<template>
    <div>
        <div class="box" v-if="isNoBlog === true">
            <p class="title has-text-centered">
                There is no data
            </p>
        </div>
        <div class="columns is-mobile is-multiline" 
            v-else>
            <div class="column is-4" 
                v-for="bl in blog.data">

                    <!-- card 4 START -->
                    <div class="card">
                      <div class="card-image">
                        <figure class="image is-4by3">
                            <a href="" 
                                @click.prevent="$emit('openBlog',bl.bl_slug)">
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
                                {{sTitle.smartTitle(bl.bl_excerpt,90)}}
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


        <!-- pagination area START -->
        <div class="mt-6 mb-4 d-flex justify-content-center" 
            v-if="blog.data != ''">
            <nav class="pagination is-rounded" role="navigation" aria-label="pagination">
                <a class="pagination-previous is-current">All post(s) {{blog.total}}</a>
                <a class="pagination-next is-current">page {{blog.current_page}}</a>
              <ul class="pagination-list" v-for="ln in blog.links">
                <li v-if="ln.url != null && ln.active == false">
                  <a class="pagination-link" 
                  aria-label="Page 1" aria-current="page" v-html="ln.label" 
                  @click.prevent="$emit('getBlog',ln.url)"></a>
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

        <!-- tag ,Category START -->
        <div class="mt-4 pt-4 mb-4 pb-4">
            <div class="columns is-mobile">
                <div class="column">
                    <p class="title">Tag</p>
                    <div class="field">
                        <div class="tags">

                            <span v-for="ta in tag_has_blog" 
                                >
                                <span class="tag mr-2 is-medium has-text-info 
                                has-text-weight-bold"
                                      v-if="ta.blog.length !== 0">
                                    {{ta.tag_name}} ({{ta.blog.length}})</span>
                            </span>
                        </div>
                    </div>
                </div><!-- end of div.column -->

                <div class="column">
                    <p class="title">category</p>
                    <div class="field">
                        <div class="tags">
                            <span 
                                v-for="ca in cat_has_blog">
                                <span class="tag mr-2 is-medium 
                                has-text-primary has-text-weight-bold" 
                                    v-if="ca.blog.length !== 0">
                                    <a href="" 
                                        @click.prevent="openCategory(ca.cat_slug)">
                                        {{ca.cat_name}}
                                    </a>
                                     ({{ca.blog.length}})
                                </span>
                            </span>
                        </div>
                    </div>
                </div><!-- end of div.colum -->
            </div><!-- end of div.columns -->
        </div><!-- end of div show tag,category -->

    </div>
</template>
<script>
var moment = require("moment")
export default{
    name:"BlogList",
    props:["blog","isNoBlog","tag_has_blog","cat_has_blog"],
    data(){
        return{
            moment:moment,
            sTitle:new CustomText(),
        }
    },
    methods:{
        openCategory(slug){
            let url = `/category/${slug}`
            location.href=url
        },
    },
}
</script>
