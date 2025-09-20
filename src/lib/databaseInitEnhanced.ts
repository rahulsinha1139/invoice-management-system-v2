import Database from 'better-sqlite3';
import { seedProductionDatabase, SEED_DATA_SUMMARY } from './productionSeedData';

/**
 * Enhanced Database Initialization for Production Deployment
 *
 * This module provides comprehensive database initialization with:
 * - Complete schema creation for all tables
 * - Production seed data from extracted SQLite database (879 records)
 * - Optimized for Vercel in-memory database deployment
 * - Full compatibility with existing API endpoints
 */

export function initializeProductionDatabase(db: Database.Database) {
  console.log('🚀 Initializing production database with enhanced schema...');

  try {
    // ================================================================
    // 1. CREATE ALL TABLES WITH ENHANCED SCHEMA
    // ================================================================
    createAllTables(db);

    // ================================================================
    // 2. OPTIMIZE DATABASE PERFORMANCE
    // ================================================================
    optimizeDatabase(db);

    // ================================================================
    // 3. SEED WITH COMPLETE PRODUCTION DATA
    // ================================================================
    console.log('🌱 Loading production dataset...');
    seedProductionDatabase(db);

    // ================================================================
    // 4. CREATE PERFORMANCE INDEXES
    // ================================================================
    createPerformanceIndexes(db);

    // ================================================================
    // 5. VERIFY DATA INTEGRITY
    // ================================================================
    const verification = verifyDataIntegrity(db);

    console.log('\\n✅ Production database initialization complete!');
    console.log('📊 Database Summary:');
    console.log(`   🏢 Companies: ${verification.companies}`);
    console.log(`   🏷️  HSN Codes: ${verification.hsnCodes}`);
    console.log(`   👥 Customers: ${verification.customers}`);
    console.log(`   📂 Product Categories: ${verification.productCategories}`);
    console.log(`   📦 Products (V3): ${verification.productsV3}`);
    console.log(`   📋 Product Variants: ${verification.productVariantsV3}`);
    console.log(`   📦 Legacy Products: ${verification.legacyProducts}`);
    console.log(`   🎯 Total Records: ${verification.totalRecords}`);

    return verification;

  } catch (error) {
    console.error('❌ Error initializing production database:', error);
    throw error;
  }
}

function createAllTables(db: Database.Database) {
  console.log('🏗️  Creating enhanced database schema...');

  // Enhanced schema with all required tables
  db.exec(`
    -- ================================================================
    -- COMPANIES TABLE
    -- ================================================================
    CREATE TABLE IF NOT EXISTS companies (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      legal_name TEXT,
      trade_name TEXT,
      name TEXT,
      address TEXT,
      address_line_1 TEXT,
      address_line_2 TEXT,
      city TEXT,
      state TEXT,
      pin_code TEXT,
      gstin TEXT NOT NULL,
      pan TEXT,
      email TEXT,
      phone TEXT,
      website TEXT,
      logo_url TEXT,
      business_type TEXT DEFAULT 'PRIVATE_LIMITED',
      incorporation_date DATE,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    -- ================================================================
    -- HSN CODES TABLE
    -- ================================================================
    CREATE TABLE IF NOT EXISTS hsn_codes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      code TEXT NOT NULL UNIQUE,
      description TEXT NOT NULL,
      gst_rate_slab REAL NOT NULL DEFAULT 18,
      effective_from DATE DEFAULT CURRENT_DATE,
      expiry_date DATE,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    -- ================================================================
    -- CUSTOMERS TABLE
    -- ================================================================
    CREATE TABLE IF NOT EXISTS customers (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(255) NOT NULL,
      gstin VARCHAR(15),
      pan VARCHAR(10),
      email VARCHAR(255),
      phone VARCHAR(20),
      billing_address TEXT NOT NULL,
      shipping_address TEXT,
      city VARCHAR(100),
      state VARCHAR(100) NOT NULL,
      state_code VARCHAR(2) NOT NULL,
      place_of_supply VARCHAR(100) NOT NULL,
      pin VARCHAR(10),
      contact_person VARCHAR(255),
      payment_terms VARCHAR(100) DEFAULT 'Immediate',
      credit_limit DECIMAL(12,2) DEFAULT 0,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    -- ================================================================
    -- PRODUCT CATEGORIES TABLE (V3)
    -- ================================================================
    CREATE TABLE IF NOT EXISTS product_categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE,
      description TEXT,
      business_category TEXT,
      product_bucket TEXT,
      color_code TEXT DEFAULT '#00ff41',
      icon TEXT DEFAULT '📦',
      sort_order INTEGER DEFAULT 0,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    -- ================================================================
    -- PRODUCTS TABLE (V3)
    -- ================================================================
    CREATE TABLE IF NOT EXISTS products_v3 (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      product_name TEXT NOT NULL,
      product_code TEXT UNIQUE,
      category_id INTEGER,
      hsn_code TEXT NOT NULL,
      base_price REAL NOT NULL DEFAULT 0,
      business_category TEXT,
      product_bucket TEXT,
      specifications TEXT, -- JSON string for additional specs
      tags TEXT, -- Comma-separated tags for search
      description TEXT,
      manufacturer TEXT,
      brand TEXT,
      model TEXT,
      weight REAL,
      dimensions TEXT,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (category_id) REFERENCES product_categories(id)
    );

    -- ================================================================
    -- PRODUCT VARIANTS TABLE (V3)
    -- ================================================================
    CREATE TABLE IF NOT EXISTS product_variants_v3 (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      product_id INTEGER NOT NULL,
      variant_name TEXT,
      pack_size TEXT NOT NULL,
      pack_size_value REAL,
      pack_size_unit TEXT,
      selling_price REAL NOT NULL DEFAULT 0,
      cost_price REAL,
      mrp REAL,
      margin_percent REAL,
      minimum_order_qty INTEGER DEFAULT 1,
      maximum_order_qty INTEGER,
      in_stock BOOLEAN DEFAULT 1,
      stock_quantity INTEGER DEFAULT 0,
      reorder_level INTEGER DEFAULT 0,
      barcode TEXT,
      sku TEXT,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (product_id) REFERENCES products_v3(id) ON DELETE CASCADE
    );

    -- ================================================================
    -- LEGACY PRODUCTS TABLE (for compatibility)
    -- ================================================================
    CREATE TABLE IF NOT EXISTS products (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      sku TEXT NOT NULL UNIQUE,
      brand_id INTEGER DEFAULT 1,
      category_id INTEGER DEFAULT 1,
      name TEXT NOT NULL,
      description TEXT,
      default_hsn_id INTEGER NOT NULL,
      default_uom_id INTEGER DEFAULT 1,
      product_type TEXT DEFAULT 'PHYSICAL',
      base_price REAL DEFAULT 0,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (default_hsn_id) REFERENCES hsn_codes(id)
    );

    -- ================================================================
    -- INVOICES TABLE
    -- ================================================================
    CREATE TABLE IF NOT EXISTS invoices (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      invoice_number TEXT NOT NULL UNIQUE,
      invoice_date DATE NOT NULL,
      due_date DATE,
      company_id INTEGER NOT NULL DEFAULT 1,
      customer_id INTEGER NOT NULL,
      billing_address_snapshot TEXT NOT NULL,
      shipping_address_snapshot TEXT,
      place_of_supply TEXT NOT NULL,
      state_code TEXT NOT NULL DEFAULT '23',
      is_interstate INTEGER NOT NULL DEFAULT 0,
      payment_method TEXT DEFAULT 'NEFT_RTGS',
      payment_terms TEXT,
      currency TEXT DEFAULT 'INR',
      subtotal REAL DEFAULT 0,
      discount_total REAL DEFAULT 0,
      taxable_value REAL DEFAULT 0,
      cgst_total REAL DEFAULT 0,
      sgst_total REAL DEFAULT 0,
      igst_total REAL DEFAULT 0,
      cess_total REAL DEFAULT 0,
      other_charges REAL DEFAULT 0,
      rounding_adjustment REAL DEFAULT 0,
      grand_total REAL NOT NULL DEFAULT 0,
      total_in_words TEXT,
      notes TEXT,
      terms_and_conditions TEXT,
      delivery_instructions TEXT,
      status TEXT DEFAULT 'DRAFT',
      printed_count INTEGER DEFAULT 0,
      emailed_count INTEGER DEFAULT 0,
      created_by TEXT,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      issued_at DATETIME,
      FOREIGN KEY (company_id) REFERENCES companies(id),
      FOREIGN KEY (customer_id) REFERENCES customers(id)
    );

    -- ================================================================
    -- INVOICE LINES TABLE
    -- ================================================================
    CREATE TABLE IF NOT EXISTS invoice_lines (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      invoice_id INTEGER NOT NULL,
      line_number INTEGER NOT NULL,
      product_id INTEGER NOT NULL,
      product_variant_id INTEGER NOT NULL,
      product_name_snapshot TEXT NOT NULL,
      description_snapshot TEXT,
      hsn_code_snapshot TEXT NOT NULL,
      uom_snapshot TEXT NOT NULL DEFAULT 'KG',
      pack_size_value_snapshot REAL,
      pack_size_uom_snapshot TEXT,
      quantity REAL NOT NULL,
      unit_price REAL NOT NULL,
      discount_pct REAL DEFAULT 0,
      discount_amount REAL DEFAULT 0,
      line_subtotal REAL NOT NULL,
      cgst_pct REAL DEFAULT 9,
      sgst_pct REAL DEFAULT 9,
      igst_pct REAL DEFAULT 0,
      cess_pct REAL DEFAULT 0,
      cgst_amount REAL DEFAULT 0,
      sgst_amount REAL DEFAULT 0,
      igst_amount REAL DEFAULT 0,
      cess_amount REAL DEFAULT 0,
      line_total REAL NOT NULL,
      remarks TEXT,
      delivery_date DATE,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
      FOREIGN KEY (product_id) REFERENCES products_v3(id)
    );

    -- ================================================================
    -- PRODUCT SEARCH INDEX (FTS5)
    -- ================================================================
    CREATE VIRTUAL TABLE IF NOT EXISTS product_search USING fts5(
      product_name,
      product_code,
      hsn_code,
      business_category,
      product_bucket,
      tags,
      content='products_v3'
    );
  `);

  console.log('✅ Enhanced database schema created successfully');
}

function optimizeDatabase(db: Database.Database) {
  console.log('⚡ Optimizing database performance...');

  // Performance optimizations
  db.pragma('journal_mode = WAL');
  db.pragma('synchronous = NORMAL');
  db.pragma('cache_size = -128000');  // 128MB cache
  db.pragma('temp_store = MEMORY');
  db.pragma('mmap_size = 268435456'); // 256MB memory map
  db.pragma('page_size = 4096');
  db.pragma('foreign_keys = ON');

  console.log('✅ Database performance optimized');
}

function createPerformanceIndexes(db: Database.Database) {
  console.log('📇 Creating performance indexes...');

  db.exec(`
    -- Invoice indexes
    CREATE INDEX IF NOT EXISTS idx_invoices_number ON invoices(invoice_number);
    CREATE INDEX IF NOT EXISTS idx_invoices_date ON invoices(invoice_date);
    CREATE INDEX IF NOT EXISTS idx_invoices_customer ON invoices(customer_id);
    CREATE INDEX IF NOT EXISTS idx_invoices_status ON invoices(status);
    CREATE INDEX IF NOT EXISTS idx_invoices_created ON invoices(created_at);

    -- Invoice lines indexes
    CREATE INDEX IF NOT EXISTS idx_invoice_lines_invoice ON invoice_lines(invoice_id);
    CREATE INDEX IF NOT EXISTS idx_invoice_lines_product ON invoice_lines(product_id);

    -- Products indexes
    CREATE INDEX IF NOT EXISTS idx_products_v3_category ON products_v3(category_id);
    CREATE INDEX IF NOT EXISTS idx_products_v3_hsn ON products_v3(hsn_code);
    CREATE INDEX IF NOT EXISTS idx_products_v3_code ON products_v3(product_code);
    CREATE INDEX IF NOT EXISTS idx_products_v3_active ON products_v3(is_active);

    -- Product variants indexes
    CREATE INDEX IF NOT EXISTS idx_variants_v3_product ON product_variants_v3(product_id);
    CREATE INDEX IF NOT EXISTS idx_variants_v3_price ON product_variants_v3(selling_price);

    -- Customer indexes
    CREATE INDEX IF NOT EXISTS idx_customers_name ON customers(name);
    CREATE INDEX IF NOT EXISTS idx_customers_gstin ON customers(gstin);
    CREATE INDEX IF NOT EXISTS idx_customers_active ON customers(is_active);

    -- HSN codes indexes
    CREATE INDEX IF NOT EXISTS idx_hsn_codes_code ON hsn_codes(code);
    CREATE INDEX IF NOT EXISTS idx_hsn_codes_active ON hsn_codes(is_active);
  `);

  console.log('✅ Performance indexes created');
}

function verifyDataIntegrity(db: Database.Database): typeof SEED_DATA_SUMMARY {
  console.log('🔍 Verifying data integrity...');

  const companies = db.prepare('SELECT COUNT(*) as count FROM companies').get() as { count: number };
  const hsnCodes = db.prepare('SELECT COUNT(*) as count FROM hsn_codes').get() as { count: number };
  const customers = db.prepare('SELECT COUNT(*) as count FROM customers').get() as { count: number };
  const productCategories = db.prepare('SELECT COUNT(*) as count FROM product_categories').get() as { count: number };
  const productsV3 = db.prepare('SELECT COUNT(*) as count FROM products_v3').get() as { count: number };
  const productVariantsV3 = db.prepare('SELECT COUNT(*) as count FROM product_variants_v3').get() as { count: number };
  const legacyProducts = db.prepare('SELECT COUNT(*) as count FROM products').get() as { count: number };

  const verification = {
    companies: companies.count,
    hsnCodes: hsnCodes.count,
    customers: customers.count,
    productCategories: productCategories.count,
    productsV3: productsV3.count,
    productVariantsV3: productVariantsV3.count,
    legacyProducts: legacyProducts.count,
    totalRecords: companies.count + hsnCodes.count + customers.count +
                 productCategories.count + productsV3.count + productVariantsV3.count + legacyProducts.count
  };

  // Verify against expected counts
  const expected = SEED_DATA_SUMMARY;
  const isValid =
    verification.companies === expected.companies &&
    verification.hsnCodes === expected.hsnCodes &&
    verification.customers === expected.customers &&
    verification.productCategories === expected.productCategories &&
    verification.productsV3 === expected.productsV3 &&
    verification.productVariantsV3 === expected.productVariantsV3 &&
    verification.legacyProducts === expected.legacyProducts;

  if (!isValid) {
    console.warn('⚠️  Data integrity check failed - counts do not match expected values');
    console.warn('Expected:', expected);
    console.warn('Actual:', verification);
  } else {
    console.log('✅ Data integrity verification passed');
  }

  return verification;
}

// Legacy compatibility function
export function initializeDatabase(db: Database.Database) {
  return initializeProductionDatabase(db);
}

export default initializeProductionDatabase;