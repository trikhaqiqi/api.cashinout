<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CashController;
use App\Http\Controllers\DreamController;
use App\Http\Controllers\LearnController;
use App\Http\Controllers\TargetController;
use App\Http\Controllers\Auth\MeController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\API\AuthController;


Route::middleware('auth:sanctum')->group(function () {
    Route::get('me', [MeController::class, '__invoke']);

    Route::prefix('cash')->group(function () {
        Route::get('', [CashController::class, 'index']);
        Route::get('{cash:slug}', [CashController::class, 'show']);
        Route::get('/search/{name}', [CashController::class, 'search']);
        Route::get('/single/{id}', [CashController::class, 'single']);
        Route::post('create', [CashController::class, 'store']);
        Route::put('/edit/{id}', [CashController::class, 'update']);
        Route::delete('/delete/{id}', [CashController::class, 'delete']);
    });
    
    Route::resource('/activity', ActivityController::class);
    Route::get('/activity/search/{name}', [ActivityController::class, 'search']);
    
    Route::resource('/learn', LearnController::class);
    Route::get('/learn/search/{name}', [LearnController::class, 'search']);


    Route::resource('/target', TargetController::class);
    Route::get('/target/search/{name}', [TargetController::class, 'search']);

    Route::resource('/dream', DreamController::class);
    Route::get('/dream/search/{name}', [DreamController::class, 'search']);

    Route::get('/logout', [AuthController::class, 'logout']);
});

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
