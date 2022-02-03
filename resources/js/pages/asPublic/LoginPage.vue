<template>
    <section class="body_content">

        <div class="columns">
            <div class="column">
                <div class="box">
                    <h2 class="title has-text-centered">
                        No Login require!
                    </h2>
                    <p>
                        all of the content on the site is free and always will 
                        unless you want to make some comment or create new 
                        topic so feel free.
                    </p>
                </div>
            </div>
            <div class="column">
                <form action="">
                    <div class="field">
                        <div class="controll">
                            <input v-model="loForm.email" class="input" 
                            type="email" name="" autocomplete="loForm.email"
                            required>
                        </div>
                    </div>

                    <div class="field">
                        <div class="controll">
                            <input v-model="loForm.password" class="input" type="password" 
                            name="" placeholder="~~~~">
                        </div>
                    </div>
                    <!-- show status START -->
                    <div class="field">
                        <div style="padding-left:1px;"  
                            v-html="res_status">
                        </div>
                    </div>
                    <!-- show status START -->
                    <!-- button START -->
                    <div class="field is-pulled-right">
                        <button class="button is-primary 
                            is-rounded is-outlined" 
                            type="submit" 
                            @click.prevent="login">
                            <font-awesome-icon icon="fingerprint">
                            </font-awesome-icon> 
                            <span class="ml-2">
                                Login
                            </span>
                        </button>
                    </div>
                    <!-- button END -->
                </form>
            </div><!-- end of div.column -->
        </div><!-- end of div.columns -->
    </section>
</template>
<script>
export default{
    name:"LoginPage",
    data(){return{
        loForm:{
            email:'',
            password:'',
        },
        res_status:'',
        token:''
    }},
    mounted(){
        
    },
    methods:{
        login(){
            this.res_status = "submitting..."
            let r_url = '/login'
            let fData = new FormData()
            fData.append("email",this.loForm.email)
            fData.append("password",this.loForm.password)
            let url = `/api/login`
            axios.post(url,fData)
                .then(res=>{
                    
                    this.res_status = res.data.msg
                    this.token = res.data.access_token
                    this.$cookies.set("token",this.token)
                    console.log(res.data)
                    r_url = res.data.url
                    setTimeout(()=>{
                        location.href=r_url
                    },2300)
                })
                .catch(err=>{
                    this.res_status = `<span class="tag is-medium is-danger">
                        ${Object.values(err.response.data.errors).join()}
                    </span>`
                })
        },
    },
}
</script>
