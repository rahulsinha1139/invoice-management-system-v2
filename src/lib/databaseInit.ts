import Database from 'better-sqlite3';

export function initializeDatabase(db: Database.Database) {
  // Create tables if they don't exist
  db.exec(`
    CREATE TABLE IF NOT EXISTS companies (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      address TEXT,
      gstin TEXT,
      pan TEXT,
      email TEXT,
      phone TEXT,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS customers (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      display_name TEXT,
      address_line_1 TEXT NOT NULL,
      address_line_2 TEXT,
      city TEXT NOT NULL,
      state TEXT NOT NULL,
      pin_code TEXT NOT NULL,
      gstin TEXT,
      pan TEXT,
      contact_person TEXT,
      phone TEXT,
      email TEXT,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS hsn_codes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      code TEXT NOT NULL UNIQUE,
      description TEXT NOT NULL,
      gst_rate_slab REAL NOT NULL,
      effective_from DATE DEFAULT CURRENT_DATE,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

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
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (default_hsn_id) REFERENCES hsn_codes(id)
    );

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
      grand_total REAL NOT NULL,
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
      FOREIGN KEY (customer_id) REFERENCES customers(id)
    );

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
      FOREIGN KEY (invoice_id) REFERENCES invoices(id),
      FOREIGN KEY (product_id) REFERENCES products(id)
    );
  `);

  // Insert default data
  const defaultCompany = db.prepare(`
    INSERT OR IGNORE INTO companies (id, name, address, gstin, pan, email, phone)
    VALUES (1, 'Unique Engineers Corporation', 'Industrial Area, Katni, MP 483501', '23ABCDE1234F1Z5', 'ABCDE1234F', 'info@uecorp.com', '+91-9876543210')
  `);
  defaultCompany.run();

  // Insert HSN codes
  const hsnCodes = [
    { code: '83111000', description: 'Welding Electrodes', gst_rate_slab: 18 },
    { code: '27101921', description: 'Lubricating Oils', gst_rate_slab: 18 },
    { code: '27101922', description: 'Greases', gst_rate_slab: 18 },
    { code: '38200000', description: 'Coolants', gst_rate_slab: 18 },
    { code: '84832000', description: 'Transmission Parts', gst_rate_slab: 18 }
  ];

  const insertHSN = db.prepare(`
    INSERT OR IGNORE INTO hsn_codes (code, description, gst_rate_slab)
    VALUES (?, ?, ?)
  `);

  hsnCodes.forEach(hsn => {
    insertHSN.run(hsn.code, hsn.description, hsn.gst_rate_slab);
  });

  // Insert sample customers
  const customers = [
    {
      name: 'Heidelberg Cements India Ltd',
      address_line_1: 'Plant Road, Industrial Area',
      city: 'Damoh',
      state: 'Madhya Pradesh',
      pin_code: '470661',
      gstin: '23AABCH1234F1Z1'
    },
    {
      name: 'Advanced Test Customer',
      address_line_1: 'Test Address Line 1',
      city: 'Katni',
      state: 'Madhya Pradesh',
      pin_code: '483501',
      gstin: '23AABCT1234F1Z1'
    }
  ];

  const insertCustomer = db.prepare(`
    INSERT OR IGNORE INTO customers (name, address_line_1, city, state, pin_code, gstin)
    VALUES (?, ?, ?, ?, ?, ?)
  `);

  customers.forEach(customer => {
    insertCustomer.run(
      customer.name,
      customer.address_line_1,
      customer.city,
      customer.state,
      customer.pin_code,
      customer.gstin
    );
  });

  // Insert sample products
  const products = [
    { sku: 'E308L-2.5', name: 'E308L Stainless Steel Electrode 2.5mm', hsn_id: 1 },
    { sku: 'E316L-3.0', name: 'E316L Stainless Steel Electrode 3.0mm', hsn_id: 1 },
    { sku: 'E7018-3.15', name: 'E7018 Low Hydrogen Electrode 3.15mm', hsn_id: 1 },
    { sku: 'RUBIA-15W40', name: 'Rubia TIR 8900 15W-40 Engine Oil', hsn_id: 2 },
    { sku: 'MULTIS-EP2', name: 'Multis Complex EP 2 Grease', hsn_id: 3 }
  ];

  const insertProduct = db.prepare(`
    INSERT OR IGNORE INTO products (sku, name, default_hsn_id)
    VALUES (?, ?, ?)
  `);

  products.forEach(product => {
    insertProduct.run(product.sku, product.name, product.hsn_id);
  });

  console.log('✅ Database initialized with default data');
}