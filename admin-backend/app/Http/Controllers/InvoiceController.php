<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;
use PDF;

class InvoiceController extends Controller
{
    public function getInvoiceList(Request $request)
    {
        try {
            $perPage = $request->per_page ?? 10;
            $invoices = Invoice::with(['checkout.checkin'])
                ->orderBy('created_at', 'desc')
                ->paginate($perPage);

            return response()->json([
                'success' => true,
                'data' => $invoices,
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error retrieving invoice list: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function getInvoiceDetails($invoiceNumber)
    {
        try {
            $invoice = Invoice::with([
                'checkout.checkin',
                'checkout.payments',
                'items'
            ])->where('invoice_number', $invoiceNumber)->firstOrFail();

            return response()->json([
                'success' => true,
                'data' => $invoice,
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error retrieving invoice details: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function generatePdf($invoiceNumber)
    {
        try {
            $invoice = Invoice::with([
                'checkout.checkin',
                'checkout.payments',
                'items'
            ])->where('invoice_number', $invoiceNumber)->firstOrFail();

            // Calculate totals
            $subtotal = $invoice->items->sum('amount');
            $taxAmount = $invoice->items->sum(function($item) {
                return ($item->amount * $item->tax_rate) / 100;
            });
            $total = $subtotal + $taxAmount;

            return response()->json([
                'success' => true,
                'data' => [
                    'invoice' => $invoice,
                    'subtotal' => $subtotal,
                    'taxAmount' => $taxAmount,
                    'total' => $total,
                    'date' => now()->format('d/m/Y'),
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error generating PDF: ' . $e->getMessage(),
            ], 500);
        }
    }
}