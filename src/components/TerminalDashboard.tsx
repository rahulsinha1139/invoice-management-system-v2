'use client';

import { useState, useEffect } from 'react';

interface TerminalDashboardProps {
  onNavigate: (section: string) => void;
  currentSection: string;
}

export default function TerminalDashboard({ onNavigate, currentSection }: TerminalDashboardProps) {
  const [currentTime, setCurrentTime] = useState<string | null>(null);
  const [systemStatus, setSystemStatus] = useState<'online' | 'processing' | 'error'>('online');
  const [commandHistory, setCommandHistory] = useState<string[]>([
    'SYSTEM INITIALIZED...',
    'LOADING UEC INVOICE PROTOCOL...',
    'DATABASE CONNECTION: ESTABLISHED',
    'GST COMPLIANCE: ACTIVE',
    'READY FOR OPERATIONS'
  ]);
  const [isClient, setIsClient] = useState(false);

  useEffect(() => {
    // Mark as client-side rendered
    setIsClient(true);

    const updateTime = () => {
      const now = new Date();
      setCurrentTime(now.toLocaleString('en-IN', {
        timeZone: 'Asia/Kolkata',
        hour12: false,
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
      }));
    };

    updateTime();
    const interval = setInterval(updateTime, 1000);
    return () => clearInterval(interval);
  }, []);

  const menuItems = [
    { id: 'dashboard', label: 'DASHBOARD', icon: '◉', status: 'online' },
    { id: 'invoice', label: 'NEW INVOICE', icon: '⚡', status: 'online' },
    { id: 'tracking', label: 'EMAIL TRACKING', icon: '📧', status: 'online', highlight: true },
    { id: 'history', label: 'INVOICE HISTORY', icon: '📊', status: 'online' },
    { id: 'products', label: 'PRODUCT CATALOG', icon: '📦', status: 'online' },
    { id: 'customers', label: 'CLIENT DATABASE', icon: '👥', status: 'online' },
    { id: 'analytics', label: 'AI ANALYTICS', icon: '🧠', status: 'online', highlight: true },
    { id: 'achievements', label: 'ACHIEVEMENTS', icon: '🏆', status: 'online', highlight: true },
    { id: 'automation', label: 'AUTOMATION', icon: '🤖', status: 'online', highlight: true },
    { id: 'settings', label: 'SYSTEM CONFIG', icon: '⚙️', status: 'online' },
  ];

  const handleCommand = (section: string) => {
    setCommandHistory(prev => [...prev, `> EXECUTING: ${section.toUpperCase()}`]);
    onNavigate(section);
    setSystemStatus('processing');
    setTimeout(() => setSystemStatus('online'), 1000);
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
        <div className="terminal-title">
          UEC INVOICE COMMAND CENTER v2.0.0
        </div>
        <div className="text-xs">
          <span className={`status-indicator status-${systemStatus}`}>
            <div className="status-dot"></div>
            {systemStatus.toUpperCase()}
          </span>
        </div>
      </div>

      {/* Main Terminal Interface */}
      <div className="p-6 space-y-6">
        {/* System Info Bar */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div className="terminal-card">
            <div className="terminal-card-header">
              <div className="terminal-card-title">SYSTEM TIME</div>
            </div>
            <div className="terminal-text text-lg font-mono">
              {isClient && currentTime ? currentTime : '--:--:-- --/--/----'}
            </div>
          </div>

          <div className="terminal-card">
            <div className="terminal-card-header">
              <div className="terminal-card-title">ORGANIZATION</div>
            </div>
            <div className="terminal-text-secondary">
              UNIQUE ENGINEERS CORP
            </div>
            <div className="text-xs text-gray-400">
              KATNI, MADHYA PRADESH
            </div>
          </div>

          <div className="terminal-card">
            <div className="terminal-card-header">
              <div className="terminal-card-title">GST STATUS</div>
            </div>
            <div className="status-indicator status-online">
              <div className="status-dot"></div>
              COMPLIANT
            </div>
          </div>
        </div>

        {/* Command Menu */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">COMMAND INTERFACE</div>
            <div className="text-xs text-gray-400">SELECT MODULE TO EXECUTE</div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3 mt-4">
            {menuItems.map((item) => (
              <button
                key={item.id}
                onClick={() => handleCommand(item.id)}
                className={`terminal-button p-4 text-left transition-all ${
                  currentSection === item.id ? 'primary' :
                  item.highlight ? 'border-cyan-400 text-cyan-400 hover:bg-cyan-400 hover:text-black' : 'secondary'
                }`}
              >
                <div className="flex items-center gap-3">
                  <span className="text-lg">{item.icon}</span>
                  <div>
                    <div className="font-semibold">{item.label}</div>
                    {item.highlight && (
                      <div className="text-xs text-cyan-400 animate-pulse">
                        🆕 NEW FEATURE
                      </div>
                    )}
                    <div className="text-xs opacity-75">
                      STATUS: {item.status.toUpperCase()}
                    </div>
                  </div>
                </div>
              </button>
            ))}
          </div>
        </div>

        {/* Command History */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">SYSTEM LOG</div>
          </div>

          <div className="space-y-1 max-h-32 overflow-y-auto">
            {commandHistory.slice(-5).map((command, index) => (
              <div key={index} className="text-sm font-mono terminal-typing">
                <span className="terminal-text">{'>'}</span> {command}
              </div>
            ))}
          </div>
        </div>

        {/* Quick Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          <div className="terminal-card text-center hover:bg-gray-800 cursor-pointer transition-colors"
               onClick={() => handleCommand('products')}>
            <div className="text-green-400 text-2xl font-bold animate-pulse">313</div>
            <div className="text-sm text-green-400">PRODUCTS v3.0</div>
            <div className="text-xs text-gray-400">7 Categories</div>
          </div>

          <div className="terminal-card text-center hover:bg-gray-800 cursor-pointer transition-colors"
               onClick={() => handleCommand('history')}>
            <div className="terminal-text-secondary text-2xl font-bold">∞</div>
            <div className="text-sm text-gray-400">INVOICES GENERATED</div>
            <div className="text-xs text-gray-400">With Email Tracking</div>
          </div>

          <div className="terminal-card text-center hover:bg-gray-800 cursor-pointer transition-colors">
            <div className="terminal-text text-2xl font-bold">3</div>
            <div className="text-sm text-gray-400">DISTRIBUTORS</div>
            <div className="text-xs text-gray-400">TotalEnergies, Eutectic, PIX</div>
          </div>

          <div className="terminal-card text-center hover:bg-gray-800 cursor-pointer transition-colors"
               onClick={() => handleCommand('tracking')}>
            <div className="text-cyan-400 text-2xl font-bold animate-pulse">📧</div>
            <div className="text-sm text-cyan-400">EMAIL INTELLIGENCE</div>
            <div className="text-xs text-cyan-400">AI-Powered</div>
          </div>
        </div>

        {/* Latest Alerts */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">🚨 SYSTEM ALERTS</div>
            <div className="text-xs text-gray-400">REAL-TIME MONITORING</div>
          </div>
          <div className="p-4 space-y-2">
            <div className="flex items-center gap-3 bg-green-900/20 p-2 rounded border border-green-500/30">
              <span>💰</span>
              <div className="text-sm">
                <div className="text-green-400 font-medium">Payment Received</div>
                <div className="text-gray-400 text-xs">Invoice UEC-2024-001 - ₹45,000.00</div>
              </div>
            </div>
            <div className="flex items-center gap-3 bg-orange-900/20 p-2 rounded border border-orange-500/30">
              <span>⚠️</span>
              <div className="text-sm">
                <div className="text-orange-400 font-medium">Invoice Overdue</div>
                <div className="text-gray-400 text-xs">Invoice UEC-2024-003 - 5 days overdue</div>
              </div>
            </div>
          </div>
        </div>

        {/* Phase 4 Features Showcase */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">🧠 PHASE 4 INTELLIGENCE</div>
            <div className="text-xs text-purple-400 animate-pulse">NEW IN v4.0.0 - AI POWERED</div>
          </div>
          <div className="p-4 grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="space-y-2">
              <div className="flex items-center gap-2 text-sm">
                <span className="text-purple-400 animate-pulse">⚡</span>
                <span>Advanced Business Intelligence Dashboard</span>
              </div>
              <div className="flex items-center gap-2 text-sm">
                <span className="text-purple-400 animate-pulse">🤖</span>
                <span>AI-Powered Predictive Analytics</span>
              </div>
              <div className="flex items-center gap-2 text-sm">
                <span className="text-purple-400 animate-pulse">🎮</span>
                <span>Gamified Achievement System</span>
              </div>
              <div className="flex items-center gap-2 text-sm">
                <span className="text-purple-400 animate-pulse">🤖</span>
                <span>Smart Automation Engine</span>
              </div>
              <div className="flex items-center gap-2 text-sm">
                <span className="text-green-400">✓</span>
                <span>313 Products Imported (Complete Catalog)</span>
              </div>
            </div>
            <div className="space-y-2">
              <div className="flex items-center gap-2 text-sm">
                <span className="text-purple-400 animate-pulse">📊</span>
                <span>Real-time Performance Metrics</span>
              </div>
              <div className="flex items-center gap-2 text-sm">
                <span className="text-purple-400 animate-pulse">🎯</span>
                <span>Smart Risk Detection & Alerts</span>
              </div>
              <div className="flex items-center gap-2 text-sm">
                <span className="text-purple-400 animate-pulse">🏆</span>
                <span>Commander Profile & Leaderboards</span>
              </div>
              <div className="flex items-center gap-2 text-sm">
                <span className="text-cyan-400">✓</span>
                <span>Email Intelligence & Command Palette</span>
              </div>
            </div>
          </div>

          {/* Phase 4 Quick Access */}
          <div className="px-4 pb-4 mt-4 border-t border-gray-700 pt-4">
            <div className="flex flex-wrap gap-2">
              <button
                onClick={() => handleCommand('analytics')}
                className="terminal-button primary text-xs flex items-center gap-1"
              >
                🧠 AI Analytics
              </button>
              <button
                onClick={() => handleCommand('achievements')}
                className="terminal-button primary text-xs flex items-center gap-1"
              >
                🏆 Achievements
              </button>
              <button
                onClick={() => handleCommand('automation')}
                className="terminal-button primary text-xs flex items-center gap-1"
              >
                🤖 Automation
              </button>
              <button
                onClick={() => handleCommand('tracking')}
                className="terminal-button secondary text-xs flex items-center gap-1"
              >
                📧 Email Intel
              </button>
            </div>
          </div>
        </div>

        {/* Command Prompt */}
        <div className="terminal-card">
          <div className="flex items-center gap-2 font-mono">
            <span className="terminal-text">root@uec-invoice:~$</span>
            <div className="flex-1 h-6 relative">
              <div className="absolute inset-y-0 left-0 w-2 bg-green-400 animate-pulse"></div>
            </div>
          </div>
          <div className="text-xs text-gray-400 mt-2">
            🚀 Press <kbd className="text-xs bg-gray-700 px-1 rounded text-green-400">Ctrl+K</kbd> for command palette | <kbd className="text-xs bg-gray-700 px-1 rounded text-purple-400">Ctrl+A</kbd> for AI analytics | <kbd className="text-xs bg-gray-700 px-1 rounded text-yellow-400">Ctrl+G</kbd> for achievements | <kbd className="text-xs bg-gray-700 px-1 rounded text-cyan-400">Ctrl+E</kbd> for email tracking
          </div>
        </div>
      </div>
    </div>
  );
}