import { NextResponse } from 'next/server';
import { DatabaseService } from '@/lib/database';

export async function GET() {
  try {
    const nextNumber = DatabaseService.getNextInvoiceNumber();

    return NextResponse.json({
      success: true,
      data: {
        next_number: nextNumber
      }
    });
  } catch (error) {
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 });
  }
}