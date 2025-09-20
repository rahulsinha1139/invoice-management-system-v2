'use client';

import { useState, useEffect, Suspense, lazy } from 'react';
import TerminalCommandPalette, { useCommandPalette } from './TerminalCommandPalette';
import { UEC_COMPANY_CONFIG } from '../lib/companyConfig';

// 🚀 LAZY LOADING - Load components only when needed
const TerminalDashboard = lazy(() => import('./TerminalDashboard'));
const TerminalInvoice = lazy(() => import('./TerminalInvoice'));
const TerminalInvoiceTracking = lazy(() => import('./TerminalInvoiceTracking'));
const TerminalInvoiceHistory = lazy(() => import('./TerminalInvoiceHistory'));
const TerminalProductMatrix = lazy(() => import('./TerminalProductMatrix'));
const TerminalAnalyticsDashboard = lazy(() => import('./TerminalAnalyticsDashboard'));
const TerminalAchievements = lazy(() => import('./TerminalAchievements'));
const TerminalAutomationCenter = lazy(() => import('./TerminalAutomationCenter'));

// Loading component with terminal styling
const TerminalLoader = () => (
  <div className="terminal-loading flex items-center justify-center h-64">
    <div className="text-green-400 font-mono">
      <div className="animate-pulse">⚡ LOADING MODULE...</div>
    </div>
  </div>
);

export default function TerminalApp() {
  const [currentSection, setCurrentSection] = useState('dashboard');
  const { isOpen: isCommandPaletteOpen, openCommandPalette, closeCommandPalette } = useCommandPalette(setCurrentSection);
  const [isLoading, setIsLoading] = useState(true);
  const [bootSequence, setBootSequence] = useState([
    `INITIALIZING ${UEC_COMPANY_CONFIG.fullName.toUpperCase()} COMMAND CENTER...`,
    'LOADING SYSTEM PROTOCOLS...',
    'CONNECTING TO DATABASE...',
    'ESTABLISHING GST COMPLIANCE...',
    `ACTIVATING ${UEC_COMPANY_CONFIG.shortName} TERMINAL INTERFACE...`,
    'READY FOR OPERATIONS'
  ]);
  const [currentBootIndex, setCurrentBootIndex] = useState(0);

  useEffect(() => {
    // Simulate boot sequence
    if (currentBootIndex < bootSequence.length) {
      const timer = setTimeout(() => {
        setCurrentBootIndex(currentBootIndex + 1);
      }, 600);
      return () => clearTimeout(timer);
    } else {
      const finalTimer = setTimeout(() => {
        setIsLoading(false);
      }, 800);
      return () => clearTimeout(finalTimer);
    }
  }, [currentBootIndex, bootSequence.length]);

  if (isLoading) {
    return (
      <div className="min-h-screen bg-black text-green-400 font-mono flex items-center justify-center">
        <div className="terminal-container max-w-md w-full">
          <div className="terminal-header">
            <div className="terminal-dots">
              <div className="terminal-dot red"></div>
              <div className="terminal-dot yellow"></div>
              <div className="terminal-dot green"></div>
            </div>
            <div className="terminal-title">SYSTEM INITIALIZATION</div>
          </div>

          <div className="p-6 space-y-3">
            <div className="text-center mb-6">
              <div className="text-2xl font-bold terminal-text">UEC</div>
              <div className="text-sm text-gray-400">UNIQUE ENGINEERS CORPORATION</div>
              <div className="text-xs text-gray-500">INVOICE COMMAND CENTER v2.0.0</div>
            </div>

            <div className="space-y-2">
              {bootSequence.slice(0, currentBootIndex).map((message, index) => (
                <div key={index} className="text-sm flex items-center gap-2">
                  <span className="terminal-text">{'>'}</span>
                  <span className="terminal-typing">{message}</span>
                  <span className="text-green-400">✓</span>
                </div>
              ))}

              {currentBootIndex < bootSequence.length && (
                <div className="text-sm flex items-center gap-2">
                  <span className="terminal-text">{'>'}</span>
                  <span className="terminal-typing">{bootSequence[currentBootIndex]}</span>
                  <span className="terminal-loading">⌛</span>
                </div>
              )}
            </div>

            {/* Progress Bar */}
            <div className="mt-6">
              <div className="terminal-progress">
                <div
                  className="terminal-progress-bar"
                  style={{ width: `${(currentBootIndex / bootSequence.length) * 100}%` }}
                ></div>
              </div>
              <div className="text-xs text-center mt-2 text-gray-400">
                {Math.round((currentBootIndex / bootSequence.length) * 100)}% Complete
              </div>
            </div>

            <div className="text-xs text-center text-gray-500 mt-4">
              Powered by Asymmetrica Enhancement Protocol v4.0
            </div>
          </div>
        </div>
      </div>
    );
  }

  const renderSection = () => {
    switch (currentSection) {
      case 'invoice':
        return <TerminalInvoice onNavigate={setCurrentSection} />;
      case 'tracking':
        return <TerminalInvoiceTracking onNavigate={setCurrentSection} />;
      case 'history':
        return <TerminalInvoiceHistory onNavigate={setCurrentSection} />;
      case 'products':
        return <TerminalProductMatrix onNavigate={setCurrentSection} />;
      case 'customers':
        return <TerminalCustomerDatabase onNavigate={setCurrentSection} />;
      case 'analytics':
        return <TerminalAnalyticsDashboard onNavigate={setCurrentSection} />;
      case 'achievements':
        return <TerminalAchievements />;
      case 'automation':
        return <TerminalAutomationCenter onNavigate={setCurrentSection} />;
      default:
        return <TerminalDashboard onNavigate={setCurrentSection} currentSection={currentSection} />;
    }
  };

  return (
    <div className="min-h-screen bg-background">
      <Suspense fallback={<TerminalLoader />}>
        {renderSection()}
      </Suspense>
      <TerminalCommandPalette
        isOpen={isCommandPaletteOpen}
        onClose={closeCommandPalette}
        onNavigate={setCurrentSection}
      />
    </div>
  );
}

// Placeholder components for future implementation

function TerminalProductCatalog({ onNavigate }: { onNavigate: (section: string) => void }) {
  return (
    <div className="terminal-container min-h-screen">
      <div className="terminal-header">
        <div className="terminal-dots">
          <div className="terminal-dot red"></div>
          <div className="terminal-dot yellow"></div>
          <div className="terminal-dot green"></div>
        </div>
        <div className="terminal-title">PRODUCT CATALOG MATRIX</div>
        <button
          onClick={() => onNavigate('dashboard')}
          className="terminal-button text-xs"
        >
          ← DASHBOARD
        </button>
      </div>
      <div className="p-6">
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">INVENTORY MATRIX</div>
          </div>
          <div className="p-4 text-center">
            <div className="terminal-text">📦 LOADING CATALOG</div>
            <div className="text-sm text-gray-400 mt-2">
              Advanced product management interface coming soon
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

function TerminalCustomerDatabase({ onNavigate }: { onNavigate: (section: string) => void }) {
  const [customers, setCustomers] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [showAddClient, setShowAddClient] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
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

  useEffect(() => {
    loadCustomers();
  }, []);

  const loadCustomers = async () => {
    try {
      const response = await fetch('/api/customers');
      const result = await response.json();
      if (result.success) {
        setCustomers(result.data);
      }
    } catch (error) {
      console.error('Error loading customers:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleAddClient = async () => {
    try {
      const response = await fetch('/api/customers', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(newClient),
      });

      const result = await response.json();

      if (result.success) {
        await loadCustomers(); // Refresh the list
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
      } else {
        alert(`Error adding client: ${result.error}`);
      }
    } catch (error) {
      console.error('Error adding client:', error);
      alert('Error adding client');
    }
  };

  const filteredCustomers = customers.filter(customer =>
    customer.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    customer.city?.toLowerCase().includes(searchQuery.toLowerCase()) ||
    customer.gstin?.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className="terminal-container min-h-screen">
      <div className="terminal-header">
        <div className="terminal-dots">
          <div className="terminal-dot red"></div>
          <div className="terminal-dot yellow"></div>
          <div className="terminal-dot green"></div>
        </div>
        <div className="terminal-title">CLIENT DATABASE MATRIX</div>
        <button
          onClick={() => onNavigate('dashboard')}
          className="terminal-button text-xs"
        >
          ← DASHBOARD
        </button>
      </div>

      <div className="p-6 space-y-6">
        {/* Header Controls */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">CLIENT MANAGEMENT</div>
            <div className="text-xs text-gray-400">{customers.length} CLIENTS</div>
          </div>
          <div className="p-4 space-y-4">
            <div className="flex gap-4">
              <input
                type="text"
                placeholder="Search clients..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="terminal-input flex-1"
              />
              <button
                onClick={() => setShowAddClient(true)}
                className="terminal-button primary"
              >
                + ADD CLIENT
              </button>
            </div>
          </div>
        </div>

        {/* Clients List */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">CLIENT RECORDS</div>
          </div>
          <div className="p-4">
            {loading ? (
              <div className="text-center py-8">
                <div className="terminal-text">LOADING CLIENT DATABASE...</div>
              </div>
            ) : filteredCustomers.length > 0 ? (
              <div className="space-y-3">
                {filteredCustomers.map(customer => (
                  <div key={customer.id} className="border border-gray-700 rounded p-4 hover:border-cyan-500 transition-colors">
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                      <div>
                        <div className="text-cyan-400 font-semibold">{customer.name}</div>
                        <div className="text-xs text-gray-400">ID: {customer.id}</div>
                      </div>
                      <div>
                        <div className="text-sm">
                          {customer.city && <div>{customer.city}, {customer.state}</div>}
                          {customer.phone && <div>📞 {customer.phone}</div>}
                          {customer.email && <div>📧 {customer.email}</div>}
                        </div>
                      </div>
                      <div>
                        {customer.gstin && (
                          <div className="text-xs">
                            <span className="text-gray-400">GST:</span>
                            <span className="ml-1 font-mono">{customer.gstin}</span>
                          </div>
                        )}
                        <div className="text-xs text-gray-400">State Code: {customer.state_code}</div>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="text-center py-8 text-gray-400">
                <div className="text-lg mb-2">NO CLIENTS FOUND</div>
                <div className="text-sm">
                  {searchQuery ? 'Try adjusting your search criteria' : 'Add your first client to get started'}
                </div>
              </div>
            )}
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


function TerminalSettings({ onNavigate }: { onNavigate: (section: string) => void }) {
  return (
    <div className="terminal-container min-h-screen">
      <div className="terminal-header">
        <div className="terminal-dots">
          <div className="terminal-dot red"></div>
          <div className="terminal-dot yellow"></div>
          <div className="terminal-dot green"></div>
        </div>
        <div className="terminal-title">SYSTEM CONFIGURATION</div>
        <button
          onClick={() => onNavigate('dashboard')}
          className="terminal-button text-xs"
        >
          ← DASHBOARD
        </button>
      </div>
      <div className="p-6">
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">SYSTEM CONFIG</div>
          </div>
          <div className="p-4 text-center">
            <div className="terminal-text">⚙️ LOADING CONFIG</div>
            <div className="text-sm text-gray-400 mt-2">
              System configuration interface coming soon
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}