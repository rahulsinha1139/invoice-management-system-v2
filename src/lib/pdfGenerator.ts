/**
 * Professional PDF Generator - Unique Engineers Corporation Format
 * Based on Flask backend ReportLab functionality
 * Uses modern browser APIs for PDF generation
 */

import { UEC_COMPANY_CONFIG, getDisplayAddress, getBankingDetails, getTaxInfo } from './companyConfig';

export interface PDFInvoiceData {
  invoiceNumber: string;
  invoiceDate: string;
  customer: {
    name: string;
    address: string;
    city: string;
    state: string;
    gstin?: string;
    phone?: string;
  };
  company: {
    name: string;
    address: string;
    gstin: string;
    phone: string;
    email: string;
    bankDetails: {
      name: string;
      account: string;
      ifsc: string;
    };
  };
  items: Array<{
    description: string;
    hsn: string;
    quantity: number;
    rate: number;
    amount: number;
  }>;
  totals: {
    subtotal: number;
    cgst: number;
    sgst: number;
    igst: number;
    roundingAdjustment: number;
    grandTotal: number;
    amountInWords: string;
  };
  additionalInfo?: {
    poNumber?: string;
    poDate?: string;
    paymentMethod?: string;
    transport?: string;
    dispatchFrom?: string;
    dispatchTo?: string;
    notes?: string;
    terms?: string;
  };
}

/**
 * Generate professional PDF using browser's print functionality
 * This provides the best quality and formatting
 */
export function generateInvoicePDF(data: PDFInvoiceData): void {
  // Create a new window with the invoice content
  const printWindow = window.open('', '_blank', 'width=800,height=600');

  if (!printWindow) {
    alert('Please allow popups to generate PDF');
    return;
  }

  // Generate the HTML content for the PDF
  const htmlContent = generateInvoiceHTML(data);

  printWindow.document.write(htmlContent);
  printWindow.document.close();

  // Wait for content to load, then print
  printWindow.onload = () => {
    setTimeout(() => {
      printWindow.print();
      printWindow.close();
    }, 500);
  };
}

/**
 * Generate professional invoice HTML matching Flask backend format
 */
function generateInvoiceHTML(data: PDFInvoiceData): string {
  const { customer, company, items, totals, additionalInfo } = data;

  return `
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Invoice ${data.invoiceNumber}</title>
      <style>
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        body {
          font-family: Arial, sans-serif;
          font-size: 12px;
          line-height: 1.4;
          color: #000;
          background: white;
        }

        .invoice-container {
          max-width: 800px;
          margin: 0 auto;
          padding: 20px;
          background: white;
        }

        .header {
          border: 2px solid #000;
          margin-bottom: 20px;
          padding: 15px;
        }

        .company-header {
          text-align: center;
          margin-bottom: 15px;
        }

        .company-name {
          font-size: 24px;
          font-weight: bold;
          color: #1e40af;
          margin-bottom: 5px;
        }

        .company-tagline {
          font-size: 14px;
          color: #666;
          margin-bottom: 10px;
        }

        .invoice-title {
          border: 2px solid #000;
          padding: 10px;
          text-align: center;
          font-size: 20px;
          font-weight: bold;
          background: #f8f9fa;
        }

        .invoice-details {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 20px;
          margin-bottom: 20px;
          border: 1px solid #ccc;
          padding: 15px;
        }

        .customer-details, .invoice-meta {
          padding: 10px;
          border: 1px solid #ddd;
          border-radius: 5px;
          background: #f9f9f9;
        }

        .section-title {
          font-weight: bold;
          color: #1e40af;
          margin-bottom: 8px;
          border-bottom: 1px solid #1e40af;
          padding-bottom: 3px;
        }

        .items-table {
          width: 100%;
          border-collapse: collapse;
          margin-bottom: 20px;
          border: 2px solid #000;
        }

        .items-table th {
          background: #1e40af;
          color: white;
          padding: 10px;
          text-align: center;
          font-weight: bold;
          border: 1px solid #000;
        }

        .items-table td {
          padding: 8px;
          border: 1px solid #000;
          text-align: center;
        }

        .items-table .description {
          text-align: left;
          max-width: 200px;
        }

        .items-table .amount {
          text-align: right;
          font-weight: bold;
        }

        .totals-section {
          display: grid;
          grid-template-columns: 1fr 300px;
          gap: 20px;
          margin-bottom: 20px;
        }

        .totals-box {
          border: 2px solid #1e40af;
          padding: 15px;
          background: #f0f7ff;
        }

        .total-row {
          display: flex;
          justify-content: space-between;
          padding: 3px 0;
          border-bottom: 1px solid #ccc;
        }

        .grand-total {
          font-size: 16px;
          font-weight: bold;
          color: #1e40af;
          border-top: 2px solid #1e40af;
          padding-top: 8px;
          margin-top: 8px;
        }

        .amount-words {
          text-align: center;
          font-weight: bold;
          color: #1e40af;
          border-top: 1px solid #1e40af;
          padding-top: 8px;
          margin-top: 8px;
          font-size: 11px;
        }

        .footer {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: 20px;
          border-top: 2px solid #000;
          padding-top: 20px;
        }

        .terms, .signature {
          padding: 10px;
        }

        .bank-details {
          border: 1px solid #1e40af;
          padding: 10px;
          margin-bottom: 15px;
          background: #f0f7ff;
        }

        .signature-line {
          margin-top: 50px;
          border-top: 1px solid #000;
          text-align: center;
          padding-top: 5px;
        }

        @media print {
          body { margin: 0; }
          .invoice-container { padding: 0; box-shadow: none; }
          .no-print { display: none; }
        }
      </style>
    </head>
    <body>
      <div class="invoice-container">
        <!-- Header Section -->
        <div class="header">
          <div class="company-header">
            <div class="company-name">UNIQUE ENGINEERS CORPORATION</div>
            <div style="font-size: 11px; color: #666; margin: 5px 0;">
              📍 ${company.address}<br>
              📞 ${company.phone} | ✉️ ${company.email}<br>
              🏢 GSTIN: ${company.gstin}
            </div>
          </div>
          <div class="invoice-title">TAX INVOICE</div>
        </div>

        <!-- Invoice Details -->
        <div class="invoice-details">
          <div class="customer-details">
            <div class="section-title">BILL TO:</div>
            <strong>${customer.name}</strong><br>
            ${customer.address}<br>
            ${customer.city}, ${customer.state}<br>
            ${customer.gstin ? `<strong>GSTIN:</strong> ${customer.gstin}<br>` : ''}
            ${customer.phone ? `<strong>Phone:</strong> ${customer.phone}` : ''}
          </div>

          <div class="invoice-meta">
            <div class="section-title">INVOICE DETAILS:</div>
            <strong>Invoice No:</strong> ${data.invoiceNumber}<br>
            <strong>Date:</strong> ${data.invoiceDate}<br>
            ${additionalInfo?.poNumber ? `<strong>PO No:</strong> ${additionalInfo.poNumber}<br>` : ''}
            ${additionalInfo?.poDate ? `<strong>PO Date:</strong> ${additionalInfo.poDate}<br>` : ''}
            <strong>Payment:</strong> ${additionalInfo?.paymentMethod || 'NEFT/RTGS'}<br>
            ${additionalInfo?.transport ? `<strong>Transport:</strong> ${additionalInfo.transport}<br>` : ''}
          </div>
        </div>

        <!-- Items Table -->
        <table class="items-table">
          <thead>
            <tr>
              <th style="width: 5%;">S.No</th>
              <th style="width: 40%;">Description of Goods</th>
              <th style="width: 10%;">HSN Code</th>
              <th style="width: 8%;">Qty</th>
              <th style="width: 12%;">Rate (₹)</th>
              <th style="width: 15%;">Amount (₹)</th>
            </tr>
          </thead>
          <tbody>
            ${items.map((item, index) => `
              <tr>
                <td>${index + 1}</td>
                <td class="description">${item.description}</td>
                <td>${item.hsn}</td>
                <td>${item.quantity}</td>
                <td>${item.rate.toFixed(2)}</td>
                <td class="amount">${item.amount.toFixed(2)}</td>
              </tr>
            `).join('')}
          </tbody>
        </table>

        <!-- Totals Section -->
        <div class="totals-section">
          <div class="bank-details">
            <div class="section-title">BANK DETAILS:</div>
            <strong>Bank:</strong> ${company.bankDetails.name}<br>
            <strong>A/c No:</strong> ${company.bankDetails.account}<br>
            <strong>IFSC:</strong> ${company.bankDetails.ifsc}
          </div>

          <div class="totals-box">
            <div class="section-title" style="text-align: center;">TAX SUMMARY</div>
            <div class="total-row">
              <span>Subtotal:</span>
              <span>₹${totals.subtotal.toFixed(2)}</span>
            </div>
            ${totals.cgst > 0 ? `
              <div class="total-row">
                <span>CGST (9%):</span>
                <span>₹${totals.cgst.toFixed(2)}</span>
              </div>
              <div class="total-row">
                <span>SGST (9%):</span>
                <span>₹${totals.sgst.toFixed(2)}</span>
              </div>
            ` : `
              <div class="total-row">
                <span>IGST (18%):</span>
                <span>₹${totals.igst.toFixed(2)}</span>
              </div>
            `}
            ${Math.abs(totals.roundingAdjustment) > 0.001 ? `
              <div class="total-row">
                <span>Rounded Off:</span>
                <span>₹${totals.roundingAdjustment >= 0 ? '+' : ''}${totals.roundingAdjustment.toFixed(2)}</span>
              </div>
            ` : ''}
            <div class="grand-total total-row">
              <span>GRAND TOTAL:</span>
              <span>₹${totals.grandTotal.toFixed(2)}</span>
            </div>
            <div class="amount-words">
              <strong>Amount in Words:</strong><br>
              ${totals.amountInWords}
            </div>
          </div>
        </div>

        <!-- Footer -->
        <div class="footer">
          <div class="terms">
            <div class="section-title">TERMS & CONDITIONS:</div>
            ${additionalInfo?.terms ?
              additionalInfo.terms.split('\n').map(term => `• ${term}`).join('<br>') :
              '• Payment within 30 days<br>• Goods once sold will not be taken back<br>• Subject to Katni jurisdiction<br>• E. & O.E.'
            }

            ${additionalInfo?.notes ? `
              <div style="margin-top: 15px;">
                <div class="section-title">SPECIAL NOTES:</div>
                <div style="background: #fff3cd; padding: 8px; border-radius: 3px; border: 1px solid #ffeaa7;">
                  ${additionalInfo.notes}
                </div>
              </div>
            ` : ''}
          </div>

          <div class="signature">
            <div class="section-title">FOR UNIQUE ENGINEERS CORPORATION</div>
            <div class="signature-line">Authorized Signatory</div>

            <div style="margin-top: 20px; font-size: 10px; text-align: center; color: #666;">
              <strong>Thank you for your business!</strong><br>
              This is a computer generated invoice.
            </div>
          </div>
        </div>

        <!-- Company Logos Footer -->
        <div style="border: 2px solid #1e40af; border-top: 1px solid #1e40af; padding: 20px; margin-top: 10px; background: #f0f7ff;">
          <div style="text-align: center; font-size: 12px; color: #666; margin-bottom: 15px;">
            <strong>Authorized Distributors</strong>
          </div>
          <div style="display: flex; justify-content: space-evenly; align-items: center; width: 80%; margin: 0 auto;">
            <div style="text-align: center; flex: 1;">
              <img src="/logos/eutectic-logo.png" alt="Eutectic Castolin" style="width: 160px; height: 80px; object-fit: contain; margin: 10px auto; display: block;">
            </div>
            <div style="text-align: center; flex: 1;">
              <img src="/logos/total-logo.jpeg" alt="TotalEnergies" style="width: 160px; height: 80px; object-fit: contain; margin: 10px auto; display: block;">
            </div>
            <div style="text-align: center; flex: 1;">
              <img src="/logos/pix-logo.png" alt="PIX Transmissions" style="width: 160px; height: 80px; object-fit: contain; margin: 10px auto; display: block;">
            </div>
          </div>
        </div>

      </div>
    </body>
    </html>
  `;
}

/**
 * Extract invoice data from current form state
 * This function should be called from the main component
 */
export function extractInvoiceData(
  invoiceNumber: string,
  invoiceDate: string,
  customer: any,
  lines: any[],
  subtotal: number,
  tax: number,
  amountInWords: string,
  additionalInfo?: any
): PDFInvoiceData {
  const roundedTotal = Math.round(subtotal + tax);
  const roundingAdjustment = roundedTotal - (subtotal + tax);

  return {
    invoiceNumber,
    invoiceDate,
    customer: {
      name: customer?.name || '',
      address: customer?.billing_address || '',
      city: customer?.city || '',
      state: customer?.state || '',
      gstin: customer?.gstin,
      phone: customer?.phone,
    },
    company: {
      name: UEC_COMPANY_CONFIG.fullName,
      address: getDisplayAddress(),
      gstin: UEC_COMPANY_CONFIG.regulatory.gstNumber,
      phone: UEC_COMPANY_CONFIG.contact.primaryPhone,
      email: UEC_COMPANY_CONFIG.contact.email,
      bankDetails: {
        name: UEC_COMPANY_CONFIG.banking.bankName,
        account: UEC_COMPANY_CONFIG.banking.accountNumber,
        ifsc: UEC_COMPANY_CONFIG.banking.ifscCode,
      },
    },
    items: lines.map(line => ({
      description: line.product_name,
      hsn: line.hsn_code,
      quantity: line.quantity,
      rate: line.unit_price || 0,
      amount: line.quantity * (line.unit_price || 0) * (1 - (line.discount_pct || 0) / 100),
    })),
    totals: {
      subtotal,
      cgst: customer?.state === 'MADHYA PRADESH' ? tax / 2 : 0,
      sgst: customer?.state === 'MADHYA PRADESH' ? tax / 2 : 0,
      igst: customer?.state !== 'MADHYA PRADESH' ? tax : 0,
      roundingAdjustment,
      grandTotal: roundedTotal,
      amountInWords,
    },
    additionalInfo,
  };
}