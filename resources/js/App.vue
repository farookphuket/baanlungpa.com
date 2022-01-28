<template>
    <div>
        <pub-nav></pub-nav>
        <div class="box">
            <h1 class="has-text-centered">this is bulma</h1>
            <p>
                <font-awesome-icon icon="lock"></font-awesome-icon>
            </p>
        </div>
        <router-view></router-view>
    </div>
</template>
<script>
import PubNav from "./pages/_include/PubNav.vue"
export default{
    name:"App",
    components:{
        PubNav,
    },
}
</script>
