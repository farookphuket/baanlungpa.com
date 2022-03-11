# baanlungpa.com



> baanlungpa.com is the  project I have just start  on Jan 21 2022 
> last update 17 Feb 2022 from Arch Linux Laptop 



[baanlungpa_homepage]:https://i.ibb.co/CBD2wgH/baanlungpa-17-feb-2022.png


# baanlungpa.com home page 17 Feb 2022

![Baan Lung Pa Home page][baanlungpa_homepage]




## ================ coding skill level ==========|

> 1 June 2021 my coding skill level is "Baby"


## ================ Theme =======================|
> baanlungpa is using "bulma" for the css style and I will try to make it look 
> as clean as possible (it's can be ugly looking as well but do you know 
> I don't mean to include ugly this is all I've got)


### Home page 

> home page 

![home page][baanlungpa_homepage]



### 404 error page

> the 404 error page on 20 Feb 2022

[404_error]:https://i.ibb.co/3B1Psk5/baanlungpa-404-error-20-feb-2022.png

![404 error page][404_error]


### Login page

> the login and register page 






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



---

# Update report 

## date 17 Feb 2022 
> update blog system added "view count","Tag","Category" on admin
> edit about page add dynamic feature.


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


