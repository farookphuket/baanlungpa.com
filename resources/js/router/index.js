import {createWebHistory, createRouter} from "vue-router";


// as public view port
import PubView from '../pages/_include/PublicView.vue' 
import Home from '../pages/asPublic/Home';
import About from '../pages/asPublic/About';
import RegisterPage from "../pages/asPublic/RegisterPage.vue"
import LoginPage from "../pages/asPublic/LoginPage.vue"
import LogoutPage from '../pages/asPublic/LogoutPage.vue'
import PageNotFound from "../pages/asPublic/PageNotFound.vue"
import UserConfirmationFail from "../pages/asPublic/UserConfirmationFail.vue"
import userHasConfirmed from "../pages/asPublic/UserHasConfirmed.vue"
import Visitor from "../pages/asPublic/Visitor.vue"

// as Admin view 
import AdminView from "../pages/_include/AdminView.vue" 
import AdminDashboard from "../pages/asAdmin/Dashboard.vue"
import AdminUser from "../pages/asAdmin/User.vue"

// as Member 
import MemberView from "../pages/_include/MemberView.vue"
import MemberDashboard from "../pages/asMember/Dashboard.vue"

export const user_id = window.lsDefault.user_id

export const routes = [
    {
        path:'/',
        redirect:'/',
        component:PubView,
        children:[

            {
                name: 'Home',
                path: '/',
                component: Home
            },
            {
                name: 'About',
                path: '/about',
                component: About
            },

            {
                name: 'LoginPage',
                path: '/login',
                component: LoginPage
            },

            {
                name: 'RegisterPage',
                path: '/register',
                component: RegisterPage
            },
            {
                name:"userHasConfirmed",
                path:"/user-has-confirmed",
                component:userHasConfirmed,
            },

            {
                name: 'Visitor',
                path: '/visitor',
                component: Visitor
            },

        ],
    },
    {
        name:"PageNotFound",
        component:PageNotFound,
        path:'/page-not-found'
    },
    {

        path:'/:pathMatch(.*)*',
        beforeEnter:(to,from,next)=>{
            next({name:'PageNotFound'})   
        },
    },

    /* ======== Admin route START =============*/
    {
        path:'/admin',
        component:AdminView,
        redirect:'/admin',
        children:[
            {

                name:'AdminDashboard',
                path:'/admin',
                component:AdminDashboard,
            },
            {

                name:'AdminUser',
                path:'/user',
                component:AdminUser,
            },
            
        ],
        beforeEnter:(to,from,next)=>{
            if(!user_id){
                next({name:'LoginPage'})
            }else{
                next()
            }
        },
    },
    /* ======== Admin route END =============*/

    /* logout page */
    {
        name:"LogoutPage",
        path:"/logout",
        component:LogoutPage,
        beforeEnter:(to,from,next)=>{
            if(!user_id){
                next({name:'Home'})
            }else{
                next()
            }
        },
    },

    /* ======== Member route START ============ */
    {
        path:'/member',
        component:MemberDashboard,
        redirect:'/member',
        children:[
            {
                name:"MemberDashboard",
                path:'/member',
                component:MemberDashboard,
            }
        ],
        beforeEnter:(to,from,next)=>{
            if(!user_id){
                next({name:'LoginPage'})
            }else{
                next()
            }
        },
        
    },
    /* ======== Member route END  ============ */

];

const router = createRouter({
    history: createWebHistory(),
    routes: routes,
});


router.beforeEach((to,from,next)=>{

    document.title = to.name
    next()
})


export default router;
