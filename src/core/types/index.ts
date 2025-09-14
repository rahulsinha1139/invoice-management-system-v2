/**
 * Core TypeScript interfaces for Invoice Management System
 * Based on database schema and business requirements
 */

// ====================================================================
// DATABASE ENTITY INTERFACES
// ====================================================================

export interface Company {
  id: number;
  legal_name: string;
  trade_name?: string;
  gstin: string;
  pan: string;
  address_line1: string;
  address_line2?: string;
  city: string;
  state: string;
  pin: string;
  phone?: string;
  email?: string;
  bank_name: string;
  bank_ifsc: string;
  bank_ac_no: string;
  authorized_distributor?: string;
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

export interface Brand {
  id: number;
  name: string;
  logo_url?: string;
  display_order: number;
  is_active: boolean;
  created_at: string;
}

export interface Category {
  id: number;
  name: string;
  description?: string;
  default_hsn_code?: string;
  display_order: number;
  is_active: boolean;
  created_at: string;
}

export interface UOM {
  id: number;
  code: string;
  description: string;
  is_weight: boolean;
  is_volume: boolean;
  is_count: boolean;
  created_at: string;
}

export interface HSNCode {
  id: number;
  code: string;
  description: string;
  gst_rate_slab: number;
  effective_from: string;
  effective_to?: string;
  is_active: boolean;
  created_at: string;
}

export interface Customer {
  id: number;
  name: string;
  gstin?: string;
  pan?: string;
  email?: string;
  phone?: string;
  billing_address: string;
  shipping_address?: string;
  city?: string;
  state: string;
  state_code: string;
  place_of_supply: string;
  pin?: string;
  contact_person?: string;
  payment_terms: string;
  credit_limit: number;
  is_active: boolean;
  created_at: string;
  updated_at: string;
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
  product_type?: string;
  specifications?: any;
  is_active: boolean;
  created_at: string;
  updated_at: string;

  // Joined fields
  brand?: Brand;
  category?: Category;
  default_hsn?: HSNCode;
  default_uom?: UOM;
  hsn_code?: string;
  brand_name?: string;
  category_name?: string;
  uom_code?: string;
  gst_rate_slab?: number;
}

export interface ProductVariant {
  id: number;
  product_id: number;
  variant_code?: string;
  diameter_mm?: number;
  pack_size_value: number;
  pack_size_uom_id: number;
  selling_uom_id: number;
  conversion_factor: number;
  weight_kg?: number;
  attributes_json?: string;
  effective_hsn_id?: number;
  barcode?: string;
  is_active: boolean;
  created_at: string;
  updated_at: string;

  // Joined fields
  product?: Product;
  pack_size_uom?: UOM;
  selling_uom?: UOM;
  effective_hsn?: HSNCode;
  product_name?: string;
  pack_size_uom_code?: string;
  selling_uom_code?: string;
  sku?: string;
}

export interface PriceList {
  id: number;
  name: string;
  description?: string;
  effective_date: string;
  expiry_date?: string;
  currency: string;
  is_active: boolean;
  created_by?: string;
  approved_by?: string;
  approval_date?: string;
  created_at: string;
  updated_at: string;
}

export interface PriceListItem {
  id: number;
  price_list_id: number;
  product_variant_id: number;
  unit_price: number;
  mrp?: number;
  discount_pct: number;
  min_qty: number;
  tax_inclusive: boolean;
  cost_price?: number;
  margin_pct?: number;
  created_at: string;

  // Joined fields
  price_list?: PriceList;
  product_variant?: ProductVariant;
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
  company?: Company;
  customer?: Customer;
  lines?: InvoiceLine[];
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

  // Joined fields
  product?: Product;
  product_variant?: ProductVariant;
}

// ====================================================================
// REQUEST/RESPONSE INTERFACES
// ====================================================================

export interface CustomerCreateRequest {
  name: string;
  gstin?: string;
  pan?: string;
  email?: string;
  phone?: string;
  billing_address: string;
  shipping_address?: string;
  city?: string;
  state: string;
  state_code: string;
  place_of_supply: string;
  pin?: string;
  contact_person?: string;
  payment_terms?: string;
  credit_limit?: number;
}

export interface CustomerUpdateRequest extends Partial<CustomerCreateRequest> {
  id: number;
}

export interface ProductSearchFilters {
  brand_id?: number;
  category_id?: number;
  search_term?: string;
  hsn_code?: string;
  is_active?: boolean;
}

export interface InvoiceLineRequest {
  product_variant_id: number;
  quantity: number;
  unit_price?: number; // If not provided, will be fetched from price list
  discount_pct?: number;
  remarks?: string;
  delivery_date?: string;
}

// Extended interface for UI components that need display information
export interface InvoiceLineRequestExtended extends InvoiceLineRequest {
  product_id: number;
  product_name: string;
  description?: string;
  hsn_code: string;
  uom: string;
  pack_size_value?: number;
  pack_size_uom?: string;
  discount_amount?: number;
  cgst_pct?: number;
  sgst_pct?: number;
  igst_pct?: number;
  cess_pct?: number;
}

export interface InvoiceCreateRequest {
  customer_id: number;
  invoice_date: string;
  due_date?: string;
  payment_method: 'NEFT_RTGS' | 'CHEQUE';
  payment_terms?: string;
  lines: InvoiceLineRequest[];
  notes?: string;
  terms_and_conditions?: string;
  delivery_instructions?: string;
}

export interface InvoiceUpdateRequest extends Partial<InvoiceCreateRequest> {
  id: number;
  status?: 'DRAFT' | 'ISSUED' | 'PAID' | 'CANCELLED';
}

// ====================================================================
// CALCULATION INTERFACES
// ====================================================================

export interface TaxCalculation {
  taxable_amount: number;
  cgst_rate: number;
  sgst_rate: number;
  igst_rate: number;
  cess_rate: number;
  cgst_amount: number;
  sgst_amount: number;
  igst_amount: number;
  cess_amount: number;
  total_tax: number;
  grand_total: number;
  is_interstate: boolean;
}

export interface LineCalculation extends TaxCalculation {
  line_subtotal: number;
  discount_amount: number;
  line_total: number;
}

export interface InvoiceCalculation {
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
  total_in_words: string;
  lines: LineCalculation[];
}

// ====================================================================
// UI/FORM INTERFACES
// ====================================================================

export interface SelectOption {
  value: string | number;
  label: string;
  data?: any;
}

export interface FormErrors {
  [key: string]: string | undefined;
}

export interface PaginationInfo {
  page: number;
  limit: number;
  total: number;
  totalPages: number;
}

export interface SearchResult<T> {
  data: T[];
  pagination: PaginationInfo;
}

// ====================================================================
// BUSINESS LOGIC INTERFACES
// ====================================================================

export interface BusinessValidationError {
  field: string;
  message: string;
  code: string;
}

export interface BusinessValidationResult {
  isValid: boolean;
  errors: BusinessValidationError[];
}

export interface NumberToWordsOptions {
  currency?: string;
  locale?: string;
}

// ====================================================================
// APPLICATION STATE INTERFACES
// ====================================================================

export interface AppState {
  isInitialized: boolean;
  currentCompany: Company | null;
  activeCustomers: Customer[];
  activeBrands: Brand[];
  activeCategories: Category[];
  activeUOMs: UOM[];
  activeHSNCodes: HSNCode[];
  currentPriceList: PriceList | null;
}

export interface InvoiceFormState {
  invoice: Partial<Invoice>;
  lines: InvoiceLineRequest[];
  calculations: InvoiceCalculation | null;
  isCalculating: boolean;
  isDirty: boolean;
  errors: FormErrors;
}

// ====================================================================
// API RESPONSE INTERFACES
// ====================================================================

export interface ApiResponse<T = any> {
  success: boolean;
  data?: T;
  error?: string;
  errors?: BusinessValidationError[];
}

export interface DatabaseResult<T = any> {
  data: T;
  changes: number;
  lastInsertRowid?: number;
}