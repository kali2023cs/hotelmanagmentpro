<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:8'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'is_admin' => true,
        ]);

        $token = $user->createToken('authToken')->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $token
        ], 201);
    }

public function login(Request $request)
{
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
        'property_code' => 'required|string|min:3',
    ]);

    // Set tenant DB
    $databaseName = 'property_' . $request->property_code;
    config(['database.connections.mysql2.database' => $databaseName]);
    DB::purge('mysql2');
    DB::reconnect('mysql2');

    // Fetch user from tenant DB
    $user = \App\Models\User::on('mysql2')->where('email', $request->email)->first();

    if (!$user || !Hash::check($request->password, $user->password)) {
        return response()->json(['message' => 'Invalid credentials'], 401);
    }

    // Create Sanctum token manually
    $plainToken = Str::random(60);
    $hashedToken = hash('sha256', $plainToken);

    DB::connection('mysql')->table('personal_access_tokens')->insert([
        'tokenable_type' => get_class($user), // Usually 'App\Models\User'
        'tokenable_id' => $user->id,
        'name' => 'auth_token',
        'token' => $hashedToken,
        'abilities' => json_encode(['*']),
        'created_at' => now(),
        'updated_at' => now(),
    ]);

    return response()->json([
        'user' => $user,
        'token' => $plainToken,
        'property_code' => $request->property_code,
    ]);
}



    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out successfully']);
    }

    public function user(Request $request)
    {
        return response()->json($request->user());
    }
}
