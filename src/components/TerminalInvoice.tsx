'use client';

import { useState, useEffect } from 'react';
import { invoiceAmountToWords } from '../lib/numberToWords';
import { generateInvoicePDF, extractInvoiceData } from '../lib/pdfGenerator';
import { exportInvoiceToExcel } from '../lib/excelExporter';
import logger, { logBusiness, logError, logInfo } from '../lib/advancedLogger';
import { UEC_COMPANY_CONFIG, generateInvoiceNumber } from '../lib/companyConfig';
import { apiCall, postJSON } from '../lib/fetchUtils';
import { useLightningButton, LightningButtonManager } from '../lib/lightningButtons';

interface Customer {
  id: number;
  name: string;
  gstin?: string;
  billing_address: string;
  city?: string;
  state: string;
  state_code: string;
  place_of_supply: string;
  phone?: string;
}

interface HSNCode {
  id: number;
  code: string;
  description: string;
  gst_rate_slab: number;
  effective_from: string;
  effective_to?: string;
  is_active: number;
  created_at: string;
}

interface ProductVariant {
  id: number;
  product_id: number;
  product_name: string;
  pack_size_value: number;
  pack_size_uom_code: string;
  selling_uom_code: string;
  hsn_code: string;
}

interface InvoiceLine {
  product_variant_id: number;
  product_name: string;
  hsn_code: string;
  quantity: number;
  unit_price: number;
  discount_pct: number;
  uom: string;
}

interface TerminalInvoiceProps {
  onNavigate: (section: string) => void;
}

export default function TerminalInvoice({ onNavigate }: TerminalInvoiceProps) {
  const [invoiceNumber, setInvoiceNumber] = useState<string>('');
  const [invoiceDate, setInvoiceDate] = useState<string>('');
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [hsnCodes, setHsnCodes] = useState<HSNCode[]>([]);
  const [products, setProducts] = useState<ProductVariant[]>([]);
  const [selectedCustomer, setSelectedCustomer] = useState<Customer | null>(null);
  const [selectedHsn, setSelectedHsn] = useState<string>('');
  const [invoiceLines, setInvoiceLines] = useState<InvoiceLine[]>([]);
  const [poNumber, setPoNumber] = useState<string>('');
  const [paymentMethod, setPaymentMethod] = useState<string>('NEFT_RTGS');
  const [notes, setNotes] = useState<string>('');
  const [isLoaded, setIsLoaded] = useState<boolean>(false);
  const [showPreview, setShowPreview] = useState<boolean>(false);
  const [processingCommand, setProcessingCommand] = useState<string>('');
  const [productSearchMode, setProductSearchMode] = useState<'hsn' | 'search'>('hsn');
  const [searchQuery, setSearchQuery] = useState<string>('');
  const [allProducts, setAllProducts] = useState<ProductVariant[]>([]);
  const [showAddClient, setShowAddClient] = useState<boolean>(false);
  const [newClient, setNewClient] = useState({
    name: '',
    gstin: '',
    billing_address: '',
    city: '',
    state: '',
    state_code: '',
    place_of_supply: '',
    phone: '',
    email: ''
  });
  const [overallDiscount, setOverallDiscount] = useState<number>(0);

  // ⚡ LIGHTNING BUTTON OPTIMIZATION
  const addClientBtn = useLightningButton('add-client-btn');
  const saveInvoiceBtn = useLightningButton('save-invoice-btn');
  const generatePdfBtn = useLightningButton('generate-pdf-btn');
  const exportExcelBtn = useLightningButton('export-excel-btn');
  const searchProductsBtn = useLightningButton('search-products-btn');
  const loadProductsBtn = useLightningButton('load-products-btn');

  useEffect(() => {
    setInvoiceDate(new Date().toISOString().split('T')[0]);
    setIsLoaded(true);
    loadInitialData();
  }, []);

  const loadInitialData = async () => {
    try {
      setProcessingCommand('LOADING_DATA');
      logInfo('Loading initial application data');

      const [customersResponse, hsnResponse, invoiceData] = await Promise.all([
        apiCall<any>('/api/customers'),
        apiCall<any>('/api/products/hsn-codes'),
        apiCall<{nextNumber: string}>('/api/invoices/next-number')
      ]);

      // Extract data arrays from API responses
      const customersData = customersResponse.data || customersResponse;
      const hsnData = hsnResponse.data || hsnResponse;

      setCustomers(customersData);
      logInfo(`Loaded ${customersData.length} customers`);

      setHsnCodes(hsnData);
      logInfo(`Loaded ${hsnData.length} HSN codes`);

      setInvoiceNumber(invoiceData.nextNumber);
      logInfo(`Next invoice number: ${invoiceData.nextNumber}`);

      setProcessingCommand('');
    } catch (error) {
      logError('Failed to load initial data', error);
      setProcessingCommand('ERROR');
    }
  };

  const loadProductsByHsn = async (hsnCode: string) => {
    try {
      setProcessingCommand('LOADING_PRODUCTS');
      const response = await fetch(`/api/products?hsn_code=${hsnCode}`);
      if (response.ok) {
        const productsData = await response.json();
        const products = productsData.data || productsData;
        setProducts(products);
        logInfo(`Loaded ${products.length} products for HSN ${hsnCode}`);
      }
      setProcessingCommand('');
    } catch (error) {
      logError('Failed to load products', error);
      setProcessingCommand('ERROR');
    }
  };

  const loadAllProducts = async () => {
    try {
      setProcessingCommand('LOADING_PRODUCTS');
      const response = await apiCall<any>('/api/products/v3');
      const products = response.products || [];
      setAllProducts(products);
      logInfo(`Loaded ${products.length} total products`);
      setProcessingCommand('');
    } catch (error) {
      logError('Failed to load all products', error);
      setProcessingCommand('ERROR');
    }
  };

  const searchProducts = async (query: string) => {
    if (!query.trim()) {
      setProducts([]);
      return;
    }

    try {
      setProcessingCommand('SEARCHING_PRODUCTS');
      const response = await apiCall<any>(`/api/products/v3?search=${encodeURIComponent(query)}`);
      const products = response.products || [];
      setProducts(products);
      logInfo(`Found ${products.length} products for search: ${query}`);
      setProcessingCommand('');
    } catch (error) {
      logError('Failed to search products', error);
      setProcessingCommand('ERROR');
    }
  };

  const getPerKgPrice = (product: any) => {
    // CSV prices are already per kg, no need to divide
    return product.selling_price || product.base_price || 0;
  };

  const formatProductPrice = (product: any) => {
    const perKgPrice = getPerKgPrice(product);
    return `₹${perKgPrice.toFixed(2)}/kg`;
  };

  const handleHsnChange = (hsn: string) => {
    setSelectedHsn(hsn);
    if (hsn) {
      loadProductsByHsn(hsn);
    } else {
      setProducts([]);
    }
  };

  const addInvoiceLine = (product: any) => {
    const perKgPrice = getPerKgPrice(product);

    const newLine: InvoiceLine = {
      product_variant_id: product.id,
      product_name: product.product_name,
      hsn_code: product.hsn_code,
      quantity: 1,
      unit_price: perKgPrice,
      discount_pct: 0,
      uom: 'kg'  // Always use kg as unit for consistent pricing
    };

    setInvoiceLines([...invoiceLines, newLine]);
    logBusiness('Invoice line added', {
      product: product.product_name,
      hsn: product.hsn_code,
      price_per_kg: perKgPrice
    });
  };

  const removeInvoiceLine = (index: number) => {
    const removedLine = invoiceLines[index];
    setInvoiceLines(invoiceLines.filter((_, i) => i !== index));
    logBusiness('Invoice line removed', {
      product: removedLine.product_name
    });
  };

  const updateInvoiceLine = (index: number, field: keyof InvoiceLine, value: any) => {
    const updatedLines = invoiceLines.map((line, i) =>
      i === index ? { ...line, [field]: value } : line
    );
    setInvoiceLines(updatedLines);
  };

  const calculateTotals = () => {
    const lineSubtotal = invoiceLines.reduce((sum, line) => {
      const lineAmount = line.quantity * line.unit_price;
      const discountAmount = lineAmount * (line.discount_pct / 100);
      return sum + (lineAmount - discountAmount);
    }, 0);

    // Apply overall discount
    const subtotal = lineSubtotal * (1 - overallDiscount / 100);

    const taxRate = selectedCustomer?.state_code === '23' ? 0.18 : 0.18;
    const tax = subtotal * taxRate;
    const total = subtotal + tax;
    const amountInWords = invoiceAmountToWords(total);

    return { subtotal, tax, total, amountInWords, lineSubtotal };
  };

  const totals = calculateTotals();

  // Client addition functionality
  const handleAddClient = () => {
    addClientBtn.triggerAction(
      async () => {
        logBusiness('Adding new client', { name: newClient.name });

        const result = await postJSON<Customer>('/api/customers', newClient);

        // Optimistic UI updates - instant feedback
        const newCustomer = result;
        setCustomers(prev => [...prev, newCustomer]);
        setSelectedCustomer(newCustomer);

        // Background refresh (no blocking)
        setTimeout(async () => {
          try {
            const customersData = await apiCall<Customer[]>('/api/customers');
            setCustomers(customersData);
          } catch (error) {
            console.warn('Background refresh failed:', error);
          }
        }, 100);

        return result;
      },
      {
        onSuccess: (result) => {
          // Instant UI reset
          setNewClient({
            name: '',
            gstin: '',
            billing_address: '',
            city: '',
            state: '',
            state_code: '',
            place_of_supply: '',
            phone: '',
            email: ''
          });
          setShowAddClient(false);

          logBusiness('Client added successfully', {
            id: result.id,
            name: result.name
          });
        },
        onError: (error) => {
          logError('Client addition error', error);
          alert('Error adding client');
        }
      }
    );
  };

  // Update quantity to be multiple of pack size
  const updateQuantityWithPackSize = (index: number, multiplier: number, product: any) => {
    const packSize = product?.pack_size_value || 1;
    const newQuantity = Math.max(1, multiplier) * packSize;
    updateInvoiceLine(index, 'quantity', newQuantity);
  };

  const executeCommand = (command: string) => {
    // Instant feedback based on command type
    const buttonMap = {
      'SAVE_INVOICE': 'save-invoice-btn',
      'GENERATE_PDF': 'generate-pdf-btn',
      'EXPORT_EXCEL': 'export-excel-btn'
    };

    const buttonId = buttonMap[command];
    if (buttonId) {
      LightningButtonManager.getInstance().triggerInstantFeedback(buttonId, 'loading');
    }

    // Set minimal processing state
    setProcessingCommand(command);

    switch (command) {
      case 'SAVE_INVOICE':
        saveInvoiceBtn.triggerAction(async () => {
          await handleSaveInvoice();
          return 'Invoice saved successfully';
        }, {
          onSuccess: () => setProcessingCommand(''),
          onError: () => setProcessingCommand('')
        });
        break;
      case 'GENERATE_PDF':
        generatePdfBtn.triggerAction(async () => {
          await handleGeneratePDF();
          return 'PDF generated successfully';
        }, {
          onSuccess: () => setProcessingCommand(''),
          onError: () => setProcessingCommand('')
        });
        break;
      case 'EXPORT_EXCEL':
        exportExcelBtn.triggerAction(async () => {
          await handleExportExcel();
          return 'Excel exported successfully';
        }, {
          onSuccess: () => setProcessingCommand(''),
          onError: () => setProcessingCommand('')
        });
        break;
      case 'PREVIEW_MODE':
        setShowPreview(!showPreview);
        setProcessingCommand('');
        break;
      case 'PRINT_INVOICE':
        window.print();
        setProcessingCommand('');
        break;
      default:
        setTimeout(() => setProcessingCommand(''), 500);
    }
  };

  const handleGeneratePDF = () => {
    if (!selectedCustomer || invoiceLines.length === 0) {
      alert('CRITICAL ERROR: Customer and products required for PDF generation');
      return;
    }

    try {
      const pdfData = extractInvoiceData(
        invoiceNumber,
        invoiceDate,
        selectedCustomer,
        invoiceLines,
        totals.subtotal,
        totals.tax,
        totals.amountInWords,
        { poNumber, paymentMethod, notes }
      );

      generateInvoicePDF(pdfData);
      logBusiness('PDF invoice generated', {
        invoiceNumber,
        customer: selectedCustomer.name,
        total: totals.total
      });
    } catch (error) {
      logError('Failed to generate PDF', error);
      alert('PDF_GENERATION_FAILED: Please retry operation');
    }
  };

  const handleExportExcel = () => {
    if (!selectedCustomer || invoiceLines.length === 0) {
      alert('CRITICAL ERROR: Customer and products required for Excel export');
      return;
    }

    try {
      exportInvoiceToExcel(
        invoiceNumber,
        invoiceDate,
        selectedCustomer,
        invoiceLines,
        totals.subtotal,
        totals.tax,
        totals.total,
        totals.amountInWords,
        { poNumber, paymentMethod, notes }
      );

      logBusiness('Excel invoice exported', {
        invoiceNumber,
        customer: selectedCustomer.name,
        total: totals.total
      });
    } catch (error) {
      logError('Failed to export Excel', error);
      alert('EXCEL_EXPORT_FAILED: Please retry operation');
    }
  };

  const handleSaveInvoice = async () => {
    if (!selectedCustomer || invoiceLines.length === 0) {
      alert('CRITICAL ERROR: Customer and products required for invoice save');
      return;
    }

    try {
      // Prepare invoice data for API
      const invoiceData = {
        customer_id: selectedCustomer.id,
        invoice_date: invoiceDate,
        payment_method: paymentMethod,
        payment_terms: 'Immediate',
        place_of_supply: selectedCustomer.place_of_supply || selectedCustomer.state,
        state_code: selectedCustomer.state_code || '23',
        is_interstate: false,
        subtotal: totals.subtotal,
        taxable_value: totals.subtotal,
        cgst_total: totals.tax / 2,
        sgst_total: totals.tax / 2,
        igst_total: 0,
        grand_total: totals.total,
        total_in_words: totals.amountInWords,
        notes: notes,
        status: 'ISSUED',
        line_items: invoiceLines.map((line, index) => ({
          product_id: line.product_variant_id || 1,
          product_variant_id: line.product_variant_id || 1,
          product_name_snapshot: line.product_name,
          hsn_code_snapshot: line.hsn_code,
          uom_snapshot: 'KG',
          quantity: line.quantity,
          unit_price: line.unit_price,
          line_subtotal: line.quantity * line.unit_price,
          cgst_pct: 9,
          sgst_pct: 9,
          igst_pct: 0,
          cgst_amount: (line.quantity * line.unit_price * 0.09),
          sgst_amount: (line.quantity * line.unit_price * 0.09),
          igst_amount: 0,
          line_total: line.quantity * line.unit_price * 1.18
        }))
      };

      // Call API to save invoice
      const response = await postJSON('/api/invoices', invoiceData);

      if (response.success) {
        logBusiness('Invoice saved to database', {
          invoiceId: response.data.id,
          invoiceNumber: response.data.invoice_number,
          customer: selectedCustomer.name,
          total: totals.total
        });

        // Update local invoice number with saved number
        setInvoiceNumber(response.data.invoice_number);

        alert(`✅ INVOICE SAVED SUCCESSFULLY\nInvoice #${response.data.invoice_number}\nTotal: ₹${totals.total.toFixed(2)}`);
      } else {
        throw new Error(response.error || 'Failed to save invoice');
      }
    } catch (error) {
      logError('Failed to save invoice', error);
      alert('INVOICE_SAVE_FAILED: Please retry operation');
    }
  };

  if (!isLoaded) {
    return (
      <div className="terminal-container min-h-screen">
        <div className="terminal-header">
          <div className="terminal-dots">
            <div className="terminal-dot red"></div>
            <div className="terminal-dot yellow"></div>
            <div className="terminal-dot green"></div>
          </div>
          <div className="terminal-title">INVOICE GENERATION MODULE</div>
        </div>
        <div className="p-6 text-center">
          <div className="terminal-text terminal-loading">INITIALIZING INVOICE SYSTEM...</div>
        </div>
      </div>
    );
  }

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
          {UEC_COMPANY_CONFIG.fullName.toUpperCase()} - INVOICE COMMAND CENTER v2.0.0
        </div>
        <div className="flex items-center gap-2">
          {processingCommand && (
            <div className="status-indicator status-processing">
              <div className="status-dot"></div>
              {processingCommand}
            </div>
          )}
          <button
            onClick={() => onNavigate('dashboard')}
            className="terminal-button text-xs"
          >
            ← DASHBOARD
          </button>
        </div>
      </div>

      {/* Main Interface */}
      <div className="p-6 space-y-6">

        {/* Command Panel */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">COMMAND INTERFACE</div>
            <div className="text-xs text-gray-400">INVOICE #{generateInvoiceNumber(parseInt(invoiceNumber) || 50)}</div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 p-4">
            {/* Customer Selection */}
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">CLIENT DATABASE:</label>
              <select
                value={selectedCustomer?.id || ''}
                onChange={(e) => {
                  const customer = customers.find(c => c.id === parseInt(e.target.value));
                  setSelectedCustomer(customer || null);
                }}
                className="terminal-input w-full"
              >
                <option value="">SELECT CLIENT</option>
                {Array.isArray(customers) && customers.map(customer => (
                  <option key={customer.id} value={customer.id}>
                    {customer.name}
                  </option>
                ))}
              </select>
              <button
                id="add-client-btn"
                onClick={() => setShowAddClient(true)}
                className="lightning-button terminal-button text-xs w-full border-green-500 text-green-500 hover:bg-green-500 hover:text-black"
              >
                + ADD CLIENT
              </button>
            </div>

            {/* Overall Discount */}
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">OVERALL DISCOUNT (%):</label>
              <input
                type="number"
                value={overallDiscount}
                onChange={(e) => setOverallDiscount(parseFloat(e.target.value) || 0)}
                className="terminal-input w-full"
                min="0"
                max="100"
                step="0.1"
                placeholder="0.0"
              />
            </div>

            {/* Product Search Mode Selection */}
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">PRODUCT SELECTION:</label>
              <div className="flex gap-2">
                <button
                  onClick={() => setProductSearchMode('hsn')}
                  className={`lightning-button terminal-button text-xs px-3 py-1 ${
                    productSearchMode === 'hsn' ? 'bg-cyan-900 border-cyan-400' : ''
                  }`}
                >
                  BY HSN CODE
                </button>
                <button
                  id="load-products-btn"
                  onClick={() => {
                    setProductSearchMode('search');
                    loadAllProducts();
                  }}
                  className={`lightning-button terminal-button text-xs px-3 py-1 ${
                    productSearchMode === 'search' ? 'bg-cyan-900 border-cyan-400' : ''
                  }`}
                >
                  SEARCH PRODUCTS
                </button>
              </div>
            </div>

            {/* HSN Selection - Show only when HSN mode is selected */}
            {productSearchMode === 'hsn' && (
              <div className="space-y-2">
                <label className="text-xs font-medium terminal-text">HSN MATRIX:</label>
                <select
                  value={selectedHsn}
                  onChange={(e) => handleHsnChange(e.target.value)}
                  className="terminal-input w-full"
                >
                  <option value="">SELECT HSN CODE</option>
                  {Array.isArray(hsnCodes) && hsnCodes.map(hsn => (
                    <option key={hsn.id} value={hsn.code}>
                      {hsn.code} - {hsn.description}
                    </option>
                  ))}
                </select>
              </div>
            )}

            {/* Product Search - Show only when search mode is selected */}
            {productSearchMode === 'search' && (
              <div className="space-y-2">
                <label className="text-xs font-medium terminal-text">SEARCH PRODUCTS:</label>
                <input
                  type="text"
                  value={searchQuery}
                  onChange={(e) => {
                    setSearchQuery(e.target.value);
                    searchProducts(e.target.value);
                  }}
                  placeholder="Search by product name..."
                  className="terminal-input w-full"
                />
              </div>
            )}

            {/* PO Number */}
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">PO REFERENCE:</label>
              <input
                type="text"
                value={poNumber}
                onChange={(e) => setPoNumber(e.target.value)}
                placeholder="ENTER PO NUMBER"
                className="terminal-input w-full"
              />
            </div>

            {/* Invoice Date */}
            <div className="space-y-2">
              <label className="text-xs font-medium terminal-text">INVOICE DATE:</label>
              <input
                type="date"
                value={invoiceDate}
                onChange={(e) => setInvoiceDate(e.target.value)}
                className="terminal-input w-full"
              />
            </div>
          </div>

          {/* Command Buttons */}
          <div className="flex flex-wrap gap-2 p-4 pt-0">
            <button
              id="save-invoice-btn"
              onClick={() => executeCommand('SAVE_INVOICE')}
              disabled={!selectedCustomer || invoiceLines.length === 0}
              className="lightning-button terminal-button success"
            >
              💾 SAVE INVOICE
            </button>
            <button
              id="generate-pdf-btn"
              onClick={() => executeCommand('GENERATE_PDF')}
              disabled={!selectedCustomer || invoiceLines.length === 0}
              className="lightning-button terminal-button primary"
            >
              📄 GENERATE PDF
            </button>
            <button
              id="export-excel-btn"
              onClick={() => executeCommand('EXPORT_EXCEL')}
              disabled={!selectedCustomer || invoiceLines.length === 0}
              className="lightning-button terminal-button secondary"
            >
              📊 EXPORT EXCEL
            </button>
            <button
              onClick={() => executeCommand('PRINT_INVOICE')}
              disabled={!selectedCustomer || invoiceLines.length === 0}
              className="terminal-button"
            >
              🖨️ PRINT
            </button>
            <button
              onClick={() => executeCommand('PREVIEW_MODE')}
              className="terminal-button"
            >
              {showPreview ? '📝 EDIT' : '👁️ PREVIEW'}
            </button>
          </div>
        </div>

        {/* Product Selection */}
        {Array.isArray(products) && products.length > 0 && !showPreview && (
          <div className="terminal-card">
            <div className="terminal-card-header">
              <div className="terminal-card-title">
                PRODUCT MATRIX
                {productSearchMode === 'hsn' && selectedHsn && (
                  <span className="ml-2 text-cyan-400">HSN: {selectedHsn}</span>
                )}
                {productSearchMode === 'search' && searchQuery && (
                  <span className="ml-2 text-cyan-400">Search: "{searchQuery}"</span>
                )}
              </div>
              <div className="text-xs text-gray-400">{products.length} PRODUCTS FOUND</div>
            </div>

            <div className="p-4 max-h-64 overflow-y-auto">
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-2">
                {products.map(product => {
                  const hsnDescription = hsnCodes.find(hsn => hsn.code === product.hsn_code)?.description || '';

                  return (
                    <button
                      key={product.id}
                      onClick={() => addInvoiceLine(product)}
                      className="terminal-button text-left p-3 hover:border-green-400"
                    >
                      <div className="font-medium text-sm terminal-text">{product.product_name}</div>
                      <div className="text-xs text-green-400 font-medium">{formatProductPrice(product)}</div>
                      <div className="text-xs text-gray-400">
                        Pack: {product.pack_size_value || 'N/A'} {product.pack_size_unit || 'kg'}
                      </div>
                      <div className="text-xs terminal-text-secondary">
                        {product.hsn_code} - {hsnDescription}
                      </div>
                    </button>
                  );
                })}
              </div>
            </div>
          </div>
        )}

        {/* Invoice Lines */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">INVOICE MATRIX</div>
            <div className="text-xs text-gray-400">{invoiceLines.length} ITEMS</div>
          </div>

          <div className="p-4">
            {invoiceLines.length > 0 ? (
              <div className="terminal-table-container">
                <table className="terminal-table">
                  <thead>
                    <tr>
                      <th>S.NO</th>
                      <th>PRODUCT</th>
                      <th>HSN</th>
                      <th>QTY</th>
                      <th>RATE</th>
                      <th>AMOUNT</th>
                      {!showPreview && <th>ACTION</th>}
                    </tr>
                  </thead>
                  <tbody>
                    {invoiceLines.map((line, index) => {
                      const lineAmount = line.quantity * line.unit_price;
                      const discountAmount = lineAmount * (line.discount_pct / 100);
                      const netAmount = lineAmount - discountAmount;

                      return (
                        <tr key={index}>
                          <td>{index + 1}</td>
                          <td>
                            <div className="font-medium">{line.product_name}</div>
                            <div className="text-xs text-gray-400">{line.uom}</div>
                          </td>
                          <td>{line.hsn_code}</td>
                          <td>
                            {showPreview ? (
                              <div className="text-center">
                                <div>{line.quantity} kg</div>
                              </div>
                            ) : (
                              <div className="text-center">
                                <input
                                  type="number"
                                  value={line.quantity}
                                  onChange={(e) => updateInvoiceLine(index, 'quantity', parseFloat(e.target.value) || 0)}
                                  className="terminal-input w-16 text-center text-xs"
                                  min="0"
                                  step="0.1"
                                />
                                <div className="text-xs text-gray-400 mt-1">kg</div>
                              </div>
                            )}
                          </td>
                          <td>
                            {showPreview ? (
                              `₹${line.unit_price.toFixed(2)}`
                            ) : (
                              <input
                                type="number"
                                value={line.unit_price}
                                onChange={(e) => updateInvoiceLine(index, 'unit_price', parseFloat(e.target.value) || 0)}
                                className="terminal-input w-24 text-right"
                                min="0"
                                step="0.01"
                              />
                            )}
                          </td>
                          <td className="terminal-text">₹{netAmount.toFixed(2)}</td>
                          {!showPreview && (
                            <td>
                              <button
                                onClick={() => removeInvoiceLine(index)}
                                className="terminal-button text-xs px-2 py-1 border-red-500 text-red-500 hover:bg-red-500 hover:text-black"
                              >
                                DEL
                              </button>
                            </td>
                          )}
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            ) : (
              <div className="text-center py-8 text-gray-400">
                <div className="terminal-text-secondary text-lg mb-2">NO ITEMS LOADED</div>
                <div className="text-sm">Select HSN code and add products to begin</div>
              </div>
            )}
          </div>
        </div>

        {/* Totals */}
        {invoiceLines.length > 0 && (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* Tax Calculation */}
            <div className="terminal-card">
              <div className="terminal-card-header">
                <div className="terminal-card-title">TAX COMPUTATION</div>
              </div>
              <div className="p-4 space-y-2">
                <div className="flex justify-between">
                  <span>LINE TOTAL:</span>
                  <span className="terminal-text">₹{totals.lineSubtotal.toFixed(2)}</span>
                </div>
                {overallDiscount > 0 && (
                  <div className="flex justify-between">
                    <span>DISCOUNT ({overallDiscount}%):</span>
                    <span className="terminal-text-secondary">-₹{(totals.lineSubtotal * overallDiscount / 100).toFixed(2)}</span>
                  </div>
                )}
                <div className="flex justify-between">
                  <span>SUBTOTAL:</span>
                  <span className="terminal-text">₹{totals.subtotal.toFixed(2)}</span>
                </div>
                {selectedCustomer?.state_code === '23' ? (
                  <>
                    <div className="flex justify-between">
                      <span>CGST @ 9%:</span>
                      <span className="terminal-text-secondary">₹{(totals.tax / 2).toFixed(2)}</span>
                    </div>
                    <div className="flex justify-between">
                      <span>SGST @ 9%:</span>
                      <span className="terminal-text-secondary">₹{(totals.tax / 2).toFixed(2)}</span>
                    </div>
                  </>
                ) : (
                  <div className="flex justify-between">
                    <span>IGST @ 18%:</span>
                    <span className="terminal-text-secondary">₹{totals.tax.toFixed(2)}</span>
                  </div>
                )}
                <div className="border-t border-gray-600 pt-2">
                  <div className="flex justify-between font-bold">
                    <span>GRAND TOTAL:</span>
                    <span className="terminal-text text-lg">₹{totals.total.toFixed(2)}</span>
                  </div>
                </div>
              </div>
            </div>

            {/* Amount in Words */}
            <div className="terminal-card">
              <div className="terminal-card-header">
                <div className="terminal-card-title">AMOUNT IN WORDS</div>
              </div>
              <div className="p-4">
                <div className="terminal-text-secondary text-sm">
                  INR {totals.amountInWords}
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Customer Info Display */}
        {selectedCustomer && (
          <div className="terminal-card">
            <div className="terminal-card-header">
              <div className="terminal-card-title">CLIENT DATA</div>
            </div>
            <div className="p-4 grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <div className="terminal-text font-medium">{selectedCustomer.name}</div>
                <div className="text-sm text-gray-400 mt-1">
                  {selectedCustomer.billing_address}<br/>
                  {selectedCustomer.city}, {selectedCustomer.state}
                </div>
              </div>
              <div className="space-y-1 text-sm">
                {selectedCustomer.gstin && (
                  <div><span className="terminal-text">GSTIN:</span> {selectedCustomer.gstin}</div>
                )}
                <div><span className="terminal-text">STATE CODE:</span> {selectedCustomer.state_code}</div>
                <div><span className="terminal-text">SUPPLY:</span> {selectedCustomer.place_of_supply}</div>
              </div>
            </div>
          </div>
        )}

        {/* UEC Company Information */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">{UEC_COMPANY_CONFIG.fullName.toUpperCase()}</div>
            <div className="text-xs text-gray-400">{UEC_COMPANY_CONFIG.tagline}</div>
          </div>
          <div className="p-4 grid grid-cols-1 md:grid-cols-3 gap-4 text-xs">
            <div className="space-y-1">
              <div className="text-cyan-400 font-semibold">ADDRESS:</div>
              <div className="text-gray-300">
                {UEC_COMPANY_CONFIG.address.line1}<br/>
                {UEC_COMPANY_CONFIG.address.line2}<br/>
                {UEC_COMPANY_CONFIG.address.city}, {UEC_COMPANY_CONFIG.address.state} {UEC_COMPANY_CONFIG.address.pinCode}
              </div>
            </div>
            <div className="space-y-1">
              <div className="text-cyan-400 font-semibold">CONTACT:</div>
              <div className="text-gray-300">
                {UEC_COMPANY_CONFIG.contact.primaryPhone}<br/>
                {UEC_COMPANY_CONFIG.contact.secondaryPhone}<br/>
                {UEC_COMPANY_CONFIG.contact.email}
              </div>
            </div>
            <div className="space-y-1">
              <div className="text-cyan-400 font-semibold">REGULATORY:</div>
              <div className="text-gray-300">
                GST: {UEC_COMPANY_CONFIG.regulatory.gstNumber}<br/>
                PAN: {UEC_COMPANY_CONFIG.regulatory.panNumber}<br/>
                State Code: {UEC_COMPANY_CONFIG.regulatory.stateCode}
              </div>
            </div>
          </div>
        </div>

        {/* System Status */}
        <div className="text-center text-xs text-gray-500">
          <div>{UEC_COMPANY_CONFIG.fullName.toUpperCase()} INVOICE COMMAND CENTER v{UEC_COMPANY_CONFIG.system.version}</div>
          <div className="mt-1">
            PDF Generation | Excel Export | Advanced Logging | GST Compliance | Number-to-Words Conversion
          </div>
        </div>

        {/* Add Client Modal */}
        {showAddClient && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div className="terminal-card w-full max-w-2xl m-4">
              <div className="terminal-card-header">
                <div className="terminal-card-title">ADD NEW CLIENT</div>
                <button
                  onClick={() => setShowAddClient(false)}
                  className="text-gray-400 hover:text-white text-xl"
                >
                  ×
                </button>
              </div>
              <div className="p-6 space-y-4">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label className="text-xs font-medium terminal-text">CLIENT NAME *</label>
                    <input
                      type="text"
                      value={newClient.name}
                      onChange={(e) => setNewClient({...newClient, name: e.target.value})}
                      className="terminal-input w-full"
                      required
                    />
                  </div>
                  <div>
                    <label className="text-xs font-medium terminal-text">GSTIN</label>
                    <input
                      type="text"
                      value={newClient.gstin}
                      onChange={(e) => setNewClient({...newClient, gstin: e.target.value})}
                      className="terminal-input w-full"
                    />
                  </div>
                </div>

                <div>
                  <label className="text-xs font-medium terminal-text">BILLING ADDRESS *</label>
                  <textarea
                    value={newClient.billing_address}
                    onChange={(e) => setNewClient({...newClient, billing_address: e.target.value})}
                    className="terminal-input w-full"
                    rows={3}
                    required
                  />
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  <div>
                    <label className="text-xs font-medium terminal-text">CITY</label>
                    <input
                      type="text"
                      value={newClient.city}
                      onChange={(e) => setNewClient({...newClient, city: e.target.value})}
                      className="terminal-input w-full"
                    />
                  </div>
                  <div>
                    <label className="text-xs font-medium terminal-text">STATE</label>
                    <input
                      type="text"
                      value={newClient.state}
                      onChange={(e) => setNewClient({...newClient, state: e.target.value})}
                      className="terminal-input w-full"
                    />
                  </div>
                  <div>
                    <label className="text-xs font-medium terminal-text">STATE CODE</label>
                    <input
                      type="text"
                      value={newClient.state_code}
                      onChange={(e) => setNewClient({...newClient, state_code: e.target.value})}
                      className="terminal-input w-full"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label className="text-xs font-medium terminal-text">PHONE</label>
                    <input
                      type="text"
                      value={newClient.phone}
                      onChange={(e) => setNewClient({...newClient, phone: e.target.value})}
                      className="terminal-input w-full"
                    />
                  </div>
                  <div>
                    <label className="text-xs font-medium terminal-text">EMAIL</label>
                    <input
                      type="email"
                      value={newClient.email}
                      onChange={(e) => setNewClient({...newClient, email: e.target.value})}
                      className="terminal-input w-full"
                    />
                  </div>
                </div>

                <div className="flex gap-4 justify-end">
                  <button
                    onClick={() => setShowAddClient(false)}
                    className="terminal-button"
                  >
                    CANCEL
                  </button>
                  <button
                    onClick={handleAddClient}
                    disabled={!newClient.name || !newClient.billing_address}
                    className="terminal-button primary"
                  >
                    ADD CLIENT
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}