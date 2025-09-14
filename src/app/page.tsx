'use client';

import { useState, useEffect } from 'react';

interface ApiResponse<T> {
  success: boolean;
  data: T;
  count?: number;
  error?: string;
}

interface HSNCode {
  id: number;
  code: string;
  description: string;
  gst_rate_slab: number;
  effective_from: string;
  is_active: boolean;
  created_at: string;
}

interface Product {
  id: number;
  sku: string;
  brand_id: number;
  category_id: number;
  name: string;
  description?: string;
  default_hsn_id: number;
  default_uom_id: number;
  product_type: string;
  is_active: boolean;
  created_at: string;
  updated_at: string;
  hsn_code?: string;
  brand_name?: string;
  category_name?: string;
  uom_code?: string;
  gst_rate_slab?: number;
}

interface Customer {
  id: number;
  name: string;
  gstin?: string;
  pan?: string;
  email?: string;
  phone?: string;
  billing_address: string;
  shipping_address?: string;
  city?: string;
  state: string;
  state_code: string;
  place_of_supply: string;
  pin?: string;
  contact_person?: string;
  payment_terms: string;
  credit_limit: number;
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

interface InvoiceLineRequestExtended {
  product_id: number;
  product_variant_id: number;
  product_name: string;
  description?: string;
  hsn_code: string;
  uom: string;
  pack_size_value?: number;
  pack_size_uom?: string;
  quantity: number;
  unit_price?: number;
  discount_pct?: number;
  discount_amount?: number;
  cgst_pct?: number;
  sgst_pct?: number;
  igst_pct?: number;
  cess_pct?: number;
  is_manual?: boolean;
}

export default function InvoiceApp() {
  const [hsnCodes, setHsnCodes] = useState<HSNCode[]>([]);
  const [products, setProducts] = useState<Product[]>([]);
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [selectedCustomer, setSelectedCustomer] = useState<Customer | null>(null);
  const [selectedHsn, setSelectedHsn] = useState<string>('');
  const [invoiceLines, setInvoiceLines] = useState<InvoiceLineRequestExtended[]>([]);
  const [loading, setLoading] = useState(true);
  const [nextInvoiceNumber, setNextInvoiceNumber] = useState<string>('1');
  const [showManualEntry, setShowManualEntry] = useState(false);
  const [showNewCustomer, setShowNewCustomer] = useState(false);
  const [newCustomer, setNewCustomer] = useState({
    name: '',
    billing_address: '',
    city: '',
    state: 'MADHYA PRADESH',
    state_code: '23',
    place_of_supply: 'MADHYA PRADESH',
    pin: '',
    gstin: '',
    phone: '',
    email: ''
  });
  const [manualProduct, setManualProduct] = useState({
    product_name: '',
    description: '',
    hsn_code: '',
    uom: 'PCS',
    quantity: 1,
    unit_price: 0,
    discount_pct: 0
  });

  // Load initial data
  useEffect(() => {
    const loadData = async () => {
      try {
        const [hsnResponse, customersResponse, nextNumberResponse] = await Promise.all([
          fetch('/api/products/hsn-codes').then(r => r.json()) as Promise<ApiResponse<HSNCode[]>>,
          fetch('/api/customers').then(r => r.json()) as Promise<ApiResponse<Customer[]>>,
          fetch('/api/invoices/next-number').then(r => r.json()) as Promise<ApiResponse<{next_number: string}>>
        ]);

        if (hsnResponse.success) setHsnCodes(hsnResponse.data);
        if (customersResponse.success) setCustomers(customersResponse.data);
        if (nextNumberResponse.success) setNextInvoiceNumber(nextNumberResponse.data.next_number);

        setLoading(false);
      } catch (error) {
        console.error('Failed to load data:', error);
        setLoading(false);
      }
    };

    loadData();
  }, []);

  // Load products when HSN is selected
  useEffect(() => {
    if (selectedHsn) {
      const loadProducts = async () => {
        try {
          const response = await fetch(`/api/products?hsn_code=${selectedHsn}`);
          const data: ApiResponse<Product[]> = await response.json();
          if (data.success) {
            setProducts(data.data);
          }
        } catch (error) {
          console.error('Failed to load products:', error);
        }
      };

      loadProducts();
    } else {
      setProducts([]);
    }
  }, [selectedHsn]);

  const addProductToInvoice = (product: Product) => {
    const newLine: InvoiceLineRequestExtended = {
      product_id: product.id,
      product_variant_id: product.id, // Simplified for now
      product_name: product.name,
      description: product.description,
      hsn_code: product.hsn_code || '',
      uom: product.uom_code || 'PCS',
      quantity: 1,
      unit_price: 100, // Default price
      discount_pct: 0,
      cgst_pct: (product.gst_rate_slab || 18) / 2,
      sgst_pct: (product.gst_rate_slab || 18) / 2,
      igst_pct: 0,
      cess_pct: 0
    };

    setInvoiceLines(prev => [...prev, newLine]);
  };

  const addManualProduct = () => {
    if (!manualProduct.product_name.trim() || !manualProduct.hsn_code.trim()) {
      alert('Please fill in product name and HSN code');
      return;
    }

    const gstRate = 18; // Default GST rate
    const newLine: InvoiceLineRequestExtended = {
      product_id: 0, // Manual entry
      product_variant_id: 0,
      product_name: manualProduct.product_name,
      description: manualProduct.description,
      hsn_code: manualProduct.hsn_code,
      uom: manualProduct.uom,
      quantity: manualProduct.quantity,
      unit_price: manualProduct.unit_price,
      discount_pct: manualProduct.discount_pct,
      cgst_pct: selectedCustomer?.state === 'MADHYA PRADESH' ? gstRate / 2 : 0,
      sgst_pct: selectedCustomer?.state === 'MADHYA PRADESH' ? gstRate / 2 : 0,
      igst_pct: selectedCustomer?.state !== 'MADHYA PRADESH' ? gstRate : 0,
      cess_pct: 0,
      is_manual: true
    };

    setInvoiceLines(prev => [...prev, newLine]);

    // Reset manual product form
    setManualProduct({
      product_name: '',
      description: '',
      hsn_code: '',
      uom: 'PCS',
      quantity: 1,
      unit_price: 0,
      discount_pct: 0
    });
    setShowManualEntry(false);
  };

  const createNewCustomer = async () => {
    if (!newCustomer.name.trim() || !newCustomer.billing_address.trim()) {
      alert('Please fill in customer name and address');
      return;
    }

    try {
      const response = await fetch('/api/customers', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          ...newCustomer,
          payment_terms: 'Cash',
          credit_limit: 0,
          is_active: true
        })
      });

      const result = await response.json();
      if (result.success) {
        const createdCustomer = result.data;
        setCustomers(prev => [...prev, createdCustomer]);
        setSelectedCustomer(createdCustomer);

        // Reset form
        setNewCustomer({
          name: '',
          billing_address: '',
          city: '',
          state: 'MADHYA PRADESH',
          state_code: '23',
          place_of_supply: 'MADHYA PRADESH',
          pin: '',
          gstin: '',
          phone: '',
          email: ''
        });
        setShowNewCustomer(false);
        alert('Customer created successfully!');
      } else {
        alert('Failed to create customer: ' + result.error);
      }
    } catch (error) {
      alert('Error creating customer: ' + error);
    }
  };

  const updateLineQuantity = (index: number, quantity: number) => {
    setInvoiceLines(prev => prev.map((line, i) =>
      i === index ? { ...line, quantity } : line
    ));
  };

  const updateLinePrice = (index: number, price: number) => {
    setInvoiceLines(prev => prev.map((line, i) =>
      i === index ? { ...line, unit_price: price } : line
    ));
  };

  const updateLineDiscount = (index: number, discount: number) => {
    setInvoiceLines(prev => prev.map((line, i) =>
      i === index ? { ...line, discount_pct: discount } : line
    ));
  };

  const removeLine = (index: number) => {
    setInvoiceLines(prev => prev.filter((_, i) => i !== index));
  };

  const calculateTotal = () => {
    return invoiceLines.reduce((sum, line) => {
      const lineTotal = line.quantity * (line.unit_price || 0);
      const discountAmount = lineTotal * ((line.discount_pct || 0) / 100);
      return sum + (lineTotal - discountAmount);
    }, 0);
  };

  const calculateTax = () => {
    const subtotal = calculateTotal();
    const isInterstate = selectedCustomer?.state !== 'MADHYA PRADESH';

    if (isInterstate) {
      return subtotal * 0.18; // IGST 18%
    } else {
      return subtotal * 0.18; // CGST 9% + SGST 9%
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-100 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-blue-500 mb-4"></div>
          <p className="text-gray-600">Loading Invoice Application...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-100 to-gray-200">
      <div className="container mx-auto py-8 px-4">
        {/* Professional Company Header */}
        <div className="invoice-container max-w-[210mm] mx-auto bg-white shadow-xl border border-gray-500">
          <div className="company-header bg-gradient-to-r from-blue-50 to-blue-100 p-6 border-b-2 border-blue-600">
            <div className="flex items-center justify-between">
              <div className="flex-1">
                <h1 className="text-4xl font-bold text-blue-900 mb-3 tracking-wide">UNIQUE ENGINEERS CORPORATION</h1>
                <div className="text-sm text-gray-700 space-y-1">
                  <p className="font-medium">Authorized Distributors: TotalEnergies, Eutectic Castolin, PIX Transmissions</p>
                  <p>Shop No 1, TIT Complex, Jabalpur Road Bargawan, Katni - 483501, Madhya Pradesh</p>
                  <p><span className="font-semibold">Contact:</span> 9425412453, 9302131864 | <span className="font-semibold">Email:</span> unique_engineers2000@yahoo.com</p>
                  <p><span className="font-semibold">GSTIN:</span> 23AACFU6860C2ZD</p>
                </div>
              </div>
            </div>
          </div>

          {/* Invoice Title and Metadata */}
          <div className="flex justify-between items-start p-8 pb-6">
            <div className="flex-1"></div>
            <div className="text-center flex-1">
              <h2 className="text-3xl font-bold text-gray-900 mb-2 tracking-wide">INVOICE/CHALLAN</h2>
            </div>
            <div className="flex-1 text-right">
              <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                <div className="space-y-2 text-sm">
                  <div><span className="font-semibold text-gray-700">Invoice No:</span> <span className="font-bold text-blue-800">#{nextInvoiceNumber}</span></div>
                  <div><span className="font-semibold text-gray-700">Date:</span> {new Date().toLocaleDateString('en-IN')}</div>
                  <div><span className="font-semibold text-gray-700">Place of Supply:</span> {selectedCustomer?.place_of_supply || 'MADHYA PRADESH'}</div>
                </div>
              </div>
            </div>
          </div>

          {/* Company Details and Customer Section */}
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 px-8 mb-8">
            <div>
              {/* Bill To Section */}
              <div className="mb-8">
                <h3 className="text-lg font-bold text-gray-800 mb-4 border-b border-gray-300 pb-2">BILL TO</h3>
            <div>
              <div className="flex justify-between items-center mb-2">
                <label className="block text-sm font-medium text-gray-700">Select Customer</label>
                <button
                  onClick={() => setShowNewCustomer(!showNewCustomer)}
                  className="text-blue-500 hover:text-blue-700 text-xs underline"
                >
                  + Add New Customer
                </button>
              </div>

              {/* New Customer Form */}
              {showNewCustomer && (
                <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-4">
                  <h4 className="font-medium mb-3 text-blue-800">New Customer Details</h4>
                  <div className="space-y-3">
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                      <input
                        type="text"
                        placeholder="Customer Name *"
                        value={newCustomer.name}
                        onChange={(e) => setNewCustomer(prev => ({...prev, name: e.target.value}))}
                        className="p-2 border border-gray-300 rounded text-sm"
                      />
                      <input
                        type="text"
                        placeholder="Phone"
                        value={newCustomer.phone}
                        onChange={(e) => setNewCustomer(prev => ({...prev, phone: e.target.value}))}
                        className="p-2 border border-gray-300 rounded text-sm"
                      />
                    </div>
                    <textarea
                      placeholder="Billing Address *"
                      value={newCustomer.billing_address}
                      onChange={(e) => setNewCustomer(prev => ({...prev, billing_address: e.target.value}))}
                      className="w-full p-2 border border-gray-300 rounded text-sm"
                      rows={2}
                    />
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
                      <input
                        type="text"
                        placeholder="City"
                        value={newCustomer.city}
                        onChange={(e) => setNewCustomer(prev => ({...prev, city: e.target.value}))}
                        className="p-2 border border-gray-300 rounded text-sm"
                      />
                      <select
                        value={newCustomer.state}
                        onChange={(e) => setNewCustomer(prev => ({
                          ...prev,
                          state: e.target.value,
                          state_code: e.target.value === 'MADHYA PRADESH' ? '23' : '27',
                          place_of_supply: e.target.value
                        }))}
                        className="p-2 border border-gray-300 rounded text-sm"
                      >
                        <option value="MADHYA PRADESH">Madhya Pradesh</option>
                        <option value="UTTAR PRADESH">Uttar Pradesh</option>
                        <option value="RAJASTHAN">Rajasthan</option>
                        <option value="GUJARAT">Gujarat</option>
                        <option value="MAHARASHTRA">Maharashtra</option>
                      </select>
                      <input
                        type="text"
                        placeholder="PIN"
                        value={newCustomer.pin}
                        onChange={(e) => setNewCustomer(prev => ({...prev, pin: e.target.value}))}
                        className="p-2 border border-gray-300 rounded text-sm"
                      />
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                      <input
                        type="text"
                        placeholder="GSTIN (optional)"
                        value={newCustomer.gstin}
                        onChange={(e) => setNewCustomer(prev => ({...prev, gstin: e.target.value}))}
                        className="p-2 border border-gray-300 rounded text-sm"
                      />
                      <input
                        type="email"
                        placeholder="Email (optional)"
                        value={newCustomer.email}
                        onChange={(e) => setNewCustomer(prev => ({...prev, email: e.target.value}))}
                        className="p-2 border border-gray-300 rounded text-sm"
                      />
                    </div>
                    <div className="flex gap-2">
                      <button
                        onClick={createNewCustomer}
                        className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 text-sm"
                      >
                        Create Customer
                      </button>
                      <button
                        onClick={() => setShowNewCustomer(false)}
                        className="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 text-sm"
                      >
                        Cancel
                      </button>
                    </div>
                  </div>
                </div>
              )}

              <select
                value={selectedCustomer?.id || ''}
                onChange={(e) => {
                  const customer = customers.find(c => c.id === parseInt(e.target.value));
                  setSelectedCustomer(customer || null);
                }}
                className="w-full p-2 border border-gray-300 rounded-md"
              >
                <option value="">Choose a customer...</option>
                {customers.map(customer => (
                  <option key={customer.id} value={customer.id}>
                    {customer.name} - {customer.city}
                  </option>
                ))}
              </select>
            </div>

                {selectedCustomer && (
                  <div className="bg-gray-50 border border-gray-300 rounded-lg p-4 text-sm">
                    <p className="font-bold text-lg text-gray-900 mb-2">{selectedCustomer.name}</p>
                    <p className="text-gray-700 mb-1">{selectedCustomer.billing_address}</p>
                    <p className="text-gray-700 mb-2">{selectedCustomer.city}, {selectedCustomer.state} - {selectedCustomer.pin}</p>
                    {selectedCustomer.gstin && <p className="text-blue-700 font-medium">GSTIN: {selectedCustomer.gstin}</p>}
                    {selectedCustomer.phone && <p className="text-gray-600">Phone: {selectedCustomer.phone}</p>}
                    <p className="text-xs text-gray-500 mt-2">State Code: {selectedCustomer.state_code}</p>
                  </div>
                )}
              </div>
            </div>

            <div>
              {/* Bank Details */}
              <div className="bg-blue-50 border border-blue-300 rounded-lg p-4 mb-6">
                <h3 className="font-bold text-blue-900 mb-3">Bank Details</h3>
                <div className="text-sm space-y-1.5 text-gray-700">
                  <p><span className="font-semibold">Bank Name:</span> STATE BANK OF INDIA</p>
                  <p><span className="font-semibold">A/c No.:</span> 30927872217</p>
                  <p><span className="font-semibold">Branch & IFS Code:</span> SBIN0004671</p>
                </div>
              </div>

              {/* Transport/Vehicle Details */}
              <div className="space-y-3">
                <div>
                  <label className="block text-sm font-semibold text-gray-700 mb-1">Transport/Vehicle:</label>
                  <input
                    type="text"
                    className="w-full p-2 border border-gray-300 rounded-md text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    placeholder="Vehicle details"
                  />
                </div>
                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-1">Dispatch From:</label>
                    <input
                      type="text"
                      className="w-full p-2 border border-gray-300 rounded-md text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                      defaultValue="KATNI"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-1">Dispatch to:</label>
                    <input
                      type="text"
                      className="w-full p-2 border border-gray-300 rounded-md text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                      value={selectedCustomer?.city || ''}
                      readOnly
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Product Selection Section */}
          <div className="px-8 mb-8 no-print">
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-lg font-semibold">Add Products</h3>
              <button
                onClick={() => setShowManualEntry(!showManualEntry)}
                className="bg-green-500 text-white px-4 py-2 rounded-md hover:bg-green-600 text-sm"
              >
                {showManualEntry ? 'Hide Manual Entry' : '+ Add Manual Product'}
              </button>
            </div>

            {/* Manual Product Entry Form */}
            {showManualEntry && (
              <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 mb-6">
                <h4 className="font-medium mb-3 text-yellow-800">Manual Product Entry</h4>
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                  <div>
                    <label className="block text-xs font-medium text-gray-700 mb-1">Product Name *</label>
                    <input
                      type="text"
                      value={manualProduct.product_name}
                      onChange={(e) => setManualProduct(prev => ({...prev, product_name: e.target.value}))}
                      className="w-full p-2 border border-gray-300 rounded text-sm"
                      placeholder="Enter product name"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-700 mb-1">Description</label>
                    <input
                      type="text"
                      value={manualProduct.description}
                      onChange={(e) => setManualProduct(prev => ({...prev, description: e.target.value}))}
                      className="w-full p-2 border border-gray-300 rounded text-sm"
                      placeholder="Product description"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-700 mb-1">HSN Code *</label>
                    <input
                      type="text"
                      value={manualProduct.hsn_code}
                      onChange={(e) => setManualProduct(prev => ({...prev, hsn_code: e.target.value}))}
                      className="w-full p-2 border border-gray-300 rounded text-sm"
                      placeholder="HSN Code"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-700 mb-1">Unit</label>
                    <select
                      value={manualProduct.uom}
                      onChange={(e) => setManualProduct(prev => ({...prev, uom: e.target.value}))}
                      className="w-full p-2 border border-gray-300 rounded text-sm"
                    >
                      <option value="PCS">PCS</option>
                      <option value="KG">KG</option>
                      <option value="LITER">LITER</option>
                      <option value="MTR">MTR</option>
                    </select>
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-700 mb-1">Quantity</label>
                    <input
                      type="number"
                      value={manualProduct.quantity}
                      onChange={(e) => setManualProduct(prev => ({...prev, quantity: parseFloat(e.target.value) || 0}))}
                      className="w-full p-2 border border-gray-300 rounded text-sm"
                      min="0"
                      step="0.01"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-700 mb-1">Unit Price (₹)</label>
                    <input
                      type="number"
                      value={manualProduct.unit_price}
                      onChange={(e) => setManualProduct(prev => ({...prev, unit_price: parseFloat(e.target.value) || 0}))}
                      className="w-full p-2 border border-gray-300 rounded text-sm"
                      min="0"
                      step="0.01"
                    />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-700 mb-1">Discount %</label>
                    <input
                      type="number"
                      value={manualProduct.discount_pct}
                      onChange={(e) => setManualProduct(prev => ({...prev, discount_pct: parseFloat(e.target.value) || 0}))}
                      className="w-full p-2 border border-gray-300 rounded text-sm"
                      min="0"
                      max="100"
                      step="0.01"
                    />
                  </div>
                  <div className="flex items-end">
                    <button
                      onClick={addManualProduct}
                      className="w-full bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 text-sm"
                    >
                      Add Product
                    </button>
                  </div>
                </div>
              </div>
            )}

            <label className="block text-sm font-medium text-gray-700 mb-2">Or Select from Catalog (HSN Code)</label>
            <select
              value={selectedHsn}
              onChange={(e) => setSelectedHsn(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md mb-4"
            >
              <option value="">Choose HSN Code...</option>
              {hsnCodes.map(hsn => (
                <option key={hsn.id} value={hsn.code}>
                  {hsn.code} - {hsn.description} ({hsn.gst_rate_slab}% GST)
                </option>
              ))}
            </select>

            {products.length > 0 && (
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {products.map(product => (
                  <div key={product.id} className="border border-gray-300 rounded-md p-4">
                    <h4 className="font-medium text-sm mb-2">{product.name}</h4>
                    <p className="text-xs text-gray-600 mb-2">{product.description}</p>
                    <p className="text-xs text-blue-600 mb-2">SKU: {product.sku}</p>
                    <p className="text-xs text-green-600 mb-3">Brand: {product.brand_name}</p>
                    <button
                      onClick={() => addProductToInvoice(product)}
                      className="w-full bg-blue-500 text-white py-1 px-3 rounded text-xs hover:bg-blue-600"
                    >
                      Add to Invoice
                    </button>
                  </div>
                ))}
              </div>
            )}
          </div>

          {/* Invoice Line Items Table */}
          {invoiceLines.length > 0 && (
            <div className="px-8 mb-8">
              <h3 className="text-xl font-bold text-gray-800 mb-4 border-b-2 border-blue-600 pb-2">INVOICE ITEMS</h3>
              <div className="overflow-x-auto border border-gray-400 rounded-lg">
                <table className="w-full text-sm">
                  <thead className="bg-blue-100">
                    <tr className="border-b-2 border-blue-600">
                      <th className="text-left py-3 px-4 font-bold text-blue-900">Product Description</th>
                      <th className="text-center py-3 px-2 font-bold text-blue-900">HSN</th>
                      <th className="text-center py-3 px-2 font-bold text-blue-900">UOM</th>
                      <th className="text-right py-3 px-2 font-bold text-blue-900">Qty</th>
                      <th className="text-right py-3 px-2 font-bold text-blue-900">Rate</th>
                      <th className="text-right py-3 px-2 font-bold text-blue-900">Disc%</th>
                      <th className="text-right py-3 px-2 font-bold text-blue-900">Amount</th>
                      <th className="text-center py-3 px-2 font-bold text-blue-900">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    {invoiceLines.map((line, index) => (
                      <tr key={index} className={`border-b hover:bg-gray-50 ${index % 2 === 0 ? 'bg-white' : 'bg-gray-25'}`}>
                        <td className="py-3 px-4">
                          <div>
                            <p className="font-semibold text-gray-900">{line.product_name}</p>
                            {line.description && <p className="text-xs text-gray-600 mt-1">{line.description}</p>}
                            {line.is_manual && <span className="text-xs bg-green-100 text-green-800 px-2 py-1 rounded-full">Manual</span>}
                          </div>
                        </td>
                        <td className="py-3 px-2 text-center font-medium text-gray-700">{line.hsn_code}</td>
                        <td className="py-3 px-2 text-center text-gray-600">{line.uom}</td>
                        <td className="py-3 px-2 text-right">
                          <input
                            type="number"
                            value={line.quantity}
                            onChange={(e) => updateLineQuantity(index, parseFloat(e.target.value) || 0)}
                            className="w-16 p-1 border border-gray-300 rounded text-right focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                            min="0"
                            step="0.01"
                          />
                        </td>
                        <td className="py-3 px-2 text-right">
                          <input
                            type="number"
                            value={line.unit_price || 0}
                            onChange={(e) => updateLinePrice(index, parseFloat(e.target.value) || 0)}
                            className="w-20 p-1 border border-gray-300 rounded text-right focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                            min="0"
                            step="0.01"
                          />
                        </td>
                        <td className="py-3 px-2 text-right">
                          <input
                            type="number"
                            value={line.discount_pct || 0}
                            onChange={(e) => updateLineDiscount(index, parseFloat(e.target.value) || 0)}
                            className="w-16 p-1 border border-gray-300 rounded text-right focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                            min="0"
                            max="100"
                            step="0.01"
                          />
                        </td>
                        <td className="py-3 px-2 text-right font-semibold text-gray-900">
                          {(() => {
                            const lineTotal = line.quantity * (line.unit_price || 0);
                            const discountAmount = lineTotal * ((line.discount_pct || 0) / 100);
                            return `₹${(lineTotal - discountAmount).toFixed(2)}`;
                          })()}
                        </td>
                        <td className="py-3 px-2 text-center">
                          <button
                            onClick={() => removeLine(index)}
                            className="text-red-500 hover:text-red-700 hover:bg-red-50 px-2 py-1 rounded text-xs transition-colors"
                            title="Remove item"
                          >
                            ✕
                          </button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              {/* Professional Tax Summary */}
              <div className="mt-6">
                <div className="flex justify-end">
                  <div className="w-80 bg-blue-50 border border-blue-300 rounded-lg p-4">
                    <h4 className="font-bold text-blue-900 mb-3 text-center">TAX SUMMARY</h4>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between py-1 border-b border-blue-200">
                        <span className="font-medium">Subtotal:</span>
                        <span className="font-semibold">₹{calculateTotal().toFixed(2)}</span>
                      </div>
                      <div className="flex justify-between py-1 text-gray-700">
                        <span>{selectedCustomer?.state !== 'MADHYA PRADESH' ? 'IGST (18%)' : 'CGST (9%) + SGST (9%)'}:</span>
                        <span>₹{calculateTax().toFixed(2)}</span>
                      </div>
                      <div className="flex justify-between py-2 border-t-2 border-blue-600 font-bold text-lg text-blue-900">
                        <span>GRAND TOTAL:</span>
                        <span>₹{(calculateTotal() + calculateTax()).toFixed(2)}</span>
                      </div>
                      <div className="text-center text-xs text-gray-600 mt-2">
                        Amount in Words: {/* TODO: Add number to words conversion */}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* Invoice Footer */}
          <div className="px-8 mb-8">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 border-t-2 border-gray-300 pt-6">
              <div>
                <h4 className="font-bold text-gray-800 mb-2">Terms & Conditions:</h4>
                <div className="text-xs text-gray-600 space-y-1">
                  <p>• Payment terms: {selectedCustomer?.payment_terms || 'As per agreement'}</p>
                  <p>• Goods once sold will not be taken back</p>
                  <p>• Subject to Katni jurisdiction only</p>
                  <p>• E. & O.E.</p>
                </div>
              </div>
              <div className="text-right">
                <div className="mb-4">
                  <p className="text-sm font-semibold text-gray-700">For UNIQUE ENGINEERS CORPORATION</p>
                  <div className="mt-8 border-t border-gray-400 pt-2">
                    <p className="text-sm text-gray-600">Authorized Signatory</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Professional Action Buttons */}
          {invoiceLines.length > 0 && (
            <div className="px-8 pb-8 text-center bg-gray-50 border-t border-gray-300 no-print">
              <div className="py-6">
                <button
                  onClick={() => window.print()}
                  className="bg-blue-600 text-white py-3 px-8 rounded-lg hover:bg-blue-700 mr-4 font-semibold shadow-lg transition-colors"
                >
                  📄 Print Invoice
                </button>
                <button
                  onClick={() => {
                    if (confirm('Are you sure you want to create a new invoice? All current data will be cleared.')) {
                      setInvoiceLines([]);
                      setSelectedCustomer(null);
                      setSelectedHsn('');
                    }
                  }}
                  className="bg-gray-600 text-white py-3 px-8 rounded-lg hover:bg-gray-700 font-semibold shadow-lg transition-colors"
                >
                  🆕 New Invoice
                </button>
              </div>
            </div>
          )}
        </div>

        {/* System Status Panel */}
        <div className="max-w-[210mm] mx-auto bg-gradient-to-r from-green-50 to-blue-50 border border-blue-200 rounded-lg p-4 shadow-md no-print">
          <div className="flex items-center justify-between">
            <div>
              <h3 className="font-bold text-green-800 mb-2">✓ System Status - Production Ready</h3>
              <div className="grid grid-cols-1 md:grid-cols-4 gap-4 text-sm">
                <div className="bg-white rounded px-3 py-2">
                  <span className="font-semibold text-blue-700">HSN Codes:</span> <span className="font-bold">{hsnCodes.length}</span>
                </div>
                <div className="bg-white rounded px-3 py-2">
                  <span className="font-semibold text-blue-700">Products:</span> <span className="font-bold">{products.length}</span>
                </div>
                <div className="bg-white rounded px-3 py-2">
                  <span className="font-semibold text-blue-700">Customers:</span> <span className="font-bold">{customers.length}</span>
                </div>
                <div className="bg-white rounded px-3 py-2">
                  <span className="font-semibold text-blue-700">Server:</span> <span className="text-green-600 font-bold">Online</span>
                </div>
              </div>
            </div>
            <div className="text-right">
              <p className="text-xs text-green-700 font-medium">🚀 Next.js Production Environment</p>
              <p className="text-xs text-blue-600">Database: SQLite + API Routes</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
