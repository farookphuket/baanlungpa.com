<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="{{asset('img/house_small.png')}}" rel="icon">

    @hasSection('meta_title')
        <title>@yield('meta_title') ,บ้านลุงป้า,บ้านลุงป้าดอทคอม,บ้านลุงป้าร้อยเอ็ด</title>
        <meta name="keywords" content="@yield('meta_title'),บ้านลุงป้าจังหวัดร้อยเอ็ด">
        <meta name="description" content="@yield('meta_title'),baanlungpa dot com ,บ้านลุงป้า ร้อยเอ็ด thailand">
    @else
        <title>บ้านลุงป้าดอทคอม baanlungpa dot com the greate place to visit in Roi-Et Thailand</title>
        <meta name="keywords" content="บ้านลุงป้า ดอทคอม,จังหวัดร้อยเอ็ด,บ้านลุงป้า ,baanlungpa roi-et thailand">
        <meta name="description" content="ยินดีเข้าสู่เว็บไซต์ บ้านลุงป้า ดอทคอม baanlungpa dot com RoiEt Province thailand">
    @endif 

<?php
$data = [
    "user_id" => null,
    "user_has_login" => false,
    "php_ver" => PHP_VERSION,
    "core_ver" => Illuminate\Foundation\Application::VERSION,
];
?>
    @auth
        <?php
        // user id from Auth
        $data["user_id"] = Auth::user()->id;
        $data["user_has_login"] = true;
        ?>
        @if(Session::has('user_must_verify'))
        <?php
            $data["user_must_verify"] = Session::get("user_must_verify");
        ?>
        @endif
    @endauth

    @if(Session::has("user_reset_password_token"))
        {{$data["user_reset_password_token"] = Session::get("user_reset_password_token")}}
    @endif

    <script>
        window.lsDefault = @json($data)
    </script>
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="{{asset('css/app.css')}}">
        <link rel="stylesheet" href="{{asset('css/custom_x.css')}}">
    </head>
    <body >
        <div id="app"></div>
        @yield('content')



    <script src="{{asset('js/app.js')}}"></script>
    </body>
</html>
