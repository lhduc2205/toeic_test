<?php

use App\Http\Controllers\AccountController;
use Illuminate\Support\Facades\Route;

Route::get('/accounts', [AccountController::class, 'index']);
Route::get('/accounts/{account}', [AccountController::class, 'show']);
Route::post('/accounts', [AccountController::class, 'store']);
Route::patch('/accounts/{account}', [AccountController::class, 'update']);
Route::delete('/accounts/{account}', [AccountController::class, 'destroy']);