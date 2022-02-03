<template>
    <div>
        <pub-nav v-show="!userIsLogin"></pub-nav>
        <public-view v-show="showPubPage"></public-view>
        <member-view v-show="userIsMember"></member-view>
        <admin-view v-show="userIsAdmin"></admin-view>
        <footer class="footer">
            <div class="container">
                <div class="field has-text-centered">
                    <p>
                        CORE V{{core_ver}} (PHP {{php_ver}}) 
                    </p>
                </div>
                <div class="field">
                    <visitor></visitor>
                </div>
            </div>
        </footer>
    </div>
</template>
<script>
import PublicView from './pages/_include/PublicView.vue'
import PubNav from "./pages/_include/PubNav.vue"
import Visitor from "./pages/asPublic/Visitor.vue"
import AdminView from './pages/_include/AdminView.vue'
import MemberView from './pages/_include/MemberView.vue'
export default{
    name:"App",
    components:{
        PubNav,
        PublicView,
        AdminView,
        MemberView,
        Visitor,
    },
    data(){
        return{
            php_ver:'',
            core_ver:'',
            userIsLogin:false,
            userIsAdmin:false,
            userIsMember:false,// will use this for later
            showPubPage:true,
            token:null,
            user_id:false,
        }
    },
    mounted(){
        this.dData()
    },
    methods:{
        dData(){
            //console.log(window.lsDefault)
            this.php_ver = window.lsDefault.php_ver
            this.core_ver = window.lsDefault.core_ver

            // get the user passport
            this.checkUserPassport()
        },
        checkUserPassport(){
            this.setDefault()
            let url = `/api/checkuserpassport`
            axios.get(url)
                .then(res=>{
                    
//                    console.log(res.data)
                    let uData = res.data.user
                    if(uData != null){
                        this.showPubPage = false
                        this.userIsLogin = true
                        if(uData.is_admin != 0){
                            this.userIsAdmin = true
                            this.userIsMember = false
                        }else{

                            this.userIsAdmin = false
                            this.userIsMember = true
                        }
                    }

                })
        },
        setUI(){

        },
        setDefault(){
            this.userIsLogin = false 
            this.showPubPage = true
            this.userIsAdmin = false 
            this.userIsMember = false

        },
    },
}
</script>
