'use client';

import { useState, useEffect } from 'react';

interface AnalyticsData {
  revenue: {
    total: number;
    monthly: number;
    growth: number;
    target: number;
  };
  invoices: {
    total: number;
    pending: number;
    paid: number;
    overdue: number;
  };
  products: {
    topSelling: Array<{ name: string; units: number; revenue: number }>;
    categories: Array<{ name: string; percentage: number; value: number }>;
  };
  customers: {
    active: number;
    newThisMonth: number;
    retention: number;
  };
  predictions: {
    nextMonthRevenue: number;
    growthTrend: 'up' | 'down' | 'stable';
    riskAlerts: Array<{ type: string; message: string; severity: 'low' | 'medium' | 'high' }>;
  };
}

interface TerminalAnalyticsDashboardProps {
  onNavigate: (section: string) => void;
}

export default function TerminalAnalyticsDashboard({ onNavigate }: TerminalAnalyticsDashboardProps) {
  const [analyticsData, setAnalyticsData] = useState<AnalyticsData | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [selectedTimeframe, setSelectedTimeframe] = useState<'7d' | '30d' | '90d' | '1y'>('30d');
  const [activeView, setActiveView] = useState<'overview' | 'revenue' | 'products' | 'customers' | 'predictions'>('overview');

  useEffect(() => {
    // Simulate AI-powered analytics computation
    const computeAnalytics = async () => {
      setIsLoading(true);

      // Simulate API call with realistic business data
      await new Promise(resolve => setTimeout(resolve, 1500));

      const mockData: AnalyticsData = {
        revenue: {
          total: 2847629.50,
          monthly: 458932.75,
          growth: 15.7,
          target: 500000
        },
        invoices: {
          total: 1247,
          pending: 23,
          paid: 1189,
          overdue: 35
        },
        products: {
          topSelling: [
            { name: 'TotalEnergies EP2 Grease', units: 245, revenue: 98500 },
            { name: 'Eutectic Castolin 7018', units: 189, revenue: 85300 },
            { name: 'PIX Transmission Oil', units: 156, revenue: 76200 },
            { name: 'Coolant Premium 50L', units: 134, revenue: 67000 },
            { name: 'Welding Electrodes 6013', units: 198, revenue: 59400 }
          ],
          categories: [
            { name: 'Lubricants', percentage: 42.5, value: 1209892.38 },
            { name: 'Welding Materials', percentage: 31.2, value: 888439.29 },
            { name: 'Coolants', percentage: 16.8, value: 478402.04 },
            { name: 'Greases', percentage: 9.5, value: 270895.79 }
          ]
        },
        customers: {
          active: 67,
          newThisMonth: 8,
          retention: 94.2
        },
        predictions: {
          nextMonthRevenue: 487650,
          growthTrend: 'up',
          riskAlerts: [
            { type: 'Payment Risk', message: 'Client ABC Industries has 3 overdue invoices', severity: 'high' },
            { type: 'Inventory Alert', message: 'Low stock: TotalEnergies EP2 Grease (12 units remaining)', severity: 'medium' },
            { type: 'Growth Opportunity', message: 'Demand spike predicted for welding materials next month', severity: 'low' }
          ]
        }
      };

      setAnalyticsData(mockData);
      setIsLoading(false);
    };

    computeAnalytics();
  }, [selectedTimeframe]);

  if (isLoading) {
    return (
      <div className="terminal-container min-h-screen">
        <div className="terminal-header">
          <div className="terminal-dots">
            <div className="terminal-dot red"></div>
            <div className="terminal-dot yellow"></div>
            <div className="terminal-dot green"></div>
          </div>
          <div className="terminal-title">BUSINESS INTELLIGENCE ENGINE</div>
          <button onClick={() => onNavigate('dashboard')} className="terminal-button text-xs">← DASHBOARD</button>
        </div>

        <div className="p-6 flex items-center justify-center min-h-[400px]">
          <div className="terminal-card max-w-md w-full text-center">
            <div className="p-8">
              <div className="text-4xl mb-4 animate-pulse">🧠</div>
              <div className="terminal-text text-xl mb-2">AI INTELLIGENCE COMPUTING</div>
              <div className="text-sm text-gray-400 mb-6">Processing business patterns and predictions...</div>

              <div className="terminal-progress mb-4">
                <div className="terminal-progress-bar animate-pulse" style={{ width: '85%' }}></div>
              </div>

              <div className="text-xs text-gray-500">
                📊 Analyzing 1,247 invoices • 313 products • 67 customers
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (!analyticsData) return null;

  const renderOverview = () => (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
      {/* Revenue Card */}
      <div className="terminal-card hover:bg-gray-800 transition-colors cursor-pointer"
           onClick={() => setActiveView('revenue')}>
        <div className="terminal-card-header">
          <div className="terminal-card-title">TOTAL REVENUE</div>
          <div className="text-green-400">💰</div>
        </div>
        <div className="p-4">
          <div className="text-2xl font-bold terminal-text">
            ₹{analyticsData.revenue.total.toLocaleString('en-IN')}
          </div>
          <div className="flex items-center gap-2 mt-2">
            <div className="text-green-400 text-sm">↗ +{analyticsData.revenue.growth}%</div>
            <div className="text-xs text-gray-400">vs last month</div>
          </div>
        </div>
      </div>

      {/* Invoices Card */}
      <div className="terminal-card">
        <div className="terminal-card-header">
          <div className="terminal-card-title">INVOICE STATUS</div>
          <div className="text-blue-400">📋</div>
        </div>
        <div className="p-4 space-y-2">
          <div className="flex justify-between">
            <span className="text-sm">Paid</span>
            <span className="text-green-400 font-semibold">{analyticsData.invoices.paid}</span>
          </div>
          <div className="flex justify-between">
            <span className="text-sm">Pending</span>
            <span className="text-yellow-400 font-semibold">{analyticsData.invoices.pending}</span>
          </div>
          <div className="flex justify-between">
            <span className="text-sm">Overdue</span>
            <span className="text-red-400 font-semibold">{analyticsData.invoices.overdue}</span>
          </div>
        </div>
      </div>

      {/* Products Card */}
      <div className="terminal-card hover:bg-gray-800 transition-colors cursor-pointer"
           onClick={() => setActiveView('products')}>
        <div className="terminal-card-header">
          <div className="terminal-card-title">TOP PRODUCT</div>
          <div className="text-purple-400">📦</div>
        </div>
        <div className="p-4">
          <div className="text-sm font-semibold terminal-text mb-1">
            {analyticsData.products.topSelling[0]?.name}
          </div>
          <div className="text-lg font-bold text-purple-400">
            {analyticsData.products.topSelling[0]?.units} units
          </div>
          <div className="text-xs text-gray-400">
            ₹{analyticsData.products.topSelling[0]?.revenue.toLocaleString('en-IN')} revenue
          </div>
        </div>
      </div>

      {/* Customers Card */}
      <div className="terminal-card hover:bg-gray-800 transition-colors cursor-pointer"
           onClick={() => setActiveView('customers')}>
        <div className="terminal-card-header">
          <div className="terminal-card-title">ACTIVE CLIENTS</div>
          <div className="text-cyan-400">👥</div>
        </div>
        <div className="p-4">
          <div className="text-2xl font-bold terminal-text">
            {analyticsData.customers.active}
          </div>
          <div className="flex items-center gap-2 mt-2">
            <div className="text-cyan-400 text-sm">+{analyticsData.customers.newThisMonth}</div>
            <div className="text-xs text-gray-400">new this month</div>
          </div>
        </div>
      </div>
    </div>
  );

  const renderPredictions = () => (
    <div className="space-y-6">
      {/* AI Predictions */}
      <div className="terminal-card">
        <div className="terminal-card-header">
          <div className="terminal-card-title">🤖 AI PREDICTIONS</div>
          <div className="text-xs text-gray-400">QUANTUM INTELLIGENCE ACTIVE</div>
        </div>
        <div className="p-4">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="text-center">
              <div className="text-lg font-bold text-green-400">
                ₹{analyticsData.predictions.nextMonthRevenue.toLocaleString('en-IN')}
              </div>
              <div className="text-sm text-gray-400">Predicted Next Month</div>
              <div className="text-xs text-green-400 mt-1">
                {analyticsData.predictions.growthTrend === 'up' ? '↗ Growth Expected' : '→ Stable'}
              </div>
            </div>
            <div className="text-center">
              <div className="text-lg font-bold text-blue-400">94.2%</div>
              <div className="text-sm text-gray-400">Customer Retention</div>
              <div className="text-xs text-blue-400 mt-1">↗ +2.1% vs target</div>
            </div>
            <div className="text-center">
              <div className="text-lg font-bold text-purple-400">87%</div>
              <div className="text-sm text-gray-400">Payment Accuracy</div>
              <div className="text-xs text-purple-400 mt-1">✨ Excellent Score</div>
            </div>
          </div>
        </div>
      </div>

      {/* Risk Alerts */}
      <div className="terminal-card">
        <div className="terminal-card-header">
          <div className="terminal-card-title">🚨 INTELLIGENT ALERTS</div>
        </div>
        <div className="p-4 space-y-3">
          {analyticsData.predictions.riskAlerts.map((alert, index) => (
            <div key={index}
                 className={`p-3 rounded border ${
                   alert.severity === 'high' ? 'border-red-500/30 bg-red-900/20' :
                   alert.severity === 'medium' ? 'border-yellow-500/30 bg-yellow-900/20' :
                   'border-green-500/30 bg-green-900/20'
                 }`}>
              <div className="flex items-center gap-3">
                <span className={`text-sm font-medium ${
                  alert.severity === 'high' ? 'text-red-400' :
                  alert.severity === 'medium' ? 'text-yellow-400' :
                  'text-green-400'
                }`}>
                  {alert.type}
                </span>
                <span className={`px-2 py-1 rounded text-xs ${
                  alert.severity === 'high' ? 'bg-red-500/20 text-red-300' :
                  alert.severity === 'medium' ? 'bg-yellow-500/20 text-yellow-300' :
                  'bg-green-500/20 text-green-300'
                }`}>
                  {alert.severity.toUpperCase()}
                </span>
              </div>
              <div className="text-sm text-gray-300 mt-1">{alert.message}</div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const renderActiveView = () => {
    switch (activeView) {
      case 'predictions':
        return renderPredictions();
      default:
        return (
          <div className="space-y-6">
            {renderOverview()}

            {/* Performance Charts Placeholder */}
            <div className="terminal-card">
              <div className="terminal-card-header">
                <div className="terminal-card-title">📈 PERFORMANCE MATRIX</div>
                <div className="flex gap-2">
                  {(['7d', '30d', '90d', '1y'] as const).map((period) => (
                    <button
                      key={period}
                      onClick={() => setSelectedTimeframe(period)}
                      className={`terminal-button text-xs px-3 py-1 ${
                        selectedTimeframe === period ? 'primary' : 'secondary'
                      }`}
                    >
                      {period.toUpperCase()}
                    </button>
                  ))}
                </div>
              </div>
              <div className="p-6">
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                  {/* Revenue Trend */}
                  <div className="space-y-4">
                    <div className="text-sm font-medium terminal-text">Revenue Trend</div>
                    <div className="h-32 bg-gray-800/50 rounded flex items-end justify-between p-4 gap-1">
                      {Array.from({ length: 7 }, (_, i) => (
                        <div
                          key={i}
                          className="bg-green-400 rounded-t"
                          style={{
                            height: `${Math.random() * 80 + 20}%`,
                            width: '12%'
                          }}
                        ></div>
                      ))}
                    </div>
                  </div>

                  {/* Category Distribution */}
                  <div className="space-y-4">
                    <div className="text-sm font-medium terminal-text">Category Performance</div>
                    <div className="space-y-2">
                      {analyticsData.products.categories.map((category, index) => (
                        <div key={index} className="space-y-1">
                          <div className="flex justify-between text-xs">
                            <span>{category.name}</span>
                            <span>{category.percentage}%</span>
                          </div>
                          <div className="terminal-progress">
                            <div
                              className="terminal-progress-bar"
                              style={{ width: `${category.percentage}%` }}
                            ></div>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {renderPredictions()}
          </div>
        );
    }
  };

  return (
    <div className="terminal-container min-h-screen">
      <div className="terminal-header">
        <div className="terminal-dots">
          <div className="terminal-dot red"></div>
          <div className="terminal-dot yellow"></div>
          <div className="terminal-dot green"></div>
        </div>
        <div className="terminal-title">
          🧠 BUSINESS INTELLIGENCE ENGINE
        </div>
        <div className="flex items-center gap-2">
          <div className="text-xs text-green-400 animate-pulse">
            <span className="terminal-text">●</span> AI ACTIVE
          </div>
          <button onClick={() => onNavigate('dashboard')} className="terminal-button text-xs">
            ← DASHBOARD
          </button>
        </div>
      </div>

      <div className="p-6">
        {/* View Navigation */}
        <div className="flex flex-wrap gap-2 mb-6">
          {[
            { id: 'overview', label: 'OVERVIEW', icon: '📊' },
            { id: 'revenue', label: 'REVENUE', icon: '💰' },
            { id: 'products', label: 'PRODUCTS', icon: '📦' },
            { id: 'customers', label: 'CUSTOMERS', icon: '👥' },
            { id: 'predictions', label: 'AI PREDICTIONS', icon: '🤖' }
          ].map((view) => (
            <button
              key={view.id}
              onClick={() => setActiveView(view.id as any)}
              className={`terminal-button ${
                activeView === view.id ? 'primary' : 'secondary'
              } flex items-center gap-2`}
            >
              <span>{view.icon}</span>
              {view.label}
            </button>
          ))}
        </div>

        {renderActiveView()}
      </div>
    </div>
  );
}