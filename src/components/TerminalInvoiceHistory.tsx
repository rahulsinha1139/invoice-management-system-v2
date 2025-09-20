'use client';

import { useState, useEffect } from 'react';
import { apiCall } from '../lib/fetchUtils';
import logger, { logBusiness, logError } from '../lib/advancedLogger';

interface Invoice {
  id: number;
  invoice_number: string;
  invoice_date: string;
  customer_name: string;
  customer_gstin?: string;
  grand_total: number;
  status: 'DRAFT' | 'ISSUED' | 'PAID' | 'CANCELLED';
  created_at: string;
  line_items?: any[];
}

interface InvoiceListResponse {
  success: boolean;
  data: Invoice[];
  pagination?: {
    total_pages: number;
    current_page: number;
    total_count: number;
  };
  error?: string;
}

interface InvoiceStatsResponse {
  success: boolean;
  data: any;
  error?: string;
}

interface InvoiceDetailResponse {
  success: boolean;
  data: Invoice;
  error?: string;
}

interface TerminalInvoiceHistoryProps {
  onNavigate: (section: string) => void;
}

export default function TerminalInvoiceHistory({ onNavigate }: TerminalInvoiceHistoryProps) {
  const [invoices, setInvoices] = useState<Invoice[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedInvoice, setSelectedInvoice] = useState<Invoice | null>(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [filters, setFilters] = useState({
    status: '',
    start_date: '',
    end_date: '',
  });
  const [stats, setStats] = useState({
    total_invoices: 0,
    total_value: 0,
    paid_value: 0,
    outstanding_value: 0,
  });

  useEffect(() => {
    loadInvoices();
    loadStats();
  }, [currentPage, filters]);

  const loadInvoices = async () => {
    try {
      setLoading(true);

      // Build query parameters
      const params = new URLSearchParams({
        page: currentPage.toString(),
        limit: '10',
      });

      if (filters.status) params.append('status', filters.status);
      if (filters.start_date) params.append('start_date', filters.start_date);
      if (filters.end_date) params.append('end_date', filters.end_date);

      const response = await apiCall(`/api/invoices?${params.toString()}`) as InvoiceListResponse;

      if (response.success) {
        setInvoices(response.data || []);
        setTotalPages(response.pagination?.total_pages || 1);
      } else {
        throw new Error(response.error || 'Failed to load invoices');
      }
    } catch (error) {
      logError('Failed to load invoice history', error);
      setInvoices([]);
    } finally {
      setLoading(false);
    }
  };

  const loadStats = async () => {
    try {
      const response = await apiCall('/api/invoices/stats') as InvoiceStatsResponse;
      if (response.success) {
        setStats(response.data);
      }
    } catch (error) {
      logError('Failed to load invoice stats', error);
    }
  };

  const loadInvoiceDetails = async (invoiceId: number) => {
    try {
      const response = await apiCall(`/api/invoices/${invoiceId}`) as InvoiceDetailResponse;
      if (response.success) {
        setSelectedInvoice(response.data);
        logBusiness('Invoice details viewed', { invoiceId, invoiceNumber: response.data.invoice_number });
      }
    } catch (error) {
      logError('Failed to load invoice details', error);
    }
  };

  const updateInvoiceStatus = async (invoiceId: number, newStatus: string) => {
    try {
      const response = await apiCall(`/api/invoices/${invoiceId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status: newStatus }),
      }) as InvoiceDetailResponse;

      if (response.success) {
        // Refresh invoice list
        loadInvoices();
        loadStats();

        // Update selected invoice if it's the one we updated
        if (selectedInvoice?.id === invoiceId) {
          setSelectedInvoice({ ...selectedInvoice, status: newStatus as any });
        }

        logBusiness('Invoice status updated', { invoiceId, newStatus });
      } else {
        throw new Error(response.error || 'Failed to update invoice status');
      }
    } catch (error) {
      logError('Failed to update invoice status', error);
      alert('Failed to update invoice status');
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'DRAFT': return 'text-yellow-400';
      case 'ISSUED': return 'text-blue-400';
      case 'PAID': return 'text-green-400';
      case 'CANCELLED': return 'text-red-400';
      default: return 'text-gray-400';
    }
  };

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'DRAFT': return '📝';
      case 'ISSUED': return '📤';
      case 'PAID': return '✅';
      case 'CANCELLED': return '❌';
      default: return '❓';
    }
  };

  const formatCurrency = (amount: number) => {
    return new Intl.NumberFormat('en-IN', {
      style: 'currency',
      currency: 'INR',
    }).format(amount);
  };

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-IN', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
    });
  };

  return (
    <div className="terminal-container min-h-screen">
      {/* Terminal Header */}
      <div className="terminal-header">
        <div className="terminal-dots">
          <div className="terminal-dot red"></div>
          <div className="terminal-dot yellow"></div>
          <div className="terminal-dot green"></div>
        </div>
        <div className="terminal-title">INVOICE HISTORY DATABASE - UEC COMMAND CENTER</div>
        <div className="flex items-center gap-2">
          <button
            onClick={() => onNavigate('dashboard')}
            className="terminal-button text-xs"
          >
            ← DASHBOARD
          </button>
        </div>
      </div>

      <div className="p-6 space-y-6">
        {/* Statistics Dashboard */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div className="terminal-card">
            <div className="p-4 text-center">
              <div className="text-2xl font-bold text-cyan-400">{stats.total_invoices}</div>
              <div className="text-xs text-gray-400">TOTAL INVOICES</div>
            </div>
          </div>
          <div className="terminal-card">
            <div className="p-4 text-center">
              <div className="text-2xl font-bold text-green-400">{formatCurrency(stats.total_value)}</div>
              <div className="text-xs text-gray-400">TOTAL VALUE</div>
            </div>
          </div>
          <div className="terminal-card">
            <div className="p-4 text-center">
              <div className="text-2xl font-bold text-blue-400">{formatCurrency(stats.paid_value)}</div>
              <div className="text-xs text-gray-400">PAID AMOUNT</div>
            </div>
          </div>
          <div className="terminal-card">
            <div className="p-4 text-center">
              <div className="text-2xl font-bold text-orange-400">{formatCurrency(stats.outstanding_value)}</div>
              <div className="text-xs text-gray-400">OUTSTANDING</div>
            </div>
          </div>
        </div>

        {/* Filters */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">FILTER CONTROLS</div>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-4 gap-4 p-4">
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">STATUS:</label>
              <select
                value={filters.status}
                onChange={(e) => setFilters({ ...filters, status: e.target.value })}
                className="terminal-input w-full"
              >
                <option value="">ALL STATUSES</option>
                <option value="DRAFT">DRAFT</option>
                <option value="ISSUED">ISSUED</option>
                <option value="PAID">PAID</option>
                <option value="CANCELLED">CANCELLED</option>
              </select>
            </div>
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">FROM DATE:</label>
              <input
                type="date"
                value={filters.start_date}
                onChange={(e) => setFilters({ ...filters, start_date: e.target.value })}
                className="terminal-input w-full"
              />
            </div>
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">TO DATE:</label>
              <input
                type="date"
                value={filters.end_date}
                onChange={(e) => setFilters({ ...filters, end_date: e.target.value })}
                className="terminal-input w-full"
              />
            </div>
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">ACTIONS:</label>
              <button
                onClick={() => {
                  setFilters({ status: '', start_date: '', end_date: '' });
                  setCurrentPage(1);
                }}
                className="terminal-button w-full"
              >
                🔄 RESET FILTERS
              </button>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Invoice List */}
          <div className="terminal-card">
            <div className="terminal-card-header">
              <div className="terminal-card-title">INVOICE REGISTRY</div>
              <div className="text-xs text-gray-400">
                Page {currentPage} of {totalPages}
              </div>
            </div>

            {loading ? (
              <div className="p-8 text-center">
                <div className="terminal-text terminal-loading">LOADING INVOICE DATA...</div>
              </div>
            ) : (
              <div className="max-h-96 overflow-y-auto">
                {invoices.length === 0 ? (
                  <div className="p-8 text-center text-gray-400">
                    No invoices found matching your criteria
                  </div>
                ) : (
                  <div className="space-y-2 p-4">
                    {invoices.map((invoice) => (
                      <div
                        key={invoice.id}
                        onClick={() => loadInvoiceDetails(invoice.id)}
                        className={`p-3 rounded border cursor-pointer transition-all hover:bg-gray-800 ${
                          selectedInvoice?.id === invoice.id
                            ? 'border-cyan-400 bg-gray-800'
                            : 'border-gray-600'
                        }`}
                      >
                        <div className="flex justify-between items-start">
                          <div>
                            <div className="font-medium text-cyan-400">
                              #{invoice.invoice_number}
                            </div>
                            <div className="text-sm text-gray-300">
                              {invoice.customer_name}
                            </div>
                            <div className="text-xs text-gray-400">
                              {formatDate(invoice.invoice_date)}
                            </div>
                          </div>
                          <div className="text-right">
                            <div className="font-medium text-green-400">
                              {formatCurrency(invoice.grand_total)}
                            </div>
                            <div className={`text-xs flex items-center gap-1 ${getStatusColor(invoice.status)}`}>
                              <span>{getStatusIcon(invoice.status)}</span>
                              {invoice.status}
                            </div>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            )}

            {/* Pagination */}
            {totalPages > 1 && (
              <div className="flex justify-center gap-2 p-4 border-t border-gray-600">
                <button
                  onClick={() => setCurrentPage(Math.max(1, currentPage - 1))}
                  disabled={currentPage === 1}
                  className="terminal-button disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  ← PREV
                </button>
                <span className="px-4 py-2 text-sm text-gray-400">
                  {currentPage} / {totalPages}
                </span>
                <button
                  onClick={() => setCurrentPage(Math.min(totalPages, currentPage + 1))}
                  disabled={currentPage === totalPages}
                  className="terminal-button disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  NEXT →
                </button>
              </div>
            )}
          </div>

          {/* Invoice Details */}
          <div className="terminal-card">
            <div className="terminal-card-header">
              <div className="terminal-card-title">INVOICE DETAILS</div>
              {selectedInvoice && (
                <div className="text-xs text-gray-400">
                  #{selectedInvoice.invoice_number}
                </div>
              )}
            </div>

            {!selectedInvoice ? (
              <div className="p-8 text-center text-gray-400">
                Select an invoice to view details
              </div>
            ) : (
              <div className="p-4 space-y-4">
                {/* Invoice Header */}
                <div className="grid grid-cols-2 gap-4 text-sm">
                  <div>
                    <div className="text-gray-400">Invoice Number:</div>
                    <div className="font-medium">{selectedInvoice.invoice_number}</div>
                  </div>
                  <div>
                    <div className="text-gray-400">Date:</div>
                    <div className="font-medium">{formatDate(selectedInvoice.invoice_date)}</div>
                  </div>
                  <div>
                    <div className="text-gray-400">Customer:</div>
                    <div className="font-medium">{selectedInvoice.customer_name}</div>
                  </div>
                  <div>
                    <div className="text-gray-400">Amount:</div>
                    <div className="font-medium text-green-400">
                      {formatCurrency(selectedInvoice.grand_total)}
                    </div>
                  </div>
                </div>

                {/* Status Management */}
                <div className="border-t border-gray-600 pt-4">
                  <div className="text-gray-400 text-sm mb-2">Status:</div>
                  <div className="flex items-center gap-2">
                    <span className={`${getStatusColor(selectedInvoice.status)} font-medium`}>
                      {getStatusIcon(selectedInvoice.status)} {selectedInvoice.status}
                    </span>
                    <div className="flex gap-1 ml-auto">
                      {selectedInvoice.status === 'DRAFT' && (
                        <button
                          onClick={() => updateInvoiceStatus(selectedInvoice.id, 'ISSUED')}
                          className="terminal-button text-xs"
                        >
                          ISSUE
                        </button>
                      )}
                      {selectedInvoice.status === 'ISSUED' && (
                        <button
                          onClick={() => updateInvoiceStatus(selectedInvoice.id, 'PAID')}
                          className="terminal-button text-xs"
                        >
                          MARK PAID
                        </button>
                      )}
                      {['DRAFT', 'ISSUED'].includes(selectedInvoice.status) && (
                        <button
                          onClick={() => updateInvoiceStatus(selectedInvoice.id, 'CANCELLED')}
                          className="terminal-button text-xs bg-red-600"
                        >
                          CANCEL
                        </button>
                      )}
                    </div>
                  </div>
                </div>

                {/* Line Items */}
                {selectedInvoice.line_items && selectedInvoice.line_items.length > 0 && (
                  <div className="border-t border-gray-600 pt-4">
                    <div className="text-gray-400 text-sm mb-2">Line Items:</div>
                    <div className="space-y-2 max-h-40 overflow-y-auto">
                      {selectedInvoice.line_items.map((item, index) => (
                        <div key={index} className="text-xs border border-gray-600 rounded p-2">
                          <div className="font-medium">{item.product_name_snapshot}</div>
                          <div className="text-gray-400 flex justify-between">
                            <span>Qty: {item.quantity} | Rate: {formatCurrency(item.unit_price)}</span>
                            <span>{formatCurrency(item.line_total)}</span>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}