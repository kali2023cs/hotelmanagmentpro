<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
    public function checkinConfirm(Request $request){
        $data = $request->all();
        echo '<pre>';
        print_r($data);
        echo '</pre>';
        return;
    }
}