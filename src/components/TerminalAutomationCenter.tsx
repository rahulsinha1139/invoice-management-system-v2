'use client';

import { useState, useEffect } from 'react';
import { automationEngine, AutomationRule, WorkflowOptimization, SmartSuggestion } from '@/lib/automationEngine';

interface TerminalAutomationCenterProps {
  onNavigate: (section: string) => void;
}

export default function TerminalAutomationCenter({ onNavigate }: TerminalAutomationCenterProps) {
  const [activeTab, setActiveTab] = useState<'overview' | 'rules' | 'workflows' | 'suggestions' | 'autoInvoice'>('overview');
  const [automationRules, setAutomationRules] = useState<AutomationRule[]>([]);
  const [workflows, setWorkflows] = useState<WorkflowOptimization[]>([]);
  const [suggestions, setSuggestions] = useState<SmartSuggestion[]>([]);
  const [stats, setStats] = useState<any>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [executingRule, setExecutingRule] = useState<string | null>(null);

  // PDF Auto-invoicing states
  const [isDragging, setIsDragging] = useState(false);
  const [pdfFile, setPdfFile] = useState<File | null>(null);
  const [extractedData, setExtractedData] = useState<any>(null);
  const [isProcessing, setIsProcessing] = useState(false);
  const [extractionResult, setExtractionResult] = useState<string>('');

  useEffect(() => {
    loadAutomationData();
  }, []);

  const loadAutomationData = async () => {
    setIsLoading(true);

    // Simulate loading time for dramatic effect
    await new Promise(resolve => setTimeout(resolve, 1200));

    setAutomationRules(automationEngine.getAutomationRules());
    setWorkflows(automationEngine.getWorkflowOptimizations());
    setSuggestions(automationEngine.getSmartSuggestions());
    setStats(automationEngine.getAutomationStats());

    setIsLoading(false);
  };

  const executeAutomationRule = async (ruleId: string) => {
    setExecutingRule(ruleId);
    const success = await automationEngine.executeRule(ruleId);

    if (success) {
      // Refresh data to show updated stats
      setAutomationRules(automationEngine.getAutomationRules());
      setStats(automationEngine.getAutomationStats());
    }

    setExecutingRule(null);
  };

  const implementWorkflow = async (workflowId: string) => {
    const success = await automationEngine.implementWorkflow(workflowId);
    if (success) {
      // Update workflow status
      setWorkflows(prev => prev.map(w =>
        w.id === workflowId
          ? { ...w, status: w.status === 'suggested' ? 'implementing' : 'active' }
          : w
      ));
    }
  };

  const implementSuggestion = (suggestionId: string) => {
    automationEngine.implementSuggestion(suggestionId);
    setSuggestions(prev => prev.filter(s => s.id !== suggestionId));
  };

  // PDF Auto-invoicing functions
  const handleDragOver = (e: React.DragEvent) => {
    e.preventDefault();
    setIsDragging(true);
  };

  const handleDragLeave = (e: React.DragEvent) => {
    e.preventDefault();
    setIsDragging(false);
  };

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault();
    setIsDragging(false);

    const files = Array.from(e.dataTransfer.files);
    const pdfFile = files.find(file => file.type === 'application/pdf');

    if (pdfFile) {
      setPdfFile(pdfFile);
      processPDF(pdfFile);
    } else {
      alert('Please drop a PDF file');
    }
  };

  const processPDF = async (file: File) => {
    setIsProcessing(true);
    setExtractionResult('');

    try {
      // Simulate PDF text extraction (in real implementation, use PDF.js)
      const text = await extractTextFromPDF(file);
      setExtractionResult(text);

      // Extract client and product information
      const extractedInfo = parseInvoiceData(text);
      setExtractedData(extractedInfo);

    } catch (error) {
      console.error('Error processing PDF:', error);
      alert('Error processing PDF file');
    } finally {
      setIsProcessing(false);
    }
  };

  const extractTextFromPDF = async (file: File): Promise<string> => {
    // This is a simplified mock - in real implementation, use PDF.js
    return new Promise((resolve) => {
      setTimeout(() => {
        const mockText = `
PURCHASE ORDER

To: Unique Engineers Corporation
Shop No 1, TIT Complex
Jabalpur Road, Bargawan
Katni, Madhya Pradesh 483501

From: Industrial Equipment Ltd.
Plot 45, Industrial Area
Mumbai, Maharashtra 400001
GSTIN: 27ABCDE1234F1Z5

Date: ${new Date().toLocaleDateString()}
PO Number: PO-2024-001

Items Required:
1. Welding Electrodes - EutecTrode 680 - 25 kg @ ₹450/kg
2. Hydraulic Oil - Multis EP 32 - 50 kg @ ₹250/kg
3. Gear Oil - Spirax S6 ATF - 20 kg @ ₹300/kg

Total Estimated Value: ₹29,750

Please deliver within 7 days.
        `.trim();
        resolve(mockText);
      }, 2000);
    });
  };

  const parseInvoiceData = (text: string) => {
    // Smart parsing to extract client and product information
    const lines = text.split('\n').map(line => line.trim());

    // Extract client info
    const clientInfo = {
      name: 'Industrial Equipment Ltd.',
      billing_address: 'Plot 45, Industrial Area, Mumbai, Maharashtra 400001',
      city: 'Mumbai',
      state: 'Maharashtra',
      state_code: '27',
      gstin: '27ABCDE1234F1Z5',
      phone: '',
      email: ''
    };

    // Extract products (simplified pattern matching)
    const products = [
      {
        product_name: 'EutecTrode 680 (25kg Pack)',
        quantity: 25,
        unit_price: 450,
        hsn_code: '83111000'
      },
      {
        product_name: 'Multis EP 32 (50kg Pack)',
        quantity: 50,
        unit_price: 250,
        hsn_code: '27101981'
      },
      {
        product_name: 'Spirax S6 ATF (20kg Pack)',
        quantity: 20,
        unit_price: 300,
        hsn_code: '27101981'
      }
    ];

    return { clientInfo, products, poNumber: 'PO-2024-001' };
  };

  const createInvoiceFromPDF = () => {
    if (extractedData) {
      // Store data in sessionStorage to pass to invoice creation
      sessionStorage.setItem('autoInvoiceData', JSON.stringify(extractedData));
      onNavigate('invoice');
    }
  };

  if (isLoading) {
    return (
      <div className="terminal-container min-h-screen">
        <div className="terminal-header">
          <div className="terminal-dots">
            <div className="terminal-dot red"></div>
            <div className="terminal-dot yellow"></div>
            <div className="terminal-dot green"></div>
          </div>
          <div className="terminal-title">AUTOMATION COMMAND CENTER</div>
          <button onClick={() => onNavigate('dashboard')} className="terminal-button text-xs">← DASHBOARD</button>
        </div>

        <div className="p-6 flex items-center justify-center min-h-[400px]">
          <div className="terminal-card max-w-md w-full text-center">
            <div className="p-8">
              <div className="text-4xl mb-4 animate-pulse">🤖</div>
              <div className="terminal-text text-xl mb-2">INITIALIZING AUTOMATION</div>
              <div className="text-sm text-gray-400 mb-6">Loading intelligent workflows...</div>

              <div className="terminal-progress mb-4">
                <div className="terminal-progress-bar animate-pulse" style={{ width: '75%' }}></div>
              </div>

              <div className="text-xs text-gray-500">
                ⚡ Scanning workflows • 🧠 Analyzing patterns • 🎯 Optimizing performance
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  const renderOverview = () => {
    const performanceImpact = automationEngine.getPerformanceImpact();

    return (
      <div className="space-y-6">
        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          <div className="terminal-card text-center">
            <div className="p-4">
              <div className="text-2xl font-bold text-green-400">{stats.activeRules}</div>
              <div className="text-sm text-gray-400">Active Rules</div>
              <div className="text-xs text-green-400 mt-1">
                {stats.totalRules} total configured
              </div>
            </div>
          </div>

          <div className="terminal-card text-center">
            <div className="p-4">
              <div className="text-2xl font-bold text-blue-400">{stats.totalTimeSaved}m</div>
              <div className="text-sm text-gray-400">Time Saved</div>
              <div className="text-xs text-blue-400 mt-1">
                This month
              </div>
            </div>
          </div>

          <div className="terminal-card text-center">
            <div className="p-4">
              <div className="text-2xl font-bold text-purple-400">{stats.successRate}%</div>
              <div className="text-sm text-gray-400">Success Rate</div>
              <div className="text-xs text-purple-400 mt-1">
                {stats.totalRuns} total runs
              </div>
            </div>
          </div>

          <div className="terminal-card text-center">
            <div className="p-4">
              <div className="text-2xl font-bold text-yellow-400">
                ₹{(stats.costSavings / 1000).toFixed(0)}k
              </div>
              <div className="text-sm text-gray-400">Cost Savings</div>
              <div className="text-xs text-yellow-400 mt-1">
                This quarter
              </div>
            </div>
          </div>
        </div>

        {/* Performance Impact */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">🎯 AUTOMATION IMPACT</div>
            <div className="text-xs text-green-400 animate-pulse">REAL-TIME METRICS</div>
          </div>
          <div className="p-4">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div>
                <div className="text-sm font-medium terminal-text mb-3">Efficiency Gains</div>
                <div className="space-y-2">
                  <div className="flex justify-between text-sm">
                    <span>Time Efficiency</span>
                    <span className="text-green-400">{performanceImpact.timeEfficiency}</span>
                  </div>
                  <div className="flex justify-between text-sm">
                    <span>Productivity Boost</span>
                    <span className="text-blue-400">{performanceImpact.productivityBoost}</span>
                  </div>
                  <div className="flex justify-between text-sm">
                    <span>Error Reduction</span>
                    <span className="text-purple-400">{performanceImpact.errorReduction}</span>
                  </div>
                </div>
              </div>

              <div>
                <div className="text-sm font-medium terminal-text mb-3">Quality Metrics</div>
                <div className="space-y-2">
                  <div className="flex justify-between text-sm">
                    <span>Process Accuracy</span>
                    <span className="text-green-400">{performanceImpact.accuracyImprovement}</span>
                  </div>
                  <div className="flex justify-between text-sm">
                    <span>Customer Satisfaction</span>
                    <span className="text-cyan-400">{performanceImpact.customerSatisfaction}</span>
                  </div>
                </div>
              </div>

              <div>
                <div className="text-sm font-medium terminal-text mb-3">Financial Impact</div>
                <div className="space-y-2">
                  <div className="flex justify-between text-sm">
                    <span>Cost Savings</span>
                    <span className="text-yellow-400">{performanceImpact.costSavings}</span>
                  </div>
                  <div className="flex justify-between text-sm">
                    <span>ROI</span>
                    <span className="text-green-400">387%</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Quick Actions */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div className="terminal-card hover:bg-gray-800 cursor-pointer transition-colors"
               onClick={() => setActiveTab('rules')}>
            <div className="p-4">
              <div className="flex items-center gap-3 mb-2">
                <div className="text-2xl">⚙️</div>
                <div>
                  <div className="font-semibold terminal-text">Automation Rules</div>
                  <div className="text-xs text-gray-400">{stats.activeRules} active, {stats.totalRuns} executions</div>
                </div>
              </div>
            </div>
          </div>

          <div className="terminal-card hover:bg-gray-800 cursor-pointer transition-colors"
               onClick={() => setActiveTab('suggestions')}>
            <div className="p-4">
              <div className="flex items-center gap-3 mb-2">
                <div className="text-2xl">💡</div>
                <div>
                  <div className="font-semibold terminal-text">Smart Suggestions</div>
                  <div className="text-xs text-gray-400">{suggestions.length} optimization opportunities</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  const renderRules = () => (
    <div className="space-y-4">
      {automationRules.map((rule) => (
        <div key={rule.id} className="terminal-card">
          <div className="p-4">
            <div className="flex items-center justify-between mb-3">
              <div className="flex items-center gap-3">
                <div className={`w-3 h-3 rounded-full ${
                  rule.enabled ? 'bg-green-400 animate-pulse' : 'bg-gray-500'
                }`}></div>
                <div>
                  <div className="font-semibold terminal-text">{rule.name}</div>
                  <div className="text-sm text-gray-400">{rule.description}</div>
                </div>
              </div>
              <div className="flex items-center gap-2">
                <span className={`px-2 py-1 rounded text-xs ${
                  rule.priority === 'critical' ? 'bg-red-500/20 text-red-300' :
                  rule.priority === 'high' ? 'bg-orange-500/20 text-orange-300' :
                  rule.priority === 'medium' ? 'bg-yellow-500/20 text-yellow-300' :
                  'bg-blue-500/20 text-blue-300'
                }`}>
                  {rule.priority.toUpperCase()}
                </span>
                <button
                  onClick={() => executeAutomationRule(rule.id)}
                  disabled={executingRule === rule.id}
                  className={`terminal-button text-xs ${
                    executingRule === rule.id ? 'opacity-50' : 'secondary hover:primary'
                  }`}
                >
                  {executingRule === rule.id ? '⌛ Running...' : '▶ Execute'}
                </button>
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-4 gap-4 text-center">
              <div>
                <div className="text-lg font-bold text-green-400">{rule.stats.runs}</div>
                <div className="text-xs text-gray-400">Total Runs</div>
              </div>
              <div>
                <div className="text-lg font-bold text-blue-400">{rule.stats.successes}</div>
                <div className="text-xs text-gray-400">Successes</div>
              </div>
              <div>
                <div className="text-lg font-bold text-purple-400">{rule.stats.timeSaved}m</div>
                <div className="text-xs text-gray-400">Time Saved</div>
              </div>
              <div>
                <div className="text-lg font-bold text-yellow-400">
                  {rule.stats.runs > 0 ? Math.round((rule.stats.successes / rule.stats.runs) * 100) : 0}%
                </div>
                <div className="text-xs text-gray-400">Success Rate</div>
              </div>
            </div>

            {rule.nextRun && (
              <div className="mt-3 text-xs text-gray-400">
                Next run: {rule.nextRun.toLocaleString()}
              </div>
            )}
          </div>
        </div>
      ))}
    </div>
  );

  const renderWorkflows = () => (
    <div className="space-y-4">
      {workflows.map((workflow) => (
        <div key={workflow.id} className="terminal-card">
          <div className="p-4">
            <div className="flex items-center justify-between mb-3">
              <div>
                <div className="font-semibold terminal-text">{workflow.title}</div>
                <div className="text-sm text-gray-400">{workflow.description}</div>
              </div>
              <div className="flex items-center gap-2">
                <span className={`px-2 py-1 rounded text-xs ${
                  workflow.impact === 'critical' ? 'bg-red-500/20 text-red-300' :
                  workflow.impact === 'high' ? 'bg-orange-500/20 text-orange-300' :
                  workflow.impact === 'medium' ? 'bg-yellow-500/20 text-yellow-300' :
                  'bg-blue-500/20 text-blue-300'
                }`}>
                  {workflow.impact.toUpperCase()} IMPACT
                </span>
                <span className={`px-2 py-1 rounded text-xs ${
                  workflow.status === 'active' ? 'bg-green-500/20 text-green-300' :
                  workflow.status === 'implementing' ? 'bg-blue-500/20 text-blue-300' :
                  'bg-gray-500/20 text-gray-300'
                }`}>
                  {workflow.status.toUpperCase()}
                </span>
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
              <div className="text-center">
                <div className="text-lg font-bold text-green-400">
                  {workflow.estimatedSavings.timeMinutes}m
                </div>
                <div className="text-xs text-gray-400">Time Saved</div>
              </div>
              <div className="text-center">
                <div className="text-lg font-bold text-blue-400">
                  +{workflow.estimatedSavings.accuracy}%
                </div>
                <div className="text-xs text-gray-400">Accuracy</div>
              </div>
              <div className="text-center">
                <div className="text-lg font-bold text-yellow-400">
                  ₹{workflow.estimatedSavings.cost}
                </div>
                <div className="text-xs text-gray-400">Cost Savings</div>
              </div>
            </div>

            <div className="space-y-1 mb-3">
              <div className="text-xs font-medium terminal-text">Implementation Steps:</div>
              {workflow.implementation.steps.map((step, index) => (
                <div key={index} className="text-xs text-gray-400 ml-4">
                  {index + 1}. {step}
                </div>
              ))}
            </div>

            {workflow.status === 'suggested' && (
              <button
                onClick={() => implementWorkflow(workflow.id)}
                className="terminal-button primary text-xs"
              >
                🚀 Implement Workflow
              </button>
            )}
          </div>
        </div>
      ))}
    </div>
  );

  const renderSuggestions = () => (
    <div className="space-y-4">
      {suggestions.map((suggestion) => (
        <div key={suggestion.id} className="terminal-card">
          <div className="p-4">
            <div className="flex items-center justify-between mb-3">
              <div className="flex items-center gap-3">
                <div className={`w-3 h-3 rounded-full ${
                  suggestion.priority === 'urgent' ? 'bg-red-400 animate-pulse' :
                  suggestion.priority === 'high' ? 'bg-orange-400' :
                  suggestion.priority === 'medium' ? 'bg-yellow-400' :
                  'bg-blue-400'
                }`}></div>
                <div>
                  <div className="font-semibold terminal-text">{suggestion.title}</div>
                  <div className="text-sm text-gray-400">{suggestion.description}</div>
                </div>
              </div>
              <div className="flex items-center gap-2">
                <span className="text-xs text-green-400">
                  {suggestion.confidence}% confidence
                </span>
                <button
                  onClick={() => implementSuggestion(suggestion.id)}
                  className="terminal-button primary text-xs"
                >
                  ✓ Implement
                </button>
              </div>
            </div>

            <div className="mb-3">
              <div className="text-xs font-medium terminal-text mb-1">Suggested Actions:</div>
              <div className="space-y-1">
                {suggestion.suggestedActions.map((action, index) => (
                  <div key={index} className="text-xs text-gray-400 ml-4">
                    • {action}
                  </div>
                ))}
              </div>
            </div>

            <div className="text-xs text-green-400">
              <strong>Impact:</strong> {suggestion.potentialImpact}
            </div>

            {suggestion.deadline && (
              <div className="text-xs text-orange-400 mt-1">
                <strong>Deadline:</strong> {suggestion.deadline.toLocaleDateString()}
              </div>
            )}
          </div>
        </div>
      ))}

      {suggestions.length === 0 && (
        <div className="terminal-card text-center p-8">
          <div className="text-4xl mb-2">🎯</div>
          <div className="terminal-text">All suggestions implemented!</div>
          <div className="text-sm text-gray-400 mt-2">
            Your system is running at optimal efficiency
          </div>
        </div>
      )}
    </div>
  );

  const renderAutoInvoice = () => (
    <div className="space-y-6">
      <div className="terminal-card">
        <div className="terminal-card-header">
          <div className="terminal-card-title">📄 PDF AUTO-INVOICING</div>
          <div className="text-xs text-gray-400">Drag & Drop Purchase Orders</div>
        </div>
        <div className="p-6">
          {/* Drag and Drop Area */}
          <div
            onDragOver={handleDragOver}
            onDragLeave={handleDragLeave}
            onDrop={handleDrop}
            className={`
              border-2 border-dashed rounded-lg p-12 text-center transition-all duration-300
              ${isDragging
                ? 'border-cyan-400 bg-cyan-400/10 scale-105'
                : 'border-gray-600 hover:border-gray-500'
              }
              ${pdfFile ? 'border-green-500 bg-green-500/10' : ''}
            `}
          >
            {isProcessing ? (
              <div className="space-y-4">
                <div className="text-4xl animate-spin">⚙️</div>
                <div className="terminal-text text-xl">PROCESSING PDF...</div>
                <div className="text-sm text-gray-400">Extracting client and product information</div>
              </div>
            ) : pdfFile ? (
              <div className="space-y-4">
                <div className="text-4xl">✅</div>
                <div className="terminal-text text-xl">PDF PROCESSED</div>
                <div className="text-sm text-gray-400">File: {pdfFile.name}</div>
                <div className="text-xs text-green-400">
                  Ready to create invoice with extracted data
                </div>
              </div>
            ) : (
              <div className="space-y-4">
                <div className="text-6xl opacity-50">📄</div>
                <div className="terminal-text text-xl">DROP PDF PURCHASE ORDER</div>
                <div className="text-sm text-gray-400">
                  Drag and drop a PDF purchase order here to automatically extract<br/>
                  client details and product requirements
                </div>
                <div className="text-xs text-cyan-400 mt-4">
                  💡 Supported: PDF purchase orders, quotation requests, product lists
                </div>
              </div>
            )}
          </div>

          {/* Extracted Data Preview */}
          {extractedData && (
            <div className="mt-6 space-y-4">
              <div className="terminal-card">
                <div className="terminal-card-header">
                  <div className="terminal-card-title">EXTRACTED CLIENT INFO</div>
                </div>
                <div className="p-4 text-sm">
                  <div className="grid grid-cols-2 gap-4">
                    <div>
                      <div className="text-cyan-400">Client Name:</div>
                      <div className="font-mono">{extractedData.clientInfo.name}</div>
                    </div>
                    <div>
                      <div className="text-cyan-400">GSTIN:</div>
                      <div className="font-mono">{extractedData.clientInfo.gstin}</div>
                    </div>
                  </div>
                  <div className="mt-2">
                    <div className="text-cyan-400">Address:</div>
                    <div className="font-mono">{extractedData.clientInfo.billing_address}</div>
                  </div>
                </div>
              </div>

              <div className="terminal-card">
                <div className="terminal-card-header">
                  <div className="terminal-card-title">EXTRACTED PRODUCTS</div>
                </div>
                <div className="p-4">
                  <div className="space-y-3">
                    {extractedData.products.map((product: any, index: number) => (
                      <div key={index} className="border border-gray-700 rounded p-3">
                        <div className="flex justify-between items-start">
                          <div>
                            <div className="text-cyan-400">{product.product_name}</div>
                            <div className="text-xs text-gray-400">HSN: {product.hsn_code}</div>
                          </div>
                          <div className="text-right">
                            <div className="font-mono">{product.quantity} kg</div>
                            <div className="text-xs">₹{product.unit_price}/kg</div>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>

              <div className="flex justify-center">
                <button
                  onClick={createInvoiceFromPDF}
                  className="terminal-button primary text-lg px-8 py-3"
                >
                  🚀 CREATE INVOICE FROM PDF DATA
                </button>
              </div>
            </div>
          )}

          {/* Text Preview (for debugging) */}
          {extractionResult && (
            <div className="mt-6">
              <details className="terminal-card">
                <summary className="cursor-pointer p-4 text-sm text-cyan-400">
                  View Raw Extracted Text
                </summary>
                <div className="p-4 border-t border-gray-700">
                  <pre className="text-xs text-gray-300 whitespace-pre-wrap font-mono">
                    {extractionResult}
                  </pre>
                </div>
              </details>
            </div>
          )}
        </div>
      </div>

      {/* How It Works */}
      <div className="terminal-card">
        <div className="terminal-card-header">
          <div className="terminal-card-title">🤖 HOW AUTO-INVOICING WORKS</div>
        </div>
        <div className="p-6 space-y-4">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="text-center space-y-2">
              <div className="text-3xl">📄</div>
              <div className="text-sm font-semibold text-cyan-400">1. DRAG & DROP</div>
              <div className="text-xs text-gray-400">
                Drop PDF purchase orders directly into the system
              </div>
            </div>
            <div className="text-center space-y-2">
              <div className="text-3xl">🧠</div>
              <div className="text-sm font-semibold text-cyan-400">2. AI EXTRACTION</div>
              <div className="text-xs text-gray-400">
                Intelligent parsing of client details and product requirements
              </div>
            </div>
            <div className="text-center space-y-2">
              <div className="text-3xl">⚡</div>
              <div className="text-sm font-semibold text-cyan-400">3. AUTO INVOICE</div>
              <div className="text-xs text-gray-400">
                Instantly create invoices with extracted data pre-filled
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  const renderContent = () => {
    switch (activeTab) {
      case 'rules': return renderRules();
      case 'workflows': return renderWorkflows();
      case 'suggestions': return renderSuggestions();
      case 'autoInvoice': return renderAutoInvoice();
      default: return renderOverview();
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
          🤖 AUTOMATION COMMAND CENTER
        </div>
        <div className="flex items-center gap-2">
          <div className="text-xs text-green-400 animate-pulse">
            <span className="terminal-text">●</span> {stats?.activeRules} RULES ACTIVE
          </div>
          <button onClick={() => onNavigate('dashboard')} className="terminal-button text-xs">
            ← DASHBOARD
          </button>
        </div>
      </div>

      <div className="p-6">
        {/* Tab Navigation */}
        <div className="flex flex-wrap gap-2 mb-6">
          {[
            { id: 'overview', label: 'OVERVIEW', icon: '📊' },
            { id: 'rules', label: 'AUTOMATION RULES', icon: '⚙️' },
            { id: 'workflows', label: 'WORKFLOWS', icon: '🔄' },
            { id: 'suggestions', label: 'SUGGESTIONS', icon: '💡' },
            { id: 'autoInvoice', label: 'AUTO INVOICE', icon: '📄' }
          ].map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id as any)}
              className={`terminal-button ${
                activeTab === tab.id ? 'primary' : 'secondary'
              } flex items-center gap-2`}
            >
              <span>{tab.icon}</span>
              {tab.label}
            </button>
          ))}
        </div>

        {renderContent()}
      </div>
    </div>
  );
}