'use client';

import { useState, useEffect, createContext, useContext } from 'react';

interface Notification {
  id: string;
  type: 'success' | 'error' | 'warning' | 'info';
  title: string;
  message: string;
  duration?: number;
  action?: {
    label: string;
    onClick: () => void;
  };
  createdAt: Date;
}

interface NotificationContextType {
  notifications: Notification[];
  addNotification: (notification: Omit<Notification, 'id' | 'createdAt'>) => void;
  removeNotification: (id: string) => void;
  clearAll: () => void;
}

const NotificationContext = createContext<NotificationContextType | undefined>(undefined);

export const useNotifications = () => {
  const context = useContext(NotificationContext);
  if (!context) {
    throw new Error('useNotifications must be used within a NotificationProvider');
  }
  return context;
};

export function NotificationProvider({ children }: { children: React.ReactNode }) {
  const [notifications, setNotifications] = useState<Notification[]>([]);

  const addNotification = (notification: Omit<Notification, 'id' | 'createdAt'>) => {
    const id = `notification-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
    const newNotification: Notification = {
      ...notification,
      id,
      createdAt: new Date(),
      duration: notification.duration || 5000
    };

    setNotifications(prev => [newNotification, ...prev]);

    // Auto-remove after duration
    if (newNotification.duration && newNotification.duration > 0) {
      setTimeout(() => {
        removeNotification(id);
      }, newNotification.duration);
    }
  };

  const removeNotification = (id: string) => {
    setNotifications(prev => prev.filter(n => n.id !== id));
  };

  const clearAll = () => {
    setNotifications([]);
  };

  return (
    <NotificationContext.Provider value={{
      notifications,
      addNotification,
      removeNotification,
      clearAll
    }}>
      {children}
    </NotificationContext.Provider>
  );
}

export default function TerminalNotifications() {
  const [notifications, setNotifications] = useState<Notification[]>([]);
  const [isVisible, setIsVisible] = useState(false);

  // Simulate real-time notifications for demonstration
  useEffect(() => {
    const demoNotifications = [
      {
        type: 'success' as const,
        title: 'Payment Received',
        message: 'Invoice UEC-2024-001 has been paid via NEFT - ₹45,000.00',
        duration: 0 // Persistent
      },
      {
        type: 'warning' as const,
        title: 'Invoice Overdue',
        message: 'Invoice UEC-2024-003 is 5 days overdue - ₹32,500.00',
        duration: 0 // Persistent
      },
      {
        type: 'info' as const,
        title: 'Document Viewed',
        message: 'Invoice UEC-2024-005 was viewed by client@industrialworks.in',
        duration: 8000
      },
      {
        type: 'error' as const,
        title: 'Invoice Disputed',
        message: 'Invoice UEC-2024-002 has a pricing discrepancy query',
        duration: 0 // Persistent
      }
    ];

    // Add demo notifications with delays
    demoNotifications.forEach((notification, index) => {
      setTimeout(() => {
        addNotification(notification);
      }, (index + 1) * 3000);
    });

    // Show notifications panel after a delay
    setTimeout(() => setIsVisible(true), 2000);

  }, []);

  const addNotification = (notification: Omit<Notification, 'id' | 'createdAt'>) => {
    const id = `notification-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
    const newNotification: Notification = {
      ...notification,
      id,
      createdAt: new Date()
    };

    setNotifications(prev => [newNotification, ...prev]);

    // Auto-remove after duration
    if (notification.duration && notification.duration > 0) {
      setTimeout(() => {
        removeNotification(id);
      }, notification.duration);
    }
  };

  const removeNotification = (id: string) => {
    setNotifications(prev => prev.filter(n => n.id !== id));
  };

  const clearAll = () => {
    setNotifications([]);
  };

  const getNotificationIcon = (type: Notification['type']): string => {
    switch (type) {
      case 'success': return '✅';
      case 'error': return '❌';
      case 'warning': return '⚠️';
      case 'info': return 'ℹ️';
      default: return '📢';
    }
  };

  const getNotificationColor = (type: Notification['type']): string => {
    switch (type) {
      case 'success': return 'border-green-500 bg-green-900/20';
      case 'error': return 'border-red-500 bg-red-900/20';
      case 'warning': return 'border-orange-500 bg-orange-900/20';
      case 'info': return 'border-blue-500 bg-blue-900/20';
      default: return 'border-gray-500 bg-gray-900/20';
    }
  };

  if (!isVisible || notifications.length === 0) {
    return null;
  }

  return (
    <div className="fixed top-20 right-6 z-50 space-y-3 max-w-md">
      {/* Notification Header */}
      <div className="terminal-card bg-gray-900/95 backdrop-blur">
        <div className="terminal-card-header">
          <div className="terminal-card-title flex items-center gap-2">
            <span>🔔</span>
            SYSTEM ALERTS
          </div>
          <div className="flex items-center gap-2">
            <span className="text-xs text-gray-400">{notifications.length} ACTIVE</span>
            <button
              onClick={clearAll}
              className="terminal-button text-xs px-2 py-1"
            >
              CLEAR ALL
            </button>
          </div>
        </div>
      </div>

      {/* Notifications List */}
      <div className="space-y-2 max-h-96 overflow-y-auto">
        {notifications.slice(0, 5).map((notification) => (
          <div
            key={notification.id}
            className={`terminal-notification show ${getNotificationColor(notification.type)} p-3 rounded-lg border-l-4 transition-all`}
          >
            <div className="flex items-start gap-3">
              <span className="text-lg flex-shrink-0 mt-1">
                {getNotificationIcon(notification.type)}
              </span>

              <div className="flex-1 min-w-0">
                <div className="terminal-notification-title flex items-center gap-2">
                  {notification.title}
                  <span className="text-xs text-gray-400">
                    {notification.createdAt.toLocaleTimeString()}
                  </span>
                </div>

                <div className="terminal-notification-message">
                  {notification.message}
                </div>

                {notification.action && (
                  <div className="mt-2">
                    <button
                      onClick={notification.action.onClick}
                      className="terminal-button text-xs px-3 py-1"
                    >
                      {notification.action.label}
                    </button>
                  </div>
                )}
              </div>

              <button
                onClick={() => removeNotification(notification.id)}
                className="text-gray-400 hover:text-white text-lg leading-none flex-shrink-0"
                title="Dismiss"
              >
                ×
              </button>
            </div>

            {/* Progress bar for temporary notifications */}
            {notification.duration && notification.duration > 0 && (
              <div className="mt-2">
                <div className="terminal-progress">
                  <div
                    className="terminal-progress-bar"
                    style={{
                      width: '100%',
                      animation: `shrink ${notification.duration}ms linear`
                    }}
                  />
                </div>
              </div>
            )}
          </div>
        ))}

        {notifications.length > 5 && (
          <div className="text-center py-2">
            <div className="text-xs text-gray-400">
              +{notifications.length - 5} more notifications
            </div>
          </div>
        )}
      </div>

      {/* Quick Action Panel */}
      <div className="terminal-card bg-gray-900/95 backdrop-blur">
        <div className="p-3 space-y-2">
          <div className="text-xs font-medium terminal-text">QUICK ACTIONS:</div>
          <div className="flex flex-wrap gap-2">
            <button
              onClick={() => addNotification({
                type: 'info',
                title: 'Email Scan Triggered',
                message: 'Scanning recent emails for invoice updates...',
                duration: 3000
              })}
              className="terminal-button text-xs px-2 py-1"
            >
              📧 SCAN EMAILS
            </button>
            <button
              onClick={() => addNotification({
                type: 'success',
                title: 'System Status',
                message: 'All systems operational - Email intelligence active',
                duration: 3000
              })}
              className="terminal-button text-xs px-2 py-1"
            >
              ⚡ STATUS CHECK
            </button>
          </div>
        </div>
      </div>

      {/* CSS Animation */}
      <style jsx>{`
        @keyframes shrink {
          from { width: 100%; }
          to { width: 0%; }
        }
      `}</style>
    </div>
  );
}