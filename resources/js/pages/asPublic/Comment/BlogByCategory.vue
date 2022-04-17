<template>
    <section class="body_content">
        <div class="container">
            <p class="title">Category ({{category_title}})</p>
            <div class="mb-4 pb-6">
                <div class="field is-pulled-right">
                    <button class="button is-primary is-rounded 
                         is-outlined" 
                         @click.prevent="backToBlog">
                        back
                    </button>
                </div>
            </div>

            <!-- show blog list START -->
            <div class="columns is-mobile is-multiline" 
                >
                <div class="column is-4" 
                    v-for="bl in blogs.data">

                        <!-- card 4 START -->
                        <div class="card">
                          <div class="card-image">
                            <figure class="image is-4by3">
                                <a href="" 
                                    @click.prevent="openBlog(bl.bl_slug)">
                                  <img 
                                  :src="bl.bl_cover" 
                                  :alt="bl.bl_title">
                                </a>

                            </figure>
                          </div>
                          <div class="card-content">
                            <div class="media">
                              <div class="media-left">
                                <figure class="image is-48x48">
                                  <img 
                                      :src="bl.bl_cover" 
                                      :alt="bl.bl_title"
                                  >
                                </figure>
                              </div>
                              <div class="media-content">
                                <p class="title is-4">
                                    {{bl.user.name}}
                                </p>
                                <p class="subtitle is-6">
                                    <span v-for="ca in bl.category" 
                                        class="mr-6">
                                        @{{ca.cat_name}}
                                    </span>

                                    <span class="mr-2 has-text-success">
                                        <font-awesome-icon 
                                            icon="eye"></font-awesome-icon>
                                    </span>
                                    <span>{{bl.read.length}}</span>
                                </p>
                              </div>
                            </div>

                            <div class="content">
                                <p>
                                    {{sTitle.smartTitle(bl.bl_excerpt,95)}}
                                </p>


                              <!-- show tags START -->
                              <span class="mr-2" 
                                  v-for="ta in bl.tag">
                                  #{{ta.tag_name}}
                              </span>
                              <!-- show tags END -->

                              <br>
                              <!-- show time START -->
                              <span class="mr-2">
                                  <font-awesome-icon 
                                      icon="calendar-week"></font-awesome-icon>
                              </span>
                              <span class="mr-2">
                                  {{moment(bl.created_at).format("YY-MM-DD HH:mm:ss")}}
                              </span>
                              <span>
                                  {{moment(bl.created_at).fromNow()}}
                              </span>
                              <!-- show time END -->

                            </div>
                          </div>
                        </div>
                        <!-- card 4 END -->
                </div>
            </div>
            <!-- show blog list END -->

            <!-- pagination START -->

        <!-- pagination area START -->
        <div class="mt-6 mb-4 d-flex justify-content-center" 
            v-if="blogs.data != ''">
            <nav class="pagination is-rounded" role="navigation" aria-label="pagination">
                <a class="pagination-previous is-current">All post(s) {{blogs.total}}</a>
                <a class="pagination-next is-current">page {{blogs.current_page}}</a>
              <ul class="pagination-list" v-for="ln in blogs.links">
                <li v-if="ln.url != null && ln.active == false">
                  <a class="pagination-link" 
                  aria-label="Page 1" aria-current="page" v-html="ln.label" 
                  @click.prevent="blogByCategoryId(ln.url)"></a>
                </li>
                <li v-else>
                  <a class="pagination-link is-current"  v-if="ln.active == true" 
                  aria-label="" aria-current="page" v-html="ln.label" 
                  ></a>

                  <a class="pagination-link"  v-else 
                  aria-label="" aria-current="page" v-html="ln.label" 
                  ></a>
                </li>

              </ul>
            </nav>
        </div>
        <!-- pagination area END -->
            <!-- pagination END -->

        </div>
    </section>
</template>
<script>
var moment = require("moment")
export default{
    name:"BlogCategory",
//    props:["category_id"],
    data(){
        return{
            blogs:'',
            category_title:'',
            category_id:0,
            moment:moment,
            perpage:9,
            sTitle:new CustomText(),
        }
    },
    mounted(){
        this.category_id = this.$route.params.slug
        this.blogByCategoryId({page:0,category_id:this.category_id})
    },
    methods:{
        blogByCategoryId(cmd){
            let page = cmd.page 
            let cat_id = cmd.category_id 
            let url = ''
            if(page){
                url = `${page}&perpage=${this.perpage}&cat_id=${cat_id}`
                this.$cookies.set('bycat_old_page',url)
               // console.log(`get this url ${url}`)
            }
            url = this.$cookies.get('bycat_old_page')
            if(!url) url = `/api/blog-by-category?perpage=${this.perpage}&cat_id=${cat_id}` 
            axios.get(url)
                .then(res=>{
                    //console.log(res.data.blog)
                    let theBlogs = res.data.blog 
                    theBlogs.data.map((bl)=>{
                        // category
                        bl.category.map((ca)=>{
                            this.category_title = ca.cat_name
                        })
                    })
                    this.blogs = theBlogs
                    document.title = `category ${this.category_title}`
                })
        },
        openBlog(slug){
            let url = `/${slug}`
            location.href=url
        },
        backToBlog(){
            let url = `/blog-public`
            location.href=url
        },
    },
}
</script>
