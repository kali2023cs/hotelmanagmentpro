<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\CheckinMaster;
use App\Models\CheckinRoomTrans;
use App\Models\CheckoutMaster;
use App\Models\CheckoutPayment;
use App\Models\Invoice;
use App\Models\RoomMaster;
use Carbon\Carbon;

class CheckoutController extends Controller
{

    public function getCheckinDetails($checkinId)
    {
        try {
            $checkin = CheckinMaster::find($checkinId);
            
            if (!$checkin) {
                return response()->json([
                    'success' => false,
                    'message' => 'Check-in not found'
                ], 404);
            }

            return response()->json([
                'success' => true,
                'data' => [
                    'guestInfo' => $checkin
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching check-in details: ' . $e->getMessage()
            ], 500);
        }
    }

    public function getCheckinRoomDetails($checkinId)
    {
        try {
            $roomDetails = CheckinRoomTrans::where('checkin_id', $checkinId)
                ->with(['roomType' => function($query) {
                    $query->select('id', 'room_type_name');
                }])
                ->with(['room' => function($query) {
                    $query->select('id', 'room_no');
                }])
                ->get();

            if ($roomDetails->isEmpty()) {
                return response()->json([
                    'success' => false,
                    'message' => 'No room details found for this check-in'
                ], 404);
            }

            // Format the response with additional room type names and room numbers
            $formattedDetails = $roomDetails->map(function($detail) {
                return [
                    'id' => $detail->id,
                    'room_type_id' => $detail->room_type_id,
                    'room_type_name' => $detail->roomType->room_type_name ?? null,
                    'room_id' => $detail->room_id,
                    'room_no' => $detail->room->room_no ?? null,
                    'rate_plan_id' => $detail->rate_plan_id,
                    'guest_name' => $detail->guest_name,
                    'contact' => $detail->contact,
                    'male' => $detail->male,
                    'female' => $detail->female,
                    'extra' => $detail->extra,
                    'net_rate' => $detail->net_rate,
                    'disc_type' => $detail->disc_type,
                    'disc_val' => $detail->disc_val,
                    'total' => $detail->total,
                    'created_at' => $detail->created_at,
                    'updated_at' => $detail->updated_at
                ];
            });

            return response()->json([
                'success' => true,
                'data' => [
                    'roomDetails' => $formattedDetails
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching room details: ' . $e->getMessage()
            ], 500);
        }
    }

    private static function calculateNights($checkInDate, $checkOutDate)
    {
        $checkIn = Carbon::parse($checkInDate);
        $checkOut = Carbon::parse($checkOutDate);
        return $checkOut->diffInDays($checkIn);
    }

    public function processCheckout(Request $request)
    {
        $request->validate([
            'checkin_id' => 'required|exists:checkin_master,id',
            'actual_checkout_datetime' => 'required|date',
            'checkout_remarks' => 'nullable|string',
            'payment_method' => 'required_if:payment_amount,>0|string|nullable',
            'payment_amount' => 'nullable|numeric|min:0',
            'invoice_items' => 'required|array',
            'invoice_items.*.item_type' => 'required|string',
            'invoice_items.*.description' => 'required|string',
            'invoice_items.*.quantity' => 'required|numeric|min:0',
            'invoice_items.*.unit_price' => 'required|numeric|min:0',
            'invoice_items.*.tax_rate' => 'required|numeric|min:0',
            'invoice_items.*.amount' => 'required|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {
            // 1. Get check-in data
            $checkin = CheckinMaster::with('rooms')->findOrFail($request->checkin_id);

            // 2. Calculate totals
            $subtotal = collect($request->invoice_items)->sum('amount');
            $taxAmount = collect($request->invoice_items)->sum(function ($item) {
                return ($item['amount'] * $item['tax_rate']) / 100;
            });
            $grandTotal = $subtotal + $taxAmount;

            // 3. Determine payment status
            $paymentAmount = $request->payment_amount ?? 0;
            $paymentStatus = $paymentAmount >= $grandTotal ? 'Paid' : 
                        ($paymentAmount > 0 ? 'Partially Paid' : 'Pending');

            // 4. Create checkout record
            $checkout = CheckoutMaster::create([
                'checkin_id' => $checkin->id,
                'actual_checkout_datetime' => $request->actual_checkout_datetime,
                'early_checkout' => Carbon::parse($request->actual_checkout_datetime) < Carbon::parse($checkin->check_out_datetime),
                'late_checkout' => Carbon::parse($request->actual_checkout_datetime) > Carbon::parse($checkin->check_out_datetime),
                'checkout_remarks' => $request->checkout_remarks,
                'total_amount' => $subtotal,
                'tax_amount' => $taxAmount,
                'grand_total' => $grandTotal,
                'payment_status' => $paymentStatus,
                'amount_paid' => $paymentAmount,
                'balance_due' => $grandTotal - $paymentAmount,
                'created_by' => $request->user()->id,
            ]);

            // 5. Record payment if any
            if ($paymentAmount > 0) {
                CheckoutPayment::create([
                    'checkout_id' => $checkout->id,
                    'payment_method' => $request->payment_method,
                    'payment_amount' => $paymentAmount,
                    'payment_date' => now(),
                    'transaction_reference' => 'PAY-' . time(),
                    'created_by' => $request->user()->id,
                ]);
            }

            // 6. Generate invoice
            $invoice = Invoice::create([
                'invoice_number' => 'INV-' . time(),
                'checkout_id' => $checkout->id,
                'invoice_date' => now(),
                'due_date' => now()->addDays(7),
                'status' => $paymentStatus === 'Paid' ? 'Paid' : 'Sent',
                'notes' => $request->checkout_remarks,
                'terms' => 'Payment due within 7 days',
            ]);

            // 7. Add invoice items
            foreach ($request->invoice_items as $item) {
                $invoice->items()->create([
                    'item_type' => $item['item_type'],
                    'description' => $item['description'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'tax_rate' => $item['tax_rate'],
                    'amount' => $item['amount'],
                ]);
            }

            // 8. Update room status to available
            RoomMaster::whereIn('id', $checkin->rooms->pluck('room_id'))
                ->update(['status_id' => 1]); // 1 = Available

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Checkout processed successfully',
                'checkout_id' => $checkout->id,
                'invoice_number' => $invoice->invoice_number,
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Error processing checkout: ' . $e->getMessage(),
            ], 500);
        }
    }
    public function getCheckoutDetails($checkoutId)
    {
        try {
            $checkout = CheckoutMaster::with([
                'checkin', 
                'payments',
                'invoice.items'
            ])->findOrFail($checkoutId);

            return response()->json([
                'success' => true,
                'data' => $checkout,
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error retrieving checkout details: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function getCheckoutList(Request $request)
    {
        try {
            $perPage = $request->per_page ?? 10;
            $checkouts = CheckoutMaster::with(['checkin', 'invoice'])
                ->orderBy('created_at', 'desc')
                ->paginate($perPage);

            return response()->json([
                'success' => true,
                'data' => $checkouts,
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error retrieving checkout list: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function recordPayment(Request $request)
    {
        // echo '<pre>';
        // print_r($request->all());
        // echo '</pre>';
        // return;
        // $request->validate([
        //     'checkout_id' => 'required|exists:checkout_master,id',
        //     'payment_method' => 'required|string',
        //     'payment_amount' => 'required|numeric|min:0.01',
        //     'payment_date' => 'required|date',
        //     'transaction_reference' => 'nullable|string',
        //     'notes' => 'nullable|string',
        // ]);

        DB::beginTransaction();

        try {
            // Record the payment
            $payment = CheckoutPayment::create([
                'checkout_id' => $request->checkout_id,
                'payment_method' => $request->payment_method,
                'payment_amount' => $request->payment_amount,
                'payment_date' => $request->payment_date,
                'transaction_reference' => $request->transaction_reference,
                'payment_notes' => $request->notes,
                'created_by' => $request->user()->id,
            ]);

            // Update checkout payment status
            $checkout = CheckoutMaster::findOrFail($request->checkout_id);
            $totalPaid = $checkout->payments()->sum('payment_amount');
            $newStatus = $totalPaid >= $checkout->grand_total ? 'Paid' : 
                        ($totalPaid > 0 ? 'Partially Paid' : 'Pending');

            $checkout->update([
                'payment_status' => $newStatus,
                'amount_paid' => $totalPaid,
                'balance_due' => $checkout->grand_total - $totalPaid,
            ]);

            // Update invoice status if fully paid
            if ($newStatus === 'Paid' && $checkout->invoice) {
                $checkout->invoice->update(['status' => 'Paid']);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Payment recorded successfully',
                'payment_id' => $payment->id,
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Error recording payment: ' . $e->getMessage(),
            ], 500);
        }
    }

    
}