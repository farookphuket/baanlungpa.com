<template>
    <div class="pb-4 mb-4">
        <form action="">

            <div class="mt-2 mb-4">
                <div class="box">
                    <p class="title">
                        Title of your post.
                    </p>
                    <p class="subtitle">
                        text limit at 80 leters.
                    </p>
                </div>
                <div class="field">
                    <div class="control has-icons-right">
                        <input v-model="bForm.bl_title" class="input" type="text" 
                        ref="title" placeholder="Title..."
                        name="">
                        <span class="icon is-right">
                            {{bForm.bl_title.length}}
                        </span>
                    </div>
                </div>
                <div class="field" v-if="bForm.bl_title.length >= 2">
                    <p>
                        <span class="content has-text-info 
                            has-text-weight-bold">
                            {{slugText.thaiSlug(bForm.bl_title)}}
                        </span>
                        <span class="tag is-medium is-rounded ml-2">
                            {{bForm.bl_title.length}}
                        </span>
                        <span class="tag is-medium has-text-danger 
                        has-text-weight-bold" 
                        v-if="bForm.bl_title.length >= 81">
                        Error! your title is too long.</span>
                    </p>
                </div>
            </div>


            <div class="mt-2 mb-4 pb-2">
                <div class="box">
                    <p class="title">
                        category
                    </p>
                    <p class="subtitle">
                        this will specify your content.
                    </p>
                </div>
                <div class="field">
                    <div class="select">
                        <select v-model="bForm.category" name="" 
                            @change.prevent="setCategory" 
                            ref="category">
                            <option value="">-- Select Category --</option>
                            <option :value="ca.id" v-for="ca in category">
                            {{ca.cat_name}}
                            </option>
                        </select>
                    </div>
                </div>
            </div>


            <!-- user upload,url for cover START -->
            <div class="mt-2 mb-4">
                <div class="columns is-mobile">

                    <!-- user upload START -->
                    <div class="column">
                        <div class="box">
                            <p class="title">
                                upload cover
                            </p>
                            <p>
                                limit size to 2 MB.
                            </p>
                        </div>

                        <div class="file has-name">
                          <label class="file-label">
                            <input class="file-input" type="file" 
                            ref="bl_cover_upload" 
                            @change="preveiewUploadCover"
                            >
                            <span class="file-cta">
                              <span class="file-icon">
                                  <font-awesome-icon 
                                      icon="upload"></font-awesome-icon>
                              </span>
                              <span class="file-label">
                                Choose a file…
                              </span>
                            </span>
                            <span class="file-name">
                                {{upload_file_name}}
                            </span>
                          </label>
                        </div>


                    </div>
                    <!-- user upload END -->

                    <!-- image url START -->
                    <div class="column">
                        <div class="field">
                            <div class="box">
                                <p class="title">
                                    copy the url
                                </p>
                                <p>
                                    paste the url here click 'eye' button to 
                                    preview.
                                </p>
                            </div>

                            <div class="field has-addons">

                                <div class="control">
                                    <input v-model="bForm.bl_cover_url" 
                                    class="input" 
                                    ref="bl_cover_url"
                                    type="text" name="" 
                                    placeholder=
            "paste image url then hit the eye icon..." 
                                     
                                    >

                                </div>

                                <div class="control">
                                    <a class="button is-link" href="" 
                                        @click.prevent="showUrlImagePreview">
                                        <font-awesome-icon 
                                            icon="eye"></font-awesome-icon>

                                    </a>
                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- image url END -->
                </div>
            </div>
            <!-- user upload,url for cover END -->


            <!-- preveiew cover image START -->
            <div class="mb-4" 
                v-if="isShowPreview !== false">
                <div class="has-text-centered">
                    <figure class="justify-content-center">
                        <img :src="photo_obj.img" :alt="photo_obj.alt" 
                        style="max-width:450px;max-height:300px;">
                    </figure>
                    <p class="has-text-centered">
                        {{photo_obj.alt}} 

                    </p>
                    <div class="mt-2 mb-4" v-show="file_is_too_big">
                        <div v-html="too_big_msg"></div>
                    </div>
                </div>
            </div>
            <!-- preveiew cover image END -->



            <div class="mt-2 mb-2">
                <div class="box">
                    <p class="title">
                      excerpt
                    </p>
                    <p class="subtitle">
                        your text is limit at 200 letters
                    </p>
                </div>

                <div class="field">

                    <div class="control has-icons-right">
                        <textarea v-model="bForm.bl_excerpt" class="textarea" 
                            name="" ></textarea>
                        <span class="icon is-right 
                            has-text-weight-bold">{{bForm.bl_excerpt.length}}</span>
                    </div>

                </div>

            </div>
            <!-- end of excerpt text -->
            
            <!-- body text start -->
            <div class="mt-2 mb-2">
                <div class="box">
                    <p class="title">post content</p>
                    <p class="subtitle">
                        your text content here
                    </p>
                </div>

                <div class="field">
                    <div class="control">
                        <jodit-editor 
                            height=450
                            v-model="bForm.bl_body" 
                            :editorOptions="options" 
                            ></jodit-editor>
                    </div>
                </div>
                <!-- jodit-vue3 still the problem on update show none data 
                    9-Feb-2022 -->
                    <div class="mt-4 mb-4">
                        <div class="field is-pulled-right">
                            <span class="mr-2 tag is-rounded">
                                {{bForm.bl_body.length}}
                            </span>

                            <button class="button is-rounded is-primary 
                                is-small pr-4" 
                                @click.prevent="copyBodyCode" 
                                    v-if="bForm.bl_body.length >= 5">
                                <font-awesome-icon 
                                    icon="copy"></font-awesome-icon>
                                <span class="ml-2">copy text</span>
                            </button>
                        </div>
                        <div class="field">
                            <div class="box">
                                <textarea class="textarea" 
                                ref="bl_body"
                                v-model="bForm.bl_body"></textarea>
                            </div>
                        </div>
                    </div>

                <!-- jodit-vue3 still the problem on update show none data 
                    9-Feb-2022 -->

            </div>
            <!-- end of excerpt text -->



            <div class="mb-4 pb-4 pt-4">
                <div class="box">
                    <p class="title">select tag or create new one</p>
                </div>
                <div class="columns is-mobile">
                    <!-- show tag list START -->
                    <div class="column is-9">
                        <label for="" v-for="ta in tag" 
                            class="checkbox">
                            <input v-model="bForm.tag" type="checkbox" 
                            :value="ta.id"> 
                            <span class="ml-2 pr-2">{{ta.tag_name}}</span>
                        </label>
                    </div>
                    <!-- show tag list End -->
                    <div class="column">
                        <div class="field">
                            <div class="control pr-2">
                                <input v-model="bForm.new_tag" class="input" type="text" 
                                ref="new_tag" @keypress="showHelp1 = true"
                                @keydown.enter.prevent="saveTag"
                                name="" placeholder="New tag...">
                            </div>
                        </div>
                        <div class="field" 
                             v-if="bForm.new_tag.length >= 2">
                            <span  
                                class="tag is-medium has-text-info">
                                Hit enter to save</span>
                            <span class="ml-2 mr-2">
                               "{{bForm.new_tag}}" 
                            </span>
                            <span class="tag is-medium">
                                {{bForm.new_tag.length}}
                            </span>
                            <span class="tag has-text-danger  
                                has-text-weight-bold is-medium" 
                                  v-if="bForm.new_tag.length >= 19">
                                  Error! your tag is too long
                            </span>
                        </div>
                    </div>
                </div>
            </div><!-- End of div show tag wrapper -->

            <!-- show bl_is_public checkbox ,save button START -->
            <div class="mt-2 mb-2">
                <div class="box">
                    <p class="title">Public your post?</p>
                </div>
                <div class="columns is-mobile">
                    <div class="column">
                        <label class="checkbox" for="">
                            <input v-model="bForm.bl_is_public" 
                            type="checkbox" name="">
                            <span class="tag is-medium has-text-warning 
                            is-danger" 
                                v-if="bForm.bl_is_public === false">
                                Keep it private</span>
                            <span class="tag is-medium has-text-success 
                                has-text-weight-bold" v-else>
                                Public this post 
                            </span>
                        </label>
                    </div>
                    <div class="column">
                        <div class="field is-pulled-right">

                            <button class="button is-danger is-outlined 
                                is-rounded ml-2" 
                                @click.prevent="closeAndRefresh">
                                <font-awesome-icon 
                                    icon="times"></font-awesome-icon>
                                <span class="ml-2 is-uppercase">
                                    clear & close
                                </span>
                            </button>
                            <button class="button is-primary is-rounded 
                                is-outlined" 
                                type="submit"
                                @click.prevent="saveBlog(editId)">
                                <font-awesome-icon 
                                    icon="check"></font-awesome-icon>
                                <span class="ml-2" v-if="editId == 0">Create</span>
                                <span class="ml-2" v-else>Save</span>
                            </button>

                        </div>
                    </div>
                </div>
            </div>
            <!-- show bl_is_public checkbox ,save button END -->

            <!-- show status under save button Start -->
            <div class="mt-2 mb-2 pb-6">
                <div class="field is-pulled-right">
                    <div v-html="res_status"></div>
                </div>
            </div>
            <!-- show status under save button END -->
        </form>
    </div>
</template>
<script>

import {JoditEditor} from "jodit-vue3"

export default{
    name:"BlogForm",
    props:["tag","category","editId"],
    components:{
        JoditEditor,
    },

    data(){
        return{

            res_status:'',
            slugText:new CustomText(),
            showHelp1:false,
            bForm:new Form({
                bl_title:'',
                bl_slug:'',
                bl_cover_upload:'',
                bl_cover_url:'',
                bl_excerpt:'',
                bl_body:'',
                bl_is_public:true,
                category:'',
                new_tag:'',
                tag:[],
            }),
            options:{
                askBeforePasteHTML:false,
                disablePlugins:"powered-by-jodit",
            },
            upload_obj:{
                file:null,
                img:'',
                size:0,
            },
            photo_obj:{
                img:'',
                alt:''
            },
            upload_file_name:'no file select',
            file_is_too_big:false,
            too_big_msg:'',
            isShowPreview:false,

        }
    },
    watch:{
        "editId":function(x){
            this.getEditData(x)
        }
    },
    mounted(){
        this.isEditingMode()
    },
    methods:{
        getEditData(x){
            if(x && x !==  0){
                setTimeout(()=>{
                    this.$refs.title.focus()
                },700)
                this.bForm.category = 0
                this.bForm.tag = []
                this.bForm.bl_is_public = false
                this.isShowPreview = true
                let url = `/api/admin/blog/${x}/edit`
                axios.get(url)
                    .then(res=>{
                        //console.log(res.data)
                        let rData = res.data.blog
                        //console.log(rData.bl_is_public)
                        if(rData.bl_is_public !== 0){
                            this.bForm.bl_is_public = true
                        }
                        this.bForm.bl_title = rData.bl_title
                        this.bForm.bl_excerpt = rData.bl_excerpt
                        this.bForm.bl_body = rData.bl_body


                        // image preview 
                        this.photo_obj.img = rData.bl_cover
                        this.photo_obj.alt = rData.bl_title

                        rData.category.map((ca)=>{
                            //console.log(ca)
                            if(ca.pivot.blog_id === rData.id){
                                this.bForm.category = ca.pivot.category_id
                            } 
                        })

                        rData.tag.map((ta)=>{
                            //console.log(ta)
                            if(ta.pivot.blog_id === rData.id){
                                this.bForm.tag.push(ta.pivot.tag_id)
                            }

                        })
                    })
            }
        },
        isEditingMode(){
            // there will not be an editing mode on the first load 
            // so we have to delete if it a cookies of editId exist
            // remove the cookies at the first form load 
            if(this.$cookies.get("editId") && 
                this.$cookies.get("editId") !== 0){
                this.$cookies.remove("editId")
            }

        },
        saveBlog(id){
            if(this.formHasError() === true){
                return 
            }else{

            this.bForm.bl_slug = this.slugText.thaiSlug(this.bForm.bl_title)


           /*     
            let fData = {
                bl_title:this.bForm.bl_title,
                bl_slug:this.bForm.bl_slug,
                bl_excerpt:this.bForm.bl_excerpt,
                bl_body:this.bForm.bl_body,
                bl_is_public:this.bForm.bl_is_public,
                category:this.bForm.category,
                tag:this.bForm.tag,
                new_tag:this.bForm.new_tag,
            }
            */


            let fData = new FormData()


            fData.append("bl_cover_upload",this.bForm.bl_cover_upload)
            fData.append("bl_cover_url",this.bForm.bl_cover_url)

            fData.append("bl_title",this.bForm.bl_title)
            fData.append("bl_slug",this.bForm.bl_slug)
            fData.append("bl_excerpt",this.bForm.bl_excerpt)
            fData.append("bl_body",this.bForm.bl_body)
            fData.append("bl_is_public",this.bForm.bl_is_public)

            // the tags is in array so you have to loop throught
            // code from :https://stackoverflow.com/questions/68841019/how-to-send-array-and-formdata-with-axios-vue 
            // 1 Apr 2022
            this.bForm.tag.forEach((ta)=>{
                fData.append("tag[]",ta)
            })

            fData.append("new_tag",this.bForm.new_tag)
            fData.append("category",this.bForm.category)



            let url = `/api/member/blog`
            if(id && id !== 0){
                url = `/api/member/blog/${id}`
                fData.append("_method","PUT")

            }
                axios.post(url,fData)
                    .then(res=>{
                        this.res_status = res.data.msg
                        setTimeout(()=>{
                            this.res_status = ''
                            this.bForm.reset()
                           this.$emit('getBlog') 
                        },2500)
                    })
                    .catch(err=>{
                        this.res_status = `<span class="
                        tag is-medium has-text-weight-bold has-text-danger
                        ">
                    ${Object.values(err.response.data.errors).join()}
                            </span>`
                    })
            }
            


        },
        formHasError(){

            if(!this.bForm.category || 
                this.bForm.category === '' || this.bForm.bl_title === ''){
                alert('Error please check your input')
                return true
            }else{
                return false
            }
        },
        setCategory(){
            // set the category id
            this.bForm.category = this.$refs.category.value
            //console.log(`the value of bl cat is ${this.bForm.category}`)
        },
        saveTag(){
            // create new tag 
            if(this.bForm.new_tag.length >= 4){
                let url = `/api/admin/tag`
                let tData = {tag_name:this.bForm.new_tag}
                axios.post(url,tData)
                    .then(res=>{
                        this.res_status = res.data.msg
                        setTimeout(()=>{
                            this.res_status = ''
                            this.$emit('getBlog')
                            this.bForm.new_tag = ''
                        },2500)
                    })
                    .catch(err=>{
                        this.res_status = `<span class="
                        tag is-medium has-text-danger has-text-weight-bold
                        ">
                        ${Object.values(err.response.data.errors).join()}
                    </span>`
                    })
            }else{
                alert('more letters please')
                return
            }
        },
        copyBodyCode(){
            this.$refs.bl_body.select()
            document.execCommand('copy')
        },
        closeAndRefresh(){
            this.bForm.reset()
            this.$emit("closeAndRefresh")
        },
        preveiewUploadCover(e){
            // reset preview 
            this.resetImagePreview()
            const theFile = e.target.files[0]
            let the_upload_size = theFile.size/1024/1024


            // upload object
            this.upload_obj = {
                file:theFile,
                img:URL.createObjectURL(theFile),
                size:the_upload_size
            }

            // preview object 
            this.photo_obj = {
                img:this.upload_obj.img,
                alt:this.upload_obj.file.name
            }
            
            // upload file name 
            this.upload_file_name = this.upload_obj.file.name


            if(the_upload_size > 2){
                this.too_big_msg = `<span class="has-text-weight-bold 
                has-text-danger">Error,the upload file 
                ${this.upload_file_name} is too big!  
                make sure your upload file size is less than 2 MB!</span>`
                this.file_is_too_big = true
            }

            // form value 
            this.bForm.bl_cover_upload = theFile

            // set show preview to true
            this.isShowPreview = true
            
        },
        showUrlImagePreview(){
            this.resetImagePreview()
            /* clear the previous value from form */
            const theUrl = this.$refs.bl_cover_url.value
            if(theUrl && theUrl !== ''){
                this.upload_obj = {}
                this.photo_obj = {
                    img:theUrl,
                    alt:theUrl
                }
                this.bForm.bl_cover_url = theUrl
                this.upload_file_name = theUrl
            }


            // set show preveiew to true
            this.isShowPreview = true
        },
        resetImagePreview(){
            this.file_is_too_big = false 
            this.too_big_msg = ''
            this.bForm.bl_cover_upload = ''
            this.bForm.bl_cover_url = ''
            this.isShowPreview = false
            this.upload_file_name = ''
        },


    },
}
</script>
