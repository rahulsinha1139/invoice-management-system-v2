'use client';

import { useState, useEffect } from 'react';

interface Product {
  id: number;
  product_name: string;
  product_code: string;
  hsn_code: string;
  base_price: number | null;
  business_category: string;
  product_bucket: string;
  specifications: string;
  tags: string;
  category_name: string;
  category_icon: string;
  color_code: string;
  pack_size: string;
  pack_size_value: number | null;
  pack_size_unit: string;
  selling_price: number | null;
  in_stock: boolean;
  stock_quantity: number | null;
}

interface CategoryStat {
  category_name: string;
  icon: string;
  color_code: string;
  description: string;
  product_count: number;
  avg_price: number | null;
  min_price: number | null;
  max_price: number | null;
}

interface TerminalProductMatrixProps {
  onNavigate: (section: string) => void;
}

export default function TerminalProductMatrix({ onNavigate }: TerminalProductMatrixProps) {
  const [products, setProducts] = useState<Product[]>([]);
  const [categoryStats, setCategoryStats] = useState<CategoryStat[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategory, setSelectedCategory] = useState<string>('');
  const [selectedHsn, setSelectedHsn] = useState<string>('');
  const [currentPage, setCurrentPage] = useState(1);
  const [pagination, setPagination] = useState({ page: 1, limit: 50, total: 0, pages: 0 });
  const [viewMode, setViewMode] = useState<'grid' | 'table' | 'matrix'>('matrix');
  const [selectedProduct, setSelectedProduct] = useState<Product | null>(null);
  const [processingCommand, setProcessingCommand] = useState<string>('');

  useEffect(() => {
    loadProducts();
  }, [searchQuery, selectedCategory, selectedHsn, currentPage]);

  const loadProducts = async () => {
    setLoading(true);
    setProcessingCommand('LOADING_MATRIX');

    try {
      const params = new URLSearchParams({
        page: currentPage.toString(),
        limit: '50'
      });

      if (searchQuery) params.append('search', searchQuery);
      if (selectedCategory) params.append('category', selectedCategory);
      if (selectedHsn) params.append('hsn', selectedHsn);

      const response = await fetch(`/api/products/v3?${params}`);
      if (response.ok) {
        const data = await response.json();
        setProducts(data.products);
        setCategoryStats(data.categoryStats);
        setPagination(data.pagination);
      }
    } catch (error) {
      console.error('Failed to load products:', error);
      setProcessingCommand('ERROR');
    } finally {
      setLoading(false);
      setProcessingCommand('');
    }
  };

  const executeSearch = () => {
    setCurrentPage(1);
    loadProducts();
  };

  const clearFilters = () => {
    setSearchQuery('');
    setSelectedCategory('');
    setSelectedHsn('');
    setCurrentPage(1);
  };

  const formatPrice = (price: number | null): string => {
    if (price === null || price === undefined) return '₹0.00';
    return `₹${price.toFixed(2)}`;
  };

  const getStockStatus = (product: Product): string => {
    if (!product.in_stock) return 'OUT_OF_STOCK';
    if (product.stock_quantity === null || product.stock_quantity === undefined) return 'UNKNOWN';
    if (product.stock_quantity < 10) return 'LOW_STOCK';
    return 'IN_STOCK';
  };

  const getStockStatusColor = (status: string): string => {
    switch (status) {
      case 'IN_STOCK': return 'text-green-400 border-green-400';
      case 'LOW_STOCK': return 'text-orange-400 border-orange-400';
      case 'OUT_OF_STOCK': return 'text-red-400 border-red-400';
      case 'UNKNOWN': return 'text-gray-400 border-gray-400';
      default: return 'text-gray-400 border-gray-400';
    }
  };

  const renderMatrixView = () => (
    <div className="space-y-6">
      {/* Category Overview - Hide when category is selected */}
      {!selectedCategory && (
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">PRODUCT CATEGORY MATRIX</div>
            <div className="text-xs text-gray-400">{categoryStats.length} CATEGORIES</div>
          </div>

          <div className="p-4 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
            {categoryStats.map((category) => (
              <div
                key={category.category_name}
                className="terminal-card cursor-pointer transition-all hover:scale-105 hover:border-cyan-400"
                onClick={() => setSelectedCategory(category.category_name)}
              >
                <div className="p-3 text-center">
                  <div className="text-2xl mb-2">{category.icon}</div>
                  <div className="terminal-text text-sm font-medium mb-1">
                    {category.category_name}
                  </div>
                  <div className="text-xs text-gray-400 mb-2">
                    {category.description}
                  </div>
                  <div className="space-y-1">
                    <div className="flex justify-between text-xs">
                      <span>Products:</span>
                      <span className="terminal-text">{category.product_count}</span>
                    </div>
                    <div className="flex justify-between text-xs">
                      <span>Avg Price:</span>
                      <span className="terminal-text-secondary">{formatPrice(category.avg_price)}</span>
                    </div>
                    <div className="flex justify-between text-xs">
                      <span>Range:</span>
                      <span className="text-gray-400">
                        {formatPrice(category.min_price)} - {formatPrice(category.max_price)}
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Product Grid - Show only when category is selected */}
      {selectedCategory && products.length > 0 && (
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="flex items-center gap-4">
              <button
                onClick={() => setSelectedCategory('')}
                className="terminal-button text-sm px-3 py-1 hover:bg-cyan-900"
              >
                ← BACK TO CATEGORIES
              </button>
              <div className="terminal-card-title">
                {selectedCategory}
              </div>
            </div>
            <div className="text-xs text-gray-400">
              {pagination.total} PRODUCTS | PAGE {pagination.page} OF {pagination.pages}
            </div>
          </div>

          <div className="p-4">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              {products.map((product) => {
                const stockStatus = getStockStatus(product);
                const specifications = product.specifications ? JSON.parse(product.specifications) : {};

                return (
                  <div
                    key={product.id}
                    className="terminal-card bg-gray-900 cursor-pointer hover:bg-gray-800 transition-all"
                    onClick={() => setSelectedProduct(product)}
                  >
                    <div className="p-3">
                      <div className="flex items-start justify-between mb-2">
                        <div className="flex items-center gap-2">
                          <span className="text-lg">{product.category_icon}</span>
                          <div className={`status-indicator border px-2 py-1 rounded text-xs ${getStockStatusColor(stockStatus)}`}>
                            {stockStatus.replace('_', ' ')}
                          </div>
                        </div>
                        <div className="text-right">
                          <div className="terminal-text text-sm font-bold">
                            {formatPrice(product.selling_price)}
                          </div>
                          <div className="text-xs text-gray-400">
                            per {product.pack_size}
                          </div>
                        </div>
                      </div>

                      <div className="space-y-2">
                        <div className="terminal-text font-medium text-sm">
                          {product.product_name}
                        </div>

                        <div className="text-xs space-y-1">
                          <div className="flex justify-between">
                            <span className="text-gray-400">Code:</span>
                            <span className="terminal-text-secondary">{product.product_code}</span>
                          </div>
                          <div className="flex justify-between">
                            <span className="text-gray-400">HSN:</span>
                            <span>{product.hsn_code}</span>
                          </div>
                          <div className="flex justify-between">
                            <span className="text-gray-400">Pack Size:</span>
                            <span className="terminal-text">{product.pack_size}</span>
                          </div>
                          <div className="flex justify-between">
                            <span className="text-gray-400">Category:</span>
                            <span className="text-cyan-400">{product.business_category}</span>
                          </div>
                        </div>

                        {product.stock_quantity !== undefined && (
                          <div className="text-xs">
                            <span className="text-gray-400">Stock: </span>
                            <span className={stockStatus === 'IN_STOCK' ? 'text-green-400' :
                                           stockStatus === 'LOW_STOCK' ? 'text-orange-400' : 'text-red-400'}>
                              {product.stock_quantity} units
                            </span>
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>

            {/* Pagination */}
            {pagination.pages > 1 && (
              <div className="flex items-center justify-between mt-6 pt-4 border-t border-gray-700">
                <div className="text-sm text-gray-400">
                  Showing {((pagination.page - 1) * pagination.limit) + 1} to {Math.min(pagination.page * pagination.limit, pagination.total)} of {pagination.total} products
                </div>

                <div className="flex gap-2">
                  <button
                    onClick={() => setCurrentPage(Math.max(1, currentPage - 1))}
                    disabled={pagination.page <= 1}
                    className="terminal-button text-xs px-3 py-1"
                  >
                    ← PREV
                  </button>

                  <span className="text-sm text-gray-400 px-3 py-1">
                    {pagination.page} / {pagination.pages}
                  </span>

                  <button
                    onClick={() => setCurrentPage(Math.min(pagination.pages, currentPage + 1))}
                    disabled={pagination.page >= pagination.pages}
                    className="terminal-button text-xs px-3 py-1"
                  >
                    NEXT →
                  </button>
                </div>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );

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
          PRODUCT CATALOG MATRIX v3.0.0
        </div>
        <div className="flex items-center gap-2">
          {processingCommand && (
            <div className="status-indicator status-processing">
              <div className="status-dot"></div>
              {processingCommand}
            </div>
          )}
          <div className="status-indicator status-online">
            <div className="status-dot"></div>
            {pagination.total} PRODUCTS
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
        {/* Search and Filter Panel */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">SEARCH & FILTER MATRIX</div>
          </div>

          <div className="p-4 space-y-4">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              {/* Search */}
              <div className="space-y-2">
                <label className="text-xs font-medium terminal-text">SEARCH PRODUCTS:</label>
                <div className="flex gap-2">
                  <input
                    type="text"
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    placeholder="Enter product name, code, or category..."
                    className="terminal-input flex-1"
                    onKeyPress={(e) => e.key === 'Enter' && executeSearch()}
                  />
                  <button
                    onClick={executeSearch}
                    className="terminal-button primary px-4"
                  >
                    🔍 SEARCH
                  </button>
                </div>
              </div>

              {/* Category Filter */}
              <div className="space-y-2">
                <label className="text-xs font-medium terminal-text">CATEGORY:</label>
                <select
                  value={selectedCategory}
                  onChange={(e) => setSelectedCategory(e.target.value)}
                  className="terminal-input w-full"
                >
                  <option value="">ALL CATEGORIES</option>
                  {categoryStats.map(cat => (
                    <option key={cat.category_name} value={cat.category_name}>
                      {cat.icon} {cat.category_name} ({cat.product_count})
                    </option>
                  ))}
                </select>
              </div>

              {/* View Mode */}
              <div className="space-y-2">
                <label className="text-xs font-medium terminal-text">VIEW MODE:</label>
                <div className="flex gap-2">
                  <button
                    onClick={() => setViewMode('matrix')}
                    className={`terminal-button text-xs px-3 py-1 ${viewMode === 'matrix' ? 'primary' : ''}`}
                  >
                    📊 MATRIX
                  </button>
                  <button
                    onClick={() => setViewMode('table')}
                    className={`terminal-button text-xs px-3 py-1 ${viewMode === 'table' ? 'primary' : ''}`}
                  >
                    📋 TABLE
                  </button>
                  <button
                    onClick={clearFilters}
                    className="terminal-button secondary text-xs px-3 py-1"
                  >
                    🔄 CLEAR
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Main Content */}
        {loading ? (
          <div className="terminal-card">
            <div className="p-8 text-center">
              <div className="terminal-text terminal-loading mb-4">LOADING PRODUCT MATRIX...</div>
              <div className="terminal-progress">
                <div className="terminal-progress-bar" style={{ width: '100%' }}></div>
              </div>
            </div>
          </div>
        ) : (
          renderMatrixView()
        )}

        {/* Product Details Modal */}
        {selectedProduct && (
          <div className="fixed inset-0 bg-black/80 flex items-center justify-center z-50 p-4">
            <div className="terminal-card bg-gray-900 max-w-2xl w-full max-h-[80vh] overflow-y-auto">
              <div className="terminal-card-header">
                <div className="terminal-card-title flex items-center gap-2">
                  <span>{selectedProduct.category_icon}</span>
                  PRODUCT DETAILS
                </div>
                <button
                  onClick={() => setSelectedProduct(null)}
                  className="terminal-button text-xs"
                >
                  ✕ CLOSE
                </button>
              </div>

              <div className="p-6 space-y-4">
                <div className="space-y-3">
                  <div className="terminal-text text-xl font-bold">
                    {selectedProduct.product_name}
                  </div>

                  <div className="grid grid-cols-2 gap-4 text-sm">
                    <div>
                      <span className="text-gray-400">Product Code:</span>
                      <div className="terminal-text-secondary">{selectedProduct.product_code}</div>
                    </div>
                    <div>
                      <span className="text-gray-400">HSN Code:</span>
                      <div>{selectedProduct.hsn_code}</div>
                    </div>
                    <div>
                      <span className="text-gray-400">Category:</span>
                      <div className="text-cyan-400">{selectedProduct.category_name}</div>
                    </div>
                    <div>
                      <span className="text-gray-400">Business Category:</span>
                      <div>{selectedProduct.business_category}</div>
                    </div>
                    <div>
                      <span className="text-gray-400">Pack Size:</span>
                      <div className="terminal-text">{selectedProduct.pack_size}</div>
                    </div>
                    <div>
                      <span className="text-gray-400">Unit Price:</span>
                      <div className="terminal-text text-lg">{formatPrice(selectedProduct.selling_price)}</div>
                    </div>
                  </div>

                  <div className="flex gap-4 pt-4">
                    <button
                      onClick={() => {
                        // Add to invoice functionality would go here
                        console.log('Add to invoice:', selectedProduct);
                        setSelectedProduct(null);
                      }}
                      className="terminal-button primary"
                    >
                      ➕ ADD TO INVOICE
                    </button>
                    <button
                      onClick={() => setSelectedProduct(null)}
                      className="terminal-button secondary"
                    >
                      CANCEL
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* System Status */}
        <div className="text-center text-xs text-gray-500">
          <div>PRODUCT CATALOG MATRIX v3.0.0 | {categoryStats.length} CATEGORIES | {pagination.total} PRODUCTS</div>
          <div className="mt-1">
            Advanced Search | Real-Time Filtering | Category Analytics | Stock Management
          </div>
        </div>
      </div>
    </div>
  );
}