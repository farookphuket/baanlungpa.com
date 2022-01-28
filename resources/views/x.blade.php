<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">


    @hasSection('meta_title')
        <title>
            @yield('meta_title')
        </title>
    @else
        <title>บ้านลุงป้าดอทคอม</title>
    @endif 
    @auth
        <script>
            var user_id = "{!!Auth::user()->id!!}"
        </script>
    @endauth
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="{{asset('css/app.css')}}">
    </head>
    <body >
        <div id="app"></div>



        <footer class="footer">
            <div class="container">
                <div class="field has-text-centered">
                    <p>
                        Laravel v{{ Illuminate\Foundation\Application::VERSION }} (PHP v{{ PHP_VERSION }})
                    </p>
                </div>
            </div>
        </footer>

    <script src="{{asset('js/app.js')}}"></script>
    </body>
</html>
