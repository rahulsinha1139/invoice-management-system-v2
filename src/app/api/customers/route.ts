import { NextResponse } from 'next/server';
import { DatabaseService } from '@/lib/database';

export async function GET() {
  try {
    const customers = DatabaseService.getCustomers();

    return NextResponse.json({
      success: true,
      data: customers,
      count: customers.length
    });
  } catch (error) {
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 });
  }
}

export async function POST(request: Request) {
  try {
    const customerData = await request.json();

    // Validate required fields
    if (!customerData.name || !customerData.billing_address) {
      return NextResponse.json({
        success: false,
        error: 'Name and billing address are required'
      }, { status: 400 });
    }

    const newCustomer = DatabaseService.createCustomer(customerData);

    return NextResponse.json({
      success: true,
      data: newCustomer
    });
  } catch (error) {
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 });
  }
}