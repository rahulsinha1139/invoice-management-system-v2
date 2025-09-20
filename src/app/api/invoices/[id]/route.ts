import { NextRequest, NextResponse } from 'next/server';
import { DatabaseService } from '@/lib/database';

// GET /api/invoices/[id] - Get specific invoice with line items
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const resolvedParams = await params;
  try {
    const invoiceId = parseInt(resolvedParams.id, 10);

    if (isNaN(invoiceId)) {
      return NextResponse.json({
        success: false,
        error: 'Invalid invoice ID',
      }, { status: 400 });
    }

    const invoice = DatabaseService.getInvoiceById(invoiceId);

    if (!invoice) {
      return NextResponse.json({
        success: false,
        error: 'Invoice not found',
      }, { status: 404 });
    }

    return NextResponse.json({
      success: true,
      data: invoice,
    });
  } catch (error) {
    console.error('Error fetching invoice:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error',
    }, { status: 500 });
  }
}

// PUT /api/invoices/[id] - Update invoice
export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const resolvedParams = await params;
  try {
    const invoiceId = parseInt(resolvedParams.id, 10);

    if (isNaN(invoiceId)) {
      return NextResponse.json({
        success: false,
        error: 'Invalid invoice ID',
      }, { status: 400 });
    }

    const updateData = await request.json();
    const invoice = DatabaseService.updateInvoice(invoiceId, updateData);

    return NextResponse.json({
      success: true,
      data: invoice,
      message: 'Invoice updated successfully',
    });
  } catch (error) {
    console.error('Error updating invoice:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Failed to update invoice',
    }, { status: 500 });
  }
}

// DELETE /api/invoices/[id] - Cancel/delete invoice
export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const resolvedParams = await params;
  try {
    const invoiceId = parseInt(resolvedParams.id, 10);

    if (isNaN(invoiceId)) {
      return NextResponse.json({
        success: false,
        error: 'Invalid invoice ID',
      }, { status: 400 });
    }

    DatabaseService.cancelInvoice(invoiceId);

    return NextResponse.json({
      success: true,
      message: 'Invoice cancelled successfully',
    });
  } catch (error) {
    console.error('Error cancelling invoice:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Failed to cancel invoice',
    }, { status: 500 });
  }
}