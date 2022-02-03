<template>
    <section class="body_content">
        <div class="columns">
            <div class="column">
                <p class="title">
                    this is the colum
                </p>
                <div class="box">
                    <p>
(1) The original question was about scaling based on a browser window size. (2) Elements like div get their own height from their own content, or take available space in a flexbox model. Saying that without explicit width/height the container won't show at all is incorrect. Obviously, if you want to display an empty div with a background image, you will need to set the height and, possibly, width, but then you will see only a part of an image, unless the aspect ratio is exactly the same as of the image itself. – 
Andrei Volgin
 Nov 11
                    </p>
                </div>
                <p class="title">
                    this is another box
                </p>
                <div class="box">
                    <p>
After the AuthController.php file has been successfully generated, now please open the file and change all the code to be as above. In this AuthController.php file, we create register, login and logout methods.

Explanation of these methods:

Register. In this method, we add validation for name, email and password. If the POST request data fails to be validated, it will send an error response from the validation. However, if the POST request is successfully validated, the data from the POST request will be stored in the users table and will create a new token, and will send a json response containing details of the data that has been added along with the token that has been successfully created.
Login. In this method, we add logic to check whether the entered email and password really match one of the data in the users table. If the data fails to be found in the users table, the resulting response will be 401 or Unauthorized. But if the data is found, it will create a new token for that user which will be stored in the personal_access_tokens table.
Logout. This method will delete the user session by deleting all tokens belonging to that user in the personal_access_token table.
Step 5: Define Route
                    </p>
                </div>
            </div>
            <div class="column">
                <p>this is another column</p>
                <register-form></register-form>
            </div>

        </div>

        <!-- dialog box will show after user has registered START -->
        <div class="modal" :class="{'is-active':isModalShow}">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">Thank you.</p>
                    <button class="delete" aria-label="close"></button>
                </header>
                <section class="modal-card-body">
                    <!-- Content ... -->
                    <after-user-has-registered></after-user-has-registered>
                </section>
                <footer class="modal-card-foot">
                    <button class="button is-success" 
                        @click.prevent="goLogin">yes, I'm in</button>
                    <button class="button" 
                        @click.prevent="isModalShow = ''">Cancel</button>
                </footer>
            </div>
        </div>
        <!-- dialog box will show after user has registered END -->
    </section>
</template>
<script>
import AfterUserHasRegistered from './AfterUserHasRegistered.vue'
import RegisterForm from './_RegisterForm.vue'
export default{
    name:"RegisterPage",
    components:{
        RegisterForm,
        AfterUserHasRegistered,
    },
    data(){
        return{
            isModalShow:'',
        } 
    },
    mounted(){
        this.afterRegistered()
    },
    methods:{
        afterRegistered(){
            this.isModalShow = 'is-active'
        },
        goLogin(){
            let url = '/login'
            setTimeout(()=>{
                location.href=url
            },3200)
        },
    }
}
</script>
