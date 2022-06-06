<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\UserRepository;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response as HttpFoundationResponse;

class AuthController extends Controller
{
    //

    public function user()
    {
        return Auth::user();
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
        if (!Auth::attempt($request->only(['email', 'password']))) {
            return new Response([
                "message" => 'invalid credentails!'
            ], HttpFoundationResponse::HTTP_UNAUTHORIZED);
        }
        $user = Auth::user();
        $token = $user->createToken("token")->plainTextToken;
        $cookie = cookie('jwt', $token, 60 * 24); //1 day token
        $response = Response(["message" => $token], HttpFoundationResponse::HTTP_ACCEPTED);
        return $response->withCookie($cookie);
    }

    public function logout()
    {
    }
}