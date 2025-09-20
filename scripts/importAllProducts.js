/**
 * Phase 3: Complete Product Data Import System
 * Imports all CSV data including lubricants, coolants, and existing welding products
 */

const fs = require('fs');
const path = require('path');
const Database = require('better-sqlite3');

// Database path
const dbPath = path.join(__dirname, '..', 'data', 'invoice.db');

// CSV files to import
const csvFiles = [
  {
    path: path.join(__dirname, '..', '..', 'docs', 'database', 'product_price_list_2025_with_pack_size_complete.csv'),
    type: 'electrodes'
  },
  {
    path: path.join(__dirname, '..', '..', 'docs', 'database', 'Lubricant_Price.csv'),
    type: 'lubricants'
  }
];

function parseCSV(filePath) {
  try {
    const content = fs.readFileSync(filePath, 'utf-8');
    const lines = content.trim().split('\n');
    const headers = lines[0].split(',').map(h => h.trim());

    const data = [];
    for (let i = 1; i < lines.length; i++) {
      const values = parseCSVLine(lines[i]);
      if (values.length === headers.length) {
        const row = {};
        headers.forEach((header, index) => {
          row[header] = values[index];
        });
        data.push(row);
      }
    }

    return { headers, data };
  } catch (error) {
    console.error(`Error parsing CSV ${filePath}:`, error);
    return null;
  }
}

function parseCSVLine(line) {
  const result = [];
  let current = '';
  let inQuotes = false;

  for (let i = 0; i < line.length; i++) {
    const char = line[i];

    if (char === '"') {
      inQuotes = !inQuotes;
    } else if (char === ',' && !inQuotes) {
      result.push(current.trim());
      current = '';
    } else {
      current += char;
    }
  }

  result.push(current.trim());
  return result;
}

function initializeDatabase() {
  console.log('🔧 Initializing database...');

  const db = new Database(dbPath);

  // Enable foreign keys and WAL mode for better performance
  db.pragma('journal_mode = WAL');
  db.pragma('foreign_keys = ON');

  // Create enhanced product tables for Phase 3

  // 1. Product Categories (Lubricants, Coolants, Welding, etc.)
  db.exec(`
    CREATE TABLE IF NOT EXISTS product_categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE,
      description TEXT,
      business_category TEXT,
      product_bucket TEXT,
      color_code TEXT DEFAULT '#00ff41',
      icon TEXT DEFAULT '📦',
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  `);

  // 2. Enhanced Product Master Table
  db.exec(`
    CREATE TABLE IF NOT EXISTS products_v3 (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      product_name TEXT NOT NULL,
      product_code TEXT UNIQUE,
      category_id INTEGER,
      hsn_code TEXT NOT NULL,
      base_price REAL NOT NULL,
      business_category TEXT,
      product_bucket TEXT,
      specifications TEXT, -- JSON string for additional specs
      tags TEXT, -- Comma-separated tags for search
      is_active BOOLEAN DEFAULT TRUE,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (category_id) REFERENCES product_categories(id)
    )
  `);

  // 3. Product Variants/Pack Sizes
  db.exec(`
    CREATE TABLE IF NOT EXISTS product_variants_v3 (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      product_id INTEGER NOT NULL,
      variant_name TEXT,
      pack_size TEXT NOT NULL,
      pack_size_value REAL,
      pack_size_unit TEXT,
      selling_price REAL NOT NULL,
      cost_price REAL,
      margin_percent REAL,
      minimum_order_qty INTEGER DEFAULT 1,
      in_stock BOOLEAN DEFAULT TRUE,
      stock_quantity INTEGER DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (product_id) REFERENCES products_v3(id) ON DELETE CASCADE
    )
  `);

  // 4. Product Search Index
  db.exec(`
    CREATE VIRTUAL TABLE IF NOT EXISTS product_search USING fts5(
      product_name,
      product_code,
      hsn_code,
      business_category,
      product_bucket,
      tags,
      content='products_v3'
    )
  `);

  // 5. Import Log for tracking
  db.exec(`
    CREATE TABLE IF NOT EXISTS import_logs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      file_name TEXT NOT NULL,
      import_type TEXT NOT NULL,
      records_imported INTEGER DEFAULT 0,
      status TEXT DEFAULT 'pending',
      error_message TEXT,
      imported_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  `);

  console.log('✅ Database schema updated for Phase 3!');
  return db;
}

function insertProductCategories(db) {
  console.log('📂 Setting up product categories...');

  const categories = [
    { name: 'Coolants', description: 'Automotive coolants and antifreeze', business_category: 'AUTOMOTIVE GRADES', product_bucket: 'COOLANTS', color_code: '#00bfff', icon: '❄️' },
    { name: 'Diesel Engine Oil', description: 'Heavy-duty diesel engine lubricants', business_category: 'AUTOMOTIVE GRADES', product_bucket: 'DIESEL ENGINE OIL', color_code: '#ffa500', icon: '🛢️' },
    { name: 'Gasoline Engine Oil', description: 'Passenger car gasoline engine oils', business_category: 'AUTOMOTIVE GRADES', product_bucket: 'GASOLINE ENGINE OIL', color_code: '#32cd32', icon: '⛽' },
    { name: 'Hydraulic Oil', description: 'Industrial hydraulic fluids', business_category: 'INDUSTRIAL GRADES', product_bucket: 'HYDRAULIC OIL', color_code: '#ff6347', icon: '🏭' },
    { name: 'Gear Oil', description: 'Transmission and gear lubricants', business_category: 'AUTOMOTIVE GRADES', product_bucket: 'GEAR OIL', color_code: '#9370db', icon: '⚙️' },
    { name: 'Grease', description: 'Multi-purpose greases', business_category: 'INDUSTRIAL GRADES', product_bucket: 'GREASE', color_code: '#daa520', icon: '🧴' },
    { name: 'Welding Electrodes', description: 'Welding rods and consumables', business_category: 'WELDING', product_bucket: 'ELECTRODES', color_code: '#ff4500', icon: '⚡' }
  ];

  const insertCategory = db.prepare(`
    INSERT OR IGNORE INTO product_categories
    (name, description, business_category, product_bucket, color_code, icon)
    VALUES (?, ?, ?, ?, ?, ?)
  `);

  categories.forEach(category => {
    insertCategory.run(
      category.name,
      category.description,
      category.business_category,
      category.product_bucket,
      category.color_code,
      category.icon
    );
  });

  console.log(`✅ ${categories.length} product categories created!`);
}

function importElectrodeData(db, csvData) {
  console.log('⚡ Importing welding electrode data...');

  const getCategoryId = db.prepare('SELECT id FROM product_categories WHERE name = ?');
  const insertProduct = db.prepare(`
    INSERT OR REPLACE INTO products_v3
    (product_name, product_code, category_id, hsn_code, base_price, business_category, product_bucket, specifications, tags, is_active)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 1)
  `);

  const insertVariant = db.prepare(`
    INSERT OR REPLACE INTO product_variants_v3
    (product_id, variant_name, pack_size, pack_size_value, pack_size_unit, selling_price, cost_price)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `);

  const insertSearchIndex = db.prepare(`
    INSERT OR REPLACE INTO product_search
    (rowid, product_name, product_code, hsn_code, business_category, product_bucket, tags)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `);

  let importedCount = 0;
  const category = getCategoryId.get('Welding Electrodes');
  const categoryId = category ? category.id : null;

  csvData.data.forEach((row, index) => {
    try {
      // Clean price field (remove commas)
      const cleanPrice = row.End_User_Price.replace(/[,"]/g, '');
      const basePrice = parseFloat(cleanPrice) || 0;

      // Parse pack size
      const packSizeMatch = row.Pack_Size.match(/([0-9.]+)\\s*([A-Za-z]+)/);
      const packSizeValue = packSizeMatch ? parseFloat(packSizeMatch[1]) : 5;
      const packSizeUnit = packSizeMatch ? packSizeMatch[2] : 'Kg';

      // Generate product code from index
      const productCode = `ELC${String(index + 1).padStart(4, '0')}`;

      // Create specifications JSON
      const specifications = JSON.stringify({
        pack_size: row.Pack_Size,
        size: row.Size,
        end_user_price: basePrice,
        business_category: 'WELDING',
        product_bucket: 'ELECTRODES'
      });

      // Generate tags for search
      const tags = [
        row.Product_Name.toLowerCase(),
        'welding',
        'electrodes',
        row.Size.toLowerCase(),
        packSizeUnit.toLowerCase()
      ].join(',');

      // Insert product
      const result = insertProduct.run(
        row.Product_Name,
        productCode,
        categoryId,
        row.HSN_Code,
        basePrice,
        'WELDING',
        'ELECTRODES',
        specifications,
        tags
      );

      // Insert variant
      insertVariant.run(
        result.lastInsertRowid,
        `${row.Product_Name} - ${row.Size}`,
        row.Pack_Size,
        packSizeValue,
        packSizeUnit,
        basePrice,
        basePrice * 0.8 // Cost price estimation
      );

      // Insert search index
      insertSearchIndex.run(
        result.lastInsertRowid,
        row.Product_Name,
        productCode,
        row.HSN_Code,
        'WELDING',
        'ELECTRODES',
        tags
      );

      importedCount++;
    } catch (error) {
      console.error(`Error importing electrode row:`, error, row);
    }
  });

  console.log(`✅ Imported ${importedCount} welding electrodes!`);
  return importedCount;
}

function importLubricantData(db, csvData) {
  console.log('🛢️ Importing lubricant and coolant data...');

  const getCategoryId = db.prepare('SELECT id FROM product_categories WHERE product_bucket = ?');
  const insertProduct = db.prepare(`
    INSERT OR REPLACE INTO products_v3
    (product_name, product_code, category_id, hsn_code, base_price, business_category, product_bucket, specifications, tags, is_active)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 1)
  `);

  const insertVariant = db.prepare(`
    INSERT OR REPLACE INTO product_variants_v3
    (product_id, variant_name, pack_size, pack_size_value, pack_size_unit, selling_price, cost_price)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `);

  const insertSearchIndex = db.prepare(`
    INSERT OR REPLACE INTO product_search
    (rowid, product_name, product_code, hsn_code, business_category, product_bucket, tags)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `);

  let importedCount = 0;

  csvData.data.forEach(row => {
    try {
      // Map product bucket to category name
      let categoryName;
      switch (row.Product_Bucket) {
        case 'COOLANTS':
          categoryName = 'Coolants';
          break;
        case 'DIESEL ENGINE OIL':
          categoryName = 'Diesel Engine Oil';
          break;
        case 'GASOLINE ENGINE OIL':
          categoryName = 'Gasoline Engine Oil';
          break;
        case 'STANDARD HYDRAULIC OIL':
        case 'PREMIUM HYDRAULIC OIL':
          categoryName = 'Hydraulic Oil';
          break;
        case 'GEAR OILS':
        case 'GEAR OIL':
          categoryName = 'Gear Oil';
          break;
        case 'GREASE':
          categoryName = 'Grease';
          break;
        default:
          // Default based on business category
          if (row.Business_Category === 'AUTOMOTIVE GRADES') {
            if (row.Product_Bucket.includes('DIESEL')) {
              categoryName = 'Diesel Engine Oil';
            } else if (row.Product_Bucket.includes('GASOLINE')) {
              categoryName = 'Gasoline Engine Oil';
            } else if (row.Product_Bucket.includes('GEAR')) {
              categoryName = 'Gear Oil';
            } else {
              categoryName = 'Coolants';
            }
          } else {
            categoryName = 'Hydraulic Oil';
          }
      }

      // Get category ID by name instead of product_bucket
      const category = db.prepare('SELECT id FROM product_categories WHERE name = ?').get(categoryName);
      const categoryId = category ? category.id : null;

      // Parse pack size
      const packSizeMatch = row.Pack_Size.match(/([0-9.]+)\\s*([A-Za-z]+)/);
      const packSizeValue = packSizeMatch ? parseFloat(packSizeMatch[1]) : 0;
      const packSizeUnit = packSizeMatch ? packSizeMatch[2] : 'L';

      // Create specifications JSON
      const specifications = JSON.stringify({
        pack_size: row.Pack_Size,
        ex_factory_price: parseFloat(row.Ex_Factory_Price) || 0,
        business_category: row.Business_Category,
        product_bucket: row.Product_Bucket
      });

      // Generate tags for search
      const tags = [
        row.Product_Name.toLowerCase(),
        row.Business_Category.toLowerCase(),
        row.Product_Bucket.toLowerCase(),
        packSizeUnit.toLowerCase()
      ].join(',');

      // Insert product
      const productResult = insertProduct.run(
        row.Product_Name,
        row.Product_Code,
        categoryId,
        row.HSN_Code,
        parseFloat(row.Ex_Factory_Price) || 0,
        row.Business_Category,
        row.Product_Bucket,
        specifications,
        tags
      );

      const productId = productResult.lastInsertRowid;

      // Insert variant
      insertVariant.run(
        productId,
        `${row.Product_Name} - ${row.Pack_Size}`,
        row.Pack_Size,
        packSizeValue,
        packSizeUnit,
        parseFloat(row.Ex_Factory_Price) || 0,
        parseFloat(row.Ex_Factory_Price) * 0.8 || 0 // Assume 20% margin
      );

      // Insert into search index
      insertSearchIndex.run(
        productId,
        row.Product_Name,
        row.Product_Code,
        row.HSN_Code,
        row.Business_Category,
        row.Product_Bucket,
        tags
      );

      importedCount++;

    } catch (error) {
      console.error(`Error importing row:`, error, row);
    }
  });

  console.log(`✅ Imported ${importedCount} lubricant/coolant products!`);
  return importedCount;
}

function generateSummaryReport(db) {
  console.log('📊 Generating import summary...');

  const categoryStats = db.prepare(`
    SELECT
      pc.name as category_name,
      pc.icon,
      COUNT(p.id) as product_count,
      COUNT(pv.id) as variant_count,
      ROUND(AVG(p.base_price), 2) as avg_price,
      MIN(p.base_price) as min_price,
      MAX(p.base_price) as max_price
    FROM product_categories pc
    LEFT JOIN products_v3 p ON pc.id = p.category_id
    LEFT JOIN product_variants_v3 pv ON p.id = pv.product_id
    GROUP BY pc.id, pc.name, pc.icon
    ORDER BY product_count DESC
  `).all();

  const totalStats = db.prepare(`
    SELECT
      COUNT(DISTINCT p.id) as total_products,
      COUNT(DISTINCT pv.id) as total_variants,
      COUNT(DISTINCT pc.id) as total_categories,
      COUNT(DISTINCT p.hsn_code) as unique_hsn_codes
    FROM products_v3 p
    LEFT JOIN product_variants_v3 pv ON p.id = pv.product_id
    LEFT JOIN product_categories pc ON p.category_id = pc.id
  `).get();

  console.log('\\n🎉 PHASE 3 DATA IMPORT COMPLETE!');
  console.log('='.repeat(50));
  console.log(`📦 Total Products: ${totalStats.total_products}`);
  console.log(`📋 Total Variants: ${totalStats.total_variants}`);
  console.log(`📂 Categories: ${totalStats.total_categories}`);
  console.log(`🏷️  Unique HSN Codes: ${totalStats.unique_hsn_codes}`);
  console.log('\\n📊 Category Breakdown:');

  categoryStats.forEach(stat => {
    if (stat.product_count > 0) {
      console.log(`  ${stat.icon} ${stat.category_name}: ${stat.product_count} products (₹${stat.min_price} - ₹${stat.max_price})`);
    }
  });

  console.log('\\n🚀 Ready for Phase 3 features!');
}

async function main() {
  console.log('🚀 Starting Phase 3: Complete Product Data Import');
  console.log('='.repeat(50));

  try {
    // Initialize database
    const db = initializeDatabase();

    // Clear existing data
    console.log('🗑️ Clearing existing product data...');
    db.exec('DELETE FROM product_search');
    db.exec('DELETE FROM product_variants_v3');
    db.exec('DELETE FROM products_v3');
    db.exec('DELETE FROM import_logs');
    console.log('✅ Existing data cleared!');

    // Set up categories
    insertProductCategories(db);

    // Import lubricant data
    for (const csvFile of csvFiles) {
      if (fs.existsSync(csvFile.path)) {
        console.log(`📁 Processing ${csvFile.path}...`);
        const csvData = parseCSV(csvFile.path);

        if (csvData && csvData.data.length > 0) {
          let importedCount = 0;

          if (csvFile.type === 'electrodes') {
            importedCount = importElectrodeData(db, csvData);
          } else if (csvFile.type === 'lubricants') {
            importedCount = importLubricantData(db, csvData);
          }

          // Log the import
          db.prepare(`
            INSERT INTO import_logs (file_name, import_type, records_imported, status)
            VALUES (?, ?, ?, ?)
          `).run(path.basename(csvFile.path), csvFile.type, importedCount, 'completed');
        }
      } else {
        console.log(`⚠️  File not found: ${csvFile.path}`);
      }
    }

    // Generate summary report
    generateSummaryReport(db);

    // Close database
    db.close();

    console.log('\\n✅ Phase 3 data import completed successfully!');

  } catch (error) {
    console.error('❌ Import failed:', error);
    process.exit(1);
  }
}

// Run the import
if (require.main === module) {
  main();
}

module.exports = { main };