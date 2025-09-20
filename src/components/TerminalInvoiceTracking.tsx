'use client';

import { useState, useEffect } from 'react';
import { emailIntelligence, emailService, InvoiceStatus, EmailData } from '../lib/emailIntelligence';

interface TerminalInvoiceTrackingProps {
  onNavigate: (section: string) => void;
}

export default function TerminalInvoiceTracking({ onNavigate }: TerminalInvoiceTrackingProps) {
  const [invoiceStatuses, setInvoiceStatuses] = useState<InvoiceStatus[]>([]);
  const [recentEmails, setRecentEmails] = useState<EmailData[]>([]);
  const [isScanning, setIsScanning] = useState(false);
  const [lastScan, setLastScan] = useState<Date | null>(null);
  const [insights, setInsights] = useState<{
    summary: string;
    recommendations: string[];
    alerts: string[];
  }>({ summary: '', recommendations: [], alerts: [] });
  const [selectedInvoice, setSelectedInvoice] = useState<string | null>(null);
  const [realTimeMode, setRealTimeMode] = useState(false);

  useEffect(() => {
    initializeTracking();

    // Set up real-time updates
    const interval = setInterval(() => {
      if (realTimeMode) {
        scanEmails(false);
      }
    }, 30000); // Check every 30 seconds in real-time mode

    return () => clearInterval(interval);
  }, [realTimeMode]);

  const initializeTracking = async () => {
    await scanEmails(true);
  };

  const scanEmails = async (showLoading = true) => {
    if (showLoading) setIsScanning(true);

    try {
      // Fetch recent emails (in production, this would connect to actual email APIs)
      const emails = await emailService.fetchRecentEmails(7);
      setRecentEmails(emails);

      // Analyze emails for invoice status updates
      const statuses = emailIntelligence.batchAnalyze(emails);
      setInvoiceStatuses(statuses);

      // Generate insights
      const generatedInsights = emailIntelligence.generateInsights(statuses);
      setInsights(generatedInsights);

      setLastScan(new Date());

      // Log the scan activity
      console.log(`📧 Email scan completed: ${statuses.length} invoice updates detected`);

    } catch (error) {
      console.error('Email scanning failed:', error);
    } finally {
      if (showLoading) setIsScanning(false);
    }
  };

  const getStatusColor = (status: InvoiceStatus['status']): string => {
    switch (status) {
      case 'paid': return 'text-green-400 border-green-400';
      case 'processing': return 'text-blue-400 border-blue-400';
      case 'viewed': return 'text-cyan-400 border-cyan-400';
      case 'overdue': return 'text-red-400 border-red-400';
      case 'disputed': return 'text-orange-400 border-orange-400';
      default: return 'text-gray-400 border-gray-400';
    }
  };

  const getStatusIcon = (status: InvoiceStatus['status']): string => {
    switch (status) {
      case 'paid': return '💰';
      case 'processing': return '⏳';
      case 'viewed': return '👁️';
      case 'overdue': return '⚠️';
      case 'disputed': return '❗';
      case 'sent': return '📤';
      default: return '📋';
    }
  };

  const formatConfidence = (confidence: number): string => {
    return `${Math.round(confidence * 100)}%`;
  };

  const groupedStatuses = invoiceStatuses.reduce((acc, status) => {
    if (!acc[status.invoiceNumber]) {
      acc[status.invoiceNumber] = [];
    }
    acc[status.invoiceNumber].push(status);
    return acc;
  }, {} as Record<string, InvoiceStatus[]>);

  // Sort invoice numbers by most recent activity
  const sortedInvoiceNumbers = Object.keys(groupedStatuses).sort((a, b) => {
    const aLatest = Math.max(...groupedStatuses[a].map(s => s.detectedAt.getTime()));
    const bLatest = Math.max(...groupedStatuses[b].map(s => s.detectedAt.getTime()));
    return bLatest - aLatest;
  });

  return (
    <div className="terminal-container min-h-screen">
      {/* Terminal Header */}
      <div className="terminal-header">
        <div className="terminal-dots">
          <div className="terminal-dot red"></div>
          <div className="terminal-dot yellow"></div>
          <div className="terminal-dot green"></div>
        </div>
        <div className="terminal-title">
          INVOICE TRACKING INTELLIGENCE MATRIX
        </div>
        <div className="flex items-center gap-2">
          {isScanning && (
            <div className="status-indicator status-processing">
              <div className="status-dot"></div>
              SCANNING
            </div>
          )}
          <div className={`status-indicator ${realTimeMode ? 'status-online' : 'status-processing'}`}>
            <div className="status-dot"></div>
            {realTimeMode ? 'REAL-TIME' : 'MANUAL'}
          </div>
          <button
            onClick={() => onNavigate('dashboard')}
            className="terminal-button text-xs"
          >
            ← DASHBOARD
          </button>
        </div>
      </div>

      <div className="p-6 space-y-6">

        {/* Control Panel */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">EMAIL INTELLIGENCE CONTROL</div>
            <div className="text-xs text-gray-400">
              {lastScan ? `LAST SCAN: ${lastScan.toLocaleTimeString()}` : 'INITIALIZING...'}
            </div>
          </div>

          <div className="p-4 space-y-4">
            <div className="flex flex-wrap gap-4 items-center">
              <button
                onClick={() => scanEmails(true)}
                disabled={isScanning}
                className="terminal-button primary"
              >
                {isScanning ? '🔄 SCANNING...' : '📧 SCAN EMAILS'}
              </button>

              <button
                onClick={() => setRealTimeMode(!realTimeMode)}
                className={`terminal-button ${realTimeMode ? 'primary' : 'secondary'}`}
              >
                {realTimeMode ? '⏹️ DISABLE REAL-TIME' : '▶️ ENABLE REAL-TIME'}
              </button>

              <button
                onClick={() => emailService.setupEmailMonitoring()}
                className="terminal-button secondary"
              >
                ⚙️ CONFIGURE EMAIL API
              </button>
            </div>

            {/* Quick Stats */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <div className="terminal-card bg-gray-900">
                <div className="text-center p-3">
                  <div className="terminal-text text-lg font-bold">{recentEmails.length}</div>
                  <div className="text-xs text-gray-400">EMAILS ANALYZED</div>
                </div>
              </div>

              <div className="terminal-card bg-gray-900">
                <div className="text-center p-3">
                  <div className="terminal-text-secondary text-lg font-bold">{invoiceStatuses.length}</div>
                  <div className="text-xs text-gray-400">STATUS UPDATES</div>
                </div>
              </div>

              <div className="terminal-card bg-gray-900">
                <div className="text-center p-3">
                  <div className="text-green-400 text-lg font-bold">
                    {invoiceStatuses.filter(s => s.status === 'paid').length}
                  </div>
                  <div className="text-xs text-gray-400">PAID INVOICES</div>
                </div>
              </div>

              <div className="terminal-card bg-gray-900">
                <div className="text-center p-3">
                  <div className="text-red-400 text-lg font-bold">
                    {invoiceStatuses.filter(s => s.status === 'overdue').length}
                  </div>
                  <div className="text-xs text-gray-400">OVERDUE ALERTS</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* AI Insights */}
        {insights.summary && (
          <div className="terminal-card">
            <div className="terminal-card-header">
              <div className="terminal-card-title">AI INTELLIGENCE INSIGHTS</div>
            </div>
            <div className="p-4 space-y-3">
              <div className="terminal-text-secondary">
                {insights.summary}
              </div>

              {insights.alerts.length > 0 && (
                <div className="space-y-2">
                  <div className="text-sm font-medium text-red-400">CRITICAL ALERTS:</div>
                  {insights.alerts.map((alert, index) => (
                    <div key={index} className="text-sm text-red-300 bg-red-900/20 p-2 rounded border border-red-500/30">
                      {alert}
                    </div>
                  ))}
                </div>
              )}

              {insights.recommendations.length > 0 && (
                <div className="space-y-2">
                  <div className="text-sm font-medium terminal-text">RECOMMENDED ACTIONS:</div>
                  {insights.recommendations.map((rec, index) => (
                    <div key={index} className="text-sm terminal-text-secondary bg-blue-900/20 p-2 rounded border border-blue-500/30">
                      • {rec}
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>
        )}

        {/* Invoice Status Matrix */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">INVOICE STATUS MATRIX</div>
            <div className="text-xs text-gray-400">{sortedInvoiceNumbers.length} TRACKED INVOICES</div>
          </div>

          <div className="p-4">
            {sortedInvoiceNumbers.length > 0 ? (
              <div className="space-y-4">
                {sortedInvoiceNumbers.map((invoiceNumber) => {
                  const statuses = groupedStatuses[invoiceNumber];
                  const latestStatus = statuses.sort((a, b) => b.detectedAt.getTime() - a.detectedAt.getTime())[0];
                  const isExpanded = selectedInvoice === invoiceNumber;

                  return (
                    <div key={invoiceNumber} className="terminal-card bg-gray-900">
                      <div
                        className="cursor-pointer p-3 hover:bg-gray-800 transition-colors"
                        onClick={() => setSelectedInvoice(isExpanded ? null : invoiceNumber)}
                      >
                        <div className="flex items-center justify-between">
                          <div className="flex items-center gap-3">
                            <span className="text-lg">{getStatusIcon(latestStatus.status)}</span>
                            <div>
                              <div className="terminal-text font-medium">{invoiceNumber}</div>
                              <div className="text-sm text-gray-400">
                                Last update: {latestStatus.detectedAt.toLocaleString()}
                              </div>
                            </div>
                          </div>
                          <div className="flex items-center gap-3">
                            <div className={`status-indicator border px-2 py-1 rounded ${getStatusColor(latestStatus.status)}`}>
                              <div className="status-dot"></div>
                              {latestStatus.status.toUpperCase()}
                            </div>
                            <div className="text-xs terminal-text-secondary">
                              {formatConfidence(latestStatus.confidence)}
                            </div>
                            <div className="text-gray-400">
                              {isExpanded ? '▼' : '▶'}
                            </div>
                          </div>
                        </div>
                      </div>

                      {isExpanded && (
                        <div className="border-t border-gray-700 p-3">
                          <div className="space-y-3">
                            <div className="text-sm font-medium terminal-text">STATUS HISTORY:</div>
                            {statuses
                              .sort((a, b) => b.detectedAt.getTime() - a.detectedAt.getTime())
                              .map((status, index) => (
                                <div key={index} className="flex items-center justify-between bg-gray-800 p-2 rounded">
                                  <div className="flex items-center gap-3">
                                    <span>{getStatusIcon(status.status)}</span>
                                    <div>
                                      <div className={`text-sm font-medium ${getStatusColor(status.status)}`}>
                                        {status.status.toUpperCase()}
                                      </div>
                                      <div className="text-xs text-gray-400">
                                        {status.detectedAt.toLocaleString()}
                                      </div>
                                    </div>
                                  </div>
                                  <div className="text-right text-xs">
                                    <div className="terminal-text-secondary">
                                      {formatConfidence(status.confidence)}
                                    </div>
                                    <div className="text-gray-400">
                                      {status.source}
                                    </div>
                                  </div>
                                </div>
                              ))}

                            {latestStatus.metadata && (
                              <div className="mt-3">
                                <div className="text-sm font-medium terminal-text mb-2">METADATA:</div>
                                <div className="bg-gray-800 p-2 rounded text-xs space-y-1">
                                  {latestStatus.metadata.transactionId && (
                                    <div><span className="text-gray-400">Transaction ID:</span> <span className="terminal-text-secondary">{latestStatus.metadata.transactionId}</span></div>
                                  )}
                                  {latestStatus.metadata.amount && (
                                    <div><span className="text-gray-400">Amount:</span> <span className="text-green-400">₹{latestStatus.metadata.amount.toFixed(2)}</span></div>
                                  )}
                                  {latestStatus.metadata.paymentMethod && (
                                    <div><span className="text-gray-400">Payment Method:</span> <span className="terminal-text">{latestStatus.metadata.paymentMethod}</span></div>
                                  )}
                                  {latestStatus.metadata.clientResponse && (
                                    <div><span className="text-gray-400">Client Response:</span> <span className="text-orange-400">{latestStatus.metadata.clientResponse}</span></div>
                                  )}
                                </div>
                              </div>
                            )}
                          </div>
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            ) : (
              <div className="text-center py-8 text-gray-400">
                <div className="terminal-text-secondary text-lg mb-2">📧 NO INVOICE ACTIVITY DETECTED</div>
                <div className="text-sm mb-4">
                  Scan your emails to detect invoice status updates automatically
                </div>
                <button
                  onClick={() => scanEmails(true)}
                  className="terminal-button primary"
                  disabled={isScanning}
                >
                  {isScanning ? '🔄 SCANNING...' : '📧 START EMAIL SCAN'}
                </button>
              </div>
            )}
          </div>
        </div>

        {/* Recent Email Activity */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">RECENT EMAIL ACTIVITY</div>
            <div className="text-xs text-gray-400">{recentEmails.length} EMAILS PROCESSED</div>
          </div>

          <div className="p-4">
            {recentEmails.length > 0 ? (
              <div className="terminal-table-container">
                <table className="terminal-table">
                  <thead>
                    <tr>
                      <th>SENDER</th>
                      <th>SUBJECT</th>
                      <th>RECEIVED</th>
                      <th>ANALYSIS</th>
                    </tr>
                  </thead>
                  <tbody>
                    {recentEmails.slice(0, 10).map((email) => {
                      const emailStatuses = emailIntelligence.analyzeEmail(email);
                      const hasInvoiceData = emailStatuses.length > 0;

                      return (
                        <tr key={email.id}>
                          <td>
                            <div className="text-sm font-medium">{email.sender}</div>
                          </td>
                          <td>
                            <div className="text-sm">{email.subject}</div>
                          </td>
                          <td>
                            <div className="text-xs text-gray-400">
                              {email.receivedAt.toLocaleString()}
                            </div>
                          </td>
                          <td>
                            {hasInvoiceData ? (
                              <div className="flex flex-wrap gap-1">
                                {emailStatuses.map((status, index) => (
                                  <span
                                    key={index}
                                    className={`text-xs px-2 py-1 rounded border ${getStatusColor(status.status)}`}
                                  >
                                    {status.invoiceNumber}: {status.status}
                                  </span>
                                ))}
                              </div>
                            ) : (
                              <span className="text-xs text-gray-500">No invoice data</span>
                            )}
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            ) : (
              <div className="text-center py-4 text-gray-400">
                No recent email activity to display
              </div>
            )}
          </div>
        </div>

        {/* System Status */}
        <div className="text-center text-xs text-gray-500">
          <div>EMAIL INTELLIGENCE SYSTEM v2.0.0 | AI-POWERED INVOICE TRACKING</div>
          <div className="mt-1">
            Pattern Recognition | Natural Language Processing | Real-Time Monitoring | Smart Insights
          </div>
        </div>
      </div>
    </div>
  );
}