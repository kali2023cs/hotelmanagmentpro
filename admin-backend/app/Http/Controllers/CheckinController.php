<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\CheckinMaster;
use App\Models\CheckinRoomTrans;

class CheckinController extends Controller
{
    public function getArrivalModes(Request $request)
    {
        $arrivalModes = DB::table('arrival_mode')
            ->select('id', 'mode_name') 
            ->where('is_active', 1)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $arrivalModes, 
        ]);
    }
    
    public function getAllGender(Request $request)
    {
        $gender = DB::table('gender_master')
            ->select('id', 'gender_name') 
            ->where('is_active', 1)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $gender, 
        ]);
    }
    
    public function getAllTitleMaster(Request $request)
    {
        $title = DB::table('title_master')
            ->select('id', 'title_name') 
            ->where('is_active', 1)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $title, 
        ]);
    }
    public function getAllSegments(Request $request)
    {
        $segments = DB::table('segment_master')
            ->select('id', 'segment_name')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $segments, 
        ]);
    }
    public function getAllBusinessSources(Request $request)
    {
        $businesssource = DB::table('business_source')
            ->select('id', 'source_name')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $businesssource, 
        ]);
    }
    
    public function getAllRoomTypes(Request $request)
    {
        $roomtypes = DB::table('roomtype_master')
            ->select('id', 'room_type_name')
            ->where('roomtype_status', 'Active')
            ->whereNull('deleted_at')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $roomtypes, 
        ]);
    }


    public function getRoomsByType(Request $request, $roomTypeId)
    {
        $rooms = DB::table('room_master')
            ->select('id', 'room_no', 'room_type_id','max_pax','max_extra_pax')
            ->where('is_active', 1)
            ->where('room_type_id', $roomTypeId)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $rooms,
        ]);
    }
    public function getRoomTypePlan(Request $request, $roomTypeId)
    {
        $plans = DB::table('plans')
            ->select('*')
            ->where('status', 'Active')
            ->where('room_type_id', $roomTypeId)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $plans,
        ]);
    }
    public function checkinConfirm(Request $request)
    {
        $data = $request->all();

        DB::beginTransaction();

        try {
            // Insert into checkin_master
            $checkin = CheckinMaster::create([
                'is_reservation' => $data['guestInfo']['isReservation'] ?? 0,
                'reservation_number' => $data['guestInfo']['reservationNumber'] ?? null,
                'arrival_mode' => $data['guestInfo']['arrivalMode'] ?? null,
                'ota' => $data['guestInfo']['ota'] ?? null,
                'booking_id' => $data['guestInfo']['bookingId'] ?? null,
                'contact' => $data['guestInfo']['contact'] ?? null,
                'title' => $data['guestInfo']['title'] ?? null,
                'first_name' => $data['guestInfo']['firstName'] ?? null,
                'last_name' => $data['guestInfo']['lastName'] ?? null,
                'gender' => $data['guestInfo']['gender'] ?? null,
                'city' => $data['guestInfo']['city'] ?? null,
                'id_number' => $data['guestInfo']['idNumber'] ?? null,
                'email' => $data['guestInfo']['email'] ?? null,
                'check_in_mode' => $data['guestInfo']['checkInMode'] ?? null,
                'allow_credit' => $data['guestInfo']['allowCredit'] ?? null,
                'foreign_guest' => $data['guestInfo']['foreignGuest'] ?? null,
                'segment_id' => $data['guestInfo']['segment'] ?? null,
                'business_source_id' => $data['guestInfo']['businessSource'] ?? null,
                'photo' => $data['guestInfo']['photo'] ?? null,
                'document' => $data['guestInfo']['document'] ?? null,
                'gst_number' => $data['guestInfo']['gstNumber'] ?? null,
                'guest_company' => $data['guestInfo']['guestCompany'] ?? null,
                'age' => $data['guestInfo']['age'] ?? null,
                'gst_type' => $data['guestInfo']['gstType'] ?? null,
                'address' => $data['guestInfo']['address'] ?? null,
                'visit_remark' => $data['guestInfo']['visitRemark'] ?? null,
                'pin_code' => $data['guestInfo']['pinCode'] ?? null,
                'nationality' => $data['guestInfo']['nationality'] ?? null,
                'booking_instructions' => $data['guestInfo']['bookingInstructions'] ?? null,
                'guest_special_instructions' => $data['guestInfo']['guestSpecialInstructions'] ?? null,
                'is_vip' => $data['guestInfo']['isVIP'] ?? 0,
                'check_in_type' => $data['guestInfo']['checkInType'] ?? null,
                'check_in_datetime' => $data['guestInfo']['checkInDateTime'] ?? null,
                'number_of_days' => $data['guestInfo']['numberOfDays'] ?? 1,
                'check_out_datetime' => $data['guestInfo']['checkOutDateTime'] ?? null,
                'grace_hours' => $data['guestInfo']['graceHours'] ?? 0,
                'payment_by' => $data['guestInfo']['paymentBy'] ?? null,
                'allow_charges_posting' => $data['guestInfo']['allowChargesPosting'] ?? 0,
                'enable_paxwise' => $data['guestInfo']['enablePaxwise'] ?? 0,
                'enable_room_sharing' => $data['guestInfo']['enableRoomSharing'] ?? 0,
            ]);

            // Insert each room detail into checkin_room_trans
            foreach ($data['roomDetails'] as $room) {
                CheckinRoomTrans::create([
                    'checkin_id' => $checkin->id,
                    'room_type_id' => $room['roomTypeId'] ?? null,
                    'room_id' => $room['roomId'] ?? null,
                    'rate_plan_id' => $room['ratePlanId'] ?? null,
                    'guest_name' => $room['guestName'] ?? null,
                    'contact' => $room['contact'] ?? null,
                    'male' => $room['male'] ?? 0,
                    'female' => $room['female'] ?? 0,
                    'extra' => $room['extra'] ?? 0,
                    'net_rate' => $room['netRate'] ?? 0,
                    'disc_type' => $room['discType'] ?? 'No Disc',
                    'disc_val' => $room['discVal'] ?? 0,
                    'total' => $room['total'] ?? 0,
                ]);
            }

            DB::commit();

            return response()->json([
                'status' => true,
                'message' => 'Check-in data saved successfully!',
                'checkin_id' => $checkin->id,
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            
            return response()->json([
                'status' => false,
                'message' => 'Error: ' . $e->getMessage(),
            ], 500);
        }
    }
}