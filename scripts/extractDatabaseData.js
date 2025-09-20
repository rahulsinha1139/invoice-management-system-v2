/**
 * Comprehensive Database Data Extraction Script
 * Extracts all data from SQLite database for Vercel deployment seeding
 *
 * This script extracts:
 * - 410 products across 5 categories from products_v3 table
 * - 5 customers from customers table
 * - 5 HSN codes from hsn_codes table
 * - 1 company from companies table
 * - Product categories and variants
 * - All existing invoices and invoice lines (for reference)
 *
 * Output: Production-ready SQL script for in-memory database initialization
 */

const fs = require('fs');
const path = require('path');
const Database = require('better-sqlite3');

// Database configuration
const dbPath = path.join(__dirname, '..', 'data', 'invoice.db');
const outputPath = path.join(__dirname, '..', 'scripts', 'seedProductionData.sql');
const jsOutputPath = path.join(__dirname, '..', 'src', 'lib', 'productionSeedData.ts');

function extractAllData() {
  console.log('🔍 Starting comprehensive database extraction...');
  console.log(`📁 Database: ${dbPath}`);
  console.log(`📤 SQL Output: ${outputPath}`);
  console.log(`📤 TypeScript Output: ${jsOutputPath}`);
  console.log('='.repeat(60));

  if (!fs.existsSync(dbPath)) {
    throw new Error(`Database file not found: ${dbPath}`);
  }

  const db = new Database(dbPath, { readonly: true });

  try {
    // ====================================================================
    // 1. EXTRACT COMPANIES DATA
    // ====================================================================
    console.log('🏢 Extracting companies data...');
    const companies = db.prepare(`
      SELECT * FROM companies ORDER BY id
    `).all();
    console.log(`   ✅ Found ${companies.length} company record(s)`);

    // ====================================================================
    // 2. EXTRACT HSN CODES
    // ====================================================================
    console.log('🏷️  Extracting HSN codes...');
    const hsnCodes = db.prepare(`
      SELECT * FROM hsn_codes WHERE is_active = 1 ORDER BY code
    `).all();
    console.log(`   ✅ Found ${hsnCodes.length} HSN codes`);

    // ====================================================================
    // 3. EXTRACT CUSTOMERS
    // ====================================================================
    console.log('👥 Extracting customers...');
    const customers = db.prepare(`
      SELECT * FROM customers WHERE is_active = 1 ORDER BY name
    `).all();
    console.log(`   ✅ Found ${customers.length} active customers`);

    // ====================================================================
    // 4. EXTRACT PRODUCT CATEGORIES (V3)
    // ====================================================================
    console.log('📂 Extracting product categories...');
    const productCategories = db.prepare(`
      SELECT * FROM product_categories ORDER BY id
    `).all();
    console.log(`   ✅ Found ${productCategories.length} product categories`);

    // ====================================================================
    // 5. EXTRACT PRODUCTS (V3)
    // ====================================================================
    console.log('📦 Extracting products (v3 schema)...');
    const productsV3 = db.prepare(`
      SELECT * FROM products_v3 WHERE is_active = 1 ORDER BY id
    `).all();
    console.log(`   ✅ Found ${productsV3.length} active products`);

    // ====================================================================
    // 6. EXTRACT PRODUCT VARIANTS (V3)
    // ====================================================================
    console.log('📋 Extracting product variants...');
    const productVariantsV3 = db.prepare(`
      SELECT * FROM product_variants_v3 ORDER BY product_id, id
    `).all();
    console.log(`   ✅ Found ${productVariantsV3.length} product variants`);

    // ====================================================================
    // 7. EXTRACT LEGACY PRODUCTS (for compatibility)
    // ====================================================================
    console.log('📦 Extracting legacy products...');
    let legacyProducts = [];
    try {
      legacyProducts = db.prepare(`
        SELECT * FROM products WHERE is_active = 1 ORDER BY id
      `).all();
      console.log(`   ✅ Found ${legacyProducts.length} legacy products`);
    } catch (error) {
      console.log(`   ⚠️  Legacy products table not found or empty`);
    }

    // ====================================================================
    // 8. EXTRACT INVOICES (for reference/backup)
    // ====================================================================
    console.log('📄 Extracting invoices...');
    const invoices = db.prepare(`
      SELECT * FROM invoices ORDER BY created_at DESC
    `).all();
    console.log(`   ✅ Found ${invoices.length} invoices`);

    // ====================================================================
    // 9. EXTRACT INVOICE LINES (for reference/backup)
    // ====================================================================
    console.log('📝 Extracting invoice lines...');
    const invoiceLines = db.prepare(`
      SELECT * FROM invoice_lines ORDER BY invoice_id, line_number
    `).all();
    console.log(`   ✅ Found ${invoiceLines.length} invoice line items`);

    // ====================================================================
    // 10. GENERATE SQL OUTPUT
    // ====================================================================
    console.log('\\n📝 Generating SQL seed script...');
    const sqlOutput = generateSQLScript({
      companies,
      hsnCodes,
      customers,
      productCategories,
      productsV3,
      productVariantsV3,
      legacyProducts,
      invoices: [], // Don't include in production seed
      invoiceLines: [] // Don't include in production seed
    });

    fs.writeFileSync(outputPath, sqlOutput, 'utf8');
    console.log(`   ✅ SQL script saved: ${outputPath}`);

    // ====================================================================
    // 11. GENERATE TYPESCRIPT OUTPUT
    // ====================================================================
    console.log('📝 Generating TypeScript seed module...');
    const tsOutput = generateTypeScriptModule({
      companies,
      hsnCodes,
      customers,
      productCategories,
      productsV3,
      productVariantsV3,
      legacyProducts
    });

    fs.writeFileSync(jsOutputPath, tsOutput, 'utf8');
    console.log(`   ✅ TypeScript module saved: ${jsOutputPath}`);

    // ====================================================================
    // 12. GENERATE SUMMARY REPORT
    // ====================================================================
    console.log('\\n📊 EXTRACTION SUMMARY');
    console.log('='.repeat(60));
    console.log(`🏢 Companies: ${companies.length}`);
    console.log(`🏷️  HSN Codes: ${hsnCodes.length}`);
    console.log(`👥 Customers: ${customers.length}`);
    console.log(`📂 Product Categories: ${productCategories.length}`);
    console.log(`📦 Products (V3): ${productsV3.length}`);
    console.log(`📋 Product Variants: ${productVariantsV3.length}`);
    console.log(`📦 Legacy Products: ${legacyProducts.length}`);
    console.log(`📄 Invoices (reference): ${invoices.length}`);
    console.log(`📝 Invoice Lines (reference): ${invoiceLines.length}`);

    // Calculate totals
    const totalRecords = companies.length + hsnCodes.length + customers.length +
                        productCategories.length + productsV3.length + productVariantsV3.length +
                        legacyProducts.length;
    console.log(`\\n🎯 Total Static Records for Production: ${totalRecords}`);
    console.log(`📁 SQL File Size: ${(fs.statSync(outputPath).size / 1024).toFixed(2)} KB`);
    console.log(`📁 TypeScript File Size: ${(fs.statSync(jsOutputPath).size / 1024).toFixed(2)} KB`);

    console.log('\\n✅ Data extraction completed successfully!');
    console.log('🚀 Ready for Vercel deployment with complete dataset');

    return {
      companies,
      hsnCodes,
      customers,
      productCategories,
      productsV3,
      productVariantsV3,
      legacyProducts,
      invoices,
      invoiceLines,
      summary: {
        totalRecords,
        sqlFileSize: fs.statSync(outputPath).size,
        tsFileSize: fs.statSync(jsOutputPath).size
      }
    };

  } catch (error) {
    console.error('❌ Error during extraction:', error);
    throw error;
  } finally {
    db.close();
  }
}

function generateSQLScript(data) {
  const {
    companies,
    hsnCodes,
    customers,
    productCategories,
    productsV3,
    productVariantsV3,
    legacyProducts
  } = data;

  let sql = `-- ================================================================
-- PRODUCTION DATA SEED SCRIPT FOR VERCEL DEPLOYMENT
-- Generated: ${new Date().toISOString()}
--
-- This script contains complete static data for the invoice app:
-- - ${companies.length} companies
-- - ${hsnCodes.length} HSN codes
-- - ${customers.length} customers
-- - ${productCategories.length} product categories
-- - ${productsV3.length} products (v3 schema)
-- - ${productVariantsV3.length} product variants
-- - ${legacyProducts.length} legacy products
-- ================================================================

-- Disable foreign key checks during seeding
PRAGMA foreign_keys = OFF;

`;

  // ====================================================================
  // 1. COMPANIES
  // ====================================================================
  sql += `-- ================================================================
-- 1. COMPANIES
-- ================================================================
DELETE FROM companies;
`;

  companies.forEach(company => {
    sql += `INSERT INTO companies (id, name, address, gstin, pan, email, phone, created_at) VALUES (
  ${company.id},
  ${sqlEscape(company.name)},
  ${sqlEscape(company.address)},
  ${sqlEscape(company.gstin)},
  ${sqlEscape(company.pan)},
  ${sqlEscape(company.email)},
  ${sqlEscape(company.phone)},
  ${sqlEscape(company.created_at)}
);
`;
  });

  // ====================================================================
  // 2. HSN CODES
  // ====================================================================
  sql += `
-- ================================================================
-- 2. HSN CODES
-- ================================================================
DELETE FROM hsn_codes;
`;

  hsnCodes.forEach(hsn => {
    sql += `INSERT INTO hsn_codes (id, code, description, gst_rate_slab, effective_from, is_active, created_at) VALUES (
  ${hsn.id},
  ${sqlEscape(hsn.code)},
  ${sqlEscape(hsn.description)},
  ${hsn.gst_rate_slab},
  ${sqlEscape(hsn.effective_from)},
  ${hsn.is_active},
  ${sqlEscape(hsn.created_at)}
);
`;
  });

  // ====================================================================
  // 3. CUSTOMERS
  // ====================================================================
  sql += `
-- ================================================================
-- 3. CUSTOMERS
-- ================================================================
DELETE FROM customers;
`;

  customers.forEach(customer => {
    sql += `INSERT INTO customers (
  id, name, gstin, pan, email, phone, billing_address, shipping_address,
  city, state, state_code, place_of_supply, pin, contact_person,
  payment_terms, credit_limit, is_active, created_at, updated_at
) VALUES (
  ${customer.id},
  ${sqlEscape(customer.name)},
  ${sqlEscape(customer.gstin)},
  ${sqlEscape(customer.pan)},
  ${sqlEscape(customer.email)},
  ${sqlEscape(customer.phone)},
  ${sqlEscape(customer.billing_address)},
  ${sqlEscape(customer.shipping_address)},
  ${sqlEscape(customer.city)},
  ${sqlEscape(customer.state)},
  ${sqlEscape(customer.state_code)},
  ${sqlEscape(customer.place_of_supply)},
  ${sqlEscape(customer.pin)},
  ${sqlEscape(customer.contact_person)},
  ${sqlEscape(customer.payment_terms)},
  ${customer.credit_limit},
  ${customer.is_active},
  ${sqlEscape(customer.created_at)},
  ${sqlEscape(customer.updated_at)}
);
`;
  });

  // ====================================================================
  // 4. PRODUCT CATEGORIES
  // ====================================================================
  sql += `
-- ================================================================
-- 4. PRODUCT CATEGORIES
-- ================================================================
DELETE FROM product_categories;
`;

  productCategories.forEach(category => {
    sql += `INSERT INTO product_categories (
  id, name, description, business_category, product_bucket, color_code, icon, created_at
) VALUES (
  ${category.id},
  ${sqlEscape(category.name)},
  ${sqlEscape(category.description)},
  ${sqlEscape(category.business_category)},
  ${sqlEscape(category.product_bucket)},
  ${sqlEscape(category.color_code)},
  ${sqlEscape(category.icon)},
  ${sqlEscape(category.created_at)}
);
`;
  });

  // ====================================================================
  // 5. PRODUCTS V3
  // ====================================================================
  sql += `
-- ================================================================
-- 5. PRODUCTS (V3 SCHEMA) - ${productsV3.length} PRODUCTS
-- ================================================================
DELETE FROM products_v3;
`;

  productsV3.forEach(product => {
    sql += `INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  ${product.id},
  ${sqlEscape(product.product_name)},
  ${sqlEscape(product.product_code)},
  ${product.category_id},
  ${sqlEscape(product.hsn_code)},
  ${product.base_price},
  ${sqlEscape(product.business_category)},
  ${sqlEscape(product.product_bucket)},
  ${sqlEscape(product.specifications)},
  ${sqlEscape(product.tags)},
  ${product.is_active},
  ${sqlEscape(product.created_at)},
  ${sqlEscape(product.updated_at)}
);
`;
  });

  // ====================================================================
  // 6. PRODUCT VARIANTS V3
  // ====================================================================
  sql += `
-- ================================================================
-- 6. PRODUCT VARIANTS (V3 SCHEMA) - ${productVariantsV3.length} VARIANTS
-- ================================================================
DELETE FROM product_variants_v3;
`;

  productVariantsV3.forEach(variant => {
    sql += `INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  ${variant.id},
  ${variant.product_id},
  ${sqlEscape(variant.variant_name)},
  ${sqlEscape(variant.pack_size)},
  ${variant.pack_size_value},
  ${sqlEscape(variant.pack_size_unit)},
  ${variant.selling_price},
  ${variant.cost_price},
  ${variant.margin_percent},
  ${variant.minimum_order_qty},
  ${variant.in_stock},
  ${variant.stock_quantity},
  ${sqlEscape(variant.created_at)}
);
`;
  });

  // ====================================================================
  // 7. LEGACY PRODUCTS (for compatibility)
  // ====================================================================
  if (legacyProducts.length > 0) {
    sql += `
-- ================================================================
-- 7. LEGACY PRODUCTS (for compatibility) - ${legacyProducts.length} PRODUCTS
-- ================================================================
DELETE FROM products;
`;

    legacyProducts.forEach(product => {
      sql += `INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  ${product.id},
  ${sqlEscape(product.sku)},
  ${product.brand_id},
  ${product.category_id},
  ${sqlEscape(product.name)},
  ${sqlEscape(product.description)},
  ${product.default_hsn_id},
  ${product.default_uom_id},
  ${sqlEscape(product.product_type)},
  ${product.is_active},
  ${sqlEscape(product.created_at)},
  ${sqlEscape(product.updated_at)}
);
`;
    });
  }

  // ====================================================================
  // FINALIZE
  // ====================================================================
  sql += `
-- ================================================================
-- FINALIZE
-- ================================================================
-- Re-enable foreign key checks
PRAGMA foreign_keys = ON;

-- Update sequences to prevent conflicts
UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM companies) WHERE name = 'companies';
UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM hsn_codes) WHERE name = 'hsn_codes';
UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM customers) WHERE name = 'customers';
UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM product_categories) WHERE name = 'product_categories';
UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM products_v3) WHERE name = 'products_v3';
UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM product_variants_v3) WHERE name = 'product_variants_v3';

-- Verify data integrity
SELECT 'COMPANIES', COUNT(*) as count FROM companies
UNION ALL
SELECT 'HSN_CODES', COUNT(*) as count FROM hsn_codes
UNION ALL
SELECT 'CUSTOMERS', COUNT(*) as count FROM customers
UNION ALL
SELECT 'PRODUCT_CATEGORIES', COUNT(*) as count FROM product_categories
UNION ALL
SELECT 'PRODUCTS_V3', COUNT(*) as count FROM products_v3
UNION ALL
SELECT 'PRODUCT_VARIANTS_V3', COUNT(*) as count FROM product_variants_v3;

-- ================================================================
-- SEED SCRIPT COMPLETE
-- Ready for Vercel deployment with complete dataset
-- ================================================================
`;

  return sql;
}

function generateTypeScriptModule(data) {
  const {
    companies,
    hsnCodes,
    customers,
    productCategories,
    productsV3,
    productVariantsV3,
    legacyProducts
  } = data;

  return `/**
 * Production Seed Data for Vercel Deployment
 * Generated: ${new Date().toISOString()}
 *
 * Complete static dataset for in-memory database initialization
 * Total records: ${companies.length + hsnCodes.length + customers.length + productCategories.length + productsV3.length + productVariantsV3.length + legacyProducts.length}
 */

import Database from 'better-sqlite3';

export interface SeedDataSummary {
  companies: number;
  hsnCodes: number;
  customers: number;
  productCategories: number;
  productsV3: number;
  productVariantsV3: number;
  legacyProducts: number;
  totalRecords: number;
}

export const SEED_DATA_SUMMARY: SeedDataSummary = {
  companies: ${companies.length},
  hsnCodes: ${hsnCodes.length},
  customers: ${customers.length},
  productCategories: ${productCategories.length},
  productsV3: ${productsV3.length},
  productVariantsV3: ${productVariantsV3.length},
  legacyProducts: ${legacyProducts.length},
  totalRecords: ${companies.length + hsnCodes.length + customers.length + productCategories.length + productsV3.length + productVariantsV3.length + legacyProducts.length}
};

export function seedProductionDatabase(db: Database.Database) {
  console.log('🌱 Seeding production database with static data...');

  try {
    // Disable foreign key checks during seeding
    db.pragma('foreign_keys = OFF');

    // ================================================================
    // 1. COMPANIES
    // ================================================================
    console.log('🏢 Seeding companies...');
    db.exec('DELETE FROM companies');

    const companies = ${JSON.stringify(companies, null, 4)};

    const insertCompany = db.prepare(\`
      INSERT INTO companies (id, name, address, gstin, pan, email, phone, created_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    \`);

    companies.forEach(company => {
      insertCompany.run(
        company.id,
        company.name,
        company.address,
        company.gstin,
        company.pan,
        company.email,
        company.phone,
        company.created_at
      );
    });

    // ================================================================
    // 2. HSN CODES
    // ================================================================
    console.log('🏷️  Seeding HSN codes...');
    db.exec('DELETE FROM hsn_codes');

    const hsnCodes = ${JSON.stringify(hsnCodes, null, 4)};

    const insertHSN = db.prepare(\`
      INSERT INTO hsn_codes (id, code, description, gst_rate_slab, effective_from, is_active, created_at)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    \`);

    hsnCodes.forEach(hsn => {
      insertHSN.run(
        hsn.id,
        hsn.code,
        hsn.description,
        hsn.gst_rate_slab,
        hsn.effective_from,
        hsn.is_active,
        hsn.created_at
      );
    });

    // ================================================================
    // 3. CUSTOMERS
    // ================================================================
    console.log('👥 Seeding customers...');
    db.exec('DELETE FROM customers');

    const customers = ${JSON.stringify(customers, null, 4)};

    const insertCustomer = db.prepare(\`
      INSERT INTO customers (
        id, name, gstin, pan, email, phone, billing_address, shipping_address,
        city, state, state_code, place_of_supply, pin, contact_person,
        payment_terms, credit_limit, is_active, created_at, updated_at
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    \`);

    customers.forEach(customer => {
      insertCustomer.run(
        customer.id,
        customer.name,
        customer.gstin,
        customer.pan,
        customer.email,
        customer.phone,
        customer.billing_address,
        customer.shipping_address,
        customer.city,
        customer.state,
        customer.state_code,
        customer.place_of_supply,
        customer.pin,
        customer.contact_person,
        customer.payment_terms,
        customer.credit_limit,
        customer.is_active,
        customer.created_at,
        customer.updated_at
      );
    });

    // ================================================================
    // 4. PRODUCT CATEGORIES
    // ================================================================
    console.log('📂 Seeding product categories...');
    db.exec('DELETE FROM product_categories');

    const productCategories = ${JSON.stringify(productCategories, null, 4)};

    const insertCategory = db.prepare(\`
      INSERT INTO product_categories (
        id, name, description, business_category, product_bucket, color_code, icon, created_at
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    \`);

    productCategories.forEach(category => {
      insertCategory.run(
        category.id,
        category.name,
        category.description,
        category.business_category,
        category.product_bucket,
        category.color_code,
        category.icon,
        category.created_at
      );
    });

    // ================================================================
    // 5. PRODUCTS V3 (${productsV3.length} products - split into chunks)
    // ================================================================
    console.log('📦 Seeding products v3 (${productsV3.length} products)...');
    db.exec('DELETE FROM products_v3');

    const insertProduct = db.prepare(\`
      INSERT INTO products_v3 (
        id, product_name, product_code, category_id, hsn_code, base_price,
        business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    \`);

    // Split products into chunks to avoid memory issues
    const CHUNK_SIZE = 50;
    ${generateProductChunks(productsV3, 'productsV3')}

    // ================================================================
    // 6. PRODUCT VARIANTS V3 (${productVariantsV3.length} variants)
    // ================================================================
    console.log('📋 Seeding product variants v3 (${productVariantsV3.length} variants)...');
    db.exec('DELETE FROM product_variants_v3');

    const insertVariant = db.prepare(\`
      INSERT INTO product_variants_v3 (
        id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
        selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    \`);

    ${generateVariantChunks(productVariantsV3, 'productVariantsV3')}

    ${legacyProducts.length > 0 ? `
    // ================================================================
    // 7. LEGACY PRODUCTS (for compatibility)
    // ================================================================
    console.log('📦 Seeding legacy products (${legacyProducts.length} products)...');
    db.exec('DELETE FROM products');

    const legacyProducts = ${JSON.stringify(legacyProducts, null, 4)};

    const insertLegacyProduct = db.prepare(\`
      INSERT INTO products (
        id, sku, brand_id, category_id, name, description, default_hsn_id,
        default_uom_id, product_type, is_active, created_at, updated_at
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    \`);

    legacyProducts.forEach(product => {
      insertLegacyProduct.run(
        product.id,
        product.sku,
        product.brand_id,
        product.category_id,
        product.name,
        product.description,
        product.default_hsn_id,
        product.default_uom_id,
        product.product_type,
        product.is_active,
        product.created_at,
        product.updated_at
      );
    });
    ` : ''}

    // ================================================================
    // FINALIZE
    // ================================================================
    // Re-enable foreign key checks
    db.pragma('foreign_keys = ON');

    console.log('✅ Production database seeded successfully!');
    console.log(\`🎯 Total records seeded: \${SEED_DATA_SUMMARY.totalRecords}\`);

    return SEED_DATA_SUMMARY;

  } catch (error) {
    console.error('❌ Error seeding production database:', error);
    throw error;
  }
}

export default seedProductionDatabase;
`;
}

function generateProductChunks(products, variableName) {
  const CHUNK_SIZE = 50;
  const chunks = [];

  for (let i = 0; i < products.length; i += CHUNK_SIZE) {
    const chunk = products.slice(i, i + CHUNK_SIZE);
    chunks.push(chunk);
  }

  return chunks.map((chunk, index) => {
    return `
    // Chunk ${index + 1} of ${chunks.length} (products ${index * CHUNK_SIZE + 1}-${Math.min((index + 1) * CHUNK_SIZE, products.length)})
    const ${variableName}Chunk${index + 1} = ${JSON.stringify(chunk, null, 6)};

    ${variableName}Chunk${index + 1}.forEach(product => {
      insertProduct.run(
        product.id,
        product.product_name,
        product.product_code,
        product.category_id,
        product.hsn_code,
        product.base_price,
        product.business_category,
        product.product_bucket,
        product.specifications,
        product.tags,
        product.is_active,
        product.created_at,
        product.updated_at
      );
    });`;
  }).join('\n');
}

function generateVariantChunks(variants, variableName) {
  const CHUNK_SIZE = 50;
  const chunks = [];

  for (let i = 0; i < variants.length; i += CHUNK_SIZE) {
    const chunk = variants.slice(i, i + CHUNK_SIZE);
    chunks.push(chunk);
  }

  return chunks.map((chunk, index) => {
    return `
    // Chunk ${index + 1} of ${chunks.length} (variants ${index * CHUNK_SIZE + 1}-${Math.min((index + 1) * CHUNK_SIZE, variants.length)})
    const ${variableName}Chunk${index + 1} = ${JSON.stringify(chunk, null, 6)};

    ${variableName}Chunk${index + 1}.forEach(variant => {
      insertVariant.run(
        variant.id,
        variant.product_id,
        variant.variant_name,
        variant.pack_size,
        variant.pack_size_value,
        variant.pack_size_unit,
        variant.selling_price,
        variant.cost_price,
        variant.margin_percent,
        variant.minimum_order_qty,
        variant.in_stock,
        variant.stock_quantity,
        variant.created_at
      );
    });`;
  }).join('\n');
}

function sqlEscape(value) {
  if (value === null || value === undefined) {
    return 'NULL';
  }
  if (typeof value === 'string') {
    return "'" + value.replace(/'/g, "''") + "'";
  }
  return value;
}

// Run extraction if called directly
if (require.main === module) {
  try {
    extractAllData();
  } catch (error) {
    console.error('❌ Extraction failed:', error);
    process.exit(1);
  }
}

module.exports = { extractAllData, generateSQLScript, generateTypeScriptModule };