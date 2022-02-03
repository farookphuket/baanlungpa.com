<template>
    <div>
        <form action="" @keypress.enter.prevent="register">
            <div class="field">
                <div class="control">
                    <input v-model="uForm.name" class="input" type="text" 
                        placeholder="Name..."
                    ref="name">
                </div>
            </div>
            <div class="field">
                <div class="control">
                    <input v-model="uForm.email" class="input" type="email" 
                        placeholder="Email..."
                    ref="email">
                </div>
            </div>
            <div class="field">
                <div class="control">
                    <input v-model="uForm.password" class="input" type="password" 
                        placeholder="~~~~"
                    >
                </div>
            </div>
            <div class="field is-pulled-left pl-2">
                <div v-html="res_status"></div>
            </div>

            <div class="field is-pulled-right pr-2">
                <button type="submit" @click.prevent="register"
                    class="button is-primary is-rounded is-outlined">
                    <font-awesome-icon icon="check"></font-awesome-icon>
                </button>
            </div>
        </form>
    </div>
</template>
<script>
export default{
    name:"RegisterForm",
    data(){return{
        res_status:'',
        uForm:new Form({
            email:'',
            name:'',
            password:'',
        }),
    }},
    mounted(){
        setTimeout(()=>{
            this.$refs.name.focus()
        },1500)
    },
    methods:{
        register(){
            let url = `/api/register`
            let uData = new FormData()
            uData.append('name',this.uForm.name)
            uData.append('email',this.uForm.email)
            uData.append('password',this.uForm.password)
            axios.post(url,uData)
                .then(res=>{
                    this.res_status = res.data.msg
                })
                .catch(err=>{
                    this.res_status = `<span class="tag is-medium is-danger">
                        ${Object.values(err.response.data.errors).join()}
                        </span>`
                })
            setTimeout(()=>{
                this.res_status = ''
            },3200)

        },

    },
}
</script>
