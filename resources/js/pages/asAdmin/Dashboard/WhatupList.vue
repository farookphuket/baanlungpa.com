<template>
    <div>
        <div class="card">
            <header class="card-header">
                <p class="card-header-title">
                    What's going on? {{moment(today).format("YY-MM-DD")}}
                </p>
            </header>
            <div class="card-content">
                <p class="title" v-if="whatup.data == ''">
                    There is no data now.
                </p>
                <!-- whatup-list START -->
                <article class="box " v-for="wp in whatup.data" 
                    v-else>
                    <p class="title">{{wp.wp_title}}</p>
                    <div v-html="wp.wp_body"></div>

                    <div class="field is-pulled-left mt-4 mb-4">
                        <nav class="level is-mobile">
                            <div class="level-item">
                                <span class="mr-2">
                                    <font-awesome-icon 
                                        icon="user"></font-awesome-icon>
                                </span>
                                <span >{{wp.user.name}}</span>
                            </div>

                            <div class="level-item">
                                <span class="mr-2">
                                    <font-awesome-icon 
                                        icon="calendar-plus"></font-awesome-icon>
                                </span>
                                <span class="mr-2">
                                    {{moment(wp.created_at).format("DD-MM-YY")}}
                                </span>
                                <br />
                                <span >({{moment(wp.created_at).fromNow()}})</span>
                            </div>
                        </nav>
                    </div>

                    <div class="content mb-6 mt-4">
                        <div class="field is-pulled-right" 
                            v-if="wp.user.is_admin != 0">
                            <button class="button is-primary is-outlined" 
                                @click="$emit('edit',wp.id)">
                                <font-awesome-icon icon="edit">
                                </font-awesome-icon>
                            </button>

                            <button class="button is-danger is-outlined" 
                                @click="$emit('del',wp.id)">
                                <font-awesome-icon icon="trash">
                                </font-awesome-icon>
                            </button>
                        </div>
                    </div>
                </article>
                <!-- whatup-list END -->
            </div>

            <!--pagination START -->

            <div class="content mt-4 mb-4" v-if="whatup.total != 0">

                <nav class="pagination is-rounded" role="navigation" 
                    aria-label="pagination">
                    <a class="pagination-previous is-current">All post(s) 
                        {{whatup.total}}</a>
                    <a class="pagination-next is-current">
                        page {{whatup.current_page}}</a>
                  <ul class="pagination-list" v-for="ln in whatup.links">
                    <li v-if="ln.url != null && ln.active == false">
                      <a class="pagination-link" 
                      aria-label="Page 1" aria-current="page" v-html="ln.label" 
                      @click.prevent="$emit('getWhatup',ln.url)"></a>
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
            <!--pagination END -->
        </div><!-- end of div.card -->
    </div>
</template>
<script>
var moment = require('moment')
export default{
    name:"WhatupList",
    props:["whatup"],
    data(){
        return{
            moment:moment,
            today:'',
            user_id:'',
        }
    },
    mounted(){
        this.today = new Date()
        this.user_id = window.lsDefault.user_id
    },

}
</script>
