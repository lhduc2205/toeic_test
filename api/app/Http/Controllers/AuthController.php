<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\UserRepository;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response as HttpFoundationResponse;
use App\Models\User;

class AuthController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    public function user()
    {
        $users = User::get();
        return new Response([
            'id' => Auth::user()
        ]);
    }

    public function register(Request $request, UserRepository $repository)
    {
        $payload = [
            "email" => $request->email,
            "password" => Hash::make($request->password),
            "is_admin" => $request->is_admin || false,
        ];

        $user = $repository->create($payload);
        //event(new Registered($user));
        return new Response($user);
    }

    public function login(Request $request)
    {
        $isLogin = false;
        $token = Auth::attempt($request->only(['email', 'password']));
        if (!$token) {
            return new Response([
                "message" => 'invalid credentails!'
            ], HttpFoundationResponse::HTTP_UNAUTHORIZED);
        }
        $user = Auth::user();
        if($user->is_admin)
        {
            return view('admin.index',[
                "token" => $token
            ]);
        }
        $response = Response(["token" => $token], HttpFoundationResponse::HTTP_ACCEPTED);
        return $response;
    }

    public function logout()
    {
        Auth::logout();
        $user = Auth::user();
        return new Response([
            "data" => $user
        ]);
    }
}