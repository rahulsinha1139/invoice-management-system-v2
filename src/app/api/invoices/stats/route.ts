import { NextResponse } from 'next/server';
import { DatabaseService } from '@/lib/database';

export async function GET() {
  try {
    const stats = DatabaseService.getInvoiceStats();

    return NextResponse.json({
      success: true,
      data: stats,
    });
  } catch (error) {
    console.error('Error fetching invoice stats:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error',
    }, { status: 500 });
  }
}