<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'password2' => 'required|same:password'
        ]);

        if ($validator->fails()) {
            $response = [
                'success'       => false,
                'message'       => $validator->errors(),
            ];

            return response()->json($response, 403);
        }

        $checkEmail = User::where("email", $input['email'])->first();

        if ($checkEmail) {
            $response = [
                'success'       => false,
                'message'       => 'Email Already Existed',
            ];

            return response()->json($response, 403);
        }

        $input['password'] = bcrypt($input['password']);

        $user = User::create($input);
        $token = $user->createToken('token')->plainTextToken;

        $response = [
            'success'       => true,
            'code_response' => 200,
            'message'       => 'User Successfully Registered',
            'data'          => $user,
            'token'         => $token,
        ];

        return response()->json($response, 200);

    }

    public function login(Request $request) 
    {
        $user = User::where('email', $request->email)->first();

        if ( ! $user || !\Hash::check($request->password, $user->password)) {
            return response()->json([
                'message' => 'Your email or password is not valid.'
            ], 401);
        }

        $token = $user->createToken('token')->plainTextToken;
        
        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'success',
            'data' => $user,
            'token' => $token,
        ], 200);
    }

    public function logout(Request $request) 
    {
        $user = $request->user();
        $user->currentAccessToken()->delete();

        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'Logout success',
        ], 200);
    }
}
