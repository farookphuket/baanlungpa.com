<template>
    <div class="content">
        <form action="">
            <div class="field">
                <div class="control">
                    <input v-model="wForm.wp_title" class="input" type="text" 
                    ref="title" placeholder="title...">
                </div>
            </div>

            <div class="field">
                <div class="control">
                    <jodit-editor 
                        height=450 
                        v-model="wForm.wp_body" 
                        ></jodit-editor>
                    
                </div>
                <div class="box content mt-6 mb-6">
                    <div class="field">
                        <span class="is-pulled-right" v-show="btnSelect">
                            <button class="button is-rounded is-small 
                                is-outlined" 
                                @click.prevent="willCopy">
                                <font-awesome-icon icon="copy"></font-awesome-icon>
                            </button>
                        </span>
                        <div class="control">
                            <textarea v-model="wForm.wp_body" class="textarea" 
                                ref="body"></textarea>
                        </div>
                    </div>
                    
                </div>
            </div>

            <div class="field">
                <nav class="level">
                    
                    <div class="level-item">
                        <div v-html="res_status"></div>
                    </div>
                    <div class="level-item">
                        <label class="checkbox" for="">
                            <input v-model="wForm.is_public" type="checkbox" 
                            name="">
                            <span>public</span>
                        </label>
                    </div>
                    <div class="level-item">
                        <button class="button is-primary is-rounded 
                            is-outlined" @click.prevent="saveWp(editId)">
                            <font-awesome-icon icon="check"></font-awesome-icon>
                        </button>
                    </div>
                </nav>
            </div>

        </form>
    </div>
</template>
<script>

import JoditEditor from "jodit-vue3"

export default{
    name:"WhatupForm",
    props:["editId"],
    data(){return{
        res_status:'',
        btnSelect:false,
        wForm:new Form({
            wp_title:'',
            wp_body:'', 
            is_public:'',
        }),
    }},
    mounted(){

    },
    watch:{
        "editId":function(x){
            this.getEditData(x)
        }
    },
    methods:{
        getEditData(id){
            if(id && id != 0){
                setTimeout(()=>{
                    this.$refs.title.focus()
                    this.btnSelect = true
                },700)
                this.wForm.is_public = false
                let url = `/api/admin/whatup/${id}`
                axios.get(url)
                    .then(res=>{
                        console.log(res.data)
                        let rData = res.data.whatup
                        this.wForm.wp_title = rData.wp_title
                        this.wForm.wp_body = rData.wp_body
                        if(rData.is_public != 0){
                            this.wForm.is_public = true
                        }
                    })
            }
            return
        },
        saveWp(id){
            let url = `/api/admin/whatup`
            let fData = new FormData()
            fData.append("wp_title",this.wForm.wp_title)
            fData.append("wp_body",this.wForm.wp_body)
            fData.append("is_public",this.wForm.is_public)

            if(id){
                fData.append("_method","PUT")
                url = `/api/admin/whatup/${id}`
            }
            axios.post(url,fData)
                .then(res=>{
                    this.res_status = res.data.msg
                    setTimeout(()=>{
                        this.formReset()
                        this.$emit('getWhatup')
                    },2500)
                })
                .catch(err=>{
                    this.res_status = `<span class="tag is-medium is-danger">
                        ${Object.values(err.response.data.errors).join()}
                    </span>`
                })
        },
        formReset(){
            this.res_status = ''
            this.wForm.reset()
            this.wForm.wp_body = ''
        },
        willCopy(){
            this.$refs.body.select()
            document.execCommand('copy')
        },
    },
}
</script>
