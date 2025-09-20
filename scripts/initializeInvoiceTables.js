const Database = require('better-sqlite3');
const path = require('path');

// Initialize database with invoice tables
function initializeInvoiceTables() {
  const dbPath = path.join(__dirname, '..', 'data', 'invoice.db');
  const db = new Database(dbPath);

  try {
    console.log('🔧 Initializing invoice tables...');

    // Create invoices table
    db.exec(`
      CREATE TABLE IF NOT EXISTS invoices (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        invoice_number VARCHAR(30) NOT NULL UNIQUE,
        invoice_date DATE NOT NULL,
        due_date DATE,
        company_id INTEGER NOT NULL DEFAULT 1,
        customer_id INTEGER NOT NULL,
        billing_address_snapshot TEXT NOT NULL,
        shipping_address_snapshot TEXT,
        place_of_supply VARCHAR(100) NOT NULL,
        state_code VARCHAR(2) NOT NULL,
        is_interstate INTEGER NOT NULL DEFAULT 0,
        payment_method VARCHAR(20) NOT NULL DEFAULT 'NEFT_RTGS',
        payment_terms VARCHAR(100),
        currency CHAR(3) DEFAULT 'INR',
        subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
        discount_total DECIMAL(12,2) DEFAULT 0,
        taxable_value DECIMAL(12,2) NOT NULL DEFAULT 0,
        cgst_total DECIMAL(12,2) DEFAULT 0,
        sgst_total DECIMAL(12,2) DEFAULT 0,
        igst_total DECIMAL(12,2) DEFAULT 0,
        cess_total DECIMAL(12,2) DEFAULT 0,
        other_charges DECIMAL(12,2) DEFAULT 0,
        rounding_adjustment DECIMAL(6,2) DEFAULT 0,
        grand_total DECIMAL(12,2) NOT NULL DEFAULT 0,
        total_in_words VARCHAR(512),
        notes TEXT,
        terms_and_conditions TEXT,
        delivery_instructions TEXT,
        status VARCHAR(20) DEFAULT 'DRAFT',
        printed_count INTEGER DEFAULT 0,
        emailed_count INTEGER DEFAULT 0,
        created_by VARCHAR(100),
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        issued_at DATETIME
      );
    `);

    // Create invoice_lines table
    db.exec(`
      CREATE TABLE IF NOT EXISTS invoice_lines (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        invoice_id INTEGER NOT NULL,
        line_number INTEGER NOT NULL,
        product_id INTEGER NOT NULL,
        product_variant_id INTEGER NOT NULL,
        product_name_snapshot VARCHAR(255) NOT NULL,
        description_snapshot TEXT,
        hsn_code_snapshot CHAR(8) NOT NULL,
        uom_snapshot VARCHAR(10) NOT NULL,
        pack_size_value_snapshot DECIMAL(10,3),
        pack_size_uom_snapshot VARCHAR(10),
        quantity DECIMAL(12,3) NOT NULL,
        unit_price DECIMAL(12,2) NOT NULL,
        discount_pct DECIMAL(5,2) DEFAULT 0,
        discount_amount DECIMAL(12,2) DEFAULT 0,
        line_subtotal DECIMAL(12,2) NOT NULL,
        cgst_pct DECIMAL(5,2) DEFAULT 0,
        sgst_pct DECIMAL(5,2) DEFAULT 0,
        igst_pct DECIMAL(5,2) DEFAULT 0,
        cess_pct DECIMAL(5,2) DEFAULT 0,
        cgst_amount DECIMAL(12,2) DEFAULT 0,
        sgst_amount DECIMAL(12,2) DEFAULT 0,
        igst_amount DECIMAL(12,2) DEFAULT 0,
        cess_amount DECIMAL(12,2) DEFAULT 0,
        line_total DECIMAL(12,2) NOT NULL,
        remarks TEXT,
        delivery_date DATE,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE
      );
    `);

    // Create indexes for performance
    db.exec(`
      CREATE INDEX IF NOT EXISTS idx_invoices_number ON invoices(invoice_number);
      CREATE INDEX IF NOT EXISTS idx_invoices_date ON invoices(invoice_date);
      CREATE INDEX IF NOT EXISTS idx_invoices_customer ON invoices(customer_id);
      CREATE INDEX IF NOT EXISTS idx_invoices_status ON invoices(status);
      CREATE INDEX IF NOT EXISTS idx_invoice_lines_invoice ON invoice_lines(invoice_id);
    `);

    // Create companies table if it doesn't exist (basic version)
    db.exec(`
      CREATE TABLE IF NOT EXISTS companies (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        legal_name VARCHAR(255) NOT NULL,
        gstin VARCHAR(15) NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
      );
    `);

    // Insert default company if not exists
    const companyExists = db.prepare('SELECT COUNT(*) as count FROM companies').get();
    if (companyExists.count === 0) {
      db.prepare(`
        INSERT INTO companies (legal_name, gstin)
        VALUES ('UNIQUE ENGINEERS CORPORATION', '23AACFU6860C2ZD')
      `).run();
      console.log('✅ Default company record created');
    }

    console.log('✅ Invoice tables initialized successfully');
    console.log('✅ Database ready for invoice operations');

  } catch (error) {
    console.error('❌ Error initializing invoice tables:', error);
    throw error;
  } finally {
    db.close();
  }
}

// Run if called directly
if (require.main === module) {
  initializeInvoiceTables();
}

module.exports = { initializeInvoiceTables };