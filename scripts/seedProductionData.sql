-- ================================================================
-- PRODUCTION DATA SEED SCRIPT FOR VERCEL DEPLOYMENT
-- Generated: 2025-09-20T16:47:28.479Z
--
-- This script contains complete static data for the invoice app:
-- - 1 companies
-- - 5 HSN codes
-- - 5 customers
-- - 7 product categories
-- - 410 products (v3 schema)
-- - 410 product variants
-- - 41 legacy products
-- ================================================================

-- Disable foreign key checks during seeding
PRAGMA foreign_keys = OFF;

-- ================================================================
-- 1. COMPANIES
-- ================================================================
DELETE FROM companies;
INSERT INTO companies (id, name, address, gstin, pan, email, phone, created_at) VALUES (
  1,
  NULL,
  NULL,
  '23AACFU6860C2ZD',
  'AACFU6860C',
  'unique_engineers2000@yahoo.com',
  '9425412453',
  '2025-09-13 11:36:04'
);

-- ================================================================
-- 2. HSN CODES
-- ================================================================
DELETE FROM hsn_codes;
INSERT INTO hsn_codes (id, code, description, gst_rate_slab, effective_from, is_active, created_at) VALUES (
  2,
  '27101921',
  'Lubricating Oils',
  18,
  '2025-09-13',
  1,
  '2025-09-13 11:36:04'
);
INSERT INTO hsn_codes (id, code, description, gst_rate_slab, effective_from, is_active, created_at) VALUES (
  3,
  '27101922',
  'Greases',
  18,
  '2025-09-13',
  1,
  '2025-09-13 11:36:04'
);
INSERT INTO hsn_codes (id, code, description, gst_rate_slab, effective_from, is_active, created_at) VALUES (
  7,
  '27101981',
  'Coolants & Antifreeze',
  18,
  '2024-01-01',
  1,
  '2025-09-13 15:42:34'
);
INSERT INTO hsn_codes (id, code, description, gst_rate_slab, effective_from, is_active, created_at) VALUES (
  4,
  '38200000',
  'Coolants and Antifreeze',
  18,
  '2025-09-13',
  1,
  '2025-09-13 11:36:04'
);
INSERT INTO hsn_codes (id, code, description, gst_rate_slab, effective_from, is_active, created_at) VALUES (
  1,
  '83111000',
  'Welding Electrodes',
  18,
  '2025-09-13',
  1,
  '2025-09-13 11:36:04'
);

-- ================================================================
-- 3. CUSTOMERS
-- ================================================================
DELETE FROM customers;
INSERT INTO customers (
  id, name, gstin, pan, email, phone, billing_address, shipping_address,
  city, state, state_code, place_of_supply, pin, contact_person,
  payment_terms, credit_limit, is_active, created_at, updated_at
) VALUES (
  2,
  'Advanced Test Customer Ltd',
  '23BBBBB1234C1Z5',
  NULL,
  'contact@advancedtest.com',
  '9876543222',
  '456 Enterprise Avenue, Technology Park',
  '456 Enterprise Avenue, Technology Park',
  'Indore',
  'MADHYA PRADESH',
  '23',
  'MADHYA PRADESH',
  '452001',
  NULL,
  'Cash',
  0,
  1,
  '2025-09-14 04:38:15',
  '2025-09-14 04:38:15'
);
INSERT INTO customers (
  id, name, gstin, pan, email, phone, billing_address, shipping_address,
  city, state, state_code, place_of_supply, pin, contact_person,
  payment_terms, credit_limit, is_active, created_at, updated_at
) VALUES (
  5,
  'Heidelberg Cements India Pvt Ltd',
  '23AABCM2359JIZK',
  NULL,
  'hemant.sahu@heidelbergcement.in',
  '+91 (7601) 241235',
  'HEIDELBERG CEMENT
ADMINISTRATIVE BLOCK
DAMOH, MP 470675',
  'HEIDELBERG CEMENT
ADMINISTRATIVE BLOCK
DAMOH, MP 470675',
  'Damoh',
  'Madhya Pradesh',
  '23',
  '',
  NULL,
  NULL,
  'Cash',
  0,
  1,
  '2025-09-17 16:08:59',
  '2025-09-17 16:08:59'
);
INSERT INTO customers (
  id, name, gstin, pan, email, phone, billing_address, shipping_address,
  city, state, state_code, place_of_supply, pin, contact_person,
  payment_terms, credit_limit, is_active, created_at, updated_at
) VALUES (
  4,
  'Lightning Button Test Customer',
  NULL,
  NULL,
  NULL,
  '9999999999',
  '123 Lightning St',
  '123 Lightning St',
  'Performance City',
  'MADHYA PRADESH',
  '23',
  'MADHYA PRADESH',
  NULL,
  NULL,
  'Cash',
  0,
  1,
  '2025-09-17 16:04:28',
  '2025-09-17 16:04:28'
);
INSERT INTO customers (
  id, name, gstin, pan, email, phone, billing_address, shipping_address,
  city, state, state_code, place_of_supply, pin, contact_person,
  payment_terms, credit_limit, is_active, created_at, updated_at
) VALUES (
  1,
  'Test Customer',
  NULL,
  NULL,
  NULL,
  '9876543210',
  '123 Test Street',
  '123 Test Street',
  'Test City',
  'MADHYA PRADESH',
  '23',
  'MADHYA PRADESH',
  '123456',
  NULL,
  'Cash',
  0,
  1,
  '2025-09-14 04:21:15',
  '2025-09-14 04:21:15'
);
INSERT INTO customers (
  id, name, gstin, pan, email, phone, billing_address, shipping_address,
  city, state, state_code, place_of_supply, pin, contact_person,
  payment_terms, credit_limit, is_active, created_at, updated_at
) VALUES (
  3,
  'Test Customer API',
  NULL,
  NULL,
  NULL,
  '1234567890',
  '123 API Test St',
  '123 API Test St',
  'Test City',
  'MADHYA PRADESH',
  '23',
  'MADHYA PRADESH',
  NULL,
  NULL,
  'Cash',
  0,
  1,
  '2025-09-17 15:39:25',
  '2025-09-17 15:39:25'
);

-- ================================================================
-- 4. PRODUCT CATEGORIES
-- ================================================================
DELETE FROM product_categories;
INSERT INTO product_categories (
  id, name, description, business_category, product_bucket, color_code, icon, created_at
) VALUES (
  1,
  'Coolants',
  'Automotive coolants and antifreeze',
  'AUTOMOTIVE GRADES',
  'COOLANTS',
  '#00bfff',
  '❄️',
  '2025-09-16 13:49:11'
);
INSERT INTO product_categories (
  id, name, description, business_category, product_bucket, color_code, icon, created_at
) VALUES (
  2,
  'Diesel Engine Oil',
  'Heavy-duty diesel engine lubricants',
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '#ffa500',
  '🛢️',
  '2025-09-16 13:49:11'
);
INSERT INTO product_categories (
  id, name, description, business_category, product_bucket, color_code, icon, created_at
) VALUES (
  3,
  'Gasoline Engine Oil',
  'Passenger car gasoline engine oils',
  'AUTOMOTIVE GRADES',
  'GASOLINE ENGINE OIL',
  '#32cd32',
  '⛽',
  '2025-09-16 13:49:11'
);
INSERT INTO product_categories (
  id, name, description, business_category, product_bucket, color_code, icon, created_at
) VALUES (
  4,
  'Hydraulic Oil',
  'Industrial hydraulic fluids',
  'INDUSTRIAL GRADES',
  'HYDRAULIC OIL',
  '#ff6347',
  '🏭',
  '2025-09-16 13:49:11'
);
INSERT INTO product_categories (
  id, name, description, business_category, product_bucket, color_code, icon, created_at
) VALUES (
  5,
  'Gear Oil',
  'Transmission and gear lubricants',
  'AUTOMOTIVE GRADES',
  'GEAR OIL',
  '#9370db',
  '⚙️',
  '2025-09-16 13:49:11'
);
INSERT INTO product_categories (
  id, name, description, business_category, product_bucket, color_code, icon, created_at
) VALUES (
  6,
  'Grease',
  'Multi-purpose greases',
  'INDUSTRIAL GRADES',
  'GREASE',
  '#daa520',
  '🧴',
  '2025-09-16 13:49:11'
);
INSERT INTO product_categories (
  id, name, description, business_category, product_bucket, color_code, icon, created_at
) VALUES (
  7,
  'Welding Electrodes',
  'Welding rods and consumables',
  'WELDING',
  'ELECTRODES',
  '#ff4500',
  '⚡',
  '2025-09-16 13:49:11'
);

-- ================================================================
-- 5. PRODUCTS (V3 SCHEMA) - 410 PRODUCTS
-- ================================================================
DELETE FROM products_v3;
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  724,
  'Xuper 660 NH, 2.50 mm',
  'ELC0001',
  7,
  '83111000',
  1691.38,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.50 mm","end_user_price":1691.38,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 660 nh, 2.50 mm,welding,electrodes,2.50 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  725,
  'Xuper 660 NH, 3.20 mm',
  'ELC0002',
  7,
  '83111000',
  1606.82,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1606.82,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 660 nh, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  726,
  'Xuper 660 NH, 4.00 mm',
  'ELC0003',
  7,
  '83111000',
  1606.82,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1606.82,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 660 nh, 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  727,
  'EutecTrode 670, 2.40 mm',
  'ELC0004',
  7,
  '83111000',
  5637.76,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.40 mm","end_user_price":5637.76,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 670, 2.40 mm,welding,electrodes,2.40 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  728,
  'EutecTrode 670, 3.20 mm',
  'ELC0005',
  7,
  '83111000',
  4952.9,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":4952.9,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 670, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  729,
  'EutecTrode 670, 4.00 mm',
  'ELC0006',
  7,
  '83111000',
  5249.9,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":5249.9,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 670, 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  730,
  'Xuper 680 CGS, 2.40 mm',
  'ELC0007',
  7,
  '83111000',
  7116.34,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.40 mm","end_user_price":7116.34,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 680 cgs, 2.40 mm,welding,electrodes,2.40 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  731,
  'Xuper 680 CGS, 3.20 mm',
  'ELC0008',
  7,
  '83111000',
  7131.68,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":7131.68,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 680 cgs, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  732,
  'Xuper 680 CGS, 4.00 mm',
  'ELC0009',
  7,
  '83111000',
  7098.44,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":7098.44,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 680 cgs, 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  733,
  'EutecTrode 680 2.40 mm',
  'ELC0010',
  7,
  '83111000',
  6821.64,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.40 mm","end_user_price":6821.64,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 680 2.40 mm,welding,electrodes,2.40 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  734,
  'EutecTrode 680 3.20 mm',
  'ELC0011',
  7,
  '83111000',
  6914.5,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":6914.5,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 680 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  735,
  'EutecTrode 680 4.00 mm',
  'ELC0012',
  7,
  '83111000',
  6898.44,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":6898.44,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 680 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  736,
  'Xuper 680S, 1.60 mm',
  'ELC0013',
  7,
  '83111000',
  12553.44,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"2.5 Kg","size":"1.60 mm","end_user_price":12553.44,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 680s, 1.60 mm,welding,electrodes,1.60 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  737,
  'Xuper Nucleotec 2222 2.40 mm',
  'ELC0014',
  7,
  '83111000',
  18772.96,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.40 mm","end_user_price":18772.96,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper nucleotec 2222 2.40 mm,welding,electrodes,2.40 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  738,
  'Xuper Nucleotec 2222 3.20 mm',
  'ELC0015',
  7,
  '83111000',
  14331.1,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":14331.1,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper nucleotec 2222 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  739,
  'Xuper Nucleotec 2222 4.00 mm',
  'ELC0016',
  7,
  '83111000',
  14647.4,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":14647.4,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper nucleotec 2222 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  740,
  'XHD 2222 2.40 mm',
  'ELC0017',
  7,
  '83111000',
  11220.76,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.40 mm","end_user_price":11220.76,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 2222 2.40 mm,welding,electrodes,2.40 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  741,
  'XHD 2222 3.20 mm',
  'ELC0018',
  7,
  '83111000',
  10864.98,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":10864.98,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 2222 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  742,
  'XHD 2222 4.00 mm',
  'ELC0019',
  7,
  '83111000',
  10925.52,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":10925.52,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 2222 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  743,
  'EutecTrode EC 6821, 2.50 mm (CPEM 021)',
  'ELC0020',
  7,
  '83111000',
  2950.5,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.50 mm","end_user_price":2950.5,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6821, 2.50 mm (cpem 021),welding,electrodes,2.50 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  744,
  'EutecTrode EC 6821, 3.20 mm (CPEM 021)',
  'ELC0021',
  7,
  '83111000',
  2900.25,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":2900.25,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6821, 3.20 mm (cpem 021),welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  745,
  'EutecTrode EC 6821, 4.00 mm (CPEM 021)',
  'ELC0022',
  7,
  '83111000',
  2900.25,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":2900.25,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6821, 4.00 mm (cpem 021),welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  746,
  'StainTrode D 2.50 mm',
  'ELC0023',
  7,
  '83111000',
  4448.58,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.50 mm","end_user_price":4448.58,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode d 2.50 mm,welding,electrodes,2.50 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  747,
  'StainTrode D 3.20 mm',
  'ELC0024',
  7,
  '83111000',
  4374.88,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":4374.88,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode d 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  748,
  'StainTrode D 4.00 mm',
  'ELC0025',
  7,
  '83111000',
  4350.3,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":4350.3,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode d 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  749,
  'EutecTrode EC 33300 3.20 mm',
  'ELC0026',
  7,
  '83111000',
  1681.82,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1681.82,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 33300 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  750,
  'EutecTrode EC 33300 4.00 mm',
  'ELC0027',
  7,
  '83111000',
  1681.82,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1681.82,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 33300 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  751,
  'StainTrode A-Mo-L 2.40 mm',
  'ELC0028',
  7,
  '83111000',
  4886.74,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.40 mm","end_user_price":4886.74,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode a-mo-l 2.40 mm,welding,electrodes,2.40 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  752,
  'StainTrode A-Mo-L 3.20 mm',
  'ELC0029',
  7,
  '83111000',
  4238.38,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":4238.38,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode a-mo-l 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  753,
  'StainTrode A-Mo-L 4.00 mm',
  'ELC0030',
  7,
  '83111000',
  4238.38,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":4238.38,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode a-mo-l 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  754,
  'StainTrode BL 2.40 mm',
  'ELC0031',
  7,
  '83111000',
  4398.07,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.40 mm","end_user_price":4398.07,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode bl 2.40 mm,welding,electrodes,2.40 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  755,
  'StainTrode BL 3.20 mm',
  'ELC0032',
  7,
  '83111000',
  3814.54,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":3814.54,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode bl 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  756,
  'StainTrode BL 4.00 mm',
  'ELC0033',
  7,
  '83111000',
  3814.54,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":3814.54,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode bl 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  757,
  'StainTrode B-Mo-L 2.40 mm',
  'ELC0034',
  7,
  '83111000',
  4886.74,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.40 mm","end_user_price":4886.74,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode b-mo-l 2.40 mm,welding,electrodes,2.40 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  758,
  'StainTrode B-Mo-L 3.20 mm',
  'ELC0035',
  7,
  '83111000',
  4238.38,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":4238.38,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'staintrode b-mo-l 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  759,
  'EutecTrode 27 3.20 mm',
  'ELC0036',
  7,
  '83111000',
  1473.06,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1473.06,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 27 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  760,
  'EutecTrode 27 4.00 mm',
  'ELC0037',
  7,
  '83111000',
  1473.06,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1473.06,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 27 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  761,
  'Xyron 223, 2.50 mm',
  'ELC0038',
  7,
  '83111000',
  10126.22,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.50 mm","end_user_price":10126.22,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xyron 223, 2.50 mm,welding,electrodes,2.50 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  762,
  'Xyron 223, 3.20 mm',
  'ELC0039',
  7,
  '83111000',
  9873.08,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":9873.08,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xyron 223, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  763,
  'Xyron 223, 4.00 mm',
  'ELC0040',
  7,
  '83111000',
  9873.08,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":9873.08,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xyron 223, 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  764,
  'Xyron 224, 3.20 mm (EutecTrode 224)',
  'ELC0041',
  7,
  '83111000',
  10947.78,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":10947.78,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xyron 224, 3.20 mm (eutectrode 224),welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  765,
  'Xyron 224, 4.00 mm (EutecTrode 224)',
  'ELC0042',
  7,
  '83111000',
  10939.6,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":10939.6,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xyron 224, 4.00 mm (eutectrode 224),welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  766,
  'Xuper 2240 3.20 mm',
  'ELC0043',
  7,
  '83111000',
  10235.82,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":10235.82,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 2240 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  767,
  'Xuper 2240 4.00 mm',
  'ELC0044',
  7,
  '83111000',
  10235.82,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":10235.82,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 2240 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  768,
  'Xuper 22*33N 3.20 mm',
  'ELC0045',
  7,
  '83111000',
  15845.12,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":15845.12,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 22*33n 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  769,
  'Xuper 22*33N 4.00 mm',
  'ELC0046',
  7,
  '83111000',
  15845.12,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":15845.12,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xuper 22*33n 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  770,
  'EutecTrode EC 2026, 2.50 mm',
  'ELC0047',
  7,
  '83111000',
  7088.36,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.50 mm","end_user_price":7088.36,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 2026, 2.50 mm,welding,electrodes,2.50 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  771,
  'EutecTrode EC 2026, 3.20 mm',
  'ELC0048',
  7,
  '83111000',
  6911.16,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":6911.16,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 2026, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  772,
  'EutecTrode EC 2026, 4.00 mm',
  'ELC0049',
  7,
  '83111000',
  6911.16,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":6911.16,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 2026, 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  773,
  'EutecTrode 2, 3.20 mm',
  'ELC0050',
  7,
  '83111000',
  880.55,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":880.55,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 2, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  774,
  'EutecTrode 2, 4.00 mm',
  'ELC0051',
  7,
  '83111000',
  880.55,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":880.55,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 2, 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  775,
  'EutecTrode 2B 3.20 mm',
  'ELC0052',
  7,
  '83111000',
  1090,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1090,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 2b 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  776,
  'EutecTrode 2B 4.00 mm',
  'ELC0053',
  7,
  '83111000',
  1090,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1090,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 2b 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  777,
  'EutecTrode 2B 5.00 mm',
  'ELC0054',
  7,
  '83111000',
  1090,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"5.00 mm","end_user_price":1090,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 2b 5.00 mm,welding,electrodes,5.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  778,
  'EutecTrode 700 3.20 mm',
  'ELC0055',
  7,
  '83111000',
  1215,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1215,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 700 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  779,
  'EutecTrode 700 4.00 mm',
  'ELC0056',
  7,
  '83111000',
  1215,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1215,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 700 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  780,
  'XHD 646 3.20 mm',
  'ELC0057',
  7,
  '83111000',
  3520,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":3520,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 646 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  781,
  'XHD 646 4.00 mm',
  'ELC0058',
  7,
  '83111000',
  3520,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":3520,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 646 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  782,
  'EutecTrode 6450 3.20 mm',
  'ELC0059',
  7,
  '83111000',
  1675.92,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1675.92,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 6450 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  783,
  'EutecTrode 6450 4.00 mm',
  'ELC0060',
  7,
  '83111000',
  1675.92,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1675.92,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 6450 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  784,
  'XHD 6710 3.20 mm',
  'ELC0061',
  7,
  '83111000',
  3659.8,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":3659.8,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 6710 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  785,
  'XHD 6710 4.00 mm',
  'ELC0062',
  7,
  '83111000',
  3453.88,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":3453.88,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 6710 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  786,
  'XHD 6715 3.20 mm',
  'ELC0063',
  7,
  '83111000',
  8301.8,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":8301.8,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 6715 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  787,
  'XHD 6715 4.00 mm',
  'ELC0064',
  7,
  '83111000',
  8035.1,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":8035.1,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 6715 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  788,
  'ChromCarb N 6006 2.50  mm',
  'ELC0065',
  7,
  '83111000',
  4394.58,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"2.50  mm","end_user_price":4394.58,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'chromcarb n 6006 2.50  mm,welding,electrodes,2.50  mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  789,
  'ChromCarb N 6006 3.20 mm',
  'ELC0066',
  7,
  '83111000',
  4174.86,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":4174.86,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'chromcarb n 6006 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  790,
  'ChromCarb N 6006 4.00 mm',
  'ELC0067',
  7,
  '83111000',
  4174.86,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":4174.86,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'chromcarb n 6006 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  791,
  'XHD ABRATEC 6777 3.20 mm (PyroCarb',
  'ELC0068',
  7,
  '83111000',
  8984,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":8984,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd abratec 6777 3.20 mm (pyrocarb,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  792,
  'XHD ABRATEC 6777 4.00 mm (PyroCarb',
  'ELC0069',
  7,
  '83111000',
  8984,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":8984,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd abratec 6777 4.00 mm (pyrocarb,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  793,
  'ToolTectic 6NHSS 3.20 mm',
  'ELC0070',
  7,
  '83111000',
  3614.28,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":3614.28,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'tooltectic 6nhss 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  794,
  'ToolTectic 6NHSS 4.00 mm',
  'ELC0071',
  7,
  '83111000',
  3377.82,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":3377.82,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'tooltectic 6nhss 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  795,
  'EutecDur N 9060 3.20 mm',
  'ELC0072',
  7,
  '83111000',
  14354.46,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"2.5 Kg","size":"3.20 mm","end_user_price":14354.46,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutecdur n 9060 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  796,
  'EutecDur N 9060 4.00 mm',
  'ELC0073',
  7,
  '83111000',
  14136.3,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"2.5 Kg","size":"4.00 mm","end_user_price":14136.3,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutecdur n 9060 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  797,
  'EutecDur N 9080 3.20 mm',
  'ELC0074',
  7,
  '83111000',
  16282.6,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"2.5 Kg","size":"3.20 mm","end_user_price":16282.6,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutecdur n 9080 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  798,
  'EutecDur N 9080 4.00 mm',
  'ELC0075',
  7,
  '83111000',
  15554.4,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"2.5 Kg","size":"4.00 mm","end_user_price":15554.4,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutecdur n 9080 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  799,
  'EutecDur N 9120 3.20 mm',
  'ELC0076',
  7,
  '83111000',
  15020.76,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"2.5 Kg","size":"3.20 mm","end_user_price":15020.76,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutecdur n 9120 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  800,
  'EutecDur N 9120 4.00  mm',
  'ELC0077',
  7,
  '83111000',
  13248.88,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"2.5 Kg","size":"4.00  mm","end_user_price":13248.88,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutecdur n 9120 4.00  mm,welding,electrodes,4.00  mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  801,
  'EutecTrode EC 7008 6.30 mm (CPET 071)',
  'ELC0078',
  7,
  '83111000',
  1321,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"6.30 mm","end_user_price":1321,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 7008 6.30 mm (cpet 071),welding,electrodes,6.30 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  802,
  'EutecTrode EC 7008 8.00 mm (CPET 071)',
  'ELC0079',
  7,
  '83111000',
  1357,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"8.00 mm","end_user_price":1357,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 7008 8.00 mm (cpet 071),welding,electrodes,8.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  803,
  'EutecTrode 6717 3.20 mm',
  'ELC0080',
  7,
  '83111000',
  2083.33,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":2083.33,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 6717 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  804,
  'EutecTrode 6717 4.00 mm',
  'ELC0081',
  7,
  '83111000',
  2083.33,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":2083.33,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 6717 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  805,
  'EutecTrode EC 6610 (CPHFD 010) 3.20 mm',
  'ELC0082',
  7,
  '83111000',
  1923.64,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1923.64,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6610 (cphfd 010) 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  806,
  'EutecTrode EC 6610 (CPHFD 010) 4.00 mm',
  'ELC0083',
  7,
  '83111000',
  1923.64,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1923.64,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6610 (cphfd 010) 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  807,
  'EutecTrode EC 6611 (CPHFD 011) 3.20 mm',
  'ELC0084',
  7,
  '83111000',
  1539.72,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1539.72,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6611 (cphfd 011) 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  808,
  'EutecTrode EC 6611 (CPHFD 011) 4.00 mm',
  'ELC0085',
  7,
  '83111000',
  1539.72,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1539.72,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6611 (cphfd 011) 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  809,
  'EutecTrode EC 6822 (CPSM 022) 3.20 mm',
  'ELC0086',
  7,
  '83111000',
  3520.25,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":3520.25,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6822 (cpsm 022) 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  810,
  'EutecTrode EC 6822 (CPSM 022) 4.00 mm',
  'ELC0087',
  7,
  '83111000',
  3520.25,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":3520.25,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode ec 6822 (cpsm 022) 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  811,
  'SugarTec Max 45, 3.20 mm',
  'ELC0088',
  7,
  '83111000',
  1583.33,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1583.33,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'sugartec max 45, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  812,
  'SugarTec Max 45, 4.00 mm',
  'ELC0089',
  7,
  '83111000',
  1583.33,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1583.33,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'sugartec max 45, 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  813,
  'SugarTec Max 45, 5.00 mm',
  'ELC0090',
  7,
  '83111000',
  1583.33,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"5.00 mm","end_user_price":1583.33,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'sugartec max 45, 5.00 mm,welding,electrodes,5.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  814,
  'EutecTrode 2101E 3.20 mm',
  'ELC0091',
  7,
  '83111000',
  7650.66,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":7650.66,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutectrode 2101e 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  815,
  'ExoTrode, 3.20 mm (CutTrode)',
  'ELC0092',
  7,
  '83111000',
  1040,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1040,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'exotrode, 3.20 mm (cuttrode),welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  816,
  'ExoTrode, 4.00 mm (CutTrode)',
  'ELC0093',
  7,
  '83111000',
  1040,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1040,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'exotrode, 4.00 mm (cuttrode),welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  817,
  'Eutec-ChamferTrode, 3.20 mm',
  'ELC0094',
  7,
  '83111000',
  1546.78,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":1546.78,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutec-chamfertrode, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  818,
  'Eutec-ChamferTrode, 4.00 mm',
  'ELC0095',
  7,
  '83111000',
  1549.5,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"4.00 mm","end_user_price":1549.5,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'eutec-chamfertrode, 4.00 mm,welding,electrodes,4.00 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  819,
  'XHD 2800, 3.20 mm',
  'ELC0096',
  7,
  '83111000',
  7927.16,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"3.20 mm","end_user_price":7927.16,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 2800, 3.20 mm,welding,electrodes,3.20 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  820,
  'XHD 2800, 400 mm',
  'ELC0097',
  7,
  '83111000',
  7936.46,
  'WELDING',
  'ELECTRODES',
  '{"pack_size":"5 Kg","size":"400 mm","end_user_price":7936.46,"business_category":"WELDING","product_bucket":"ELECTRODES"}',
  'xhd 2800, 400 mm,welding,electrodes,400 mm,kg',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  821,
  'COOLELF AUTO SUPRA -37░C',
  '175428',
  1,
  '27101981',
  203.66666666666666,
  'AUTOMOTIVE GRADES',
  'COOLANTS',
  '{"pack_size":"210 L","ex_factory_price":203.66666666666666,"business_category":"AUTOMOTIVE GRADES","product_bucket":"COOLANTS"}',
  'coolelf auto supra -37░c,automotive grades,coolants,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  822,
  'COOLELF SUPRA',
  '169205',
  1,
  '27101981',
  188,
  'AUTOMOTIVE GRADES',
  'COOLANTS',
  '{"pack_size":"210 L","ex_factory_price":188,"business_category":"AUTOMOTIVE GRADES","product_bucket":"COOLANTS"}',
  'coolelf supra,automotive grades,coolants,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  823,
  'COOLTECH',
  '172666',
  1,
  '27101981',
  170,
  'AUTOMOTIVE GRADES',
  'COOLANTS',
  '{"pack_size":"210 L","ex_factory_price":170,"business_category":"AUTOMOTIVE GRADES","product_bucket":"COOLANTS"}',
  'cooltech,automotive grades,coolants,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  824,
  'GLACELF AUTO SUPRA',
  '175453',
  1,
  '27101981',
  237,
  'AUTOMOTIVE GRADES',
  'COOLANTS',
  '{"pack_size":"210 L","ex_factory_price":237,"business_category":"AUTOMOTIVE GRADES","product_bucket":"COOLANTS"}',
  'glacelf auto supra,automotive grades,coolants,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  825,
  'GLACELF SUPRA',
  '168156',
  1,
  '27101981',
  218,
  'AUTOMOTIVE GRADES',
  'COOLANTS',
  '{"pack_size":"210 L","ex_factory_price":218,"business_category":"AUTOMOTIVE GRADES","product_bucket":"COOLANTS"}',
  'glacelf supra,automotive grades,coolants,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  826,
  'RUBIA 7800 TT 15W40',
  '198078',
  2,
  '27101981',
  255.08474576271186,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":255.08474576271186,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia 7800 tt 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  827,
  'RUBIA 7800 TT 15W40',
  '204758',
  2,
  '27101981',
  259.3220338983051,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"50 L","ex_factory_price":259.3220338983051,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia 7800 tt 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  828,
  'RUBIA FLEET HD 300 15W40',
  '188828',
  2,
  '27101981',
  239.83050847457628,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"50 L","ex_factory_price":239.83050847457628,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia fleet hd 300 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  829,
  'RUBIA FLEET HD 300 15W40',
  '188871',
  2,
  '27101981',
  235.2542372881356,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":235.2542372881356,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia fleet hd 300 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  830,
  'RUBIA FLEET HD 300 15W40',
  '195562',
  2,
  '27101981',
  235.59322033898306,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":235.59322033898306,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia fleet hd 300 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  831,
  'RUBIA FLEET HD 500 15W40',
  '202595',
  2,
  '27101981',
  244.91525423728814,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":244.91525423728814,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia fleet hd 500 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  832,
  'RUBIA FLEET HD 700 15W40',
  '202731',
  2,
  '27101981',
  246.61016949152545,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":246.61016949152545,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia fleet hd 700 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  833,
  'RUBIA TIR 7400 15W40',
  '170190',
  2,
  '27101981',
  241.6238095238095,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":241.6238095238095,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia tir 7400 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  834,
  'RUBIA TIR 7400 15W40',
  '170354',
  2,
  '27101981',
  242.1,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"50 L","ex_factory_price":242.1,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia tir 7400 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  835,
  'RUBIA TIR 7400 15W40',
  '175076',
  2,
  '27101981',
  262,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"20 L","ex_factory_price":262,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'rubia tir 7400 15w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  836,
  'SUPER HDB ULTRA 20W40',
  '169050',
  2,
  '27101981',
  239.9661016949153,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"55 L","ex_factory_price":239.9661016949153,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'super hdb ultra 20w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  837,
  'SUPER HDB ULTRA 20W40',
  '169051',
  2,
  '27101981',
  236.44067796610173,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":236.44067796610173,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'super hdb ultra 20w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  838,
  'SUPER HDB ULTRA 20W40',
  '169214',
  2,
  '27101981',
  258.4745762711865,
  'AUTOMOTIVE GRADES',
  'DIESEL ENGINE OIL',
  '{"pack_size":"20 L","ex_factory_price":258.4745762711865,"business_category":"AUTOMOTIVE GRADES","product_bucket":"DIESEL ENGINE OIL"}',
  'super hdb ultra 20w40,automotive grades,diesel engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  839,
  'MULTIS XL 3 PREMIUM +',
  '221175',
  1,
  '27101981',
  451.56779661016947,
  'AUTOMOTIVE GRADES',
  'GREASE AUTOMOTIVE',
  '{"pack_size":"180 L","ex_factory_price":451.56779661016947,"business_category":"AUTOMOTIVE GRADES","product_bucket":"GREASE AUTOMOTIVE"}',
  'multis xl 3 premium +,automotive grades,grease automotive,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  840,
  'MULTIS XL 3 Plus',
  '208260',
  1,
  '27101981',
  287.29,
  'AUTOMOTIVE GRADES',
  'GREASE AUTOMOTIVE',
  '{"pack_size":"180 L","ex_factory_price":287.29,"business_category":"AUTOMOTIVE GRADES","product_bucket":"GREASE AUTOMOTIVE"}',
  'multis xl 3 plus,automotive grades,grease automotive,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  841,
  'MULTIS XL 3 Plus',
  '208197',
  1,
  '27101981',
  296.61,
  'AUTOMOTIVE GRADES',
  'GREASE AUTOMOTIVE',
  '{"pack_size":"20 L","ex_factory_price":296.61,"business_category":"AUTOMOTIVE GRADES","product_bucket":"GREASE AUTOMOTIVE"}',
  'multis xl 3 plus,automotive grades,grease automotive,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  842,
  'LEX 3',
  '223021',
  1,
  '27101981',
  241.53,
  'AUTOMOTIVE GRADES',
  'GREASE AUTOMOTIVE',
  '{"pack_size":"20 L","ex_factory_price":241.53,"business_category":"AUTOMOTIVE GRADES","product_bucket":"GREASE AUTOMOTIVE"}',
  'lex 3,automotive grades,grease automotive,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  843,
  'LEX 3',
  '223024',
  1,
  '27101981',
  235.59,
  'AUTOMOTIVE GRADES',
  'GREASE AUTOMOTIVE',
  '{"pack_size":"180 L","ex_factory_price":235.59,"business_category":"AUTOMOTIVE GRADES","product_bucket":"GREASE AUTOMOTIVE"}',
  'lex 3,automotive grades,grease automotive,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  844,
  'RUBIA TIR 8600 10W40',
  '169035',
  1,
  '27101981',
  326.7,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"25 L","ex_factory_price":326.7,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia tir 8600 10w40,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  845,
  'RUBIA TIR 8600 10W40',
  '174654',
  1,
  '27101981',
  291.7285714285714,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"210 L","ex_factory_price":291.7285714285714,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia tir 8600 10w40,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  846,
  'RUBIA TIR 8600 10W40     20LBCK TOT   IN',
  '182732',
  1,
  '27101981',
  310,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"20 L","ex_factory_price":310,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia tir 8600 10w40     20lbck tot   in,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  847,
  'RUBIA TIR 8800 10W40',
  '216765',
  1,
  '27101981',
  263.5593220338983,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"210 L","ex_factory_price":263.5593220338983,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia tir 8800 10w40,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  848,
  'RUBIA TIR 8800 10W40',
  '216767',
  1,
  '27101981',
  270.33898305084745,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"26 L","ex_factory_price":270.33898305084745,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia tir 8800 10w40,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  849,
  'RUBIA WORKS 1000 15W40',
  '202558',
  1,
  '27101981',
  248.11428571428573,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"210 L","ex_factory_price":248.11428571428573,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia works 1000 15w40,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  850,
  'RUBIA W.1000 PLUS 15W40  210L   TOT    IN',
  '230145',
  1,
  '27101981',
  260,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"210 L","ex_factory_price":260,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia w.1000 plus 15w40  210l   tot    in,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  851,
  'RUBIA OPT.1300 15W40     210LP  TOT    IN',
  '225011',
  1,
  '27101981',
  261.86,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"210 L","ex_factory_price":261.86,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia opt.1300 15w40     210lp  tot    in,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  852,
  'RUBIA OPT.1300 FE 10W30  210LP  TOT    IN',
  '224593',
  1,
  '27101981',
  278.8,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"210 L","ex_factory_price":278.8,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia opt.1300 fe 10w30  210lp  tot    in,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  853,
  'RUBIA WORKS 5000 10W40   210L   TOT   IN',
  '231819',
  1,
  '27101981',
  320,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"210 L","ex_factory_price":320,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia works 5000 10w40   210l   tot   in,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  854,
  'RUBIA WORKS 4000 15W40',
  '217493',
  1,
  '27101981',
  270,
  'AUTOMOTIVE GRADES',
  'PREMIUM DEO',
  '{"pack_size":"210 L","ex_factory_price":270,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM DEO"}',
  'rubia works 4000 15w40,automotive grades,premium deo,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  855,
  'AUTO TRANS-FLUID D III',
  '169255',
  1,
  '27101981',
  258.22033898305085,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":258.22033898305085,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'auto trans-fluid d iii,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  856,
  'GEARELF 4 140 EP',
  '169181',
  1,
  '27101981',
  284,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":284,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'gearelf 4 140 ep,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  857,
  'TRANSTEC 4 80W90',
  '205344',
  1,
  '27101981',
  304,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"20 L","ex_factory_price":304,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'transtec 4 80w90,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  858,
  'TRANSTEC 4 80W90',
  '205345',
  1,
  '27101981',
  259.91525423728814,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"20 L","ex_factory_price":259.91525423728814,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'transtec 4 80w90,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  859,
  'TRANSTEC 4 80W90',
  '205346',
  1,
  '27101981',
  252.28813559322035,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"50 L","ex_factory_price":252.28813559322035,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'transtec 4 80w90,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  860,
  'TRANSTEC 4 80W90',
  '205347',
  1,
  '27101981',
  249.74576271186442,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":249.74576271186442,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'transtec 4 80w90,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  861,
  'SUPER HDB 30',
  '223050',
  1,
  '27101981',
  216.1,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":216.1,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'super hdb 30,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  862,
  'TRANSTEC 4 SAE 140',
  '205268',
  1,
  '27101981',
  266.69491525423734,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"20 L","ex_factory_price":266.69491525423734,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'transtec 4 sae 140,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  863,
  'TRANSTEC 4 SAE 140',
  '205269',
  1,
  '27101981',
  253.98305084745766,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":253.98305084745766,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'transtec 4 sae 140,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  864,
  'TRANSTEC 4 SAE 90',
  '205264',
  1,
  '27101981',
  264.1525423728814,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"20 L","ex_factory_price":264.1525423728814,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'transtec 4 sae 90,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  865,
  'TRANSTEC 4 SAE 90',
  '205265',
  1,
  '27101981',
  249.8813559322034,
  'AUTOMOTIVE GRADES',
  'STANDARD TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":249.8813559322034,"business_category":"AUTOMOTIVE GRADES","product_bucket":"STANDARD TRANSMISSION OIL"}',
  'transtec 4 sae 90,automotive grades,standard transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  866,
  'DYNATRANS MM',
  '187514',
  1,
  '27101981',
  260.1694915254237,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"20 L","ex_factory_price":260.1694915254237,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'dynatrans mm,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  867,
  'DYNATRANS MM',
  '187516',
  1,
  '27101981',
  238.135593220339,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":238.135593220339,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'dynatrans mm,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  868,
  'DYNATRANS MPX',
  '217848',
  1,
  '27101981',
  231.4,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":231.4,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'dynatrans mpx,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  869,
  'DYNATRANS SF 3I',
  '170186',
  1,
  '27101981',
  258.4745762711865,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"20 L","ex_factory_price":258.4745762711865,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'dynatrans sf 3i,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  870,
  'DYNATRANS SF 3I',
  '175196',
  1,
  '27101981',
  244.91525423728814,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":244.91525423728814,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'dynatrans sf 3i,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  871,
  'EP 80W85',
  '183137',
  1,
  '27101981',
  228.8,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":228.8,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'ep 80w85,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  872,
  'TRAX. AXLE 7 85W90',
  '223309',
  1,
  '27101981',
  255,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":255,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'trax. axle 7 85w90,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  873,
  'TRACTELF BLS 90',
  '168922',
  1,
  '27101981',
  291,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":291,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'tractelf bls 90,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  874,
  'GEARELF 5 EP 80W90',
  '168101',
  1,
  '27101981',
  243.8,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":243.8,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'gearelf 5 ep 80w90,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  875,
  'TRANSTEC 5 85W140',
  '205525',
  1,
  '27101981',
  260.7627118644068,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"50 L","ex_factory_price":260.7627118644068,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'transtec 5 85w140,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  876,
  'TRANSTEC 5 85W140',
  '205526',
  1,
  '27101981',
  257.3728813559322,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":257.3728813559322,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'transtec 5 85w140,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  877,
  'DYNATRANS ACX 10W',
  '216737',
  1,
  '27101981',
  216.4,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":216.4,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'dynatrans acx 10w,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  878,
  'DYNATRANS ACX 30',
  '216739',
  1,
  '27101981',
  228.4,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":228.4,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'dynatrans acx 30,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  879,
  'DYNATRANS ACX 50',
  '216761',
  1,
  '27101981',
  252,
  'AUTOMOTIVE GRADES',
  'PREMIUM TRANSMISSION OIL',
  '{"pack_size":"210 L","ex_factory_price":252,"business_category":"AUTOMOTIVE GRADES","product_bucket":"PREMIUM TRANSMISSION OIL"}',
  'dynatrans acx 50,automotive grades,premium transmission oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  880,
  'NATERIA MH 40',
  '168966',
  4,
  '27101981',
  236.8,
  'INDUSTRIAL GRADES',
  'GAS ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":236.8,"business_category":"INDUSTRIAL GRADES","product_bucket":"GAS ENGINE OIL"}',
  'nateria mh 40,industrial grades,gas engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  881,
  'NATERIA MJ 40',
  '168967',
  4,
  '27101981',
  235,
  'INDUSTRIAL GRADES',
  'GAS ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":235,"business_category":"INDUSTRIAL GRADES","product_bucket":"GAS ENGINE OIL"}',
  'nateria mj 40,industrial grades,gas engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  882,
  'NATERIA MP 40',
  '175362',
  4,
  '27101981',
  254.2,
  'INDUSTRIAL GRADES',
  'GAS ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":254.2,"business_category":"INDUSTRIAL GRADES","product_bucket":"GAS ENGINE OIL"}',
  'nateria mp 40,industrial grades,gas engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  883,
  'NATERIA MWX 40',
  '232537',
  4,
  '27101981',
  260,
  'INDUSTRIAL GRADES',
  'GAS ENGINE OIL',
  '{"pack_size":"210 L","ex_factory_price":260,"business_category":"INDUSTRIAL GRADES","product_bucket":"GAS ENGINE OIL"}',
  'nateria mwx 40,industrial grades,gas engine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  884,
  'WT SUPRA',
  '210804',
  4,
  '27101981',
  413,
  'INDUSTRIAL GRADES',
  'Coolant',
  '{"pack_size":"20 L","ex_factory_price":413,"business_category":"INDUSTRIAL GRADES","product_bucket":"Coolant"}',
  'wt supra,industrial grades,coolant,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  885,
  'WT SUPRA',
  '168186',
  4,
  '27101981',
  372.76190476190476,
  'INDUSTRIAL GRADES',
  'Coolant',
  '{"pack_size":"210 L","ex_factory_price":372.76190476190476,"business_category":"INDUSTRIAL GRADES","product_bucket":"Coolant"}',
  'wt supra,industrial grades,coolant,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  886,
  'CARTER EP 100',
  '169019',
  5,
  '27101981',
  213.6,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":213.6,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter ep 100,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  887,
  'CARTER EP 150',
  '169008',
  5,
  '27101981',
  217.4,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":217.4,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter ep 150,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  888,
  'CARTER EP 220',
  '169009',
  5,
  '27101981',
  229.1,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":229.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter ep 220,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  889,
  'CARTER EP 220',
  '202320',
  5,
  '27101981',
  257,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"20 L","ex_factory_price":257,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter ep 220,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  890,
  'CARTER EP 320',
  '169011',
  5,
  '27101981',
  241.7,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":241.7,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter ep 320,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  891,
  'CARTER EP 320',
  '202321',
  5,
  '27101981',
  267,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"20 L","ex_factory_price":267,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter ep 320,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  892,
  'CARTER EP 460',
  '169012',
  5,
  '27101981',
  256.3,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":256.3,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter ep 460,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  893,
  'CARTER EP 68',
  '169020',
  5,
  '27101981',
  209.8,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":209.8,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter ep 68,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  894,
  'CARTER 150 (Metal Barrel)',
  '228947',
  5,
  '27101981',
  217.4,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":217.4,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 150 (metal barrel),industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  895,
  'CARTER 150 (Plastic Barrel)',
  '228948',
  5,
  '27101981',
  207.4,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":207.4,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 150 (plastic barrel),industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  896,
  'CARTER 220 (Metal Barrel)',
  '228950',
  5,
  '27101981',
  229.1,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":229.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 220 (metal barrel),industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  897,
  'CARTER 220 (Plastic Barrel)',
  '228951',
  5,
  '27101981',
  219.1,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":219.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 220 (plastic barrel),industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  898,
  'CARTER 320 (Metal Barrel)',
  '228954',
  5,
  '27101981',
  241.7,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":241.7,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 320 (metal barrel),industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  899,
  'CARTER 320 (Plastic Barrel)',
  '228955',
  5,
  '27101981',
  231.7,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":231.7,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 320 (plastic barrel),industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  900,
  'CARTER 460 (Metal Barrel)',
  '228959',
  5,
  '27101981',
  256.3,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":256.3,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 460 (metal barrel),industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  901,
  'CARTER 460 (Plastic Barrel)',
  '228960',
  5,
  '27101981',
  246.3,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"210 L","ex_factory_price":246.3,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 460 (plastic barrel),industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  902,
  'CARTER 220',
  '228952',
  5,
  '27101981',
  247,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"20 L","ex_factory_price":247,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 220,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  903,
  'CARTER 320',
  '228956',
  5,
  '27101981',
  257,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"20 L","ex_factory_price":257,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 320,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  904,
  'CARTER 680',
  '228970',
  5,
  '27101981',
  286.3,
  'INDUSTRIAL GRADES',
  'GEAR OILS',
  '{"pack_size":"20 L","ex_factory_price":286.3,"business_category":"INDUSTRIAL GRADES","product_bucket":"GEAR OILS"}',
  'carter 680,industrial grades,gear oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  905,
  'HIPER SSG 1',
  '208747',
  4,
  '27101981',
  435,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"180 L","ex_factory_price":435,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'hiper ssg 1,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  906,
  'LEX EP 2',
  '168230',
  4,
  '27101981',
  320,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"180 L","ex_factory_price":320,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'lex ep 2,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  907,
  'LEX EP 2',
  '169272',
  4,
  '27101981',
  375,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"20 L","ex_factory_price":375,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'lex ep 2,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  908,
  'MULTIS EP 0',
  '207862',
  4,
  '27101981',
  387,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"20 L","ex_factory_price":387,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 0,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  909,
  'MULTIS EP 0',
  '207867',
  4,
  '27101981',
  333,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"180 L","ex_factory_price":333,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 0,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  910,
  'MULTIS EP 00',
  '208744',
  4,
  '27101981',
  335,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"180 L","ex_factory_price":335,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 00,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  911,
  'MULTIS EP 00',
  '208746',
  4,
  '27101981',
  390,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"20 L","ex_factory_price":390,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 00,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  912,
  'MULTIS EP 000',
  '209294',
  4,
  '27101981',
  395,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"20 L","ex_factory_price":395,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 000,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  913,
  'MULTIS EP 2',
  '207866',
  4,
  '27101981',
  390,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"20 L","ex_factory_price":390,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 2,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  914,
  'MULTIS EP 2',
  '207868',
  4,
  '27101981',
  330,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"180 L","ex_factory_price":330,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 2,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  915,
  'MULTIS EP 3',
  '207864',
  4,
  '27101981',
  392,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"20 L","ex_factory_price":392,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 3,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  916,
  'MULTIS EP 3',
  '207869',
  4,
  '27101981',
  335,
  'INDUSTRIAL GRADES',
  'GREASE INDUSTRIAL',
  '{"pack_size":"180 L","ex_factory_price":335,"business_category":"INDUSTRIAL GRADES","product_bucket":"GREASE INDUSTRIAL"}',
  'multis ep 3,industrial grades,grease industrial,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  917,
  'SERIOLA 32 *',
  '225552',
  4,
  '27101981',
  200,
  'INDUSTRIAL GRADES',
  'HEAT TRANSFER OIL',
  '{"pack_size":"210 L","ex_factory_price":200,"business_category":"INDUSTRIAL GRADES","product_bucket":"HEAT TRANSFER OIL"}',
  'seriola 32 *,industrial grades,heat transfer oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  918,
  'SERIOLA AB',
  '226589',
  4,
  '27101981',
  242,
  'INDUSTRIAL GRADES',
  'HEAT TRANSFER OIL',
  '{"pack_size":"210 L","ex_factory_price":242,"business_category":"INDUSTRIAL GRADES","product_bucket":"HEAT TRANSFER OIL"}',
  'seriola ab,industrial grades,heat transfer oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  919,
  'DIEL 7500',
  '170156',
  4,
  '27101981',
  232.7,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":232.7,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'diel 7500,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  920,
  'DRASTA C 1000 IN',
  '170825',
  4,
  '27101981',
  209.9,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":209.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'drasta c 1000 in,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  921,
  'DROSERA IN 220',
  '170824',
  4,
  '27101981',
  219,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":219,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'drosera in 220,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  922,
  'DROSERA IN 68',
  '170823',
  4,
  '27101981',
  208,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":208,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'drosera in 68,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  923,
  'DROSERA MS 220',
  '204318',
  4,
  '27101981',
  260,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"20 L","ex_factory_price":260,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'drosera ms 220,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  924,
  'DROSERA MS 220',
  '204319',
  4,
  '27101981',
  238.3,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":238.3,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'drosera ms 220,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  925,
  'DROSERA MS 68',
  '204316',
  4,
  '27101981',
  245.5,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"20 L","ex_factory_price":245.5,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'drosera ms 68,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  926,
  'DROSERA MS 68',
  '204317',
  4,
  '27101981',
  225.4,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":225.4,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'drosera ms 68,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  927,
  'GRANITCUT 2424',
  '168191',
  4,
  '27101981',
  225.9,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":225.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'granitcut 2424,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  928,
  'LACTUCA 2614 CR',
  '168175',
  4,
  '27101981',
  228.6,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":228.6,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'lactuca 2614 cr,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  929,
  'LACTUCA 3000',
  '168176',
  4,
  '27101981',
  253.5,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"20 L","ex_factory_price":253.5,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'lactuca 3000,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  930,
  'LACTUCA 3000',
  '168177',
  4,
  '27101981',
  225,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":225,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'lactuca 3000,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  931,
  'MARTOL 104',
  '170164',
  4,
  '27101981',
  255.5,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":255.5,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'martol 104,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  932,
  'MARTOL 708',
  '168195',
  4,
  '27101981',
  275.4,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":275.4,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'martol 708,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  933,
  'MARTOL 9107',
  '168196',
  4,
  '27101981',
  294,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":294,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'martol 9107,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  934,
  'MARTOL EV 10 CF',
  '199104',
  4,
  '27101981',
  241.2,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":241.2,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'martol ev 10 cf,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  935,
  'MARTOL LVG 13 CF',
  '229649',
  4,
  '27101981',
  288,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":288,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'martol lvg 13 cf,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  936,
  'OSYRIS 2609',
  '168197',
  4,
  '27101981',
  256,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"50 L","ex_factory_price":256,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'osyris 2609,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  937,
  'OSYRIS 2609',
  '169269',
  4,
  '27101981',
  234.3,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":234.3,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'osyris 2609,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  938,
  'OSYRIS 2611 WD',
  '168180',
  4,
  '27101981',
  230,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":230,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'osyris 2611 wd,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  939,
  'OSYRIS 2626 TP',
  '168181',
  4,
  '27101981',
  228.1,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":228.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'osyris 2626 tp,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  940,
  'OSYRIS HF 5000',
  '211919',
  4,
  '27101981',
  229,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":229,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'osyris hf 5000,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  941,
  'VALONA 2724',
  '168200',
  4,
  '27101981',
  221,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":221,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'valona 2724,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  942,
  'VALONA 7009',
  '168201',
  4,
  '27101981',
  240.1,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":240.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'valona 7009,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  943,
  'VALONA 7035',
  '168172',
  4,
  '27101981',
  221.2,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":221.2,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'valona 7035,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  944,
  'VALONA GR 5005 HC',
  '206784',
  4,
  '27101981',
  261.1,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":261.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'valona gr 5005 hc,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  945,
  'VALONA MS 5020 HC',
  '208675',
  4,
  '27101981',
  265.7,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":265.7,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'valona ms 5020 hc,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  946,
  'LACTUCA 5000',
  '213603',
  4,
  '27101981',
  242,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":242,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'lactuca 5000,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  947,
  'LACTUCA 5000',
  '213604',
  4,
  '27101981',
  265,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"20 L","ex_factory_price":265,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'lactuca 5000,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  948,
  'SPIRIT 5000      210L  TOT',
  '223066',
  4,
  '27101981',
  360.75,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":360.75,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'spirit 5000      210l  tot,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  949,
  'Spirit 3000 210 L',
  '230782',
  4,
  '27101981',
  295,
  'INDUSTRIAL GRADES',
  'METALWORKING FLUID',
  '{"pack_size":"210 L","ex_factory_price":295,"business_category":"INDUSTRIAL GRADES","product_bucket":"METALWORKING FLUID"}',
  'spirit 3000 210 l,industrial grades,metalworking fluid,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  950,
  'AZOLLA AF 46',
  '225757',
  4,
  '27101981',
  236.6,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":236.6,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'azolla af 46,industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  951,
  'AZOLLA AF 68',
  '225758',
  4,
  '27101981',
  236.6,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":236.6,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'azolla af 68,industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  952,
  'AZOLLA SPIN EE 10',
  '170155',
  4,
  '27101981',
  218.5,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":218.5,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'azolla spin ee 10,industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  953,
  'EQUIVIS ZS 100',
  '168193',
  4,
  '27101981',
  235,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":235,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'equivis zs 100,industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  954,
  'EQUIVIS ZS 32',
  '168173',
  4,
  '27101981',
  225.8,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":225.8,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'equivis zs 32,industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  955,
  'EQUIVIS ZS 46',
  '168194',
  4,
  '27101981',
  227.6,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":227.6,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'equivis zs 46,industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  956,
  'EQUIVIS ZS 68 (Plastic Barrel)',
  '168174',
  4,
  '27101981',
  227.6,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":227.6,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'equivis zs 68 (plastic barrel),industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  957,
  'EQUIVIS ZS 68 (Metal Barrel)',
  '170344',
  4,
  '27101981',
  237.6,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":237.6,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'equivis zs 68 (metal barrel),industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  958,
  'EQUIVIS AF 46',
  '231713',
  4,
  '27101981',
  245,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":245,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'equivis af 46,industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  959,
  'EQUIVIS AF 68',
  '231711',
  4,
  '27101981',
  245,
  'INDUSTRIAL GRADES',
  'PREMIUM HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":245,"business_category":"INDUSTRIAL GRADES","product_bucket":"PREMIUM HYDRAULIC OIL"}',
  'equivis af 68,industrial grades,premium hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  960,
  'ACANTIS HM 100',
  '168160',
  4,
  '27101981',
  229.8,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":229.8,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 100,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  961,
  'ACANTIS HM 150',
  '168161',
  4,
  '27101981',
  236.2,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":236.2,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 150,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  962,
  'ACANTIS HM 220',
  '168162',
  4,
  '27101981',
  229.2,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":229.2,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 220,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  963,
  'ACANTIS HM 32',
  '168165',
  4,
  '27101981',
  207.9,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":207.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 32,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  964,
  'ACANTIS HM 46',
  '168166',
  4,
  '27101981',
  243.5,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"20 L","ex_factory_price":243.5,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 46,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  965,
  'ACANTIS HM 46',
  '168167',
  4,
  '27101981',
  207.9,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":207.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 46,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  966,
  'ACANTIS HM 68',
  '168168',
  4,
  '27101981',
  243.5,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"20 L","ex_factory_price":243.5,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 68,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  967,
  'ACANTIS HM 68 (Plastic Barrel)',
  '168169',
  4,
  '27101981',
  216.9,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":216.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 68 (plastic barrel),industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  968,
  'ACANTIS HM 68 (Metal Barrel)',
  '168170',
  4,
  '27101981',
  207.9,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":207.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'acantis hm 68 (metal barrel),industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  969,
  'AZOLLA ZS 32 SUPERCLEAN',
  '203588',
  4,
  '27101981',
  255,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"20 L","ex_factory_price":255,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 32 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  970,
  'AZOLLA ZS 32 SUPERCLEAN',
  '169006',
  4,
  '27101981',
  233.1,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":233.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 32 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  971,
  'AZOLLA ZS 32 SUPERCLEAN',
  '228096',
  4,
  '27101981',
  255,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"20 L","ex_factory_price":255,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 32 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  972,
  'AZOLLA ZS 32 SUPERCLEAN',
  '228095',
  4,
  '27101981',
  223.1,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":223.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 32 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  973,
  'AZOLLA ZS 46 SUPERCLEAN',
  '169007',
  4,
  '27101981',
  233.1,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":233.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 46 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  974,
  'AZOLLA ZS 46 SUPERCLEAN',
  '203589',
  4,
  '27101981',
  255,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"20 L","ex_factory_price":255,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 46 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  975,
  'AZOLLA ZS 46 SUPERCLEAN',
  '228098',
  4,
  '27101981',
  255,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"20 L","ex_factory_price":255,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 46 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  976,
  'AZOLLA ZS 46 SUPERCLEAN',
  '228097',
  4,
  '27101981',
  223.1,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":223.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 46 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  977,
  'AZOLLA ZS 68 SUPERCLEAN',
  '169005',
  4,
  '27101981',
  223.1,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"210 L","ex_factory_price":223.1,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 68 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  978,
  'AZOLLA ZS 68 SUPERCLEAN',
  '169021',
  4,
  '27101981',
  255,
  'INDUSTRIAL GRADES',
  'STANDARD HYDRAULIC OIL',
  '{"pack_size":"20 L","ex_factory_price":255,"business_category":"INDUSTRIAL GRADES","product_bucket":"STANDARD HYDRAULIC OIL"}',
  'azolla zs 68 superclean,industrial grades,standard hydraulic oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  979,
  'PRESLIA 32',
  '168202',
  4,
  '27101981',
  200.9,
  'INDUSTRIAL GRADES',
  'TURBINE OIL',
  '{"pack_size":"210 L","ex_factory_price":200.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"TURBINE OIL"}',
  'preslia 32,industrial grades,turbine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  980,
  'PRESLIA 46',
  '168203',
  4,
  '27101981',
  200.9,
  'INDUSTRIAL GRADES',
  'TURBINE OIL',
  '{"pack_size":"210 L","ex_factory_price":200.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"TURBINE OIL"}',
  'preslia 46,industrial grades,turbine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  981,
  'PRESLIA 68',
  '168204',
  4,
  '27101981',
  202.9,
  'INDUSTRIAL GRADES',
  'TURBINE OIL',
  '{"pack_size":"210 L","ex_factory_price":202.9,"business_category":"INDUSTRIAL GRADES","product_bucket":"TURBINE OIL"}',
  'preslia 68,industrial grades,turbine oil,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  982,
  'DACNIS LD 68             210L   TOT   IN',
  '230194',
  4,
  '27101981',
  250,
  'INDUSTRIAL GRADES',
  'Circulating & Compressor Oils',
  '{"pack_size":"210 L","ex_factory_price":250,"business_category":"INDUSTRIAL GRADES","product_bucket":"Circulating & Compressor Oils"}',
  'dacnis ld 68             210l   tot   in,industrial grades,circulating & compressor oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  983,
  'DACNIS LD 68             20LP   TOT   IN',
  '232927',
  4,
  '27101981',
  275,
  'INDUSTRIAL GRADES',
  'Circulating & Compressor Oils',
  '{"pack_size":"20 L","ex_factory_price":275,"business_category":"INDUSTRIAL GRADES","product_bucket":"Circulating & Compressor Oils"}',
  'dacnis ld 68             20lp   tot   in,industrial grades,circulating & compressor oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  984,
  'DACNIS LD 68             20LP   TOT   IN',
  '230195',
  4,
  '27101981',
  275,
  'INDUSTRIAL GRADES',
  'Circulating & Compressor Oils',
  '{"pack_size":"20 L","ex_factory_price":275,"business_category":"INDUSTRIAL GRADES","product_bucket":"Circulating & Compressor Oils"}',
  'dacnis ld 68             20lp   tot   in,industrial grades,circulating & compressor oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  985,
  'CORTIS MS 100        210L   TOT   IN',
  '188522',
  4,
  '27101981',
  202,
  'INDUSTRIAL GRADES',
  'Circulating & Compressor Oils',
  '{"pack_size":"210 L","ex_factory_price":202,"business_category":"INDUSTRIAL GRADES","product_bucket":"Circulating & Compressor Oils"}',
  'cortis ms 100        210l   tot   in,industrial grades,circulating & compressor oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  986,
  'CORTIS MS 150       210L   TOT   IN',
  '229382',
  4,
  '27101981',
  208,
  'INDUSTRIAL GRADES',
  'Circulating & Compressor Oils',
  '{"pack_size":"210 L","ex_factory_price":208,"business_category":"INDUSTRIAL GRADES","product_bucket":"Circulating & Compressor Oils"}',
  'cortis ms 150       210l   tot   in,industrial grades,circulating & compressor oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  987,
  'CORTIS MS 220        210L   TOT   IN',
  '207145',
  4,
  '27101981',
  216,
  'INDUSTRIAL GRADES',
  'Circulating & Compressor Oils',
  '{"pack_size":"210 L","ex_factory_price":216,"business_category":"INDUSTRIAL GRADES","product_bucket":"Circulating & Compressor Oils"}',
  'cortis ms 220        210l   tot   in,industrial grades,circulating & compressor oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  988,
  'CORTIS MS 320        210L   TOT   IN',
  '228889',
  4,
  '27101981',
  226,
  'INDUSTRIAL GRADES',
  'Circulating & Compressor Oils',
  '{"pack_size":"210 L","ex_factory_price":226,"business_category":"INDUSTRIAL GRADES","product_bucket":"Circulating & Compressor Oils"}',
  'cortis ms 320        210l   tot   in,industrial grades,circulating & compressor oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  989,
  'CORTIS MS 460        210L   TOT   IN',
  '228887',
  4,
  '27101981',
  238,
  'INDUSTRIAL GRADES',
  'Circulating & Compressor Oils',
  '{"pack_size":"210 L","ex_factory_price":238,"business_category":"INDUSTRIAL GRADES","product_bucket":"Circulating & Compressor Oils"}',
  'cortis ms 460        210l   tot   in,industrial grades,circulating & compressor oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  990,
  'Tempershield 6019 IN TOT IN',
  '232364',
  4,
  '27101981',
  265,
  'INDUSTRIAL GRADES',
  'R0lling Oils',
  '{"pack_size":"210 L","ex_factory_price":265,"business_category":"INDUSTRIAL GRADES","product_bucket":"R0lling Oils"}',
  'tempershield 6019 in tot in,industrial grades,r0lling oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  991,
  'Rolkleen SD 6745  TOT IN',
  '229859',
  4,
  '27101981',
  325,
  'INDUSTRIAL GRADES',
  'R0lling Oils',
  '{"pack_size":"210 L","ex_factory_price":325,"business_category":"INDUSTRIAL GRADES","product_bucket":"R0lling Oils"}',
  'rolkleen sd 6745  tot in,industrial grades,r0lling oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  992,
  'Rolkleen EP 2150  TOT IN',
  '230374',
  4,
  '27101981',
  295,
  'INDUSTRIAL GRADES',
  'R0lling Oils',
  '{"pack_size":"210 L","ex_factory_price":295,"business_category":"INDUSTRIAL GRADES","product_bucket":"R0lling Oils"}',
  'rolkleen ep 2150  tot in,industrial grades,r0lling oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  993,
  'Rolkleen SD 4642  TOT IN',
  '229855',
  4,
  '27101981',
  315,
  'INDUSTRIAL GRADES',
  'R0lling Oils',
  '{"pack_size":"210 L","ex_factory_price":315,"business_category":"INDUSTRIAL GRADES","product_bucket":"R0lling Oils"}',
  'rolkleen sd 4642  tot in,industrial grades,r0lling oils,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  994,
  'ALTIS EM 2 18K TOT C',
  '140190',
  4,
  '27101981',
  663.5498017647059,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":663.5498017647059,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'altis em 2 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  995,
  'ALTIS MV 2 50K TOT C',
  '140201',
  4,
  '27101981',
  734.8874864705883,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"50 L","ex_factory_price":734.8874864705883,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'altis mv 2 50k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  996,
  'ALTIS SH 2 18K TOT C',
  '140203',
  4,
  '27101981',
  974.7942835294118,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":974.7942835294118,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'altis sh 2 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  997,
  'AZOLLA AL 22 208L TOT C',
  '156684',
  4,
  '27101981',
  490.1257636470588,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":490.1257636470588,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'azolla al 22 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  998,
  'AZOLLA AL 32 208L TOT C',
  '156685',
  4,
  '27101981',
  512.4641011470588,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":512.4641011470588,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'azolla al 32 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  999,
  'CALORIS 23 18K TOT C',
  '140186',
  4,
  '27101981',
  637.8493858823531,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":637.8493858823531,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'caloris 23 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1000,
  'CALORIS MS 23 50K TOT C',
  '111654',
  4,
  '27101981',
  917.0982394117647,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"50 L","ex_factory_price":917.0982394117647,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'caloris ms 23 50k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1001,
  'CARTER ALS 220 208L TOT C',
  '156712',
  4,
  '27101981',
  633.343101302353,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":633.343101302353,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter als 220 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1002,
  'CARTER ALS 460  208L TOT C',
  '170459',
  4,
  '27101981',
  642.4403597970588,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":642.4403597970588,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter als 460  208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1003,
  'CARTER EP 680 208L TOT C',
  '110499',
  4,
  '27101981',
  459.63554207633,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":459.63554207633,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter ep 680 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1004,
  'CARTER EP 680 20L TOT C',
  '112534',
  4,
  '27101981',
  555.3026345516901,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":555.3026345516901,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter ep 680 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1005,
  'CARTER SG 150 20L TOT C',
  '199507',
  4,
  '27101981',
  889.4003200258823,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":889.4003200258823,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sg 150 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1006,
  'CARTER SG 220 208L TOT C',
  '199648',
  4,
  '27101981',
  854.1853854411764,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":854.1853854411764,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sg 220 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1007,
  'CARTER SG 220 20L TOT C',
  '199649',
  4,
  '27101981',
  863.6695276294117,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":863.6695276294117,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sg 220 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1008,
  'CARTER SG 320 208L TOT C',
  '199672',
  4,
  '27101981',
  868.6239564147057,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":868.6239564147057,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sg 320 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1009,
  'CARTER SG 320 20L TOT C',
  '199673',
  4,
  '27101981',
  884.913053995294,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":884.913053995294,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sg 320 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1010,
  'CARTER SG 460 208L TOT C',
  '199635',
  4,
  '27101981',
  903.5504107788234,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":903.5504107788234,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sg 460 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1011,
  'CARTER SG 680 20L TOT C',
  '199642',
  4,
  '27101981',
  995.0652177111765,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":995.0652177111765,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sg 680 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1012,
  'CARTER SH 1000       208L TOT C',
  '120615',
  4,
  '27101981',
  1187.3275519241176,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":1187.3275519241176,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 1000       208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1013,
  'CARTER SH 1000 20L TOT C',
  '112552',
  4,
  '27101981',
  1361.5137117106801,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1361.5137117106801,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 1000 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1014,
  'CARTER SH 150    20L TOT C',
  '112537',
  4,
  '27101981',
  866.9100000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":866.9100000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 150    20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1015,
  'CARTER SH 150 208L TOT C',
  '112461',
  4,
  '27101981',
  786.7941430995475,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":786.7941430995475,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 150 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1016,
  'CARTER SH 220 208L TOT C',
  '112462',
  4,
  '27101981',
  821.549601244344,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":821.549601244344,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 220 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1017,
  'CARTER SH 220 20L TOT C',
  '112718',
  4,
  '27101981',
  866.9100000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":866.9100000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 220 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1018,
  'CARTER SH 320 208L TOT C',
  '112538',
  4,
  '27101981',
  858.0300000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":858.0300000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 320 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1019,
  'CARTER SH 320 20L TOT C',
  '112539',
  4,
  '27101981',
  913.5300000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":913.5300000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 320 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1020,
  'CARTER SH 460 208L TOT C',
  '120616',
  4,
  '27101981',
  917.97,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":917.97,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 460 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1021,
  'CARTER SH 460 20L TOT C',
  '112550',
  4,
  '27101981',
  952.3800000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":952.3800000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 460 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1022,
  'CARTER SH 680 208L TOT C',
  '156216',
  4,
  '27101981',
  1022.3100000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":1022.3100000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sh 680 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1023,
  'CARTER SY 220 208L TOT C',
  '110513',
  4,
  '27101981',
  850.2404743082354,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":850.2404743082354,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sy 220 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1024,
  'CARTER SY 220 20L TOT C',
  '110514',
  4,
  '27101981',
  871.1295355117647,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":871.1295355117647,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sy 220 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1025,
  'CARTER SY 320 208L TOT C',
  '112371',
  4,
  '27101981',
  893.0356541229411,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":893.0356541229411,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sy 320 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1026,
  'CARTER SY 320 20L TOT C',
  '110515',
  4,
  '27101981',
  911.24749805,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":911.24749805,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sy 320 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1027,
  'CARTER SY 460 208L TOT C',
  '112373',
  4,
  '27101981',
  941.0404665235294,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":941.0404665235294,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sy 460 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1028,
  'CARTER SY 460 20L TOT C',
  '110516',
  4,
  '27101981',
  952.7143397264706,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":952.7143397264706,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter sy 460 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1029,
  'CARTER WT 320    208L  TOT C',
  '206098',
  4,
  '27101981',
  868.6221989017276,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":868.6221989017276,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter wt 320    208l  tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1030,
  'CARTER WT 320 208L TOT  SG',
  '232138',
  4,
  '27101981',
  869,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":869,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'carter wt 320 208l tot  sg,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1031,
  'COPAL OGL 0 180K TOT C',
  '156086',
  4,
  '27101981',
  705.8763447058824,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":705.8763447058824,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'copal ogl 0 180k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1032,
  'COPAL OGL 0 18K TOT C',
  '156088',
  4,
  '27101981',
  733.6429435294116,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":733.6429435294116,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'copal ogl 0 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1033,
  'CORTIS SHT 200 20L TOT C',
  '110525',
  4,
  '27101981',
  1139.4137240705884,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1139.4137240705884,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'cortis sht 200 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1034,
  'DACNIS LD 46   208L TOT C',
  '158853',
  4,
  '27101981',
  460.52478846153844,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":460.52478846153844,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis ld 46   208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1035,
  'DACNIS LD 46   20L TOT C',
  '158856',
  4,
  '27101981',
  473.5093029411765,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":473.5093029411765,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis ld 46   20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1036,
  'DACNIS LD 68    208L TOT C',
  '158854',
  4,
  '27101981',
  452.87419541855206,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":452.87419541855206,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis ld 68    208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1037,
  'DACNIS LD 68   20L TOT C',
  '158857',
  4,
  '27101981',
  465.89705,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":465.89705,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis ld 68   20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1038,
  'DACNIS SH 32 20L TOT  C',
  '112592',
  4,
  '27101981',
  670.4114999999999,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":670.4114999999999,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis sh 32 20l tot  c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1039,
  'DACNIS SH 46 208L TOT C',
  '112595',
  4,
  '27101981',
  666.7917024886879,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":666.7917024886879,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis sh 46 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1040,
  'DACNIS SH 46 20L TOT C',
  '112591',
  4,
  '27101981',
  678.3893235294119,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":678.3893235294119,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis sh 46 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1041,
  'DACNIS SH 68 208L TOT C',
  '126853',
  4,
  '27101981',
  700.3782550904979,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":700.3782550904979,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis sh 68 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1042,
  'DACNIS SH 68 20L TOT C',
  '112594',
  4,
  '27101981',
  711.9956176470589,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":711.9956176470589,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dacnis sh 68 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1043,
  'DAG 1 A 180K+L TOT C',
  '128300',
  4,
  '27101981',
  652.4332079700001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":652.4332079700001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'dag 1 a 180k+l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1044,
  'ELFMATIC G3 SYN          208L   ELF C',
  '157002',
  4,
  '27101981',
  712.7285806470588,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":712.7285806470588,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'elfmatic g3 syn          208l   elf c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1045,
  'EMETAN M 170K   TOT C',
  '157473',
  4,
  '27101981',
  541.6007605047059,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"170 L","ex_factory_price":541.6007605047059,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'emetan m 170k   tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1046,
  'EQUIVIS XV 32 208L   TOT C',
  '112451',
  4,
  '27101981',
  615.8447671347059,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":615.8447671347059,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'equivis xv 32 208l   tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1047,
  'ESTAR SHT 200            20L    TOT C',
  '229466',
  4,
  '27101981',
  1139.4,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1139.4,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'estar sht 200            20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1048,
  'FINAVESTAN A 360 B 208L TOT C',
  '203635',
  4,
  '27101981',
  438.2621199979,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":438.2621199979,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'finavestan a 360 b 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1049,
  'FINAVESTAN A 520 B 208L TOT C1',
  '203632',
  4,
  '27101981',
  513.3949292986425,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":513.3949292986425,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'finavestan a 520 b 208l tot c1,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1050,
  'FINAVESTAN A 80 B',
  '203631',
  4,
  '27101981',
  405,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":405,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'finavestan a 80 b,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1051,
  'FINAVESTAN A 100 B       208L   TOT C1',
  '203639',
  4,
  '27101981',
  415,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":415,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'finavestan a 100 b       208l   tot c1,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1052,
  'GEAR FLUID 550  180K   TLG C',
  '205631',
  4,
  '27101981',
  616,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":616,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'gear fluid 550  180k   tlg c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1053,
  'GLACELF MDX 208L TOT C',
  '148019',
  4,
  '27101981',
  588.4555306470588,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":588.4555306470588,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'glacelf mdx 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1054,
  'GRAISSE F 9702 50K TOT C2',
  '148286',
  4,
  '27101981',
  975.3984305882353,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"50 L","ex_factory_price":975.3984305882353,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'graisse f 9702 50k tot c2,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1055,
  'GRAISSE N 3924 180K TOT C',
  '110345',
  4,
  '27101981',
  679.1877581699347,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":679.1877581699347,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'graisse n 3924 180k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1056,
  'HYDRANSAFE FR EHC 230K TOT C',
  '202045',
  4,
  '27101981',
  2098.324260981765,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"230 L","ex_factory_price":2098.324260981765,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'hydransafe fr ehc 230k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1057,
  'HYDRANSAFE HFDU 46 208L TOT C',
  '156782',
  4,
  '27101981',
  653.190443815294,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":653.190443815294,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'hydransafe hfdu 46 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1058,
  'JARYTHERM DBT 200K   TOT C',
  '140155',
  4,
  '27101981',
  1038.1156617411766,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"200 L","ex_factory_price":1038.1156617411766,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'jarytherm dbt 200k   tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1059,
  'KALOR 3037 50K NEU C',
  '223791',
  4,
  '27101981',
  19059,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"50 L","ex_factory_price":19059,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'kalor 3037 50k neu c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1060,
  'Lissoflix APZ 2090',
  '228346',
  4,
  '27101981',
  452.88000000000005,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"206 L","ex_factory_price":452.88000000000005,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'lissoflix apz 2090,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1061,
  'LUBRILAM CLEANER H1 208L   TOT C',
  '174243',
  4,
  '27101981',
  425.9758098270588,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":425.9758098270588,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'lubrilam cleaner h1 208l   tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1062,
  'MARTOL EV 10 CF 208L TOT C',
  '115842',
  4,
  '27101981',
  544.6100653364706,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":544.6100653364706,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'martol ev 10 cf 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1063,
  'MARTOL FMO 15 CF 208L TOT MY',
  '215790',
  4,
  '27101981',
  1405,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":1405,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'martol fmo 15 cf 208l tot my,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1064,
  'MARTOL LVG 25 AQ 208L TOT SG',
  '202432',
  4,
  '27101981',
  475.82370757918557,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":475.82370757918557,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'martol lvg 25 aq 208l tot sg,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1065,
  'MISOLA MAP SH 220 208L TOT C',
  '198154',
  4,
  '27101981',
  848.403879332353,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":848.403879332353,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'misola map sh 220 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1066,
  'MULTIPLEX EP 2 180K ELF C',
  '140168',
  4,
  '27101981',
  687.993591764706,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":687.993591764706,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multiplex ep 2 180k elf c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1067,
  'MULTIS COMPLEX EP 2 180K TOT T AE',
  '205906',
  4,
  '27101981',
  623.9620588235296,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":623.9620588235296,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex ep 2 180k tot t ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1068,
  'MULTIS COMPLEX EP 2 18K TOT T AE',
  '205907',
  4,
  '27101981',
  641,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":641,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex ep 2 18k tot t ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1069,
  'MULTIS COMPLEX EP 2 18K TOT T AE',
  '211496',
  4,
  '27101981',
  641,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":641,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex ep 2 18k tot t ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1070,
  'MULTIS COMPLEX EP 3 18K TOT T AE',
  '205909',
  4,
  '27101981',
  645,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":645,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex ep 3 18k tot t ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1071,
  'MULTIS COMPLEX EP 3 18K TOT T AE',
  '211497',
  4,
  '27101981',
  645,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":645,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex ep 3 18k tot t ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1072,
  'MULTIS COMPLEX EP 3 50K TOT C',
  '147903',
  4,
  '27101981',
  827.82947,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"50 L","ex_factory_price":827.82947,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex ep 3 50k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1073,
  'MULTIS COMPLEX HV 2 180K TOT T AE',
  '209832',
  4,
  '27101981',
  653.0282450980393,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":653.0282450980393,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex hv 2 180k tot t ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1074,
  'MULTIS COMPLEX HV 2 MOLY 180K+L TOT C',
  '153310',
  4,
  '27101981',
  788.9707311764706,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":788.9707311764706,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex hv 2 moly 180k+l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1075,
  'MULTIS COMPLEX XHV 2 MOLY 180K+L TOT C',
  '209594',
  4,
  '27101981',
  560,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":560,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex xhv 2 moly 180k+l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1076,
  'MULTIS HP 2 MOLY 180K TOT T AE',
  '227751',
  4,
  '27101981',
  540,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":540,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis hp 2 moly 180k tot t ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1077,
  'MULTIS COMPLEX SHD 220 17K TOT C',
  '182690',
  4,
  '27101981',
  1228.9468682352938,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"17 L","ex_factory_price":1228.9468682352938,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis complex shd 220 17k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1078,
  'MULTIS EP 1                 18K    TOT Y AE',
  '211530',
  4,
  '27101981',
  570.2600980392157,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":570.2600980392157,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis ep 1                 18k    tot y ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1079,
  'MULTIS MS 2 180K TOT AE',
  '211465',
  4,
  '27101981',
  620.0686666666667,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":620.0686666666667,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis ms 2 180k tot ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1080,
  'MULTIS MS 2 18K TOT AE',
  '211542',
  4,
  '27101981',
  649.35,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":649.35,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'multis ms 2 18k tot ae,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1081,
  'NATERIA MX 40 208L TOT C',
  '205274',
  4,
  '27101981',
  578.8510061158823,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":578.8510061158823,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nateria mx 40 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1082,
  'NEVASTANE AW 68 20L    TOT C',
  '190550',
  4,
  '27101981',
  423,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":423,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane aw 68 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1083,
  'NEVASTANE EP 220 20L    TOT C',
  '190578',
  4,
  '27101981',
  522,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":522,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane ep 220 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1084,
  'NEVASTANE EP 320 20L    TOT C',
  '190581',
  4,
  '27101981',
  525.6,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":525.6,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane ep 320 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1085,
  'NEVASTANE SH 46 20L    TOT C',
  '190486',
  4,
  '27101981',
  675,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":675,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane sh 46 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1086,
  'NEVASTANE SY 220 20L    TOT C',
  '200395',
  4,
  '27101981',
  1465.2,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1465.2,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane sy 220 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1087,
  'NEVASTANE SY 460 20L    TOT C',
  '200392',
  4,
  '27101981',
  1485,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1485,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane sy 460 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1088,
  'NEVASTANE XSH 150 20L    TOT C',
  '190592',
  4,
  '27101981',
  801,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":801,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xsh 150 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1089,
  'NEVASTANE XSH 320 20L    TOT C',
  '189338',
  4,
  '27101981',
  952.2,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":952.2,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xsh 320 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1090,
  'NEVASTANE XSH 460 20L    TOT C',
  '190639',
  4,
  '27101981',
  991.8,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":991.8,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xsh 460 20l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1091,
  'NEVASTANE CHAIN OIL XT 20L TOT C',
  '180949',
  4,
  '27101981',
  1297.1224462059652,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1297.1224462059652,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane chain oil xt 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1092,
  'NEVASTANE SH 100 20L TOT C',
  '190543',
  4,
  '27101981',
  835.143515952941,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":835.143515952941,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane sh 100 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1093,
  'NEVASTANE SH 32 20L TOT C',
  '190483',
  4,
  '27101981',
  660.7373763764706,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":660.7373763764706,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane sh 32 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1094,
  'NEVASTANE SY 220   25K TOT C',
  '134023',
  4,
  '27101981',
  850.5288595625,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"23.65 L","ex_factory_price":850.5288595625,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane sy 220   25k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1095,
  'NEVASTANE SY 320         25K    TOT C',
  '134024',
  4,
  '27101981',
  882.45,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"25 L","ex_factory_price":882.45,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane sy 320         25k    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1096,
  'NEVASTANE SY 320 20L TOT C',
  '200366',
  4,
  '27101981',
  1512.5227196635294,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1512.5227196635294,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane sy 320 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1097,
  'NEVASTANE XMF 1 16K TOT C',
  '187967',
  4,
  '27101981',
  748.0095605882352,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"16 L","ex_factory_price":748.0095605882352,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xmf 1 16k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1098,
  'NEVASTANE XMF 2 16K TOT C',
  '188474',
  4,
  '27101981',
  791.1094117647059,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"16 L","ex_factory_price":791.1094117647059,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xmf 2 16k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1099,
  'NEVASTANE XS 320         16K    TOT C',
  '190492',
  4,
  '27101981',
  1154.818024117647,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"16 L","ex_factory_price":1154.818024117647,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xs 320         16k    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1100,
  'NEVASTANE XS 80 16K TOT C',
  '190496',
  4,
  '27101981',
  1028.9258600000003,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"16 L","ex_factory_price":1028.9258600000003,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xs 80 16k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1101,
  'NEVASTANE XS 80         180K    TOT C',
  '190494',
  4,
  '27101981',
  997.1839735294117,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":997.1839735294117,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xs 80         180k    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1102,
  'NEVASTANE XS 80         50K    TOT C',
  '190495',
  4,
  '27101981',
  1029.4816752941176,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"50 L","ex_factory_price":1029.4816752941176,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xs 80         50k    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1103,
  'NEVASTANE XSH 220 20L TOT C',
  '190594',
  4,
  '27101981',
  957.7594389023529,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":957.7594389023529,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'nevastane xsh 220 20l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1104,
  'ORITES DS 270 200K TOT C',
  '112635',
  4,
  '27101981',
  330,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"200 L","ex_factory_price":330,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'orites ds 270 200k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1105,
  'PLANETELF ACD 150 FY',
  '125883',
  4,
  '27101981',
  1224.2099686400002,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1224.2099686400002,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'planetelf acd 150 fy,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1106,
  'PLANETELF ACD 68',
  '112624',
  4,
  '27101981',
  1058.5981923888235,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":1058.5981923888235,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'planetelf acd 68,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1107,
  'RUBIA TIR 9900 FE 5W30     208L    TOT   C',
  '174337',
  4,
  '27101981',
  935.0840978506787,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":935.0840978506787,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'rubia tir 9900 fe 5w30     208l    tot   c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1108,
  'SERIOLA CLEANER         20 L      TOT C',
  '209463',
  4,
  '27101981',
  656.9613948459626,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"20 L","ex_factory_price":656.9613948459626,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'seriola cleaner         20 l      tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1109,
  'STATERMELF EP 2 50K TOT C',
  '131684',
  4,
  '27101981',
  961.2600000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"50 L","ex_factory_price":961.2600000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'statermelf ep 2 50k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1110,
  'STATERMIC X400           4C1K   TOT Z',
  '209113',
  4,
  '27101981',
  25357.099477647058,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"4 L","ex_factory_price":25357.099477647058,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'statermic x400           4c1k   tot z,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1111,
  'TRANS. DUAL 9 FE 75W90   208L   TOT C',
  '201659',
  4,
  '27101981',
  857,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":857,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'trans. dual 9 fe 75w90   208l   tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1112,
  'TRANS. DUAL 9 FE 75W90   208L   TOT C',
  '214148',
  4,
  '27101981',
  857,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":857,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'trans. dual 9 fe 75w90   208l   tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1113,
  'TRANS. DUAL 9 FE 75W90   60L    TOT C',
  '201658',
  4,
  '27101981',
  914.6400000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"60 L","ex_factory_price":914.6400000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'trans. dual 9 fe 75w90   60l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1114,
  'TRANS. DUAL 9 FE 75W90   60L    TOT C',
  '214147',
  4,
  '27101981',
  914.6400000000001,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"60 L","ex_factory_price":914.6400000000001,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'trans. dual 9 fe 75w90   60l    tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1115,
  'TRANS. GEAR 9V FE 75W90 208L TOT C',
  '201697',
  4,
  '27101981',
  1028.97,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":1028.97,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'trans. gear 9v fe 75w90 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1116,
  'TRANS. GEAR 9V FE 75W90 208L TOT C',
  '214150',
  4,
  '27101981',
  1028.97,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":1028.97,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'trans. gear 9v fe 75w90 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1117,
  'TRAXIUM AXLE 8 FE 75W140 208L   TOT C',
  '214134',
  4,
  '27101981',
  807.6259223811763,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":807.6259223811763,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'traxium axle 8 fe 75w140 208l   tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1118,
  'VALONA BR 9015 HC',
  '198002',
  4,
  '27101981',
  534.6409622211764,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":534.6409622211764,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'valona br 9015 hc,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1119,
  'VALONA GR 7012 HC',
  '198875',
  4,
  '27101981',
  525.5169883435294,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":525.5169883435294,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'valona gr 7012 hc,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1120,
  'VALONA GR 7522 HC 208L   TOT C',
  '202056',
  4,
  '27101981',
  505.0137837835294,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":505.0137837835294,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'valona gr 7522 hc 208l   tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1121,
  'VALONA MQL 3046 208L TOT C',
  '132500',
  4,
  '27101981',
  745.9553639247059,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":745.9553639247059,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'valona mql 3046 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1122,
  'VALONA MS 7023 HC',
  '197990',
  4,
  '27101981',
  461.5499219211764,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":461.5499219211764,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'valona ms 7023 hc,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1123,
  'VULSOL MSF 7200 208L TOT C',
  '157664',
  4,
  '27101981',
  814.5391892582354,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"208 L","ex_factory_price":814.5391892582354,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'vulsol msf 7200 208l tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1124,
  'CERAN AD PLUS 180K TOT C',
  '152100',
  4,
  '27101981',
  644.2654276470588,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":644.2654276470588,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran ad plus 180k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1125,
  'CERAN AD PLUS 18K TOT C',
  '152102',
  4,
  '27101981',
  752.7758169934642,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":752.7758169934642,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran ad plus 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1126,
  'CERAN CA 180K TOT C',
  '150080',
  4,
  '27101981',
  614.5293094117648,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":614.5293094117648,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran ca 180k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1127,
  'CERAN CA 18K TOT C',
  '150082',
  4,
  '27101981',
  731.3955164705882,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":731.3955164705882,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran ca 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1128,
  'CERAN MS 18K TOT C',
  '140064',
  4,
  '27101981',
  857.1185194117646,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":857.1185194117646,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran ms 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1129,
  'CERAN XM 100 18K TOT C',
  '167268',
  4,
  '27101981',
  728.7614352941176,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":728.7614352941176,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran xm 100 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1130,
  'CERAN XM 220 180K TOT C',
  '176269',
  4,
  '27101981',
  632.6084019607845,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":632.6084019607845,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran xm 220 180k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1131,
  'CERAN XM 220 18K TOT C',
  '177040',
  4,
  '27101981',
  720.6583333333334,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":720.6583333333334,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran xm 220 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1132,
  'CERAN XM 460 180K TOT C',
  '182158',
  4,
  '27101981',
  639.1639705882354,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"180 L","ex_factory_price":639.1639705882354,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran xm 460 180k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);
INSERT INTO products_v3 (
  id, product_name, product_code, category_id, hsn_code, base_price,
  business_category, product_bucket, specifications, tags, is_active, created_at, updated_at
) VALUES (
  1133,
  'CERAN XM 460 18K TOT C',
  '182159',
  4,
  '27101981',
  730.0834640522876,
  'IMPORTED GRADED',
  'TRADED',
  '{"pack_size":"18 L","ex_factory_price":730.0834640522876,"business_category":"IMPORTED GRADED","product_bucket":"TRADED"}',
  'ceran xm 460 18k tot c,imported graded,traded,l',
  1,
  '2025-09-16 14:32:43',
  '2025-09-16 14:32:43'
);

-- ================================================================
-- 6. PRODUCT VARIANTS (V3 SCHEMA) - 410 VARIANTS
-- ================================================================
DELETE FROM product_variants_v3;
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  724,
  724,
  'Xuper 660 NH, 2.50 mm - 2.50 mm',
  '5 Kg',
  5,
  'Kg',
  1691.38,
  1353.1040000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  725,
  725,
  'Xuper 660 NH, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1606.82,
  1285.4560000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  726,
  726,
  'Xuper 660 NH, 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1606.82,
  1285.4560000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  727,
  727,
  'EutecTrode 670, 2.40 mm - 2.40 mm',
  '5 Kg',
  5,
  'Kg',
  5637.76,
  4510.2080000000005,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  728,
  728,
  'EutecTrode 670, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  4952.9,
  3962.3199999999997,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  729,
  729,
  'EutecTrode 670, 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  5249.9,
  4199.92,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  730,
  730,
  'Xuper 680 CGS, 2.40 mm - 2.40 mm',
  '5 Kg',
  5,
  'Kg',
  7116.34,
  5693.072,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  731,
  731,
  'Xuper 680 CGS, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  7131.68,
  5705.344000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  732,
  732,
  'Xuper 680 CGS, 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  7098.44,
  5678.752,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  733,
  733,
  'EutecTrode 680 2.40 mm - 2.40 mm',
  '5 Kg',
  5,
  'Kg',
  6821.64,
  5457.312000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  734,
  734,
  'EutecTrode 680 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  6914.5,
  5531.6,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  735,
  735,
  'EutecTrode 680 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  6898.44,
  5518.752,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  736,
  736,
  'Xuper 680S, 1.60 mm - 1.60 mm',
  '2.5 Kg',
  5,
  'Kg',
  12553.44,
  10042.752,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  737,
  737,
  'Xuper Nucleotec 2222 2.40 mm - 2.40 mm',
  '5 Kg',
  5,
  'Kg',
  18772.96,
  15018.368,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  738,
  738,
  'Xuper Nucleotec 2222 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  14331.1,
  11464.880000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  739,
  739,
  'Xuper Nucleotec 2222 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  14647.4,
  11717.92,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  740,
  740,
  'XHD 2222 2.40 mm - 2.40 mm',
  '5 Kg',
  5,
  'Kg',
  11220.76,
  8976.608,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  741,
  741,
  'XHD 2222 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  10864.98,
  8691.984,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  742,
  742,
  'XHD 2222 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  10925.52,
  8740.416000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  743,
  743,
  'EutecTrode EC 6821, 2.50 mm (CPEM 021) - 2.50 mm',
  '5 Kg',
  5,
  'Kg',
  2950.5,
  2360.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  744,
  744,
  'EutecTrode EC 6821, 3.20 mm (CPEM 021) - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  2900.25,
  2320.2000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  745,
  745,
  'EutecTrode EC 6821, 4.00 mm (CPEM 021) - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  2900.25,
  2320.2000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  746,
  746,
  'StainTrode D 2.50 mm - 2.50 mm',
  '5 Kg',
  5,
  'Kg',
  4448.58,
  3558.864,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  747,
  747,
  'StainTrode D 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  4374.88,
  3499.9040000000005,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  748,
  748,
  'StainTrode D 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  4350.3,
  3480.2400000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  749,
  749,
  'EutecTrode EC 33300 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1681.82,
  1345.4560000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  750,
  750,
  'EutecTrode EC 33300 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1681.82,
  1345.4560000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  751,
  751,
  'StainTrode A-Mo-L 2.40 mm - 2.40 mm',
  '5 Kg',
  5,
  'Kg',
  4886.74,
  3909.392,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  752,
  752,
  'StainTrode A-Mo-L 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  4238.38,
  3390.704,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  753,
  753,
  'StainTrode A-Mo-L 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  4238.38,
  3390.704,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  754,
  754,
  'StainTrode BL 2.40 mm - 2.40 mm',
  '5 Kg',
  5,
  'Kg',
  4398.07,
  3518.456,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  755,
  755,
  'StainTrode BL 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  3814.54,
  3051.632,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  756,
  756,
  'StainTrode BL 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  3814.54,
  3051.632,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  757,
  757,
  'StainTrode B-Mo-L 2.40 mm - 2.40 mm',
  '5 Kg',
  5,
  'Kg',
  4886.74,
  3909.392,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  758,
  758,
  'StainTrode B-Mo-L 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  4238.38,
  3390.704,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  759,
  759,
  'EutecTrode 27 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1473.06,
  1178.448,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  760,
  760,
  'EutecTrode 27 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1473.06,
  1178.448,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  761,
  761,
  'Xyron 223, 2.50 mm - 2.50 mm',
  '5 Kg',
  5,
  'Kg',
  10126.22,
  8100.976,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  762,
  762,
  'Xyron 223, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  9873.08,
  7898.464,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  763,
  763,
  'Xyron 223, 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  9873.08,
  7898.464,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  764,
  764,
  'Xyron 224, 3.20 mm (EutecTrode 224) - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  10947.78,
  8758.224,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  765,
  765,
  'Xyron 224, 4.00 mm (EutecTrode 224) - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  10939.6,
  8751.68,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  766,
  766,
  'Xuper 2240 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  10235.82,
  8188.656,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  767,
  767,
  'Xuper 2240 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  10235.82,
  8188.656,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  768,
  768,
  'Xuper 22*33N 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  15845.12,
  12676.096000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  769,
  769,
  'Xuper 22*33N 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  15845.12,
  12676.096000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  770,
  770,
  'EutecTrode EC 2026, 2.50 mm - 2.50 mm',
  '5 Kg',
  5,
  'Kg',
  7088.36,
  5670.688,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  771,
  771,
  'EutecTrode EC 2026, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  6911.16,
  5528.928,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  772,
  772,
  'EutecTrode EC 2026, 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  6911.16,
  5528.928,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  773,
  773,
  'EutecTrode 2, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  880.55,
  704.44,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  774,
  774,
  'EutecTrode 2, 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  880.55,
  704.44,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  775,
  775,
  'EutecTrode 2B 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1090,
  872,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  776,
  776,
  'EutecTrode 2B 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1090,
  872,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  777,
  777,
  'EutecTrode 2B 5.00 mm - 5.00 mm',
  '5 Kg',
  5,
  'Kg',
  1090,
  872,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  778,
  778,
  'EutecTrode 700 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1215,
  972,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  779,
  779,
  'EutecTrode 700 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1215,
  972,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  780,
  780,
  'XHD 646 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  3520,
  2816,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  781,
  781,
  'XHD 646 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  3520,
  2816,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  782,
  782,
  'EutecTrode 6450 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1675.92,
  1340.736,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  783,
  783,
  'EutecTrode 6450 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1675.92,
  1340.736,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  784,
  784,
  'XHD 6710 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  3659.8,
  2927.84,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  785,
  785,
  'XHD 6710 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  3453.88,
  2763.1040000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  786,
  786,
  'XHD 6715 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  8301.8,
  6641.44,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  787,
  787,
  'XHD 6715 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  8035.1,
  6428.080000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  788,
  788,
  'ChromCarb N 6006 2.50  mm - 2.50  mm',
  '5 Kg',
  5,
  'Kg',
  4394.58,
  3515.664,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  789,
  789,
  'ChromCarb N 6006 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  4174.86,
  3339.888,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  790,
  790,
  'ChromCarb N 6006 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  4174.86,
  3339.888,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  791,
  791,
  'XHD ABRATEC 6777 3.20 mm (PyroCarb - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  8984,
  7187.200000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  792,
  792,
  'XHD ABRATEC 6777 4.00 mm (PyroCarb - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  8984,
  7187.200000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  793,
  793,
  'ToolTectic 6NHSS 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  3614.28,
  2891.4240000000004,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  794,
  794,
  'ToolTectic 6NHSS 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  3377.82,
  2702.2560000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  795,
  795,
  'EutecDur N 9060 3.20 mm - 3.20 mm',
  '2.5 Kg',
  5,
  'Kg',
  14354.46,
  11483.568,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  796,
  796,
  'EutecDur N 9060 4.00 mm - 4.00 mm',
  '2.5 Kg',
  5,
  'Kg',
  14136.3,
  11309.04,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  797,
  797,
  'EutecDur N 9080 3.20 mm - 3.20 mm',
  '2.5 Kg',
  5,
  'Kg',
  16282.6,
  13026.080000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  798,
  798,
  'EutecDur N 9080 4.00 mm - 4.00 mm',
  '2.5 Kg',
  5,
  'Kg',
  15554.4,
  12443.52,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  799,
  799,
  'EutecDur N 9120 3.20 mm - 3.20 mm',
  '2.5 Kg',
  5,
  'Kg',
  15020.76,
  12016.608,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  800,
  800,
  'EutecDur N 9120 4.00  mm - 4.00  mm',
  '2.5 Kg',
  5,
  'Kg',
  13248.88,
  10599.104,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  801,
  801,
  'EutecTrode EC 7008 6.30 mm (CPET 071) - 6.30 mm',
  '5 Kg',
  5,
  'Kg',
  1321,
  1056.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  802,
  802,
  'EutecTrode EC 7008 8.00 mm (CPET 071) - 8.00 mm',
  '5 Kg',
  5,
  'Kg',
  1357,
  1085.6000000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  803,
  803,
  'EutecTrode 6717 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  2083.33,
  1666.664,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  804,
  804,
  'EutecTrode 6717 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  2083.33,
  1666.664,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  805,
  805,
  'EutecTrode EC 6610 (CPHFD 010) 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1923.64,
  1538.9120000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  806,
  806,
  'EutecTrode EC 6610 (CPHFD 010) 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1923.64,
  1538.9120000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  807,
  807,
  'EutecTrode EC 6611 (CPHFD 011) 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1539.72,
  1231.776,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  808,
  808,
  'EutecTrode EC 6611 (CPHFD 011) 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1539.72,
  1231.776,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  809,
  809,
  'EutecTrode EC 6822 (CPSM 022) 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  3520.25,
  2816.2000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  810,
  810,
  'EutecTrode EC 6822 (CPSM 022) 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  3520.25,
  2816.2000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  811,
  811,
  'SugarTec Max 45, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1583.33,
  1266.664,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  812,
  812,
  'SugarTec Max 45, 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1583.33,
  1266.664,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  813,
  813,
  'SugarTec Max 45, 5.00 mm - 5.00 mm',
  '5 Kg',
  5,
  'Kg',
  1583.33,
  1266.664,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  814,
  814,
  'EutecTrode 2101E 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  7650.66,
  6120.528,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  815,
  815,
  'ExoTrode, 3.20 mm (CutTrode) - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1040,
  832,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  816,
  816,
  'ExoTrode, 4.00 mm (CutTrode) - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1040,
  832,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  817,
  817,
  'Eutec-ChamferTrode, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  1546.78,
  1237.424,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  818,
  818,
  'Eutec-ChamferTrode, 4.00 mm - 4.00 mm',
  '5 Kg',
  5,
  'Kg',
  1549.5,
  1239.6000000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  819,
  819,
  'XHD 2800, 3.20 mm - 3.20 mm',
  '5 Kg',
  5,
  'Kg',
  7927.16,
  6341.728,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  820,
  820,
  'XHD 2800, 400 mm - 400 mm',
  '5 Kg',
  5,
  'Kg',
  7936.46,
  6349.168000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  821,
  821,
  'COOLELF AUTO SUPRA -37░C - 210 L',
  '210 L',
  0,
  'L',
  203.66666666666666,
  162.93333333333334,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  822,
  822,
  'COOLELF SUPRA - 210 L',
  '210 L',
  0,
  'L',
  188,
  150.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  823,
  823,
  'COOLTECH - 210 L',
  '210 L',
  0,
  'L',
  170,
  136,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  824,
  824,
  'GLACELF AUTO SUPRA - 210 L',
  '210 L',
  0,
  'L',
  237,
  189.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  825,
  825,
  'GLACELF SUPRA - 210 L',
  '210 L',
  0,
  'L',
  218,
  174.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  826,
  826,
  'RUBIA 7800 TT 15W40 - 210 L',
  '210 L',
  0,
  'L',
  255.08474576271186,
  204.0677966101695,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  827,
  827,
  'RUBIA 7800 TT 15W40 - 50 L',
  '50 L',
  0,
  'L',
  259.3220338983051,
  207.4576271186441,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  828,
  828,
  'RUBIA FLEET HD 300 15W40 - 50 L',
  '50 L',
  0,
  'L',
  239.83050847457628,
  191.86440677966104,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  829,
  829,
  'RUBIA FLEET HD 300 15W40 - 210 L',
  '210 L',
  0,
  'L',
  235.2542372881356,
  188.2033898305085,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  830,
  830,
  'RUBIA FLEET HD 300 15W40 - 210 L',
  '210 L',
  0,
  'L',
  235.59322033898306,
  188.47457627118646,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  831,
  831,
  'RUBIA FLEET HD 500 15W40 - 210 L',
  '210 L',
  0,
  'L',
  244.91525423728814,
  195.93220338983053,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  832,
  832,
  'RUBIA FLEET HD 700 15W40 - 210 L',
  '210 L',
  0,
  'L',
  246.61016949152545,
  197.28813559322037,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  833,
  833,
  'RUBIA TIR 7400 15W40 - 210 L',
  '210 L',
  0,
  'L',
  241.6238095238095,
  193.29904761904763,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  834,
  834,
  'RUBIA TIR 7400 15W40 - 50 L',
  '50 L',
  0,
  'L',
  242.1,
  193.68,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  835,
  835,
  'RUBIA TIR 7400 15W40 - 20 L',
  '20 L',
  0,
  'L',
  262,
  209.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  836,
  836,
  'SUPER HDB ULTRA 20W40 - 55 L',
  '55 L',
  0,
  'L',
  239.9661016949153,
  191.97288135593226,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  837,
  837,
  'SUPER HDB ULTRA 20W40 - 210 L',
  '210 L',
  0,
  'L',
  236.44067796610173,
  189.15254237288138,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  838,
  838,
  'SUPER HDB ULTRA 20W40 - 20 L',
  '20 L',
  0,
  'L',
  258.4745762711865,
  206.7796610169492,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  839,
  839,
  'MULTIS XL 3 PREMIUM + - 180 L',
  '180 L',
  0,
  'L',
  451.56779661016947,
  361.2542372881356,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  840,
  840,
  'MULTIS XL 3 Plus - 180 L',
  '180 L',
  0,
  'L',
  287.29,
  229.83200000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  841,
  841,
  'MULTIS XL 3 Plus - 20 L',
  '20 L',
  0,
  'L',
  296.61,
  237.288,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  842,
  842,
  'LEX 3 - 20 L',
  '20 L',
  0,
  'L',
  241.53,
  193.22400000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  843,
  843,
  'LEX 3 - 180 L',
  '180 L',
  0,
  'L',
  235.59,
  188.472,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  844,
  844,
  'RUBIA TIR 8600 10W40 - 25 L',
  '25 L',
  0,
  'L',
  326.7,
  261.36,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  845,
  845,
  'RUBIA TIR 8600 10W40 - 210 L',
  '210 L',
  0,
  'L',
  291.7285714285714,
  233.38285714285712,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  846,
  846,
  'RUBIA TIR 8600 10W40     20LBCK TOT   IN - 20 L',
  '20 L',
  0,
  'L',
  310,
  248,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  847,
  847,
  'RUBIA TIR 8800 10W40 - 210 L',
  '210 L',
  0,
  'L',
  263.5593220338983,
  210.84745762711864,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  848,
  848,
  'RUBIA TIR 8800 10W40 - 26 L',
  '26 L',
  0,
  'L',
  270.33898305084745,
  216.27118644067798,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  849,
  849,
  'RUBIA WORKS 1000 15W40 - 210 L',
  '210 L',
  0,
  'L',
  248.11428571428573,
  198.4914285714286,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  850,
  850,
  'RUBIA W.1000 PLUS 15W40  210L   TOT    IN - 210 L',
  '210 L',
  0,
  'L',
  260,
  208,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  851,
  851,
  'RUBIA OPT.1300 15W40     210LP  TOT    IN - 210 L',
  '210 L',
  0,
  'L',
  261.86,
  209.48800000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  852,
  852,
  'RUBIA OPT.1300 FE 10W30  210LP  TOT    IN - 210 L',
  '210 L',
  0,
  'L',
  278.8,
  223.04000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  853,
  853,
  'RUBIA WORKS 5000 10W40   210L   TOT   IN - 210 L',
  '210 L',
  0,
  'L',
  320,
  256,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  854,
  854,
  'RUBIA WORKS 4000 15W40 - 210 L',
  '210 L',
  0,
  'L',
  270,
  216,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  855,
  855,
  'AUTO TRANS-FLUID D III - 210 L',
  '210 L',
  0,
  'L',
  258.22033898305085,
  206.5762711864407,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  856,
  856,
  'GEARELF 4 140 EP - 210 L',
  '210 L',
  0,
  'L',
  284,
  227.20000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  857,
  857,
  'TRANSTEC 4 80W90 - 20 L',
  '20 L',
  0,
  'L',
  304,
  243.20000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  858,
  858,
  'TRANSTEC 4 80W90 - 20 L',
  '20 L',
  0,
  'L',
  259.91525423728814,
  207.93220338983053,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  859,
  859,
  'TRANSTEC 4 80W90 - 50 L',
  '50 L',
  0,
  'L',
  252.28813559322035,
  201.83050847457628,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  860,
  860,
  'TRANSTEC 4 80W90 - 210 L',
  '210 L',
  0,
  'L',
  249.74576271186442,
  199.79661016949154,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  861,
  861,
  'SUPER HDB 30 - 210 L',
  '210 L',
  0,
  'L',
  216.1,
  172.88,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  862,
  862,
  'TRANSTEC 4 SAE 140 - 20 L',
  '20 L',
  0,
  'L',
  266.69491525423734,
  213.3559322033899,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  863,
  863,
  'TRANSTEC 4 SAE 140 - 210 L',
  '210 L',
  0,
  'L',
  253.98305084745766,
  203.18644067796615,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  864,
  864,
  'TRANSTEC 4 SAE 90 - 20 L',
  '20 L',
  0,
  'L',
  264.1525423728814,
  211.3220338983051,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  865,
  865,
  'TRANSTEC 4 SAE 90 - 210 L',
  '210 L',
  0,
  'L',
  249.8813559322034,
  199.90508474576274,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  866,
  866,
  'DYNATRANS MM - 20 L',
  '20 L',
  0,
  'L',
  260.1694915254237,
  208.135593220339,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  867,
  867,
  'DYNATRANS MM - 210 L',
  '210 L',
  0,
  'L',
  238.135593220339,
  190.5084745762712,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  868,
  868,
  'DYNATRANS MPX - 210 L',
  '210 L',
  0,
  'L',
  231.4,
  185.12,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  869,
  869,
  'DYNATRANS SF 3I - 20 L',
  '20 L',
  0,
  'L',
  258.4745762711865,
  206.7796610169492,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  870,
  870,
  'DYNATRANS SF 3I - 210 L',
  '210 L',
  0,
  'L',
  244.91525423728814,
  195.93220338983053,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  871,
  871,
  'EP 80W85 - 210 L',
  '210 L',
  0,
  'L',
  228.8,
  183.04000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  872,
  872,
  'TRAX. AXLE 7 85W90 - 210 L',
  '210 L',
  0,
  'L',
  255,
  204,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  873,
  873,
  'TRACTELF BLS 90 - 210 L',
  '210 L',
  0,
  'L',
  291,
  232.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  874,
  874,
  'GEARELF 5 EP 80W90 - 210 L',
  '210 L',
  0,
  'L',
  243.8,
  195.04000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  875,
  875,
  'TRANSTEC 5 85W140 - 50 L',
  '50 L',
  0,
  'L',
  260.7627118644068,
  208.61016949152545,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  876,
  876,
  'TRANSTEC 5 85W140 - 210 L',
  '210 L',
  0,
  'L',
  257.3728813559322,
  205.89830508474574,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  877,
  877,
  'DYNATRANS ACX 10W - 210 L',
  '210 L',
  0,
  'L',
  216.4,
  173.12,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  878,
  878,
  'DYNATRANS ACX 30 - 210 L',
  '210 L',
  0,
  'L',
  228.4,
  182.72000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  879,
  879,
  'DYNATRANS ACX 50 - 210 L',
  '210 L',
  0,
  'L',
  252,
  201.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  880,
  880,
  'NATERIA MH 40 - 210 L',
  '210 L',
  0,
  'L',
  236.8,
  189.44000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  881,
  881,
  'NATERIA MJ 40 - 210 L',
  '210 L',
  0,
  'L',
  235,
  188,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  882,
  882,
  'NATERIA MP 40 - 210 L',
  '210 L',
  0,
  'L',
  254.2,
  203.36,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  883,
  883,
  'NATERIA MWX 40 - 210 L',
  '210 L',
  0,
  'L',
  260,
  208,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  884,
  884,
  'WT SUPRA - 20 L',
  '20 L',
  0,
  'L',
  413,
  330.40000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  885,
  885,
  'WT SUPRA - 210 L',
  '210 L',
  0,
  'L',
  372.76190476190476,
  298.20952380952383,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  886,
  886,
  'CARTER EP 100 - 210 L',
  '210 L',
  0,
  'L',
  213.6,
  170.88,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  887,
  887,
  'CARTER EP 150 - 210 L',
  '210 L',
  0,
  'L',
  217.4,
  173.92000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  888,
  888,
  'CARTER EP 220 - 210 L',
  '210 L',
  0,
  'L',
  229.1,
  183.28,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  889,
  889,
  'CARTER EP 220 - 20 L',
  '20 L',
  0,
  'L',
  257,
  205.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  890,
  890,
  'CARTER EP 320 - 210 L',
  '210 L',
  0,
  'L',
  241.7,
  193.36,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  891,
  891,
  'CARTER EP 320 - 20 L',
  '20 L',
  0,
  'L',
  267,
  213.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  892,
  892,
  'CARTER EP 460 - 210 L',
  '210 L',
  0,
  'L',
  256.3,
  205.04000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  893,
  893,
  'CARTER EP 68 - 210 L',
  '210 L',
  0,
  'L',
  209.8,
  167.84000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  894,
  894,
  'CARTER 150 (Metal Barrel) - 210 L',
  '210 L',
  0,
  'L',
  217.4,
  173.92000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  895,
  895,
  'CARTER 150 (Plastic Barrel) - 210 L',
  '210 L',
  0,
  'L',
  207.4,
  165.92000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  896,
  896,
  'CARTER 220 (Metal Barrel) - 210 L',
  '210 L',
  0,
  'L',
  229.1,
  183.28,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  897,
  897,
  'CARTER 220 (Plastic Barrel) - 210 L',
  '210 L',
  0,
  'L',
  219.1,
  175.28,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  898,
  898,
  'CARTER 320 (Metal Barrel) - 210 L',
  '210 L',
  0,
  'L',
  241.7,
  193.36,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  899,
  899,
  'CARTER 320 (Plastic Barrel) - 210 L',
  '210 L',
  0,
  'L',
  231.7,
  185.36,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  900,
  900,
  'CARTER 460 (Metal Barrel) - 210 L',
  '210 L',
  0,
  'L',
  256.3,
  205.04000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  901,
  901,
  'CARTER 460 (Plastic Barrel) - 210 L',
  '210 L',
  0,
  'L',
  246.3,
  197.04000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  902,
  902,
  'CARTER 220 - 20 L',
  '20 L',
  0,
  'L',
  247,
  197.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  903,
  903,
  'CARTER 320 - 20 L',
  '20 L',
  0,
  'L',
  257,
  205.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  904,
  904,
  'CARTER 680 - 20 L',
  '20 L',
  0,
  'L',
  286.3,
  229.04000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  905,
  905,
  'HIPER SSG 1 - 180 L',
  '180 L',
  0,
  'L',
  435,
  348,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  906,
  906,
  'LEX EP 2 - 180 L',
  '180 L',
  0,
  'L',
  320,
  256,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  907,
  907,
  'LEX EP 2 - 20 L',
  '20 L',
  0,
  'L',
  375,
  300,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  908,
  908,
  'MULTIS EP 0 - 20 L',
  '20 L',
  0,
  'L',
  387,
  309.6,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  909,
  909,
  'MULTIS EP 0 - 180 L',
  '180 L',
  0,
  'L',
  333,
  266.40000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  910,
  910,
  'MULTIS EP 00 - 180 L',
  '180 L',
  0,
  'L',
  335,
  268,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  911,
  911,
  'MULTIS EP 00 - 20 L',
  '20 L',
  0,
  'L',
  390,
  312,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  912,
  912,
  'MULTIS EP 000 - 20 L',
  '20 L',
  0,
  'L',
  395,
  316,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  913,
  913,
  'MULTIS EP 2 - 20 L',
  '20 L',
  0,
  'L',
  390,
  312,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  914,
  914,
  'MULTIS EP 2 - 180 L',
  '180 L',
  0,
  'L',
  330,
  264,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  915,
  915,
  'MULTIS EP 3 - 20 L',
  '20 L',
  0,
  'L',
  392,
  313.6,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  916,
  916,
  'MULTIS EP 3 - 180 L',
  '180 L',
  0,
  'L',
  335,
  268,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  917,
  917,
  'SERIOLA 32 * - 210 L',
  '210 L',
  0,
  'L',
  200,
  160,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  918,
  918,
  'SERIOLA AB - 210 L',
  '210 L',
  0,
  'L',
  242,
  193.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  919,
  919,
  'DIEL 7500 - 210 L',
  '210 L',
  0,
  'L',
  232.7,
  186.16,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  920,
  920,
  'DRASTA C 1000 IN - 210 L',
  '210 L',
  0,
  'L',
  209.9,
  167.92000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  921,
  921,
  'DROSERA IN 220 - 210 L',
  '210 L',
  0,
  'L',
  219,
  175.20000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  922,
  922,
  'DROSERA IN 68 - 210 L',
  '210 L',
  0,
  'L',
  208,
  166.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  923,
  923,
  'DROSERA MS 220 - 20 L',
  '20 L',
  0,
  'L',
  260,
  208,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  924,
  924,
  'DROSERA MS 220 - 210 L',
  '210 L',
  0,
  'L',
  238.3,
  190.64000000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  925,
  925,
  'DROSERA MS 68 - 20 L',
  '20 L',
  0,
  'L',
  245.5,
  196.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  926,
  926,
  'DROSERA MS 68 - 210 L',
  '210 L',
  0,
  'L',
  225.4,
  180.32000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  927,
  927,
  'GRANITCUT 2424 - 210 L',
  '210 L',
  0,
  'L',
  225.9,
  180.72000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  928,
  928,
  'LACTUCA 2614 CR - 210 L',
  '210 L',
  0,
  'L',
  228.6,
  182.88,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  929,
  929,
  'LACTUCA 3000 - 20 L',
  '20 L',
  0,
  'L',
  253.5,
  202.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  930,
  930,
  'LACTUCA 3000 - 210 L',
  '210 L',
  0,
  'L',
  225,
  180,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  931,
  931,
  'MARTOL 104 - 210 L',
  '210 L',
  0,
  'L',
  255.5,
  204.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  932,
  932,
  'MARTOL 708 - 210 L',
  '210 L',
  0,
  'L',
  275.4,
  220.32,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  933,
  933,
  'MARTOL 9107 - 210 L',
  '210 L',
  0,
  'L',
  294,
  235.20000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  934,
  934,
  'MARTOL EV 10 CF - 210 L',
  '210 L',
  0,
  'L',
  241.2,
  192.96,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  935,
  935,
  'MARTOL LVG 13 CF - 210 L',
  '210 L',
  0,
  'L',
  288,
  230.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  936,
  936,
  'OSYRIS 2609 - 50 L',
  '50 L',
  0,
  'L',
  256,
  204.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  937,
  937,
  'OSYRIS 2609 - 210 L',
  '210 L',
  0,
  'L',
  234.3,
  187.44000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  938,
  938,
  'OSYRIS 2611 WD - 210 L',
  '210 L',
  0,
  'L',
  230,
  184,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  939,
  939,
  'OSYRIS 2626 TP - 210 L',
  '210 L',
  0,
  'L',
  228.1,
  182.48000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  940,
  940,
  'OSYRIS HF 5000 - 210 L',
  '210 L',
  0,
  'L',
  229,
  183.20000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  941,
  941,
  'VALONA 2724 - 210 L',
  '210 L',
  0,
  'L',
  221,
  176.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  942,
  942,
  'VALONA 7009 - 210 L',
  '210 L',
  0,
  'L',
  240.1,
  192.08,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  943,
  943,
  'VALONA 7035 - 210 L',
  '210 L',
  0,
  'L',
  221.2,
  176.96,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  944,
  944,
  'VALONA GR 5005 HC - 210 L',
  '210 L',
  0,
  'L',
  261.1,
  208.88000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  945,
  945,
  'VALONA MS 5020 HC - 210 L',
  '210 L',
  0,
  'L',
  265.7,
  212.56,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  946,
  946,
  'LACTUCA 5000 - 210 L',
  '210 L',
  0,
  'L',
  242,
  193.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  947,
  947,
  'LACTUCA 5000 - 20 L',
  '20 L',
  0,
  'L',
  265,
  212,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  948,
  948,
  'SPIRIT 5000      210L  TOT - 210 L',
  '210 L',
  0,
  'L',
  360.75,
  288.6,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  949,
  949,
  'Spirit 3000 210 L - 210 L',
  '210 L',
  0,
  'L',
  295,
  236,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  950,
  950,
  'AZOLLA AF 46 - 210 L',
  '210 L',
  0,
  'L',
  236.6,
  189.28,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  951,
  951,
  'AZOLLA AF 68 - 210 L',
  '210 L',
  0,
  'L',
  236.6,
  189.28,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  952,
  952,
  'AZOLLA SPIN EE 10 - 210 L',
  '210 L',
  0,
  'L',
  218.5,
  174.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  953,
  953,
  'EQUIVIS ZS 100 - 210 L',
  '210 L',
  0,
  'L',
  235,
  188,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  954,
  954,
  'EQUIVIS ZS 32 - 210 L',
  '210 L',
  0,
  'L',
  225.8,
  180.64000000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  955,
  955,
  'EQUIVIS ZS 46 - 210 L',
  '210 L',
  0,
  'L',
  227.6,
  182.08,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  956,
  956,
  'EQUIVIS ZS 68 (Plastic Barrel) - 210 L',
  '210 L',
  0,
  'L',
  227.6,
  182.08,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  957,
  957,
  'EQUIVIS ZS 68 (Metal Barrel) - 210 L',
  '210 L',
  0,
  'L',
  237.6,
  190.08,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  958,
  958,
  'EQUIVIS AF 46 - 210 L',
  '210 L',
  0,
  'L',
  245,
  196,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  959,
  959,
  'EQUIVIS AF 68 - 210 L',
  '210 L',
  0,
  'L',
  245,
  196,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  960,
  960,
  'ACANTIS HM 100 - 210 L',
  '210 L',
  0,
  'L',
  229.8,
  183.84000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  961,
  961,
  'ACANTIS HM 150 - 210 L',
  '210 L',
  0,
  'L',
  236.2,
  188.96,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  962,
  962,
  'ACANTIS HM 220 - 210 L',
  '210 L',
  0,
  'L',
  229.2,
  183.36,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  963,
  963,
  'ACANTIS HM 32 - 210 L',
  '210 L',
  0,
  'L',
  207.9,
  166.32000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  964,
  964,
  'ACANTIS HM 46 - 20 L',
  '20 L',
  0,
  'L',
  243.5,
  194.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  965,
  965,
  'ACANTIS HM 46 - 210 L',
  '210 L',
  0,
  'L',
  207.9,
  166.32000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  966,
  966,
  'ACANTIS HM 68 - 20 L',
  '20 L',
  0,
  'L',
  243.5,
  194.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  967,
  967,
  'ACANTIS HM 68 (Plastic Barrel) - 210 L',
  '210 L',
  0,
  'L',
  216.9,
  173.52,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  968,
  968,
  'ACANTIS HM 68 (Metal Barrel) - 210 L',
  '210 L',
  0,
  'L',
  207.9,
  166.32000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  969,
  969,
  'AZOLLA ZS 32 SUPERCLEAN - 20 L',
  '20 L',
  0,
  'L',
  255,
  204,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  970,
  970,
  'AZOLLA ZS 32 SUPERCLEAN - 210 L',
  '210 L',
  0,
  'L',
  233.1,
  186.48000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  971,
  971,
  'AZOLLA ZS 32 SUPERCLEAN - 20 L',
  '20 L',
  0,
  'L',
  255,
  204,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  972,
  972,
  'AZOLLA ZS 32 SUPERCLEAN - 210 L',
  '210 L',
  0,
  'L',
  223.1,
  178.48000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  973,
  973,
  'AZOLLA ZS 46 SUPERCLEAN - 210 L',
  '210 L',
  0,
  'L',
  233.1,
  186.48000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  974,
  974,
  'AZOLLA ZS 46 SUPERCLEAN - 20 L',
  '20 L',
  0,
  'L',
  255,
  204,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  975,
  975,
  'AZOLLA ZS 46 SUPERCLEAN - 20 L',
  '20 L',
  0,
  'L',
  255,
  204,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  976,
  976,
  'AZOLLA ZS 46 SUPERCLEAN - 210 L',
  '210 L',
  0,
  'L',
  223.1,
  178.48000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  977,
  977,
  'AZOLLA ZS 68 SUPERCLEAN - 210 L',
  '210 L',
  0,
  'L',
  223.1,
  178.48000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  978,
  978,
  'AZOLLA ZS 68 SUPERCLEAN - 20 L',
  '20 L',
  0,
  'L',
  255,
  204,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  979,
  979,
  'PRESLIA 32 - 210 L',
  '210 L',
  0,
  'L',
  200.9,
  160.72000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  980,
  980,
  'PRESLIA 46 - 210 L',
  '210 L',
  0,
  'L',
  200.9,
  160.72000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  981,
  981,
  'PRESLIA 68 - 210 L',
  '210 L',
  0,
  'L',
  202.9,
  162.32000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  982,
  982,
  'DACNIS LD 68             210L   TOT   IN - 210 L',
  '210 L',
  0,
  'L',
  250,
  200,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  983,
  983,
  'DACNIS LD 68             20LP   TOT   IN - 20 L',
  '20 L',
  0,
  'L',
  275,
  220,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  984,
  984,
  'DACNIS LD 68             20LP   TOT   IN - 20 L',
  '20 L',
  0,
  'L',
  275,
  220,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  985,
  985,
  'CORTIS MS 100        210L   TOT   IN - 210 L',
  '210 L',
  0,
  'L',
  202,
  161.60000000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  986,
  986,
  'CORTIS MS 150       210L   TOT   IN - 210 L',
  '210 L',
  0,
  'L',
  208,
  166.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  987,
  987,
  'CORTIS MS 220        210L   TOT   IN - 210 L',
  '210 L',
  0,
  'L',
  216,
  172.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  988,
  988,
  'CORTIS MS 320        210L   TOT   IN - 210 L',
  '210 L',
  0,
  'L',
  226,
  180.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  989,
  989,
  'CORTIS MS 460        210L   TOT   IN - 210 L',
  '210 L',
  0,
  'L',
  238,
  190.4,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  990,
  990,
  'Tempershield 6019 IN TOT IN - 210 L',
  '210 L',
  0,
  'L',
  265,
  212,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  991,
  991,
  'Rolkleen SD 6745  TOT IN - 210 L',
  '210 L',
  0,
  'L',
  325,
  260,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  992,
  992,
  'Rolkleen EP 2150  TOT IN - 210 L',
  '210 L',
  0,
  'L',
  295,
  236,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  993,
  993,
  'Rolkleen SD 4642  TOT IN - 210 L',
  '210 L',
  0,
  'L',
  315,
  252,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  994,
  994,
  'ALTIS EM 2 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  663.5498017647059,
  530.8398414117647,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  995,
  995,
  'ALTIS MV 2 50K TOT C - 50 L',
  '50 L',
  0,
  'L',
  734.8874864705883,
  587.9099891764707,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  996,
  996,
  'ALTIS SH 2 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  974.7942835294118,
  779.8354268235295,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  997,
  997,
  'AZOLLA AL 22 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  490.1257636470588,
  392.1006109176471,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  998,
  998,
  'AZOLLA AL 32 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  512.4641011470588,
  409.9712809176471,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  999,
  999,
  'CALORIS 23 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  637.8493858823531,
  510.2795087058825,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1000,
  1000,
  'CALORIS MS 23 50K TOT C - 50 L',
  '50 L',
  0,
  'L',
  917.0982394117647,
  733.6785915294117,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1001,
  1001,
  'CARTER ALS 220 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  633.343101302353,
  506.6744810418825,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1002,
  1002,
  'CARTER ALS 460  208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  642.4403597970588,
  513.9522878376471,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1003,
  1003,
  'CARTER EP 680 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  459.63554207633,
  367.708433661064,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1004,
  1004,
  'CARTER EP 680 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  555.3026345516901,
  444.24210764135205,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1005,
  1005,
  'CARTER SG 150 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  889.4003200258823,
  711.5202560207058,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1006,
  1006,
  'CARTER SG 220 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  854.1853854411764,
  683.3483083529412,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1007,
  1007,
  'CARTER SG 220 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  863.6695276294117,
  690.9356221035295,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1008,
  1008,
  'CARTER SG 320 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  868.6239564147057,
  694.8991651317647,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1009,
  1009,
  'CARTER SG 320 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  884.913053995294,
  707.9304431962353,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1010,
  1010,
  'CARTER SG 460 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  903.5504107788234,
  722.8403286230588,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1011,
  1011,
  'CARTER SG 680 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  995.0652177111765,
  796.0521741689413,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1012,
  1012,
  'CARTER SH 1000       208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  1187.3275519241176,
  949.8620415392942,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1013,
  1013,
  'CARTER SH 1000 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  1361.5137117106801,
  1089.210969368544,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1014,
  1014,
  'CARTER SH 150    20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  866.9100000000001,
  693.5280000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1015,
  1015,
  'CARTER SH 150 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  786.7941430995475,
  629.435314479638,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1016,
  1016,
  'CARTER SH 220 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  821.549601244344,
  657.2396809954753,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1017,
  1017,
  'CARTER SH 220 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  866.9100000000001,
  693.5280000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1018,
  1018,
  'CARTER SH 320 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  858.0300000000001,
  686.4240000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1019,
  1019,
  'CARTER SH 320 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  913.5300000000001,
  730.8240000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1020,
  1020,
  'CARTER SH 460 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  917.97,
  734.3760000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1021,
  1021,
  'CARTER SH 460 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  952.3800000000001,
  761.9040000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1022,
  1022,
  'CARTER SH 680 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  1022.3100000000001,
  817.8480000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1023,
  1023,
  'CARTER SY 220 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  850.2404743082354,
  680.1923794465883,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1024,
  1024,
  'CARTER SY 220 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  871.1295355117647,
  696.9036284094118,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1025,
  1025,
  'CARTER SY 320 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  893.0356541229411,
  714.428523298353,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1026,
  1026,
  'CARTER SY 320 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  911.24749805,
  728.9979984400001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1027,
  1027,
  'CARTER SY 460 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  941.0404665235294,
  752.8323732188236,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1028,
  1028,
  'CARTER SY 460 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  952.7143397264706,
  762.1714717811765,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1029,
  1029,
  'CARTER WT 320    208L  TOT C - 208 L',
  '208 L',
  0,
  'L',
  868.6221989017276,
  694.8977591213821,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1030,
  1030,
  'CARTER WT 320 208L TOT  SG - 208 L',
  '208 L',
  0,
  'L',
  869,
  695.2,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1031,
  1031,
  'COPAL OGL 0 180K TOT C - 180 L',
  '180 L',
  0,
  'L',
  705.8763447058824,
  564.7010757647059,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1032,
  1032,
  'COPAL OGL 0 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  733.6429435294116,
  586.9143548235293,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1033,
  1033,
  'CORTIS SHT 200 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  1139.4137240705884,
  911.5309792564708,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1034,
  1034,
  'DACNIS LD 46   208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  460.52478846153844,
  368.41983076923077,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1035,
  1035,
  'DACNIS LD 46   20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  473.5093029411765,
  378.8074423529412,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1036,
  1036,
  'DACNIS LD 68    208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  452.87419541855206,
  362.29935633484166,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1037,
  1037,
  'DACNIS LD 68   20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  465.89705,
  372.71764,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1038,
  1038,
  'DACNIS SH 32 20L TOT  C - 20 L',
  '20 L',
  0,
  'L',
  670.4114999999999,
  536.3292,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1039,
  1039,
  'DACNIS SH 46 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  666.7917024886879,
  533.4333619909503,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1040,
  1040,
  'DACNIS SH 46 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  678.3893235294119,
  542.7114588235295,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1041,
  1041,
  'DACNIS SH 68 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  700.3782550904979,
  560.3026040723984,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1042,
  1042,
  'DACNIS SH 68 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  711.9956176470589,
  569.5964941176471,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1043,
  1043,
  'DAG 1 A 180K+L TOT C - 180 L',
  '180 L',
  0,
  'L',
  652.4332079700001,
  521.9465663760001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1044,
  1044,
  'ELFMATIC G3 SYN          208L   ELF C - 208 L',
  '208 L',
  0,
  'L',
  712.7285806470588,
  570.1828645176471,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1045,
  1045,
  'EMETAN M 170K   TOT C - 170 L',
  '170 L',
  0,
  'L',
  541.6007605047059,
  433.28060840376475,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1046,
  1046,
  'EQUIVIS XV 32 208L   TOT C - 208 L',
  '208 L',
  0,
  'L',
  615.8447671347059,
  492.67581370776475,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1047,
  1047,
  'ESTAR SHT 200            20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  1139.4,
  911.5200000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1048,
  1048,
  'FINAVESTAN A 360 B 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  438.2621199979,
  350.60969599832003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1049,
  1049,
  'FINAVESTAN A 520 B 208L TOT C1 - 208 L',
  '208 L',
  0,
  'L',
  513.3949292986425,
  410.71594343891405,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1050,
  1050,
  'FINAVESTAN A 80 B - 208 L',
  '208 L',
  0,
  'L',
  405,
  324,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1051,
  1051,
  'FINAVESTAN A 100 B       208L   TOT C1 - 208 L',
  '208 L',
  0,
  'L',
  415,
  332,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1052,
  1052,
  'GEAR FLUID 550  180K   TLG C - 180 L',
  '180 L',
  0,
  'L',
  616,
  492.8,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1053,
  1053,
  'GLACELF MDX 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  588.4555306470588,
  470.76442451764706,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1054,
  1054,
  'GRAISSE F 9702 50K TOT C2 - 50 L',
  '50 L',
  0,
  'L',
  975.3984305882353,
  780.3187444705883,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1055,
  1055,
  'GRAISSE N 3924 180K TOT C - 180 L',
  '180 L',
  0,
  'L',
  679.1877581699347,
  543.3502065359478,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1056,
  1056,
  'HYDRANSAFE FR EHC 230K TOT C - 230 L',
  '230 L',
  0,
  'L',
  2098.324260981765,
  1678.6594087854119,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1057,
  1057,
  'HYDRANSAFE HFDU 46 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  653.190443815294,
  522.5523550522352,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1058,
  1058,
  'JARYTHERM DBT 200K   TOT C - 200 L',
  '200 L',
  0,
  'L',
  1038.1156617411766,
  830.4925293929414,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1059,
  1059,
  'KALOR 3037 50K NEU C - 50 L',
  '50 L',
  0,
  'L',
  19059,
  15247.2,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1060,
  1060,
  'Lissoflix APZ 2090 - 206 L',
  '206 L',
  0,
  'L',
  452.88000000000005,
  362.3040000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1061,
  1061,
  'LUBRILAM CLEANER H1 208L   TOT C - 208 L',
  '208 L',
  0,
  'L',
  425.9758098270588,
  340.7806478616471,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1062,
  1062,
  'MARTOL EV 10 CF 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  544.6100653364706,
  435.6880522691765,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1063,
  1063,
  'MARTOL FMO 15 CF 208L TOT MY - 208 L',
  '208 L',
  0,
  'L',
  1405,
  1124,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1064,
  1064,
  'MARTOL LVG 25 AQ 208L TOT SG - 208 L',
  '208 L',
  0,
  'L',
  475.82370757918557,
  380.6589660633485,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1065,
  1065,
  'MISOLA MAP SH 220 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  848.403879332353,
  678.7231034658824,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1066,
  1066,
  'MULTIPLEX EP 2 180K ELF C - 180 L',
  '180 L',
  0,
  'L',
  687.993591764706,
  550.3948734117648,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1067,
  1067,
  'MULTIS COMPLEX EP 2 180K TOT T AE - 180 L',
  '180 L',
  0,
  'L',
  623.9620588235296,
  499.16964705882367,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1068,
  1068,
  'MULTIS COMPLEX EP 2 18K TOT T AE - 18 L',
  '18 L',
  0,
  'L',
  641,
  512.8000000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1069,
  1069,
  'MULTIS COMPLEX EP 2 18K TOT T AE - 18 L',
  '18 L',
  0,
  'L',
  641,
  512.8000000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1070,
  1070,
  'MULTIS COMPLEX EP 3 18K TOT T AE - 18 L',
  '18 L',
  0,
  'L',
  645,
  516,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1071,
  1071,
  'MULTIS COMPLEX EP 3 18K TOT T AE - 18 L',
  '18 L',
  0,
  'L',
  645,
  516,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1072,
  1072,
  'MULTIS COMPLEX EP 3 50K TOT C - 50 L',
  '50 L',
  0,
  'L',
  827.82947,
  662.2635760000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1073,
  1073,
  'MULTIS COMPLEX HV 2 180K TOT T AE - 180 L',
  '180 L',
  0,
  'L',
  653.0282450980393,
  522.4225960784314,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1074,
  1074,
  'MULTIS COMPLEX HV 2 MOLY 180K+L TOT C - 180 L',
  '180 L',
  0,
  'L',
  788.9707311764706,
  631.1765849411765,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1075,
  1075,
  'MULTIS COMPLEX XHV 2 MOLY 180K+L TOT C - 180 L',
  '180 L',
  0,
  'L',
  560,
  448,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1076,
  1076,
  'MULTIS HP 2 MOLY 180K TOT T AE - 180 L',
  '180 L',
  0,
  'L',
  540,
  432,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1077,
  1077,
  'MULTIS COMPLEX SHD 220 17K TOT C - 17 L',
  '17 L',
  0,
  'L',
  1228.9468682352938,
  983.1574945882351,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1078,
  1078,
  'MULTIS EP 1                 18K    TOT Y AE - 18 L',
  '18 L',
  0,
  'L',
  570.2600980392157,
  456.20807843137254,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1079,
  1079,
  'MULTIS MS 2 180K TOT AE - 180 L',
  '180 L',
  0,
  'L',
  620.0686666666667,
  496.05493333333334,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1080,
  1080,
  'MULTIS MS 2 18K TOT AE - 18 L',
  '18 L',
  0,
  'L',
  649.35,
  519.48,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1081,
  1081,
  'NATERIA MX 40 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  578.8510061158823,
  463.0808048927059,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1082,
  1082,
  'NEVASTANE AW 68 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  423,
  338.40000000000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1083,
  1083,
  'NEVASTANE EP 220 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  522,
  417.6,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1084,
  1084,
  'NEVASTANE EP 320 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  525.6,
  420.48,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1085,
  1085,
  'NEVASTANE SH 46 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  675,
  540,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1086,
  1086,
  'NEVASTANE SY 220 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  1465.2,
  1172.16,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1087,
  1087,
  'NEVASTANE SY 460 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  1485,
  1188,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1088,
  1088,
  'NEVASTANE XSH 150 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  801,
  640.8000000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1089,
  1089,
  'NEVASTANE XSH 320 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  952.2,
  761.7600000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1090,
  1090,
  'NEVASTANE XSH 460 20L    TOT C - 20 L',
  '20 L',
  0,
  'L',
  991.8,
  793.44,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1091,
  1091,
  'NEVASTANE CHAIN OIL XT 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  1297.1224462059652,
  1037.6979569647722,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1092,
  1092,
  'NEVASTANE SH 100 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  835.143515952941,
  668.1148127623528,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1093,
  1093,
  'NEVASTANE SH 32 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  660.7373763764706,
  528.5899011011765,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1094,
  1094,
  'NEVASTANE SY 220   25K TOT C - 23.65 L',
  '23.65 L',
  0,
  'L',
  850.5288595625,
  680.4230876500001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1095,
  1095,
  'NEVASTANE SY 320         25K    TOT C - 25 L',
  '25 L',
  0,
  'L',
  882.45,
  705.96,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1096,
  1096,
  'NEVASTANE SY 320 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  1512.5227196635294,
  1210.0181757308235,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1097,
  1097,
  'NEVASTANE XMF 1 16K TOT C - 16 L',
  '16 L',
  0,
  'L',
  748.0095605882352,
  598.4076484705882,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1098,
  1098,
  'NEVASTANE XMF 2 16K TOT C - 16 L',
  '16 L',
  0,
  'L',
  791.1094117647059,
  632.8875294117647,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1099,
  1099,
  'NEVASTANE XS 320         16K    TOT C - 16 L',
  '16 L',
  0,
  'L',
  1154.818024117647,
  923.8544192941176,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1100,
  1100,
  'NEVASTANE XS 80 16K TOT C - 16 L',
  '16 L',
  0,
  'L',
  1028.9258600000003,
  823.1406880000003,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1101,
  1101,
  'NEVASTANE XS 80         180K    TOT C - 180 L',
  '180 L',
  0,
  'L',
  997.1839735294117,
  797.7471788235293,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1102,
  1102,
  'NEVASTANE XS 80         50K    TOT C - 50 L',
  '50 L',
  0,
  'L',
  1029.4816752941176,
  823.5853402352941,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1103,
  1103,
  'NEVASTANE XSH 220 20L TOT C - 20 L',
  '20 L',
  0,
  'L',
  957.7594389023529,
  766.2075511218824,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1104,
  1104,
  'ORITES DS 270 200K TOT C - 200 L',
  '200 L',
  0,
  'L',
  330,
  264,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1105,
  1105,
  'PLANETELF ACD 150 FY - 20 L',
  '20 L',
  0,
  'L',
  1224.2099686400002,
  979.3679749120001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1106,
  1106,
  'PLANETELF ACD 68 - 20 L',
  '20 L',
  0,
  'L',
  1058.5981923888235,
  846.8785539110588,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1107,
  1107,
  'RUBIA TIR 9900 FE 5W30     208L    TOT   C - 208 L',
  '208 L',
  0,
  'L',
  935.0840978506787,
  748.0672782805431,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1108,
  1108,
  'SERIOLA CLEANER         20 L      TOT C - 20 L',
  '20 L',
  0,
  'L',
  656.9613948459626,
  525.5691158767701,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1109,
  1109,
  'STATERMELF EP 2 50K TOT C - 50 L',
  '50 L',
  0,
  'L',
  961.2600000000001,
  769.0080000000002,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1110,
  1110,
  'STATERMIC X400           4C1K   TOT Z - 4 L',
  '4 L',
  0,
  'L',
  25357.099477647058,
  20285.67958211765,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1111,
  1111,
  'TRANS. DUAL 9 FE 75W90   208L   TOT C - 208 L',
  '208 L',
  0,
  'L',
  857,
  685.6,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1112,
  1112,
  'TRANS. DUAL 9 FE 75W90   208L   TOT C - 208 L',
  '208 L',
  0,
  'L',
  857,
  685.6,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1113,
  1113,
  'TRANS. DUAL 9 FE 75W90   60L    TOT C - 60 L',
  '60 L',
  0,
  'L',
  914.6400000000001,
  731.7120000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1114,
  1114,
  'TRANS. DUAL 9 FE 75W90   60L    TOT C - 60 L',
  '60 L',
  0,
  'L',
  914.6400000000001,
  731.7120000000001,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1115,
  1115,
  'TRANS. GEAR 9V FE 75W90 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  1028.97,
  823.176,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1116,
  1116,
  'TRANS. GEAR 9V FE 75W90 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  1028.97,
  823.176,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1117,
  1117,
  'TRAXIUM AXLE 8 FE 75W140 208L   TOT C - 208 L',
  '208 L',
  0,
  'L',
  807.6259223811763,
  646.1007379049411,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1118,
  1118,
  'VALONA BR 9015 HC - 208 L',
  '208 L',
  0,
  'L',
  534.6409622211764,
  427.7127697769412,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1119,
  1119,
  'VALONA GR 7012 HC - 208 L',
  '208 L',
  0,
  'L',
  525.5169883435294,
  420.4135906748236,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1120,
  1120,
  'VALONA GR 7522 HC 208L   TOT C - 208 L',
  '208 L',
  0,
  'L',
  505.0137837835294,
  404.0110270268235,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1121,
  1121,
  'VALONA MQL 3046 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  745.9553639247059,
  596.7642911397647,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1122,
  1122,
  'VALONA MS 7023 HC - 208 L',
  '208 L',
  0,
  'L',
  461.5499219211764,
  369.23993753694117,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1123,
  1123,
  'VULSOL MSF 7200 208L TOT C - 208 L',
  '208 L',
  0,
  'L',
  814.5391892582354,
  651.6313514065884,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1124,
  1124,
  'CERAN AD PLUS 180K TOT C - 180 L',
  '180 L',
  0,
  'L',
  644.2654276470588,
  515.4123421176471,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1125,
  1125,
  'CERAN AD PLUS 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  752.7758169934642,
  602.2206535947714,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1126,
  1126,
  'CERAN CA 180K TOT C - 180 L',
  '180 L',
  0,
  'L',
  614.5293094117648,
  491.6234475294118,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1127,
  1127,
  'CERAN CA 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  731.3955164705882,
  585.1164131764706,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1128,
  1128,
  'CERAN MS 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  857.1185194117646,
  685.6948155294117,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1129,
  1129,
  'CERAN XM 100 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  728.7614352941176,
  583.0091482352941,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1130,
  1130,
  'CERAN XM 220 180K TOT C - 180 L',
  '180 L',
  0,
  'L',
  632.6084019607845,
  506.0867215686276,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1131,
  1131,
  'CERAN XM 220 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  720.6583333333334,
  576.5266666666668,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1132,
  1132,
  'CERAN XM 460 180K TOT C - 180 L',
  '180 L',
  0,
  'L',
  639.1639705882354,
  511.3311764705884,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);
INSERT INTO product_variants_v3 (
  id, product_id, variant_name, pack_size, pack_size_value, pack_size_unit,
  selling_price, cost_price, margin_percent, minimum_order_qty, in_stock, stock_quantity, created_at
) VALUES (
  1133,
  1133,
  'CERAN XM 460 18K TOT C - 18 L',
  '18 L',
  0,
  'L',
  730.0834640522876,
  584.0667712418301,
  null,
  1,
  1,
  0,
  '2025-09-16 14:32:43'
);

-- ================================================================
-- 7. LEGACY PRODUCTS (for compatibility) - 41 PRODUCTS
-- ================================================================
DELETE FROM products;
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  1,
  'EUTECTRODE-670-2.40MM',
  2,
  1,
  'EutecTrode 670',
  'Professional welding electrode - EutecTrode 670',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  2,
  'XUPER-680-CGS-2.40MM',
  2,
  1,
  'Xuper 680 CGS',
  'Professional welding electrode - Xuper 680 CGS',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  3,
  'EUTECTRODE-680-2.40MM',
  2,
  1,
  'EutecTrode 680',
  'Professional welding electrode - EutecTrode 680',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  4,
  'XUPER-680S-1.60MM',
  2,
  1,
  'Xuper 680S',
  'Professional welding electrode - Xuper 680S',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  5,
  'XUPER-NUCLEOTEC-2222-2.40MM',
  2,
  1,
  'Xuper Nucleotec 2222',
  'Professional welding electrode - Xuper Nucleotec 2222',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  6,
  'XHD-2222-2.40MM',
  2,
  1,
  'XHD 2222',
  'Professional welding electrode - XHD 2222',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  7,
  'EUTECTRODE-EC-6821-2.50MM',
  2,
  1,
  'EutecTrode EC 6821',
  'Professional welding electrode - EutecTrode EC 6821',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  8,
  'STAINTRODE-D-2.50MM',
  2,
  1,
  'StainTrode D',
  'Professional welding electrode - StainTrode D',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  9,
  'EUTECTRODE-EC-33300-3.20MM',
  2,
  1,
  'EutecTrode EC 33300',
  'Professional welding electrode - EutecTrode EC 33300',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  10,
  'STAINTRODE-AMOL-2.40MM',
  2,
  1,
  'StainTrode A-Mo-L',
  'Professional welding electrode - StainTrode A-Mo-L',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  11,
  'STAINTRODE-BL-2.40MM',
  2,
  1,
  'StainTrode BL',
  'Professional welding electrode - StainTrode BL',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  12,
  'STAINTRODE-BMOL-2.40MM',
  2,
  1,
  'StainTrode B-Mo-L',
  'Professional welding electrode - StainTrode B-Mo-L',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  13,
  'EUTECTRODE-27-3.20MM',
  2,
  1,
  'EutecTrode 27',
  'Professional welding electrode - EutecTrode 27',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  14,
  'XYRON-223-2.50MM',
  2,
  1,
  'Xyron 223',
  'Professional welding electrode - Xyron 223',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  15,
  'XYRON-224-3.20MM',
  2,
  1,
  'Xyron 224',
  'Professional welding electrode - Xyron 224',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  16,
  'XUPER-2240-3.20MM',
  2,
  1,
  'Xuper 2240',
  'Professional welding electrode - Xuper 2240',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  17,
  'XUPER-2233N-3.20MM',
  2,
  1,
  'Xuper 22*33N',
  'Professional welding electrode - Xuper 22*33N',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  18,
  'EUTECTRODE-EC-2026-2.50MM',
  2,
  1,
  'EutecTrode EC 2026',
  'Professional welding electrode - EutecTrode EC 2026',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  19,
  'EUTECTRODE-2-3.20MM',
  2,
  1,
  'EutecTrode 2',
  'Professional welding electrode - EutecTrode 2',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  20,
  'EUTECTRODE-2B-3.20MM',
  2,
  1,
  'EutecTrode 2B',
  'Professional welding electrode - EutecTrode 2B',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  21,
  'EUTECTRODE-700-3.20MM',
  2,
  1,
  'EutecTrode 700',
  'Professional welding electrode - EutecTrode 700',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  22,
  'XHD-646-3.20MM',
  2,
  1,
  'XHD 646',
  'Professional welding electrode - XHD 646',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  23,
  'EUTECTRODE-6450-3.20MM',
  2,
  1,
  'EutecTrode 6450',
  'Professional welding electrode - EutecTrode 6450',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  24,
  'XHD-6710-3.20MM',
  2,
  1,
  'XHD 6710',
  'Professional welding electrode - XHD 6710',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  25,
  'XHD-6715-3.20MM',
  2,
  1,
  'XHD 6715',
  'Professional welding electrode - XHD 6715',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  26,
  'CHROMCARB-N-6006-2.50MM',
  2,
  1,
  'ChromCarb N 6006',
  'Professional welding electrode - ChromCarb N 6006',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  27,
  'XHD-ABRATEC-6777-3.20MM',
  2,
  1,
  'XHD ABRATEC 6777',
  'Professional welding electrode - XHD ABRATEC 6777',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  28,
  'TOOLTECTIC-6NHSS-3.20MM',
  2,
  1,
  'ToolTectic 6NHSS',
  'Professional welding electrode - ToolTectic 6NHSS',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  29,
  'EUTECDUR-N-9060-3.20MM',
  2,
  1,
  'EutecDur N 9060',
  'Professional welding electrode - EutecDur N 9060',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  30,
  'EUTECDUR-N-9080-3.20MM',
  2,
  1,
  'EutecDur N 9080',
  'Professional welding electrode - EutecDur N 9080',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  31,
  'EUTECDUR-N-9120-3.20MM',
  2,
  1,
  'EutecDur N 9120',
  'Professional welding electrode - EutecDur N 9120',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  32,
  'EUTECTRODE-EC-7008-6.30MM',
  2,
  1,
  'EutecTrode EC 7008',
  'Professional welding electrode - EutecTrode EC 7008',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  33,
  'EUTECTRODE-6717-3.20MM',
  2,
  1,
  'EutecTrode 6717',
  'Professional welding electrode - EutecTrode 6717',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  34,
  'EUTECTRODE-EC-6610-3.20MM',
  2,
  1,
  'EutecTrode EC 6610',
  'Professional welding electrode - EutecTrode EC 6610',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  35,
  'EUTECTRODE-EC-6611-3.20MM',
  2,
  1,
  'EutecTrode EC 6611',
  'Professional welding electrode - EutecTrode EC 6611',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  36,
  'EUTECTRODE-EC-6822-3.20MM',
  2,
  1,
  'EutecTrode EC 6822',
  'Professional welding electrode - EutecTrode EC 6822',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  37,
  'SUGARTEC-MAX-45-3.20MM',
  2,
  1,
  'SugarTec Max 45',
  'Professional welding electrode - SugarTec Max 45',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  38,
  'EUTECTRODE-2101E-3.20MM',
  2,
  1,
  'EutecTrode 2101E',
  'Professional welding electrode - EutecTrode 2101E',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  39,
  'EXOTRODE-3.20MM',
  2,
  1,
  'ExoTrode',
  'Professional welding electrode - ExoTrode',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  40,
  'EUTECCHAMFERTRODE-3.20MM',
  2,
  1,
  'Eutec-ChamferTrode',
  'Professional welding electrode - Eutec-ChamferTrode',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);
INSERT INTO products (
  id, sku, brand_id, category_id, name, description, default_hsn_id,
  default_uom_id, product_type, is_active, created_at, updated_at
) VALUES (
  41,
  'XHD-2800-3.20MM',
  2,
  1,
  'XHD 2800',
  'Professional welding electrode - XHD 2800',
  1,
  1,
  'Electrode',
  1,
  '2025-09-13 11:36:04',
  '2025-09-13 11:36:04'
);

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
