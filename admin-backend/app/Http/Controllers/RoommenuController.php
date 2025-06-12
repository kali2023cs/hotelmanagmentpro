<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\RoomMaster;
use App\Models\RoomStatusMaster;
use App\Models\BlockRoom;


class RoommenuController extends Controller
{

   public function retriveRoomMasterForBlock()
    {
        $data = RoomMaster::join('roomstatus_master', 'room_master.status_id', '=', 'roomstatus_master.id')
            ->select(
                'room_master.*',
                'roomstatus_master.status_name as status_name'
            )
            ->whereIn(DB::raw('UPPER(roomstatus_master.status_name)'), ['AVAILABLE', 'OUT OF ORDER'])
            ->get();

        return response()->json([
            'status' => true,
            'data' => $data
        ]);
    }

    public function blockRoom(Request $request)
    {

        $room = RoomMaster::where('id', $request->room_id)->first();

        if (!$room) {
            return response()->json([
                'status' => false,
                'message' => 'Room not found',
            ], 404);
        }

        $status_id = RoomStatusMaster::where(DB::raw('UPPER(status_name)'), 'BLOCKED')
            ->pluck('id')
            ->first();

        if (!$status_id) {
            return response()->json([
                'status' => false,
                'message' => 'BLOCKED status not found in roomstatus_master',
            ], 500);
        }

        $block = BlockRoom::create([
            'room_id'      => $room->id,
            'status_id'    => $status_id,
            'reason'       => $request->reason,
            'fromdatetime' => Carbon::parse($request->from_date),
            'todatetime'   => Carbon::parse($request->to_date),
            'blocked_by'   => Auth::id() ?? 1, // fallback to 1 if not authenticated
        ]);

        RoomMaster::where('id', $request->room_id)
            ->update(['status_id' => $status_id]);

        return response()->json([
            'status' => true,
            'message' => 'Room blocked successfully',
            'data' => $block
        ]);
    }

}
