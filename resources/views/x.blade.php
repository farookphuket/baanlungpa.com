<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="{{asset('img/house_small.png')}}" rel="icon">

    @hasSection('meta_title')
        <title>
            @yield('meta_title')
        </title>
    @else
        <title>บ้านลุงป้าดอทคอม</title>
    @endif 

<?php
$data = [
    "user_id" => null,
    "php_ver" => PHP_VERSION,
    "core_ver" => Illuminate\Foundation\Application::VERSION,
];
?>
    @auth
        <?php
        // user id from Auth
         $data["user_id"] = Auth::user()->id;
        ?>

    @endauth
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
