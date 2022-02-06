<template>
    <section class="body_content">

        <div class="columns is-mobile">
            <div class="column">

                <div class="card">
                    <header class="card-header">
                        <p class="card-header-title">
                            {{user.name}}'s profile
                        </p>
                    </header>
                    <div class="card-content">
                        <p class="subtitle">
                            {{user.email}}
                        </p>
                    </div>

                    <footer class="card-footer">
                        <button class="button is-block is-outlined 
                            is-rounded is-danger is-uppercase" 
                            @click.prevent="deleteMyAccount(user_id)">
                            <font-awesome-icon 
                                icon="times"></font-awesome-icon>
                            <span class="ml-2">
                                delete my account
                            </span>
                        </button>
                    </footer>
                </div>
                
            </div>
            <div class="column">
                <profile-form :user="user"  
                    @getUser="getUser($event)" 
                    @confMyPass="confMyPass($event)"></profile-form>
            </div>
        </div>

        <confirm-my-password ref="confirmBox" 
            @confMyPass="confMyPass($event)"></confirm-my-password>
    </section>
</template>
<script>
import ProfileForm from "./ProfileForm.vue"
import ConfirmMyPassword from "./ConfirmMyPassword.vue" 
export default{
    name:"Profile",
    components:{
        ProfileForm,
        ConfirmMyPassword,
    },
    data(){return{
        user:'',
        user_id:0,
        res_status:'',
        runConfirm:false,
    }},
    mounted(){
        this.getUser()

    },
    methods:{
        getUser(){
            let url = `/api/member/user`
            axios.get(url)
                .then(res=>{
                    //console.log(res.data)
                    this.user = res.data.user
                    this.user_id = this.user.id
                })
        },
        confMyPass(){
            this.$refs.confirmBox.showConfirmationBox()
                
        },
        checkIsUserNeedConfirm(){
            if(!this.$cookies.get('user_is_confirmed') || 
                this.$cookies.get('user_is_confirmed') !== 'true'){
                this.confMyPass()
                return false
            }
            return true
        },
        deleteMyAccount(id){
            if(id && id !== 0 && 
                confirm(`delete your account id ${id}?`) === true && 
            this.checkIsUserNeedConfirm() === true){
                let url = `/api/member/profile/${id}`
            }else{
                return
            }
        },
    },
}
</script>
