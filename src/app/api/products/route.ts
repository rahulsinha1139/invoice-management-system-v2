import { NextRequest, NextResponse } from 'next/server';
import { DatabaseService } from '@/lib/database';

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);
    const hsn_code = searchParams.get('hsn_code') || undefined;
    const category_id = searchParams.get('category_id');
    const brand_id = searchParams.get('brand_id');
    const search = searchParams.get('search') || undefined;

    const filters = {
      hsn_code,
      category_id: category_id ? parseInt(category_id) : undefined,
      brand_id: brand_id ? parseInt(brand_id) : undefined,
      search
    };

    const products = DatabaseService.getProducts(filters);

    return NextResponse.json({
      success: true,
      data: products,
      count: products.length,
      filters
    });
  } catch (error) {
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 });
  }
}