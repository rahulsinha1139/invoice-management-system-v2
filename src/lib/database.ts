import Database from 'better-sqlite3';
import path from 'path';
import { initializeDatabase as initDB } from './databaseInit';

let db: Database.Database | null = null;
let isInitializing = false;
let initPromise: Promise<Database.Database> | null = null;

// Initialize database once at startup
async function initializeDatabase(): Promise<Database.Database> {
  if (db) return db;

  if (isInitializing && initPromise) {
    return initPromise;
  }

  isInitializing = true;
  initPromise = new Promise((resolve, reject) => {
    try {
      // Use in-memory database for production (Vercel), local file for development
      const isProduction = process.env.NODE_ENV === 'production' || process.env.VERCEL === '1';
      const dbPath = isProduction ? ':memory:' : path.join(process.cwd(), 'data', 'invoice.db');

      console.log(`🔧 Initializing database: ${isProduction ? 'in-memory (production)' : 'local file (development)'}`);

      if (!isProduction) {
        // Check if file exists in development
        const fs = require('fs');
        if (!fs.existsSync(dbPath)) {
          throw new Error(`Database file not found at: ${dbPath}`);
        }
        db = new Database(dbPath, {
          fileMustExist: true,
          timeout: 5000
        });
      } else {
        // Create in-memory database for production
        db = new Database(':memory:');
        // Initialize tables and default data
        initDB(db);
      }

      // Lightning-fast optimizations
      db.pragma('foreign_keys = ON');
      db.pragma('journal_mode = WAL');
      db.pragma('synchronous = NORMAL');
      db.pragma('cache_size = -128000');  // 128MB cache (doubled)
      db.pragma('temp_store = MEMORY');
      db.pragma('mmap_size = 268435456'); // 256MB memory map
      db.pragma('page_size = 4096');      // Optimal page size

      // Prepare frequently used statements
      db.prepare('SELECT 1').get(); // Warmup query

      console.log('⚡ Database connection optimized and ready');
      isInitializing = false;
      resolve(db);
    } catch (error) {
      isInitializing = false;
      initPromise = null;
      console.error('Database connection error:', error);
      reject(error);
    }
  });

  return initPromise;
}

export function getDatabase(): Database.Database {
  if (!db) {
    // Synchronous fallback for immediate usage
    const isProduction = process.env.NODE_ENV === 'production' || process.env.VERCEL === '1';

    if (!isProduction) {
      const dbPath = path.join(process.cwd(), 'data', 'invoice.db');
      const fs = require('fs');

      if (!fs.existsSync(dbPath)) {
        throw new Error(`Database file not found at: ${dbPath}`);
      }

      db = new Database(dbPath, { fileMustExist: true });
    } else {
      // Create in-memory database for production
      db = new Database(':memory:');
      // Initialize tables and default data
      initDB(db);
      console.log('✅ Production database initialized');
    }

    // Quick optimizations
    db.pragma('journal_mode = WAL');
    db.pragma('cache_size = -64000');
    db.pragma('temp_store = MEMORY');
  }
  return db;
}

// Export async version for better performance
export const getDatabaseAsync = initializeDatabase;

export function closeDatabase() {
  if (db) {
    db.close();
    db = null;
  }
}

// Product interfaces
export interface HSNCode {
  id: number;
  code: string;
  description: string;
  gst_rate_slab: number;
  effective_from: string;
  is_active: boolean;
  created_at: string;
}

export interface Product {
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
  // Joined fields
  hsn_code?: string;
  brand_name?: string;
  category_name?: string;
  uom_code?: string;
}

export interface ProductVariant {
  id: number;
  product_id: number;
  sku: string;
  diameter_mm?: number;
  pack_size_value?: number;
  pack_size_uom_id?: number;
  selling_uom_id?: number;
  is_active: boolean;
  created_at: string;
  updated_at: string;
  // Joined fields
  product_name?: string;
  pack_size_uom_code?: string;
  selling_uom_code?: string;
}

export interface Customer {
  id: number;
  name: string;
  display_name?: string;
  address_line_1: string;
  address_line_2?: string;
  city: string;
  state: string;
  pin_code: string;
  gstin?: string;
  pan?: string;
  contact_person?: string;
  phone?: string;
  email?: string;
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

export interface Invoice {
  id: number;
  invoice_number: string;
  invoice_date: string;
  due_date?: string;
  company_id: number;
  customer_id: number;
  billing_address_snapshot: string;
  shipping_address_snapshot?: string;
  place_of_supply: string;
  state_code: string;
  is_interstate: boolean;
  payment_method: 'NEFT_RTGS' | 'CHEQUE';
  payment_terms?: string;
  currency: string;
  subtotal: number;
  discount_total: number;
  taxable_value: number;
  cgst_total: number;
  sgst_total: number;
  igst_total: number;
  cess_total: number;
  other_charges: number;
  rounding_adjustment: number;
  grand_total: number;
  total_in_words?: string;
  notes?: string;
  terms_and_conditions?: string;
  delivery_instructions?: string;
  status: 'DRAFT' | 'ISSUED' | 'PAID' | 'CANCELLED';
  printed_count: number;
  emailed_count: number;
  created_by?: string;
  created_at: string;
  updated_at: string;
  issued_at?: string;
  // Joined fields
  customer_name?: string;
  customer_gstin?: string;
  line_items?: InvoiceLine[];
}

export interface InvoiceLine {
  id: number;
  invoice_id: number;
  line_number: number;
  product_id: number;
  product_variant_id: number;
  product_name_snapshot: string;
  description_snapshot?: string;
  hsn_code_snapshot: string;
  uom_snapshot: string;
  pack_size_value_snapshot?: number;
  pack_size_uom_snapshot?: string;
  quantity: number;
  unit_price: number;
  discount_pct: number;
  discount_amount: number;
  line_subtotal: number;
  cgst_pct: number;
  sgst_pct: number;
  igst_pct: number;
  cess_pct: number;
  cgst_amount: number;
  sgst_amount: number;
  igst_amount: number;
  cess_amount: number;
  line_total: number;
  remarks?: string;
  delivery_date?: string;
  created_at: string;
}

// Database service functions
export class DatabaseService {
  static getHSNCodes(): HSNCode[] {
    const db = getDatabase();
    return db.prepare(`
      SELECT * FROM hsn_codes
      WHERE is_active = 1
      ORDER BY code
    `).all() as HSNCode[];
  }

  static getProducts(filters?: {
    hsn_code?: string;
    category_id?: number;
    brand_id?: number;
    search?: string;
  }): Product[] {
    const db = getDatabase();

    let query = `
      SELECT p.*, b.name as brand_name, c.name as category_name,
             h.code as hsn_code, h.gst_rate_slab, u.code as uom_code
      FROM products p
      LEFT JOIN brands b ON p.brand_id = b.id
      LEFT JOIN categories c ON p.category_id = c.id
      LEFT JOIN hsn_codes h ON p.default_hsn_id = h.id
      LEFT JOIN uoms u ON p.default_uom_id = u.id
      WHERE p.is_active = 1
    `;

    const params: any[] = [];

    if (filters?.hsn_code) {
      query += ' AND h.code = ?';
      params.push(filters.hsn_code);
    }

    if (filters?.category_id) {
      query += ' AND p.category_id = ?';
      params.push(filters.category_id);
    }

    if (filters?.brand_id) {
      query += ' AND p.brand_id = ?';
      params.push(filters.brand_id);
    }

    if (filters?.search) {
      query += ' AND (p.name LIKE ? OR p.sku LIKE ? OR p.description LIKE ?)';
      params.push(`%${filters.search}%`, `%${filters.search}%`, `%${filters.search}%`);
    }

    query += ' ORDER BY p.name';

    return db.prepare(query).all(...params) as Product[];
  }

  static getProductVariants(productId: number): ProductVariant[] {
    const db = getDatabase();
    return db.prepare(`
      SELECT pv.*, p.name as product_name, p.sku,
             psu.code as pack_size_uom_code, su.code as selling_uom_code
      FROM product_variants pv
      LEFT JOIN products p ON pv.product_id = p.id
      LEFT JOIN uoms psu ON pv.pack_size_uom_id = psu.id
      LEFT JOIN uoms su ON pv.selling_uom_id = su.id
      WHERE pv.product_id = ? AND pv.is_active = 1
      ORDER BY pv.diameter_mm, pv.pack_size_value
    `).all(productId) as ProductVariant[];
  }

  static getVariantPrice(variantId: number, asOfDate?: string) {
    const db = getDatabase();
    const date = asOfDate || new Date().toISOString().split('T')[0];

    // Get active price list
    const priceList = db.prepare(`
      SELECT * FROM price_lists
      WHERE is_active = 1
      AND effective_date <= ?
      AND (expiry_date IS NULL OR expiry_date >= ?)
      ORDER BY effective_date DESC
      LIMIT 1
    `).get(date, date);

    if (!priceList) {
      return null;
    }

    // Get price for variant
    const priceItem = db.prepare(`
      SELECT * FROM price_list_items
      WHERE price_list_id = ? AND product_variant_id = ?
    `).get((priceList as any).id, variantId);

    return priceItem ? {
      variant_id: variantId,
      unit_price: (priceItem as any).unit_price,
      mrp: (priceItem as any).mrp,
      discount_pct: (priceItem as any).discount_pct,
      price_list: (priceList as any).name
    } : null;
  }

  static getCustomers(): Customer[] {
    const db = getDatabase();
    return db.prepare(`
      SELECT * FROM customers
      WHERE is_active = 1
      ORDER BY name
    `).all() as Customer[];
  }

  static getCustomer(id: number): Customer | null {
    const db = getDatabase();
    return db.prepare(`
      SELECT * FROM customers
      WHERE id = ? AND is_active = 1
    `).get(id) as Customer | null;
  }

  static getNextInvoiceNumber(): string {
    const db = getDatabase();
    const result = db.prepare(`
      SELECT COALESCE(MAX(CAST(SUBSTR(invoice_number, 1, LENGTH(invoice_number)) AS INTEGER)), 0) + 1 as next_number
      FROM invoices
    `).get() as { next_number: number };

    return result.next_number.toString();
  }

  static createCustomer(customerData: any): Customer {
    const db = getDatabase();

    // Insert customer data
    const insertStmt = db.prepare(`
      INSERT INTO customers (
        name, gstin, pan, email, phone, billing_address, shipping_address,
        city, state, state_code, place_of_supply, pin, contact_person,
        payment_terms, credit_limit, is_active
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `);

    const result = insertStmt.run(
      customerData.name,
      customerData.gstin || null,
      customerData.pan || null,
      customerData.email || null,
      customerData.phone || null,
      customerData.billing_address,
      customerData.shipping_address || customerData.billing_address,
      customerData.city || null,
      customerData.state,
      customerData.state_code,
      customerData.place_of_supply,
      customerData.pin || null,
      customerData.contact_person || null,
      customerData.payment_terms || 'Cash',
      customerData.credit_limit || 0,
      customerData.is_active !== false ? 1 : 0
    );

    // Return the created customer
    return this.getCustomer(result.lastInsertRowid as number) as Customer;
  }

  // ====================================================================
  // INVOICE MANAGEMENT METHODS
  // ====================================================================

  static getInvoices(options: {
    page?: number;
    limit?: number;
    filters?: {
      status?: string;
      customer_id?: number;
      start_date?: string;
      end_date?: string;
    };
  }) {
    const db = getDatabase();
    const { page = 1, limit = 10, filters = {} } = options;
    const offset = (page - 1) * limit;

    let whereClause = '1 = 1';
    const params: any[] = [];

    if (filters.status) {
      whereClause += ' AND i.status = ?';
      params.push(filters.status);
    }

    if (filters.customer_id) {
      whereClause += ' AND i.customer_id = ?';
      params.push(filters.customer_id);
    }

    if (filters.start_date) {
      whereClause += ' AND i.invoice_date >= ?';
      params.push(filters.start_date);
    }

    if (filters.end_date) {
      whereClause += ' AND i.invoice_date <= ?';
      params.push(filters.end_date);
    }

    // Get total count
    const countQuery = `
      SELECT COUNT(*) as count
      FROM invoices i
      WHERE ${whereClause}
    `;
    const totalCount = (db.prepare(countQuery).get(...params) as { count: number }).count;

    // Get invoices with customer info
    const invoicesQuery = `
      SELECT
        i.*,
        c.name as customer_name,
        c.gstin as customer_gstin
      FROM invoices i
      LEFT JOIN customers c ON i.customer_id = c.id
      WHERE ${whereClause}
      ORDER BY i.created_at DESC
      LIMIT ? OFFSET ?
    `;

    const invoices = db.prepare(invoicesQuery).all(...params, limit, offset) as Invoice[];

    return {
      invoices,
      totalCount,
      totalPages: Math.ceil(totalCount / limit),
    };
  }

  static getInvoiceById(invoiceId: number): Invoice | null {
    const db = getDatabase();

    // Get invoice with customer info
    const invoiceQuery = `
      SELECT
        i.*,
        c.name as customer_name,
        c.gstin as customer_gstin
      FROM invoices i
      LEFT JOIN customers c ON i.customer_id = c.id
      WHERE i.id = ?
    `;

    const invoice = db.prepare(invoiceQuery).get(invoiceId) as Invoice | null;

    if (!invoice) return null;

    // Get line items
    const lineItemsQuery = `
      SELECT * FROM invoice_lines
      WHERE invoice_id = ?
      ORDER BY line_number
    `;

    const lineItems = db.prepare(lineItemsQuery).all(invoiceId) as InvoiceLine[];
    invoice.line_items = lineItems;

    return invoice;
  }

  static createInvoice(invoiceData: any): Invoice {
    const db = getDatabase();

    try {
      // Start transaction
      const transaction = db.transaction(() => {
        // Get next invoice number
        const nextNumber = this.getNextInvoiceNumber();

        // Get customer details for address snapshot
        const customer = this.getCustomer(invoiceData.customer_id);
        if (!customer) {
          throw new Error('Customer not found');
        }

        // Create billing address snapshot
        const billingAddress = `${customer.name}\n${customer.address_line_1}${customer.address_line_2 ? '\n' + customer.address_line_2 : ''}\n${customer.city}, ${customer.state} - ${customer.pin_code}${customer.gstin ? '\nGSTIN: ' + customer.gstin : ''}`;

        // Insert invoice header
        const insertInvoice = db.prepare(`
          INSERT INTO invoices (
            invoice_number, invoice_date, due_date, company_id, customer_id,
            billing_address_snapshot, shipping_address_snapshot,
            place_of_supply, state_code, is_interstate,
            payment_method, payment_terms, currency,
            subtotal, discount_total, taxable_value,
            cgst_total, sgst_total, igst_total, cess_total,
            other_charges, rounding_adjustment, grand_total, total_in_words,
            notes, terms_and_conditions, delivery_instructions,
            status, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `);

        const invoiceResult = insertInvoice.run(
          nextNumber,
          invoiceData.invoice_date || new Date().toISOString().split('T')[0],
          invoiceData.due_date || null,
          1, // Default company ID
          invoiceData.customer_id,
          billingAddress,
          invoiceData.shipping_address_snapshot || billingAddress,
          invoiceData.place_of_supply || customer.state,
          invoiceData.state_code || '23', // Default to MP
          invoiceData.is_interstate ? 1 : 0, // Convert boolean to integer
          invoiceData.payment_method || 'NEFT_RTGS',
          invoiceData.payment_terms || 'Immediate',
          'INR',
          invoiceData.subtotal || 0,
          invoiceData.discount_total || 0,
          invoiceData.taxable_value || 0,
          invoiceData.cgst_total || 0,
          invoiceData.sgst_total || 0,
          invoiceData.igst_total || 0,
          invoiceData.cess_total || 0,
          invoiceData.other_charges || 0,
          invoiceData.rounding_adjustment || 0,
          invoiceData.grand_total || 0,
          invoiceData.total_in_words || null,
          invoiceData.notes || null,
          invoiceData.terms_and_conditions || null,
          invoiceData.delivery_instructions || null,
          invoiceData.status || 'DRAFT',
          invoiceData.created_by || 'system'
        );

        const invoiceId = invoiceResult.lastInsertRowid as number;

        // Insert line items
        if (invoiceData.line_items && Array.isArray(invoiceData.line_items)) {
          const insertLineItem = db.prepare(`
            INSERT INTO invoice_lines (
              invoice_id, line_number, product_id, product_variant_id,
              product_name_snapshot, description_snapshot, hsn_code_snapshot,
              uom_snapshot, pack_size_value_snapshot, pack_size_uom_snapshot,
              quantity, unit_price, discount_pct, discount_amount, line_subtotal,
              cgst_pct, sgst_pct, igst_pct, cess_pct,
              cgst_amount, sgst_amount, igst_amount, cess_amount,
              line_total, remarks, delivery_date
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
          `);

          invoiceData.line_items.forEach((item: any, index: number) => {
            insertLineItem.run(
              invoiceId,
              index + 1,
              item.product_id,
              item.product_variant_id || item.product_id,
              item.product_name_snapshot || item.product_name,
              item.description_snapshot || item.description || null,
              item.hsn_code_snapshot || item.hsn_code,
              item.uom_snapshot || item.uom || 'KG',
              item.pack_size_value_snapshot || item.pack_size_value || null,
              item.pack_size_uom_snapshot || item.pack_size_uom || null,
              item.quantity,
              item.unit_price,
              item.discount_pct || 0,
              item.discount_amount || 0,
              item.line_subtotal || (item.quantity * item.unit_price),
              item.cgst_pct || 9,
              item.sgst_pct || 9,
              item.igst_pct || 0,
              item.cess_pct || 0,
              item.cgst_amount || 0,
              item.sgst_amount || 0,
              item.igst_amount || 0,
              item.cess_amount || 0,
              item.line_total || (item.quantity * item.unit_price * 1.18),
              item.remarks || null,
              item.delivery_date || null
            );
          });
        }

        return invoiceId;
      });

      const invoiceId = transaction();
      return this.getInvoiceById(invoiceId) as Invoice;
    } catch (error) {
      console.error('Error creating invoice:', error);
      throw error;
    }
  }

  static updateInvoice(invoiceId: number, updateData: any): Invoice {
    const db = getDatabase();

    const updateFields: string[] = [];
    const params: any[] = [];

    // Build dynamic update query
    const allowedFields = [
      'invoice_date', 'due_date', 'payment_method', 'payment_terms',
      'notes', 'terms_and_conditions', 'delivery_instructions', 'status'
    ];

    allowedFields.forEach(field => {
      if (updateData[field] !== undefined) {
        updateFields.push(`${field} = ?`);
        params.push(updateData[field]);
      }
    });

    if (updateFields.length === 0) {
      throw new Error('No valid fields to update');
    }

    params.push(invoiceId);

    const updateQuery = `
      UPDATE invoices
      SET ${updateFields.join(', ')}, updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `;

    const result = db.prepare(updateQuery).run(...params);

    if (result.changes === 0) {
      throw new Error('Invoice not found or no changes made');
    }

    return this.getInvoiceById(invoiceId) as Invoice;
  }

  static cancelInvoice(invoiceId: number): void {
    const db = getDatabase();

    const result = db.prepare(`
      UPDATE invoices
      SET status = 'CANCELLED', updated_at = CURRENT_TIMESTAMP
      WHERE id = ? AND status != 'CANCELLED'
    `).run(invoiceId);

    if (result.changes === 0) {
      throw new Error('Invoice not found or already cancelled');
    }
  }

  static getInvoiceStats() {
    const db = getDatabase();

    const stats = db.prepare(`
      SELECT
        COUNT(*) as total_invoices,
        COUNT(CASE WHEN status = 'DRAFT' THEN 1 END) as draft_count,
        COUNT(CASE WHEN status = 'ISSUED' THEN 1 END) as issued_count,
        COUNT(CASE WHEN status = 'PAID' THEN 1 END) as paid_count,
        COUNT(CASE WHEN status = 'CANCELLED' THEN 1 END) as cancelled_count,
        COALESCE(SUM(CASE WHEN status != 'CANCELLED' THEN grand_total ELSE 0 END), 0) as total_value,
        COALESCE(SUM(CASE WHEN status = 'PAID' THEN grand_total ELSE 0 END), 0) as paid_value,
        COALESCE(SUM(CASE WHEN status = 'ISSUED' THEN grand_total ELSE 0 END), 0) as outstanding_value
      FROM invoices
    `).get();

    return stats;
  }
}