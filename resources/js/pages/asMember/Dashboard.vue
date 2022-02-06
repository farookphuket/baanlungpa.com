<template>
    <section class="body_content">

        <!-- show new comment,new post, START -->
        <div class="container mb-6">
            <div class="columns">
                <div class="column">
                    <div class="card">
                        <header class="card-header">
                            <p class="title card-header-title">
                                the new comment
                            </p>
                        </header>
                    </div>
                </div>

                <div class="column">
                    <div class="card">
                        <header class="card-header">
                            <p class="title card-header-title">
                                my update
                            </p>
                        </header>
                        <div class="card-content">
                            <p class="mb-4">create update profile 4 Feb 2022</p>
                            <div class="field">
                                <div class="control">
                                    <label class="checkbox" for="">
                                        <input id="" type="checkbox" 
                                        name="" checked>
                                        <span class="ml-2">create whatup member</span>
                                    </label>
                                </div>
                            </div>

                            <div class="field">
                                <div class="control">
                                    <label class="checkbox" for="">
                                        <input id="" type="checkbox" 
                                        name="" checked>
                                        <span class="ml-2">
                                            create update profile</span>
                                        <span class="mr-2 ml-2">
                                            success
                                        </span>
                                    </label>
                                </div>
                            </div>


                            <div class="field">
                                <div class="control">
                                    <label class="checkbox" for="">
                                        <input id="" type="checkbox" 
                                        name="" checked>
                                        <span class="ml-2">
                                            create update password reset</span>
                                        <span class="mr-2 ml-2">
                                            success 6 Feb 2022
                                        </span>
                                    </label>
                                </div>
                            </div>

                            <div class="mb-6">
                                <div class="field is-pulled-right">
                                    <button class="button is-warning">
                                        <font-awesome-icon icon="sync"></font-awesome-icon>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- show new comment,new post, START -->

        <whatup></whatup>
    </section>
</template>
<script>
import Whatup from "./Whatup/Whatup.vue"
export default{
    name:"MemberDashboard",
    components:{
        Whatup,
    },
}
</script>
