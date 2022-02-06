# baanlungpa.com



> baanlungpa.com is the  project I have just start  on Jan 21 2022 
> last update 3 Feb 2022 from Arch Linux Laptop 


## ================ coding skill level ==========|

> 1 June 2021 my coding skill level is "Baby"


## ================ Theme =======================|


## =============== SET responsive image background 
> copy code from 
> `https://stackoverflow.com/questions/12609110/responsive-css-background-images`


```


#app section.hero.is-danger.is-fullheight{
    /*border:2px solid #ff0000; */
    background: url('/img/baanlungpa_logo1_cut.png') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: contain;
    -moz-background-position: center;
    -o-background-size: cover;
    background-size: contain;
    background-position: center;
    /*min-width:100vh;*/
}


@media (max-width:760px){
    
    #app section.hero.is-danger.is-fullheight{
        /*border:2px solid #ff0000; */
        background: url('/img/baanlungpa_bg1.png');
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-repeat:no-repeat;
        background-size: contain;
        background-position:center;
    }
    
}


```



## date 6 Feb 2022 

> create "password reset","whatup"
> jodit-vue3 cannot load the current edit data on update.




## update datetime timestamps field with null 

> get the code from https://stackoverflow.com/questions/53631528/laravel-not-updating-null-values-to-column
> on 2 Feb 2022 when I tried to update the users tables email_verified_at field
> to null not 'NULL' and in Models User added the fillable `email_verified_at`. 
> otherwise will be error cannot make change to field.


## =============== install agent 28 Jan 2022
> copy code from https://github.com/jenssegers/agent 
> command to install 

```
composer require jenssegers/agent

```

> setup helpers follow `https://dev.to/kingsconsult/how-to-create-laravel-8-helpers-function-global-function-d8n`



## =============== Laravel 8 =====================|

1. using laravel 8 as code base
2. use vue3 bulma agent moment vue-router jodit-vue3 vue3-cookies


