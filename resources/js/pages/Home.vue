<template>
    <div>

        <div class="box">
            <h1>this is the box in home</h1>
            <div class="field"><button class="button is-primary is-rounded 
                    is-outlined" @click.prevent="isModalShow='is-active'">
                    <font-awesome-icon icon="check"></font-awesome-icon>
                </button></div>
        </div>

        

        <!-- modal START -->
        <div class="modal" :class="{'is-active':isModalShow}">
            <div class="modal-background"></div>
            <div class="modal-content">
                <!-- Any other Bulma elements you want -->
                <div class="box">
                    <p>this is the modal content</p>
                </div>
            </div>
            <button class="modal-close is-large" aria-label="close" 
                @click.prevent="isModalShow = ''"></button>
        </div>
        <!-- modal END -->

    </div>
</template>

<script>
export default {
    name: "Home",
    data(){return{
        isModalShow:false,
    }}
}
</script>
