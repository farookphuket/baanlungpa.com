<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Hash;

use Illuminate\Support\Facades\Crypt;

// this line is very important
use Session;


use Auth;
use DB;

class LoginController extends Controller
{
    protected $user_token_table = "personal_access_tokens";
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function checkUserPassport(){

        $user = null;

        if(Auth::check()):
            $user = Auth::user();
        endif;

        return response()->json([
            "user" => $user
        ]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        //
        $valid = request()->validate([
            "email" => ["required","email"],
            "password" => ["required"],
        ]);

        $err = false;
        $url = "";
        $msg = "";
        $email = request()->email;
        $token = '';
        $user_enable = null;

        if(!Auth::attempt($valid)):
            $err = 1;
            $msg = "<span class=\"tag is-medium is-danger\">
                Error! no account found!</span>";
            $url = '/login';
        else:
            $user_url = $this->getUserUrl();
            $url = $user_url; 
            $token = Auth::user()->createToken('auth_token')->plainTextToken;
            $user_enable = Auth::user();
            $msg = "<span class=\"tag is-medium is-success\">
                Welcome {$email}</span>";
        endif;


        return response()->json([
            "msg" => $msg,
            "url" => $url,
            "error" => $err,
            "token_type" => "Bearer",
            "access_token" => $token,
            "user_enable" => $user_enable
        ]);
    }


    public function getUserUrl(){
        $user = Auth::user();
        $url = '';
        if($user->is_admin != 0):
            $url = "/admin";
        else:
            $url = "/member";
        endif;
        return $url;

    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        // the token will be re-generate in every login 
        // make sure we clear all after user logout
        $u_token = DB::table($this->user_token_table)
            ->where('tokenable_id',Auth::user()->id)
            ->get();
        foreach($u_token as $arr):
            DB::table($this->user_token_table)
                ->delete($arr->id);
        endforeach;

        //also delete the current session
        request()->session()->flush();

        // then give the login url
        $url = '/login';

        return response()->json([
            'url' => $url
        ]);

    }
}
