import { NextResponse } from 'next/server';
import { DatabaseService } from '@/lib/database';

export async function GET() {
  try {
    const hsnCodes = DatabaseService.getHSNCodes();

    return NextResponse.json({
      success: true,
      data: hsnCodes,
      count: hsnCodes.length
    });
  } catch (error) {
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 });
  }
}