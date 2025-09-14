import { NextResponse } from 'next/server';
import Database from 'better-sqlite3';
import path from 'path';

export async function GET() {
  try {
    const dbPath = path.join(process.cwd(), 'data', 'invoice.db');
    console.log('Database path:', dbPath);

    // Test database connection
    const db = new Database(dbPath);

    // Simple test query
    const result = db.prepare('SELECT COUNT(*) as count FROM products WHERE is_active = 1').get();

    db.close();

    return NextResponse.json({
      success: true,
      message: 'Database connection successful',
      dbPath,
      productCount: (result as any).count
    });
  } catch (error) {
    console.error('Database test error:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error',
      stack: error instanceof Error ? error.stack : null
    }, { status: 500 });
  }
}