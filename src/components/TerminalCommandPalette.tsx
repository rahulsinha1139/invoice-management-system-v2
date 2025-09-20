'use client';

import { useState, useEffect, useRef } from 'react';

interface Command {
  id: string;
  title: string;
  description: string;
  icon: string;
  category: string;
  shortcut?: string;
  action: () => void;
}

interface TerminalCommandPaletteProps {
  isOpen: boolean;
  onClose: () => void;
  onNavigate: (section: string) => void;
}

export default function TerminalCommandPalette({ isOpen, onClose, onNavigate }: TerminalCommandPaletteProps) {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedIndex, setSelectedIndex] = useState(0);
  const [filteredCommands, setFilteredCommands] = useState<Command[]>([]);
  const inputRef = useRef<HTMLInputElement>(null);

  const commands: Command[] = [
    // Navigation Commands
    {
      id: 'nav-dashboard',
      title: 'Dashboard',
      description: 'Go to main dashboard',
      icon: '◉',
      category: 'Navigation',
      shortcut: 'Ctrl+D',
      action: () => { onNavigate('dashboard'); onClose(); }
    },
    {
      id: 'nav-invoice',
      title: 'Create Invoice',
      description: 'Create a new invoice',
      icon: '⚡',
      category: 'Navigation',
      shortcut: 'Ctrl+N',
      action: () => { onNavigate('invoice'); onClose(); }
    },
    {
      id: 'nav-tracking',
      title: 'Email Tracking',
      description: 'View email intelligence tracking',
      icon: '📧',
      category: 'Navigation',
      shortcut: 'Ctrl+E',
      action: () => { onNavigate('tracking'); onClose(); }
    },
    {
      id: 'nav-products',
      title: 'Product Catalog',
      description: 'Browse product matrix',
      icon: '📦',
      category: 'Navigation',
      shortcut: 'Ctrl+P',
      action: () => { onNavigate('products'); onClose(); }
    },
    {
      id: 'nav-customers',
      title: 'Customer Database',
      description: 'Manage client information',
      icon: '👥',
      category: 'Navigation',
      shortcut: 'Ctrl+U',
      action: () => { onNavigate('customers'); onClose(); }
    },
    {
      id: 'nav-analytics',
      title: 'AI Analytics',
      description: 'Advanced business intelligence dashboard',
      icon: '🧠',
      category: 'Navigation',
      shortcut: 'Ctrl+A',
      action: () => { onNavigate('analytics'); onClose(); }
    },
    {
      id: 'nav-achievements',
      title: 'Achievements',
      description: 'View gamified performance metrics',
      icon: '🏆',
      category: 'Navigation',
      shortcut: 'Ctrl+G',
      action: () => { onNavigate('achievements'); onClose(); }
    },
    {
      id: 'nav-automation',
      title: 'Automation Center',
      description: 'Smart workflow automation and optimization',
      icon: '🤖',
      category: 'Navigation',
      shortcut: 'Ctrl+M',
      action: () => { onNavigate('automation'); onClose(); }
    },

    // Quick Actions
    {
      id: 'action-scan-emails',
      title: 'Scan Emails',
      description: 'Run email intelligence scan',
      icon: '🔍',
      category: 'Actions',
      shortcut: 'Ctrl+S',
      action: () => {
        // Trigger email scan
        console.log('Email scan triggered');
        onClose();
      }
    },
    {
      id: 'action-export-data',
      title: 'Export Data',
      description: 'Export invoice or product data',
      icon: '📊',
      category: 'Actions',
      action: () => {
        console.log('Data export triggered');
        onClose();
      }
    },
    {
      id: 'action-generate-report',
      title: 'Generate Report',
      description: 'Create business report',
      icon: '📋',
      category: 'Actions',
      action: () => {
        console.log('Report generation triggered');
        onClose();
      }
    },

    // System Commands
    {
      id: 'system-help',
      title: 'Help & Tutorials',
      description: 'View help documentation',
      icon: '❓',
      category: 'System',
      shortcut: 'F1',
      action: () => {
        console.log('Help opened');
        onClose();
      }
    },
    {
      id: 'system-settings',
      title: 'System Settings',
      description: 'Configure application settings',
      icon: '⚙️',
      category: 'System',
      action: () => { onNavigate('settings'); onClose(); }
    },
    {
      id: 'system-shortcuts',
      title: 'Keyboard Shortcuts',
      description: 'View all keyboard shortcuts',
      icon: '⌨️',
      category: 'System',
      shortcut: 'Ctrl+/',
      action: () => {
        alert('Keyboard Shortcuts:\n\nCtrl+K - Command Palette\nCtrl+D - Dashboard\nCtrl+N - New Invoice\nCtrl+E - Email Tracking\nCtrl+P - Products\nCtrl+U - Customers\nCtrl+A - AI Analytics\nCtrl+G - Achievements\nCtrl+M - Automation\nCtrl+S - Scan Emails\nF1 - Help\nEscape - Close');
        onClose();
      }
    },

    // Search Commands
    {
      id: 'search-invoices',
      title: 'Search Invoices',
      description: 'Find invoices by number or client',
      icon: '🔎',
      category: 'Search',
      action: () => {
        const query = prompt('Enter invoice number or client name:');
        if (query) {
          console.log(`Searching invoices for: ${query}`);
        }
        onClose();
      }
    },
    {
      id: 'search-products',
      title: 'Search Products',
      description: 'Find products by name or code',
      icon: '🔍',
      category: 'Search',
      action: () => {
        const query = prompt('Enter product name or code:');
        if (query) {
          console.log(`Searching products for: ${query}`);
          onNavigate('products');
        }
        onClose();
      }
    }
  ];

  useEffect(() => {
    if (!searchQuery.trim()) {
      setFilteredCommands(commands);
    } else {
      const filtered = commands.filter(cmd =>
        cmd.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        cmd.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
        cmd.category.toLowerCase().includes(searchQuery.toLowerCase())
      );
      setFilteredCommands(filtered);
    }
    setSelectedIndex(0);
  }, [searchQuery]);

  useEffect(() => {
    if (isOpen && inputRef.current) {
      inputRef.current.focus();
    }
  }, [isOpen]);

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (!isOpen) return;

      switch (e.key) {
        case 'ArrowDown':
          e.preventDefault();
          setSelectedIndex(prev =>
            prev < filteredCommands.length - 1 ? prev + 1 : 0
          );
          break;

        case 'ArrowUp':
          e.preventDefault();
          setSelectedIndex(prev =>
            prev > 0 ? prev - 1 : filteredCommands.length - 1
          );
          break;

        case 'Enter':
          e.preventDefault();
          if (filteredCommands[selectedIndex]) {
            filteredCommands[selectedIndex].action();
          }
          break;

        case 'Escape':
          e.preventDefault();
          onClose();
          break;
      }
    };

    document.addEventListener('keydown', handleKeyDown);
    return () => document.removeEventListener('keydown', handleKeyDown);
  }, [isOpen, filteredCommands, selectedIndex, onClose]);

  if (!isOpen) return null;

  const groupedCommands = filteredCommands.reduce((acc, cmd) => {
    if (!acc[cmd.category]) {
      acc[cmd.category] = [];
    }
    acc[cmd.category].push(cmd);
    return acc;
  }, {} as Record<string, Command[]>);

  return (
    <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-start justify-center z-50 pt-24">
      <div className="command-palette">
        {/* Header */}
        <div className="command-palette-header">
          <div className="terminal-text">⚡</div>
          <input
            ref={inputRef}
            type="text"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder="Type a command or search..."
            className="command-palette-input"
          />
          <div className="text-xs text-gray-400">
            ESC to close
          </div>
        </div>

        {/* Results */}
        <div className="command-palette-results">
          {Object.keys(groupedCommands).length === 0 ? (
            <div className="p-4 text-center text-gray-400">
              <div className="text-lg mb-2">🔍</div>
              <div>No commands found</div>
              <div className="text-xs mt-1">Try a different search term</div>
            </div>
          ) : (
            Object.entries(groupedCommands).map(([category, cmds]) => (
              <div key={category}>
                <div className="px-4 py-2 text-xs font-medium text-gray-400 uppercase tracking-wide border-b border-gray-700 bg-gray-800/50">
                  {category}
                </div>
                {cmds.map((cmd, cmdIndex) => {
                  const globalIndex = filteredCommands.indexOf(cmd);
                  return (
                    <div
                      key={cmd.id}
                      className={`command-palette-item ${
                        selectedIndex === globalIndex ? 'selected' : ''
                      }`}
                      onClick={() => cmd.action()}
                    >
                      <div className="command-palette-icon">{cmd.icon}</div>
                      <div className="command-palette-text">
                        <div className="command-palette-title">{cmd.title}</div>
                        <div className="command-palette-description">{cmd.description}</div>
                      </div>
                      {cmd.shortcut && (
                        <div className="command-palette-shortcut">
                          {cmd.shortcut}
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            ))
          )}
        </div>

        {/* Footer */}
        <div className="p-3 border-t border-gray-700 bg-gray-800/30">
          <div className="flex items-center justify-between text-xs text-gray-400">
            <div className="flex items-center gap-4">
              <div>↑↓ Navigate</div>
              <div>⏎ Select</div>
              <div>ESC Close</div>
            </div>
            <div>{filteredCommands.length} commands</div>
          </div>
        </div>
      </div>
    </div>
  );
}

// Hook for using command palette
export function useCommandPalette(onNavigate: (section: string) => void) {
  const [isOpen, setIsOpen] = useState(false);

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      // Ctrl+K or Cmd+K to open command palette
      if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
        e.preventDefault();
        setIsOpen(true);
      }

      // Other global shortcuts
      if (e.ctrlKey || e.metaKey) {
        switch (e.key) {
          case 'd':
            e.preventDefault();
            onNavigate('dashboard');
            break;
          case 'n':
            e.preventDefault();
            onNavigate('invoice');
            break;
          case 'e':
            e.preventDefault();
            onNavigate('tracking');
            break;
          case 'p':
            e.preventDefault();
            onNavigate('products');
            break;
          case 'u':
            e.preventDefault();
            onNavigate('customers');
            break;
          case 'a':
            e.preventDefault();
            onNavigate('analytics');
            break;
          case 'g':
            e.preventDefault();
            onNavigate('achievements');
            break;
          case 'm':
            e.preventDefault();
            onNavigate('automation');
            break;
          case '/':
            e.preventDefault();
            alert('Keyboard Shortcuts:\n\nCtrl+K - Command Palette\nCtrl+D - Dashboard\nCtrl+N - New Invoice\nCtrl+E - Email Tracking\nCtrl+P - Products\nCtrl+U - Customers\nCtrl+A - AI Analytics\nCtrl+G - Achievements\nCtrl+M - Automation\nF1 - Help\nEscape - Close');
            break;
        }
      }

      // F1 for help
      if (e.key === 'F1') {
        e.preventDefault();
        alert('UEC Invoice Command Center\n\nPress Ctrl+K to open the command palette\nUse Ctrl+ shortcuts for quick navigation\nPress Escape to close dialogs');
      }
    };

    document.addEventListener('keydown', handleKeyDown);
    return () => document.removeEventListener('keydown', handleKeyDown);
  }, [onNavigate]);

  return {
    isOpen,
    openCommandPalette: () => setIsOpen(true),
    closeCommandPalette: () => setIsOpen(false)
  };
}