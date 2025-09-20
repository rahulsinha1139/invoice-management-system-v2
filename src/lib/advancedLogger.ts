/**
 * Advanced 7-Category Logging System
 * Based on Flask backend implementation
 * Enterprise-grade logging with performance monitoring
 */

// Define log levels
export enum LogLevel {
  DEBUG = 'DEBUG',
  INFO = 'INFO',
  WARNING = 'WARNING',
  ERROR = 'ERROR',
  CRITICAL = 'CRITICAL'
}

// Define log categories (7 main categories)
export enum LogCategory {
  GENERAL = 'General',
  SECURITY = 'Security',
  PERFORMANCE = 'Performance',
  DATABASE = 'Database',
  BUSINESS = 'Business',
  ERROR = 'Error',
  STRUCTURED = 'Structured'
}

// Log entry interface
export interface LogEntry {
  id: string;
  timestamp: string;
  level: LogLevel;
  category: LogCategory;
  message: string;
  data?: any;
  sessionId?: string;
  userId?: string;
  userAgent?: string;
  ip?: string;
  stack?: string;
  performanceMetrics?: {
    duration?: number;
    memoryUsage?: number;
    timestamp: number;
  };
}

// Performance timer interface
interface PerformanceTimer {
  start: number;
  label: string;
}

export class AdvancedLogger {
  private logs: LogEntry[] = [];
  private maxLogs: number = 1000;
  private sessionId: string;
  private userId?: string;
  private performanceTimers: Map<string, PerformanceTimer> = new Map();

  constructor(maxLogs: number = 1000, userId?: string) {
    this.maxLogs = maxLogs;
    this.sessionId = this.generateSessionId();
    this.userId = userId;
  }

  private generateSessionId(): string {
    return `session_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  }

  private generateId(): string {
    return `log_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  }

  private createLogEntry(
    level: LogLevel,
    category: LogCategory,
    message: string,
    data?: any
  ): LogEntry {
    const entry: LogEntry = {
      id: this.generateId(),
      timestamp: new Date().toISOString(),
      level,
      category,
      message,
      data,
      sessionId: this.sessionId,
      userId: this.userId
    };

    // Add client info if available
    if (typeof window !== 'undefined') {
      entry.userAgent = navigator.userAgent;
      entry.ip = 'client'; // In real app, would get from server
    }

    return entry;
  }

  private addLogEntry(entry: LogEntry): void {
    this.logs.push(entry);

    // Keep only last maxLogs entries
    if (this.logs.length > this.maxLogs) {
      this.logs = this.logs.slice(-this.maxLogs);
    }

    // Console output for development (client-side only)
    if (typeof window !== 'undefined' && (process.env.NODE_ENV === 'development' || !process.env.NODE_ENV)) {
      this.outputToConsole(entry);
    }

    // Send to server in production (placeholder)
    if (typeof window !== 'undefined' && process.env.NODE_ENV === 'production') {
      this.sendToServer(entry);
    }
  }

  private outputToConsole(entry: LogEntry): void {
    try {
      // Check if console is available
      if (typeof console === 'undefined' || !console) {
        return;
      }

      const message = `[${entry.timestamp}] ${entry.level} - ${entry.category}: ${entry.message}`;
      const data = entry.data || '';

      // Use appropriate console method based on log level
      switch (entry.level) {
        case LogLevel.DEBUG:
          if (console.debug) console.debug(message, data);
          else console.log(message, data);
          break;
        case LogLevel.INFO:
          if (console.info) console.info(message, data);
          else console.log(message, data);
          break;
        case LogLevel.WARNING:
          if (console.warn) console.warn(message, data);
          else console.log(message, data);
          break;
        case LogLevel.ERROR:
        case LogLevel.CRITICAL:
          if (console.error) console.error(message, data);
          else console.log(message, data);
          break;
        default:
          console.log(message, data);
      }
    } catch (error) {
      // Silent fail - don't throw errors from logging system
    }
  }

  private sendToServer(entry: LogEntry): void {
    // Placeholder for server logging implementation
    // In a real application, this would send logs to a logging service
  }

  // Public logging methods

  debug(category: LogCategory, message: string, data?: any): void {
    const entry = this.createLogEntry(LogLevel.DEBUG, category, message, data);
    this.addLogEntry(entry);
  }

  info(category: LogCategory, message: string, data?: any): void {
    const entry = this.createLogEntry(LogLevel.INFO, category, message, data);
    this.addLogEntry(entry);
  }

  warning(category: LogCategory, message: string, data?: any): void {
    const entry = this.createLogEntry(LogLevel.WARNING, category, message, data);
    this.addLogEntry(entry);
  }

  error(category: LogCategory, message: string, data?: any): void {
    const entry = this.createLogEntry(LogLevel.ERROR, category, message, data);

    // Add stack trace for errors if available
    if (data instanceof Error) {
      entry.stack = data.stack;
    }
    this.addLogEntry(entry);
  }

  critical(category: LogCategory, message: string, data?: any): void {
    const entry = this.createLogEntry(LogLevel.CRITICAL, category, message, data);

    // Add stack trace for critical errors if available
    if (data instanceof Error) {
      entry.stack = data.stack;
    }
    this.addLogEntry(entry);
  }

  // Performance monitoring methods

  startTimer(label: string): void {
    this.performanceTimers.set(label, {
      start: performance.now(),
      label
    });
  }

  endTimer(label: string, category: LogCategory = LogCategory.PERFORMANCE): void {
    const timer = this.performanceTimers.get(label);
    if (timer) {
      const duration = performance.now() - timer.start;
      this.performanceTimers.delete(label);

      const entry = this.createLogEntry(
        LogLevel.INFO,
        category,
        `Performance: ${label}`,
        { duration: `${duration.toFixed(2)}ms` }
      );

      entry.performanceMetrics = {
        duration,
        timestamp: Date.now()
      };

      this.addLogEntry(entry);
    }
  }

  // Security logging method
  logSecurityEvent(event: {
    type: string;
    severity: 'low' | 'medium' | 'high' | 'critical';
    details?: any;
  }): void {
    const level = event.severity === 'critical' ? LogLevel.CRITICAL :
                  event.severity === 'high' ? LogLevel.ERROR :
                  event.severity === 'medium' ? LogLevel.WARNING : LogLevel.INFO;

    this.addLogEntry(this.createLogEntry(level, LogCategory.SECURITY, `Security Event: ${event.type}`, {
      type: event.type,
      severity: event.severity,
      details: event.details
    }));
  }

  // Business logic logging method
  logBusinessEvent(action: string, details?: any): void {
    this.addLogEntry(this.createLogEntry(LogLevel.INFO, LogCategory.BUSINESS, `Business Action: ${action}`, details));
  }

  // Database operation logging method
  logDatabaseOperation(operation: string, table?: string, details?: any): void {
    this.addLogEntry(this.createLogEntry(
      LogLevel.INFO,
      LogCategory.DATABASE,
      `DB Operation: ${operation}${table ? ` on ${table}` : ''}`,
      details
    ));
  }

  // Export methods

  exportLogs(): LogEntry[] {
    return [...this.logs];
  }

  exportLogsAsCSV(): string {
    if (this.logs.length === 0) return '';

    const headers = ['Timestamp', 'Level', 'Category', 'Message', 'Data'];
    const csvData = [headers.join(',')];

    this.logs.forEach(log => {
      const row = [
        log.timestamp,
        log.level,
        log.category,
        `"${log.message.replace(/"/g, '""')}"`,
        log.data ? `"${JSON.stringify(log.data).replace(/"/g, '""')}"` : ''
      ];
      csvData.push(row.join(','));
    });

    return csvData.join('\n');
  }

  // Utility methods

  clearLogs(): void {
    this.logs = [];
  }

  getLogsByCategory(category: LogCategory): LogEntry[] {
    return this.logs.filter(log => log.category === category);
  }

  getLogsByLevel(level: LogLevel): LogEntry[] {
    return this.logs.filter(log => log.level === level);
  }

  getLogsSince(timestamp: Date): LogEntry[] {
    return this.logs.filter(log => new Date(log.timestamp) >= timestamp);
  }

  getLogsCount(): number {
    return this.logs.length;
  }

  getSessionId(): string {
    return this.sessionId;
  }

  setUserId(userId: string): void {
    this.userId = userId;
  }
}

// Create and export singleton instance
const logger = new AdvancedLogger();

// Export convenience functions
export const logDebug = (message: string, data?: any) => logger.debug(LogCategory.GENERAL, message, data);
export const logInfo = (message: string, data?: any) => logger.info(LogCategory.GENERAL, message, data);
export const logWarning = (message: string, data?: any) => logger.warning(LogCategory.GENERAL, message, data);
export const logError = (message: string, data?: any) => logger.error(LogCategory.ERROR, message, data);
export const logCritical = (message: string, data?: any) => logger.critical(LogCategory.ERROR, message, data);

export const logSecurity = (event: { type: string; severity: 'low' | 'medium' | 'high' | 'critical'; details?: any }) =>
  logger.logSecurityEvent(event);

export const logBusiness = (action: string, details?: any) => logger.logBusinessEvent(action, details);

export const logDatabase = (operation: string, table?: string, details?: any) =>
  logger.logDatabaseOperation(operation, table, details);

export const logPerformance = (label: string, action: 'start' | 'end') => {
  if (action === 'start') {
    logger.startTimer(label);
  } else {
    logger.endTimer(label);
  }
};

export default logger;