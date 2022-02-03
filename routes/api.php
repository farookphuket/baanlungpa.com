<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController as Login;
use App\Http\Controllers\RegisterController as Regis;
use App\Http\Controllers\WhatupController as Whatup;
use App\Http\Controllers\VisitorController as Visit;
use App\Http\Controllers\UserController as User;


// Member route 
use App\Http\Controllers\Member\DashboardController as Member;


// admin route 
use App\Http\Controllers\Admin\DashboardController as Admin;

use Illuminate\Support\Facades\Auth;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



// visitor
Route::get('/getvisitor',[Visit::class,'getVisitor'])
    ->name('getvisitor');
Route::post('/visitor',[Visit::class,'store']);



// get whatup as public
Route::get('/getwhatup',[Whatup::class,'getWhatup'])
    ->name('getWhatup');


// register 
Route::post('/register',[Regis::class,'store'])
    ->name('register');

// login 
Route::post('/login',[Login::class,'store'])
    ->name('login');

// check if the user has passport
Route::get('/checkuserpassport',[Login::class,'checkUserPassport'])
    ->name('checkUserPassport');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    $user = Auth::user();
    return $user;
});



/* make a route prefix for member group */
Route::prefix("member")->name("member.")->middleware('auth:sanctum')
        ->group(function(){
    Route::resource('/dashboard',Member::class);


    // whatup 
    Route::resource("/whatup",Whatup::class);

//
//    // profile
//    Route::resource('/profile',Profile::class);
//
//    // confirm password 
//    Route::post('/confirm-password',[USER::class,"userIsConfirmPassword"])
//        ->name("userIsConfirmPassword");

    /* Logout from member */
    Route::delete('/logout',[Login::class,'destroy'])->name('logout');

});



/* make a route prefix for member group */
Route::prefix("admin")->name("admin.")->middleware('auth:sanctum')
        ->group(function(){
    Route::resource('/dashboard',Admin::class);

    // whatup 
    Route::resource("/whatup",Whatup::class);

    // manage user route
    Route::resource("/user",User::class);
    Route::get('/getuser',[User::class,'getUser'])
        ->name('getUser');

});
