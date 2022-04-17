<template>
    <section class="body_content">
        <div class="container">
            <blog-list :blog="blogs" 
                :isNoBlog="isNoBlog" 
                :tag_has_blog="tag_has_blog" 
                :cat_has_blog="cat_has_blog"
                @openBlog="openBlog($event)" 
                @getBlog="getBlog($event)" 
                @showByCategoryId="showByCategoryId($event)" 
                v-if="isShowAllPost !== false"></blog-list>

        </div>
    </section>
</template>
<script>
import BlogList from "./BlogList.vue"
export default{
    name:"PubBlog",
    components:{
        BlogList,
    },
    data(){
        return{
            blogs:'',
            isNoBlog:false,
            tag_has_blog:'',
            cat_has_blog:'',
            perpage:9,
            isShowAllPost:true,
        }
    },
    mounted(){
        this.getBlog()
    },
    methods:{
        getBlog(page){
            let url = ''
            if(page){
                url = `${page}&perpage=${this.perpage}` 
                this.$cookies.set('pubblog_old_page',url)
            }
            url = this.$cookies.get('pubblog_old_page')
            if(!url) url = `/api/blog?perpage=${this.perpage}`
            axios.get(url)
                .then(res=>{
                    //console.log(res.data)
                    let blog_list = res.data.blog
                    let blog_tag = res.data.tag_has_blog 
                    let blog_cat = res.data.cat_has_blog
                    if(Object.values(blog_list.data).length === 0){
                        this.isNoBlog = true
                    }
                    this.blogs = blog_list
                    document.title = `public blog,write your own today`

                    this.tag_has_blog = blog_tag 
                    this.cat_has_blog = blog_cat

            })
        },
        openBlog(slug){
            let url = `/${slug}`
            location.href=url
        },

    },
}
</script>
