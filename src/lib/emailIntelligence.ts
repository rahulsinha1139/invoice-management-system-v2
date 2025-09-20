/**
 * Email Intelligence System for Invoice Tracking
 * Analyzes emails to detect invoice status updates and payment confirmations
 */

export interface EmailData {
  id: string;
  subject: string;
  sender: string;
  body: string;
  receivedAt: Date;
  attachments?: string[];
}

export interface InvoiceStatus {
  invoiceNumber: string;
  status: 'sent' | 'viewed' | 'processing' | 'paid' | 'overdue' | 'disputed' | 'cancelled';
  confidence: number; // 0-1 confidence score
  detectedAt: Date;
  source: 'email' | 'manual' | 'api';
  metadata?: {
    paymentMethod?: string;
    transactionId?: string;
    amount?: number;
    dueDate?: Date;
    clientResponse?: string;
  };
}

export interface EmailPattern {
  type: InvoiceStatus['status'];
  keywords: string[];
  senderPatterns: string[];
  subjectPatterns: string[];
  bodyPatterns: string[];
  confidence: number;
}

// Advanced pattern recognition for different invoice statuses
const EMAIL_PATTERNS: EmailPattern[] = [
  {
    type: 'viewed',
    keywords: ['viewed', 'opened', 'received', 'acknowledged'],
    senderPatterns: ['noreply', 'notification', 'system'],
    subjectPatterns: ['invoice.*viewed', 'document.*opened', 'receipt.*confirmed'],
    bodyPatterns: ['has been viewed', 'document opened', 'invoice received'],
    confidence: 0.8
  },
  {
    type: 'paid',
    keywords: ['payment', 'paid', 'transaction', 'credit', 'deposit', 'transfer', 'settled'],
    senderPatterns: ['bank', 'payment', 'neft', 'rtgs', 'upi', 'razorpay', 'paytm'],
    subjectPatterns: ['payment.*received', 'transaction.*successful', 'credit.*alert', 'payment.*confirmation'],
    bodyPatterns: ['payment.*successful', 'amount.*credited', 'transaction.*completed', 'funds.*received'],
    confidence: 0.95
  },
  {
    type: 'processing',
    keywords: ['processing', 'review', 'approval', 'pending', 'initiated'],
    senderPatterns: ['accounts', 'finance', 'payment'],
    subjectPatterns: ['payment.*processing', 'under.*review', 'approval.*pending'],
    bodyPatterns: ['payment.*initiated', 'under process', 'being reviewed', 'approval pending'],
    confidence: 0.7
  },
  {
    type: 'overdue',
    keywords: ['overdue', 'reminder', 'outstanding', 'due', 'late', 'unpaid'],
    senderPatterns: ['reminder', 'collections', 'accounts'],
    subjectPatterns: ['payment.*overdue', 'reminder', 'outstanding.*amount', 'invoice.*due'],
    bodyPatterns: ['payment overdue', 'amount outstanding', 'please pay', 'immediate attention'],
    confidence: 0.85
  },
  {
    type: 'disputed',
    keywords: ['dispute', 'query', 'issue', 'problem', 'incorrect', 'error', 'discrepancy'],
    senderPatterns: ['accounts', 'support', 'queries'],
    subjectPatterns: ['invoice.*query', 'dispute', 'issue.*payment', 'incorrect.*amount'],
    bodyPatterns: ['dispute', 'incorrect amount', 'query regarding', 'issue with invoice'],
    confidence: 0.9
  }
];

export class EmailIntelligenceEngine {
  private patterns: EmailPattern[] = EMAIL_PATTERNS;

  /**
   * Analyze an email to detect invoice-related information
   */
  analyzeEmail(email: EmailData): InvoiceStatus[] {
    const detectedStatuses: InvoiceStatus[] = [];

    // Extract potential invoice numbers from subject and body
    const invoiceNumbers = this.extractInvoiceNumbers(email.subject + ' ' + email.body);

    if (invoiceNumbers.length === 0) {
      return detectedStatuses; // No invoice numbers found
    }

    // Analyze against each pattern
    for (const pattern of this.patterns) {
      const confidence = this.calculatePatternMatch(email, pattern);

      if (confidence >= 0.6) { // Minimum confidence threshold
        for (const invoiceNumber of invoiceNumbers) {
          detectedStatuses.push({
            invoiceNumber,
            status: pattern.type,
            confidence: confidence * pattern.confidence,
            detectedAt: new Date(),
            source: 'email',
            metadata: this.extractMetadata(email, pattern.type)
          });
        }
      }
    }

    return detectedStatuses;
  }

  /**
   * Extract invoice numbers using various patterns
   */
  private extractInvoiceNumbers(text: string): string[] {
    const patterns = [
      /(?:invoice|inv|bill|receipt)[\s#]*[:\-]?\s*([A-Z0-9\-\/]{6,20})/gi,
      /(?:INV|BILL|RCP)[\-]?([0-9]{4,10})/gi,
      /([A-Z]{2,4}[\-\/]?[0-9]{4,8}[\-\/]?[0-9]{2,4})/gi, // UEC-2024-001 format
      /(?:reference|ref|number|no)[\s#]*[:\-]?\s*([A-Z0-9\-\/]{6,20})/gi
    ];

    const found = new Set<string>();

    for (const pattern of patterns) {
      const matches = text.matchAll(pattern);
      for (const match of matches) {
        if (match[1] && match[1].length >= 6) {
          found.add(match[1].toUpperCase());
        }
      }
    }

    return Array.from(found);
  }

  /**
   * Calculate how well an email matches a pattern
   */
  private calculatePatternMatch(email: EmailData, pattern: EmailPattern): number {
    let score = 0;

    // Safely construct email text
    const emailText = `${email.subject || ''} ${email.body || ''} ${email.sender || ''}`.toLowerCase();

    // Check keywords
    const keywordMatches = pattern.keywords.filter(keyword =>
      keyword && emailText.includes(keyword.toLowerCase())
    ).length;
    if (pattern.keywords.length > 0) {
      score += (keywordMatches / pattern.keywords.length) * 0.4;
    }

    // Check sender patterns
    const senderMatches = pattern.senderPatterns.some(patternStr => {
      try {
        return patternStr && new RegExp(patternStr, 'i').test(email.sender || '');
      } catch (e) {
        return false;
      }
    });
    score += senderMatches ? 0.3 : 0;

    // Check subject patterns
    const subjectMatches = pattern.subjectPatterns.some(patternStr => {
      try {
        return patternStr && new RegExp(patternStr, 'i').test(email.subject || '');
      } catch (e) {
        return false;
      }
    });
    score += subjectMatches ? 0.3 : 0;

    return Math.min(score, 1.0);
  }

  /**
   * Extract additional metadata based on the detected status type
   */
  private extractMetadata(email: EmailData, statusType: InvoiceStatus['status']): InvoiceStatus['metadata'] {
    const metadata: InvoiceStatus['metadata'] = {};
    const text = email.body.toLowerCase();

    if (statusType === 'paid') {
      // Extract transaction ID
      const transactionPatterns = [
        /(?:transaction|ref|utr)[\s#]*[:\-]?\s*([A-Z0-9]{10,20})/gi,
        /(?:txn|id)[\s#]*[:\-]?\s*([A-Z0-9]{8,15})/gi
      ];

      for (const pattern of transactionPatterns) {
        const match = pattern.exec(text);
        if (match && match[1]) {
          metadata.transactionId = match[1];
          break;
        }
      }

      // Extract amount
      const amountPattern = /(?:rs\.?|inr|amount)[\s]*[:\-]?\s*([0-9,]+(?:\.[0-9]{2})?)/gi;
      const amountMatch = amountPattern.exec(text);
      if (amountMatch && amountMatch[1]) {
        metadata.amount = parseFloat(amountMatch[1].replace(/,/g, ''));
      }

      // Extract payment method
      if (text.includes('neft')) metadata.paymentMethod = 'NEFT';
      else if (text.includes('rtgs')) metadata.paymentMethod = 'RTGS';
      else if (text.includes('upi')) metadata.paymentMethod = 'UPI';
      else if (text.includes('cheque')) metadata.paymentMethod = 'Cheque';
      else if (text.includes('cash')) metadata.paymentMethod = 'Cash';
    }

    if (statusType === 'disputed') {
      // Extract client response/issue
      const issuePatterns = [
        /(?:issue|problem|query)[\s]*[:\-]?\s*([^.!?]{20,100})/gi,
        /(?:incorrect|wrong|error)[\s]*[:\-]?\s*([^.!?]{20,100})/gi
      ];

      for (const pattern of issuePatterns) {
        const match = pattern.exec(text);
        if (match && match[1]) {
          metadata.clientResponse = match[1].trim();
          break;
        }
      }
    }

    return metadata;
  }

  /**
   * Batch analyze multiple emails
   */
  batchAnalyze(emails: EmailData[]): InvoiceStatus[] {
    const allStatuses: InvoiceStatus[] = [];

    for (const email of emails) {
      const statuses = this.analyzeEmail(email);
      allStatuses.push(...statuses);
    }

    // Remove duplicates and keep highest confidence
    const uniqueStatuses = new Map<string, InvoiceStatus>();

    for (const status of allStatuses) {
      const key = `${status.invoiceNumber}-${status.status}`;
      const existing = uniqueStatuses.get(key);

      if (!existing || status.confidence > existing.confidence) {
        uniqueStatuses.set(key, status);
      }
    }

    return Array.from(uniqueStatuses.values());
  }

  /**
   * Generate smart insights from detected statuses
   */
  generateInsights(statuses: InvoiceStatus[]): {
    summary: string;
    recommendations: string[];
    alerts: string[];
  } {
    const insights = {
      summary: '',
      recommendations: [] as string[],
      alerts: [] as string[]
    };

    const statusCounts = statuses.reduce((acc, status) => {
      acc[status.status] = (acc[status.status] || 0) + 1;
      return acc;
    }, {} as Record<string, number>);

    const total = statuses.length;
    if (total === 0) {
      insights.summary = 'No invoice activity detected in recent emails.';
      return insights;
    }

    // Generate summary
    const topStatus = Object.entries(statusCounts)
      .sort(([,a], [,b]) => b - a)[0];

    insights.summary = `Analyzed ${total} invoice-related emails. Primary activity: ${topStatus[0]} (${topStatus[1]} invoices)`;

    // Generate recommendations
    if (statusCounts.overdue > 0) {
      insights.recommendations.push(`Follow up on ${statusCounts.overdue} overdue invoices`);
      insights.alerts.push(`⚠️ ${statusCounts.overdue} invoices are overdue`);
    }

    if (statusCounts.disputed > 0) {
      insights.recommendations.push(`Resolve ${statusCounts.disputed} disputed invoices`);
      insights.alerts.push(`🚨 ${statusCounts.disputed} invoices have disputes`);
    }

    if (statusCounts.paid > 0) {
      insights.recommendations.push(`Update accounting for ${statusCounts.paid} paid invoices`);
    }

    if (statusCounts.processing > 0) {
      insights.recommendations.push(`Monitor ${statusCounts.processing} invoices in processing`);
    }

    return insights;
  }
}

// Email service integration helpers
export class EmailServiceIntegration {
  /**
   * Simulate email fetching (in real implementation, this would connect to Gmail/Outlook API)
   */
  async fetchRecentEmails(days: number = 7): Promise<EmailData[]> {
    // This would be replaced with actual email service integration
    return this.getMockEmails();
  }

  /**
   * Mock email data for demonstration
   */
  private getMockEmails(): EmailData[] {
    const now = new Date();

    return [
      {
        id: '1',
        subject: 'Payment Confirmation - Invoice UEC-2024-001',
        sender: 'payments@sbi.co.in',
        body: 'Dear Sir, We confirm that payment of Rs. 45,000.00 has been successfully processed via NEFT. Transaction ID: SBI123456789. Amount credited to your account. Thank you.',
        receivedAt: new Date(now.getTime() - 2 * 24 * 60 * 60 * 1000), // 2 days ago
        attachments: []
      },
      {
        id: '2',
        subject: 'Invoice Query - UEC-2024-002',
        sender: 'accounts@techcorp.com',
        body: 'Hello, We have received invoice UEC-2024-002 but there seems to be a discrepancy in the amount. The quoted price was Rs. 25,000 but invoice shows Rs. 28,000. Please clarify.',
        receivedAt: new Date(now.getTime() - 1 * 24 * 60 * 60 * 1000), // 1 day ago
        attachments: []
      },
      {
        id: '3',
        subject: 'Payment Reminder - Invoice UEC-2024-003',
        sender: 'reminder@uec.com',
        body: 'This is a reminder that Invoice UEC-2024-003 for Rs. 32,500 is now overdue. Payment was due 5 days ago. Please arrange payment at the earliest.',
        receivedAt: new Date(now.getTime() - 12 * 60 * 60 * 1000), // 12 hours ago
        attachments: []
      },
      {
        id: '4',
        subject: 'UPI Payment Success - UEC-2024-004',
        sender: 'upi@paytm.com',
        body: 'Payment Successful! Rs. 18,750.00 has been transferred to Unique Engineers Corporation. UPI Transaction ID: PTM789456123. Reference: Invoice UEC-2024-004.',
        receivedAt: new Date(now.getTime() - 6 * 60 * 60 * 1000), // 6 hours ago
        attachments: []
      },
      {
        id: '5',
        subject: 'Document Viewed Notification',
        sender: 'notifications@docsign.com',
        body: 'Your document "Invoice UEC-2024-005" has been viewed by client@industrialworks.in at 14:30 IST today. The document was opened and viewed for 3 minutes.',
        receivedAt: new Date(now.getTime() - 2 * 60 * 60 * 1000), // 2 hours ago
        attachments: []
      }
    ];
  }

  /**
   * Set up email monitoring webhook (for real-time updates)
   */
  async setupEmailMonitoring(): Promise<boolean> {
    // In real implementation, this would set up webhooks with email providers
    console.log('📧 Email monitoring system activated');
    return true;
  }
}

// Export singleton instances
export const emailIntelligence = new EmailIntelligenceEngine();
export const emailService = new EmailServiceIntegration();