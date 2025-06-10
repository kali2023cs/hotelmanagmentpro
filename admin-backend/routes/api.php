<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\MasterController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\CheckinController;

// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Routes protected by sanctum auth
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    // BlockMaster routes
    Route::get('/blockmaster', [MasterController::class, 'blockmaster']);
    Route::post('/blockmaster', [MasterController::class, 'addblockmaster']);
    Route::put('/blockmaster/{id}', [MasterController::class, 'editblockmaster']);
    Route::delete('/blockmaster/{id}', [MasterController::class, 'deleteBlockMaster']);

    // FloorMaster routes
    Route::get('/floormaster', [MasterController::class, 'floormaster']);
    Route::post('/floormaster', [MasterController::class, 'addfloormaster']);
    Route::put('/floormaster/{id}', [MasterController::class, 'editfloormaster']);
    Route::delete('/floormaster/{id}', [MasterController::class, 'deleteFloorMaster']);


    // RoomTypeMaster routes
    Route::get('/plans', [MasterController::class, 'getPlans']);
    Route::get('/roomtypemaster', [MasterController::class, 'roomtypemaster']);
    Route::post('/roomtypemaster', [MasterController::class, 'addroomtypemaster']);
    Route::put('/roomtypemaster/{id}', [MasterController::class, 'editroomtypemaster']);
    Route::delete('/roomtypemaster/{id}', [MasterController::class, 'deleteRoomTypeMaster']);
    
    // RoomStatusMaster routes
    Route::get('/roomstatusmaster', [MasterController::class, 'roomstatusmaster']);
    
    // RoomMaster routes
    Route::get('/roommaster', [MasterController::class, 'roommaster']);
    Route::post('/roommaster', [MasterController::class, 'addroommaster']);
    Route::put('/roommaster/{id}', [MasterController::class, 'editroommaster']);
    Route::delete('/roommaster/{id}', [MasterController::class, 'deleteroommaster']);


    // Logout
    Route::post('/logout', [AuthController::class, 'logout']);
});


Route::get('/getAllActiveRooms', [DashboardController::class, 'getAllActiveRooms']);
Route::get('/getArrivalModes', [CheckinController::class, 'getArrivalModes']);
Route::get('/getAllGender', [CheckinController::class, 'getAllGender']);
Route::get('/getAllTitleMaster', [CheckinController::class, 'getAllTitleMaster']);
Route::get('/getAllRoomTypes', [CheckinController::class, 'getAllRoomTypes']);
Route::get('/getAllSegments', [CheckinController::class, 'getAllSegments']);
Route::get('/getAllBusinessSources', [CheckinController::class, 'getAllBusinessSources']);
Route::get('/getRoomsByType/{roomTypeId}', [CheckinController::class, 'getRoomsByType']);
Route::get('/getRoomTypePlan/{roomTypeId}', [CheckinController::class, 'getRoomTypePlan']);

Route::post('/checkinConfirm', [CheckinController::class, 'checkinConfirm']);