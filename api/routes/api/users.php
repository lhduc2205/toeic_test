<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

// Route::get('users', [UserController::class, 'index']);
// Route::get('users/{user}', [UserController::class, 'show']);
// Route::patch('users/{user}',[])
// Route::post('users', [UserController::class, 'store']);
Route::resource('users', UserController::class);