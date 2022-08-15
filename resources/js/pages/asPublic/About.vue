<template>
    <section class="body_content">
        <div class="container">
            <about-baan-lung-pa></about-baan-lung-pa>
        </div>
    </section>
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
            theSlug:new CustomText(),
            tForm:new Form({
                theTitle:'',
                theBody:'',
            }),
        }
    },
    mounted(){
        this.getWhatup()
    },
    methods:{
        getWhatup(){

            this.tForm.theBody = `
<p class="title">I am a text from server</p>
            <p>I can promise that i will not show in the 
            jodit editor on the first load</p>
<pre>
    <code><span>
type some code to show in here 
    </span></code>
</pre>
                `


        },
        copyMe(){
            this.$refs.theBody.select()
            document.execCommand('copy')
        },
    },
}
</script>

