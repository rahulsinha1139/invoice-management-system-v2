import { NextRequest, NextResponse } from 'next/server';
import { getDatabase } from '@/lib/database';

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const category = searchParams.get('category');
  const search = searchParams.get('search');
  const hsn = searchParams.get('hsn');
  const page = parseInt(searchParams.get('page') || '1');
  const limit = parseInt(searchParams.get('limit') || '50');
  const offset = (page - 1) * limit;

  try {
    const db = getDatabase();

    let query = `
      SELECT
        p.id,
        p.product_name,
        p.product_code,
        p.hsn_code,
        p.base_price,
        p.business_category,
        p.product_bucket,
        p.specifications,
        p.tags,
        pc.name as category_name,
        pc.icon as category_icon,
        pc.color_code,
        pv.pack_size,
        pv.pack_size_value,
        pv.pack_size_unit,
        pv.selling_price,
        pv.in_stock,
        pv.stock_quantity
      FROM products_v3 p
      LEFT JOIN product_categories pc ON p.category_id = pc.id
      LEFT JOIN product_variants_v3 pv ON p.id = pv.product_id
      WHERE p.is_active = 1
    `;

    const params: any[] = [];

    if (category) {
      query += ` AND pc.name = ?`;
      params.push(category);
    }

    if (hsn) {
      query += ` AND p.hsn_code = ?`;
      params.push(hsn);
    }

    if (search) {
      query += ` AND (
        p.product_name LIKE ? OR
        p.product_code LIKE ? OR
        p.business_category LIKE ? OR
        p.product_bucket LIKE ? OR
        p.tags LIKE ?
      )`;
      const searchTerm = `%${search}%`;
      params.push(searchTerm, searchTerm, searchTerm, searchTerm, searchTerm);
    }

    query += ` ORDER BY pc.name, p.product_name LIMIT ? OFFSET ?`;
    params.push(limit, offset);

    const products = db.prepare(query).all(...params);

    // Get category statistics
    const categoryStats = db.prepare(`
      SELECT
        pc.name as category_name,
        pc.icon,
        pc.color_code,
        pc.description,
        COUNT(DISTINCT p.id) as product_count,
        ROUND(AVG(p.base_price), 2) as avg_price,
        MIN(p.base_price) as min_price,
        MAX(p.base_price) as max_price
      FROM product_categories pc
      LEFT JOIN products_v3 p ON pc.id = p.category_id AND p.is_active = 1
      GROUP BY pc.id, pc.name, pc.icon, pc.color_code, pc.description
      ORDER BY product_count DESC
    `).all();

    // Get total count for pagination
    let countQuery = `
      SELECT COUNT(DISTINCT p.id) as total
      FROM products_v3 p
      LEFT JOIN product_categories pc ON p.category_id = pc.id
      WHERE p.is_active = 1
    `;

    const countParams: any[] = [];

    if (category) {
      countQuery += ` AND pc.name = ?`;
      countParams.push(category);
    }

    if (hsn) {
      countQuery += ` AND p.hsn_code = ?`;
      countParams.push(hsn);
    }

    if (search) {
      countQuery += ` AND (
        p.product_name LIKE ? OR
        p.product_code LIKE ? OR
        p.business_category LIKE ? OR
        p.product_bucket LIKE ? OR
        p.tags LIKE ?
      )`;
      const searchTerm = `%${search}%`;
      countParams.push(searchTerm, searchTerm, searchTerm, searchTerm, searchTerm);
    }

    const { total } = db.prepare(countQuery).get(...countParams) as { total: number };

    return NextResponse.json({
      products,
      categoryStats,
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit),
        hasNext: page * limit < total,
        hasPrev: page > 1
      }
    });

  } catch (error) {
    console.error('Database error:', error);
    return NextResponse.json(
      { error: 'Failed to fetch products', details: error },
      { status: 500 }
    );
  }
}