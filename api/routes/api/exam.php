<?php

use App\Http\Controllers\ExamController;
use Illuminate\Support\Facades\Route;

Route::get('/exams', [ExamController::class, 'index']);
Route::get('/exams/{exam}', [ExamController::class, 'show']);
Route::post('/exams', [ExamController::class, 'store']);
Route::patch('/exams/{exam}', [ExamController::class, 'update']);
Route::delete('/exams/{exam}', [ExamController::class, 'destroy']);