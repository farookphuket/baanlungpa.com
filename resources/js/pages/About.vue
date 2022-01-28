<template>
    <div>
        <div class="columns">
            <div class="column">
                <h1 class="has-text-centered">
                    this is the title 
                </h1>
                <p>
                    this web has created on 21 Jan 2003 or 
                    {{moment("2003-01-21 23:45:50").format("Y-M-D H:m:s a")}} or
{{moment("2003-01-21 23:45:50").fromNow()}}
                </p>
            </div>

            <div class="column">
                <form action="">
                    <div class="field">
                        <div class="control">
                            <jodit-editor 
                                height=450 
                                v-model="msgBox"></jodit-editor>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
var moment = require('moment')
import JoditEditor from 'jodit-vue3'

export default {
    name: "About",
    data(){
        return{
            moment:moment,
            msgBody:'',
        }
    }
}
</script>
