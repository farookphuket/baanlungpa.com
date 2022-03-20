<template>
    <section class="body_content">
        <div class="container">
            <course-list 
                :course="course" 
                :num_course="num_course" 
                ></course-list>
        </div>
    </section>

</template>
<script>

import CourseList from './Course/CourseList.vue'

export default{
    name:"PubCourse",
    components:{
        CourseList,
    },
    data(){
        return{
            course:'',
            num_course:0,
            perpage:15,
        }
    },
    mounted(){
        this.getWelcome()

    },
    methods:{
        getWelcome(){
            document.title = "เรียนออนไลน์ฟรี,สอนออนไลน์,เรียนกับครูมดแดง "
            this.getCourse()
        },
        getCourse(page){
            let url = ''
            if(page){
                url = `${page}&perpage=${this.perpage}`
                this.$cookies.set("old_course_page",url)
            }
            url = this.$cookies.get("old_course_page")
            if(!url) url = `/api/free-course?perpage=${this.perpage}`
            axios.get(url)
                .then(res=>{
                    let coData = res.data.course

                    if(coData.data.length > 0){
                       this.num_course = coData.data.length 
                    }

                    this.course = res.data.course
                })
        },
    },
}
</script>
