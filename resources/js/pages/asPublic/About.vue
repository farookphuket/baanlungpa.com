<template>
    <div>
       <section class="body_content">
           <about-baan-lung-pa></about-baan-lung-pa>
            <div class="columns">

                <div class="column">
                    <form action="">
                        <div class="field">
                            <div class="control">
                                <jodit-editor 
                                    height=450 
                                    ref="msgBody"
                                    v-model="msgBody"></jodit-editor>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
       </section>     
    </div>
</template>

<script>

var moment = require('moment')
import {JoditEditor} from 'jodit-vue3'
import AboutBaanLungPa from "./AboutBaanLungPa.vue"
export default {
    name: "About",
    components:{
        AboutBaanLungPa,
    },
    data(){
        return{
            moment:moment,
            msgBody:'',
        }
    },
    mounted(){
        this.getWhatup()
    },
    methods:{
        getWhatup(){
            this.msgBody = `<h2 class="title has-text-centered">test</h2><p>
                enter text ha ha</p>`

        },
    },
}
</script>
