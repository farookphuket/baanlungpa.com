<template>
    <div>
        <div class="box" v-if="isNoBlog === true">
            <p class="title has-text-centered">
                There is no data.
            </p>
        </div>
        <article class="box" 
            v-for="bl in blogs.data"
            v-else>
            <p class="title">
                <span>
                    <a href="" 
                        @click.prevent="$emit('openBlog',bl.bl_slug)">
                        {{bl.bl_title}}
                    </a>
                </span>
                
                <span class="tag is-small has-text-success">
                    <font-awesome-icon
                        icon="eye"></font-awesome-icon>
                </span>
            </p>

            <div class="mb-4">
                <div v-html="bl.bl_excerpt"></div>
            </div>

            <!-- show user,read,create START -->
            <div class="mt-4 mb-4">
                <div class="columns is-mobile">
                    <div class="column"><!-- create,read time START -->
                        <div class="mb-4 pb-4">
                            <div class="field is-pulled-left">
                                <span class="mr-2">
                                    <font-awesome-icon 
                                        icon="calendar-week"></font-awesome-icon>
                                </span>
                                <span>
                                    {{moment(bl.created_at)
                                    .format("YYYY-MMM-DD - HH:mm:ss")}}
                                </span>
                                <span class="ml-2 pr-2">
                                    {{moment(bl.created_at).fromNow()}}
                                </span>
                            </div>
                            <div class="field is-pulled-right pr-2">
                                <span class="mr-2">
                                    <font-awesome-icon 
                                        icon="eye"></font-awesome-icon>
                                </span>
                                <span class="mr-2">
                                    {{Object.values(bl.read).length}} 
                                </span>
                                <span class="ml-3 mr-2">
                                    <font-awesome-icon 
                                        icon="user"></font-awesome-icon>
                                </span>
                                <span>{{bl.user.name}}</span>
                            </div>
                        </div>

                    </div><!-- create,read time END -->

                </div>
            </div>
            <!-- show user,read,create END -->
        </article>

        <!-- show pagination START -->
        <div class="mt-2 mb-4">
            <nav class="pagination is-rounded" role="navigation" aria-label="pagination">
                <a class="pagination-previous is-current">All post(s) {{blogs.total}}</a>
                <a class="pagination-next is-current">page {{blogs.current_page}}</a>
              <ul class="pagination-list" v-for="ln in blogs.links">
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
        <!-- show pagination END -->

    </div>
</template>
<script>
var moment = require('moment')
export default{
    name:"BlogList",
    props:["blogs","isNoBlog"],
    data(){
        return{
            moment:moment,
        }
    },

}
</script>
