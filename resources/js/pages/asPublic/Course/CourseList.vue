<template>
    <div>


        <div class="content mb-4 mt-4 pb-4">
            <div class="columns is-mobile">
                <div class="column">
                    <!-- card 4 START -->
                    <div class="card">
                      <div class="card-image">
                        <figure class="image is-4by3">
                          <img 
                          src="/img/placeholders/1280x960.png" 
                          alt="Placeholder image">
                        </figure>
                      </div>
                      <div class="card-content">
                        <div class="media">
                          <div class="media-left">
                            <figure class="image is-48x48">
                              <img src="/img/placeholders/96x96.png" 
                              alt="Placeholder image">
                            </figure>
                          </div>
                          <div class="media-content">
                            <p class="title is-4">
                                ครูมดแดง
                            </p>
                            <p class="subtitle is-6">@kroo-moddang</p>
                          </div>
                        </div>

                        <div class="content">
                            <p>
                                Collective Bargaining for International Business 
                                <br>
                                (การเจรจาต่อรองสำหรับธุรกิจระหว่างประเทศ)
                            </p>

                          <a>@bulmaio</a>.
                          <a href="#">#css</a> <a href="#">#responsive</a>
                          <br>
                          <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
                        </div>
                      </div>
                    </div>
                    <!-- card 4 END -->
                </div>
                <!-- end of div.column>div.card-4 -->

                <!-- START of div.column>div.card-5 -->
                <div class="column">
                    <!-- card 5 START -->
                    <div class="card">
                      <div class="card-image">
                        <figure class="image is-4by3">
                          <img 
                          src="/img/placeholders/1280x960.png" 
                          alt="Placeholder image">
                        </figure>
                      </div>
                      <div class="card-content">
                        <div class="media">
                          <div class="media-left">
                            <figure class="image is-48x48">
                              <img src="/img/placeholders/96x96.png" 
                              alt="Placeholder image">
                            </figure>
                          </div>
                          <div class="media-content">
                            <p class="title is-4">
                                ครูมดแดง
                            </p>
                            <p class="subtitle is-6">@kroo-moddang</p>
                          </div>
                        </div>

                        <div class="content">
                            <p>
                              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                              Phasellus nec iaculis mauris. 
                            </p>


                          <a>@bulmaio</a>.
                          <a href="#">#css</a> <a href="#">#responsive</a>
                          <br>
                          <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
                        </div>
                      </div>
                    </div>
                    <!-- card 5 END -->
                </div>
                <!-- END of div.column>div.card-5 -->
            </div>



        </div>

        <div class="columns is-mobile">

            <!-- column 1 START -->
            <div class="column">
                <!-- card 1 START -->
                <div class="card">
                  <div class="card-image">
                    <figure class="image is-4by3">
                      <img 
                      src="/img/placeholders/1280x960.png" 
                      alt="Placeholder image">
                    </figure>
                  </div>
                  <div class="card-content">
                    <div class="media">
                      <div class="media-left">
                        <figure class="image is-48x48">
                          <img src="/img/placeholders/96x96.png" 
                          alt="Placeholder image">
                        </figure>
                      </div>
                      <div class="media-content">
                        <p class="title is-4">John Smith</p>
                        <p class="subtitle is-6">@johnsmith</p>
                      </div>
                    </div>

                    <div class="content">
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                      Phasellus nec iaculis mauris. <a>@bulmaio</a>.
                      <a href="#">#css</a> <a href="#">#responsive</a>
                      <br>
                      <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
                    </div>
                  </div>
                </div>
                <!-- card 1 END -->


            </div>
            <!-- column 1 END -->

            
            <!-- column 2 START -->

            <div class="column">

                <!-- card 2 START -->
                <div class="card">
                  <div class="card-image">
                    <figure class="image is-4by3">
                      <img 
                      src="/img/placeholders/1280x960.png" 
                      alt="Placeholder image">
                    </figure>
                  </div>
                  <div class="card-content">
                    <div class="media">
                      <div class="media-left">
                        <figure class="image is-48x48">
                          <img src="/img/placeholders/96x96.png" 
                          alt="Placeholder image">
                        </figure>
                      </div>
                      <div class="media-content">
                        <p class="title is-4">
                            ครูมดแดง
                        </p>
                        <p class="subtitle is-6">@janensmith</p>
                      </div>
                    </div>

                    <div class="content">
                        <p>
                        collective Bargaining for international business
                        <br>
                        (การเจรจาต่อรองสำหรับธุรกิจระหว่างประเทศ)
                        </p>

                      <a>@bulmaio</a>.
                      <a href="#">#css</a> <a href="#">#responsive</a>
                      <br>
                      <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
                    </div>
                  </div>
                </div>
                <!-- card 2 END -->
            </div>
            <!-- column 2 END -->

        </div><!-- end of div.columns.is-mobile -->

        <div class="mb-4">
            <div class="columns is-mobile">
                <div class="column is-4 " 
                    v-for="co in course.data">
                        <!-- card list START -->
                        <div class="card">
                          <div class="card-image">
                            <figure class="image is-4by3">
                              <img 
                              :src="co.course_cover" 
                              :alt="co.course_name">
                            </figure>
                          </div>
                          <div class="card-content">
                            <div class="media">
                              <div class="media-left">
                                <figure class="image is-48x48">
                                  <img src="/img/placeholders/96x96.png" 
                                  alt="Placeholder image">
                                </figure>
                              </div>
                              <div class="media-content">
                                <p class="title is-4">
                                    ครูมดแดง
                                </p>
                                <p class="subtitle is-6">@janensmith</p>
                              </div>
                            </div>

                            <div class="content">
                                <p>
                                collective Bargaining for international business
                                <br>
                                (การเจรจาต่อรองสำหรับธุรกิจระหว่างประเทศ)
                                </p>

                              <a>@bulmaio</a>.
                              <a href="#">#css</a> <a href="#">#responsive</a>
                              <br>
                              <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
                            </div>
                          </div>
                        </div>
                        <!-- card 2 END -->



                </div>
            </div>
        </div>

        <div class="mt-4 mb-4 pb-4">
            <div class="field is-pulled-right">
                <button class="button is-primary is-rounded 
                    is-outlined" 
                    @click.prevent="openCourse">
                    <font-awesome-icon 
                        icon="arrow-right"></font-awesome-icon>
                    <span class="ml-2">
                       All free course (ดูคอร์สฟรีทั้งหมด)
                    </span>
                </button>
            </div>
        </div>


    </div>
</template>



<script>
var moment = require('moment')

export default{
    name:"CourseList",
    props:["num_course","course"],
    data(){
        return{
            moment:moment,
        }
    },
    methods:{
        /*
        the3Obj(){
            this.theLast3Object = this.theArray
                .slice(Math.max(this.theArray.length - 3,0))
        },
        */
        openCourse(){
            //let url = `https://course.baanlungpa.com/public-course`
            let url = `http://course.baanlungpa.com/public-course`
            location.href=url
        },
    },

}
</script>
