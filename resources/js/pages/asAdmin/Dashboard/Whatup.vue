<template>
    <div>
        <div class="content mb-4">
            <div class="field is-pulled-right">
                <button class="button is-primary" 
                    @click="showForm='true'" v-if="showForm == false">
                    <font-awesome-icon icon="plus"></font-awesome-icon>
                </button>
                <button class="button is-danger" 
                        @click="showForm = false"
                    v-else>
                    <font-awesome-icon icon="times"></font-awesome-icon>
                </button>
            </div>
        </div>
        <div class="container mt-6 mb-6" 
            v-show="showForm">
            <div class="card">
                <header class="card-header">
                    <p class="card-header-title">
                        new what's up
                    </p>
                </header>
                <div class="card-content">
                    <whatup-form @getWhatup="getWhatup($event)" 
                        :editId="editId" 
                        ></whatup-form>
                </div>
            </div><!-- end of div.card -->
        </div>
        <div class="columns is-mobile">
            <div class="column">
                <whatup-list :whatup="whatup"
                    @getWhatup="getWhatup($event)" 
                    @edit="edit($event)" 
                    @del="del($event)"
                    ></whatup-list>
            </div><!-- end of div.column show whatup list -->

        </div><!-- end of div.columns -->

        <!-- modal START -->
        <div class="modal" :class="{'is-active':isModalShow}">
            <div class="modal-background"></div>
            <div class="modal-content">
                <!-- Any other Bulma elements you want -->
                <div class="content box">
                    <div v-html="res_status"></div>
                </div>
            </div>
            <button class="modal-close is-large" aria-label="close" 
                @click.prevent="isModalShow = ''"></button>
        </div>
        <!-- modal END -->
    </div>
</template>
<script>
import WhatupForm from './WhatupForm.vue'
import WhatupList from './WhatupList.vue'
export default{
    name:"AdminWhatup",
    components:{
        WhatupForm,
        WhatupList,
    },
    data(){return{
        showForm:false,
        isModalShow:'',
        whatup:'',
        editId:0,
        res_status:'',
    }},
    mounted(){
        this.getWhatup()
    },
    methods:{
        getWhatup(page){
            this.res_status = ''
            this.isModalShow = ''
            this.editId = 0
            let url = ''
            if(page){
                url = page
                this.$cookies.set('wa_old_page',url)
            }
            url = this.$cookies.get('wa_old_page')
            if(!url){
                url = `/api/getwhatup`
            }
            axios.get(url)
                .then(res=>{
                    this.whatup = res.data.whatup
                    
                })
            
        },
        edit(id){
            this.showForm = true 
            this.editId = id
        },
        del(id){
            if(id && id != 0 && 
                confirm(`delete post id ${id}`) == true){
                let url = `/api/admin/whatup/${id}`
                axios.delete(url)
                    .then(res=>{
                        this.res_status = res.data.msg
                        this.isModalShow = 'is-active'
                        setTimeout(()=>{
                            this.getWhatup()
                        },3200)
                    })
            }
            return
        },
    }
}
</script>
