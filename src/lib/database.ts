import Database from 'better-sqlite3';
import path from 'path';

let db: Database.Database | null = null;

export function getDatabase(): Database.Database {
  if (!db) {
    try {
      const dbPath = path.join(process.cwd(), 'data', 'invoice.db');
      console.log('Attempting to connect to database at:', dbPath);

      // Check if file exists
      const fs = require('fs');
      if (!fs.existsSync(dbPath)) {
        throw new Error(`Database file not found at: ${dbPath}`);
      }

      db = new Database(dbPath);
      console.log('Database connection established');

      // Enable foreign keys
      db.pragma('foreign_keys = ON');

      // WAL mode for better performance
      db.pragma('journal_mode = WAL');

      console.log('Database pragmas set successfully');
    } catch (error) {
      console.error('Database connection error:', error);
      throw error;
    }
  }
  return db;
}

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
}