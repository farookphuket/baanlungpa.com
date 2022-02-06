<template>
    <div>
        <div class="container">
            <form action="" class="pb-6 mb-6">
                <div class="field">
                    <div class="control">
                        <input v-model="wForm.wp_title" class="input" type="text" 
                        ref="title"
                        name="" placeholder="Title...">
                    </div>
                </div>

                <div class="field">
                    <div class="control">
                        <jodit-editor 
                            v-model="wForm.wp_body"
                            height=450></jodit-editor>
                    </div>
                </div>

                <div class="mb-4 mt-4" v-if="wForm.wp_body != 0">
                    <div class="box">
                        <div class="control">
                            <div class="field is-pulled-right">
                                <button class="button is-rounded is-small  
                                    is-outlined" 
                                    @click.prevent="copyMe">
                                    <font-awesome-icon icon="copy"></font-awesome-icon>
                                </button>
                            </div>
                            <textarea v-model="wForm.wp_body" 
                                ref="body"
                                class="textarea"></textarea>
                        </div>
                    </div>
                </div>
                <div class="mb-6 mt-6 pt-4 pb-4">
                    <div class="columns is-mobile">
                        <div class="column">
                            <div v-html="res_status"></div>
                        </div>
                        <div class="column">
                            <div class="field">
                                <label for="" class="checkbox">
                                    <input v-model="wForm.is_public" 
                                           type="checkbox" name="">
                                    <span class="ml-2">show public</span>
                                </label>
                            </div>
                        </div>
                        <!-- button column START -->
                        <div class="column">
                            <div class="field is-pulled-right">
                                <button class="button is-primary is-rounded 
                                    is-outlined" 
                                    @click.prevent="saveWhatup(editId)">
                                    <font-awesome-icon icon="check">
                                    </font-awesome-icon>
                                </button>
                            </div>
                        </div>
                        <!-- button column END -->
                    </div><!-- end of div.columns -->

                </div><!-- div.mt-6.mb-6 END -->
            </form>

        </div>

    </div>
</template>
<script>
import JoditEditor from "jodit-vue3"
export default{
    name:"WhatupForm",
    props:["editId"],
    data(){return{
        wForm:new Form({
            wp_title:'',
            wp_body:'',
            is_public:true
        }),
        res_status:'',
    }},
    watch:{
        "editId":function(x){
            this.getEditData(x)
        }
    },
    methods:{
        getEditData(id){
            this.wForm.is_public = false
            this.res_status = ''
            if(id && id != 0){
                setTimeout(()=>{
                    this.$refs.title.focus()
                },700)
                let url = `/api/member/whatup/${id}`
                axios.get(url)
                    .then(res=>{
                        let rData = res.data.whatup
                        console.log(res.data.whatup)
                        if(rData.is_public != 0) this.wForm.is_public = true
                        this.wForm.wp_title = rData.wp_title
                        this.wForm.wp_body = rData.wp_body
                    })
            }
        },
        saveWhatup(id){
            let url = `/api/member/whatup`
            let fData = new FormData()
            fData.append("wp_title",this.wForm.wp_title)
            fData.append("wp_body",this.wForm.wp_body)
            fData.append("is_public",this.wForm.is_public)

            if(id && id != 0){
                fData.append("_method","PUT")
                url = `/api/member/whatup/${id}`
            }
            axios.post(url,fData)
                .then(res=>{
                    this.res_status = res.data.msg
                    setTimeout(()=>{
                        this.res_status = ''
                        this.$emit('getWhatup')
                        this.wForm.reset()
                    },2500)
                })
                .catch(err=>{
                    this.res_status = `<span class="tag is-medium is-danger">
                    ${Object.values(err.response.data.errors).join()}
                        </span>`
                })
        },
        copyMe(){
            this.$refs.body.select()
            document.execCommand('copy')
        },
    },
}
</script>
