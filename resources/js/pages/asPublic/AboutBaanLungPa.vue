<template>
    <div>
                <p class="title has-text-centered has-text-info">
                    currently working on
                </p>
                <p class="subtitle">
                    baanlungpa.com project which using  

                </p>
                <div class="content">
                    <p class="mb-4">
                        I using all this free code to create my web app and 
                        I will share this to you if you want to.
                    </p>
                    <ol class="is-lower-roman is-mobile">
                        <li>
                            <span class="has-text-info has-text-weight-bold
                                ">
                                Laravel 8 as core code (this is the last 
                                project using Laravel8+vue3)
                            </span>
                        </li>

                        <li>
                            <span class="has-text-info has-text-weight-bold
                                ">
                                agent from https://github.com/jenssegers/agent
                            </span>
                        </li>

                        <li>
                            <span class="has-text-info has-text-weight-bold
                                ">
                                BulmaCss for the styling.
                            </span>
                        </li>
                        <li>
                            <span class="has-text-info has-text-weight-bold
                                ">
                                Vue 3 and Vue-router as front-end
                            </span>
                        </li>

                        <li>
                            <span class="has-text-info has-text-weight-bold
                            ">
                                font awesome for some cool font 
                            </span>
                            <span class="ml-3">
                                <button class="button is-outlined is-rounded 
                                    is-small is-success">
                                    <font-awesome-icon icon="check"></font-awesome-icon>
                                </button>
                            </span>
                        </li>
                        <li>
                            <span class="has-text-info has-text-weight-bold
                                ">
                                momentJs to format date (ago time)
                            </span>
                        </li>
                        <li>
                            <span class="has-text-info has-text-weight-bold
                                ">
                                Vue3-cookies for the cookie 
                            </span>
                        </li>
                        <li class="has-background-warning p-2 is-rounded">
                            <span class="has-text-info has-text-weight-bold
                                ">
                                Jodit-vue3 for WYSIWYG html editor 
                            </span>
                        </li>
                    </ol>
                </div>
                <p class="pb-4 mt-2">
                    this web has created on 21 Jun 2021 or 
                    {{moment("2021-06-21 23:45:50")
                    .format("YYYY-MMMM-DD H:m:s a")}} or
                    {{moment("2021-06-21 23:45:50").fromNow()}}
                </p>
                <div class="mb-4 mt-2">

                    <span class="ml-2 mr-2 has-text-info 
                        has-text-weight-bold">
                        last update 20 Apr 2022
                    </span>
                </div>
    </div>
</template>
<script>
var moment = require('moment')
export default{
    name:"AboutBannLungPa",
    data(){return{
        moment:moment,
    }},
}
</script>
