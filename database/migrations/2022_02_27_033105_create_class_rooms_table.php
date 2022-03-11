<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClassRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('class_rooms', function (Blueprint $table) {
            $table->id();
            $table->foreignId("user_id")->constrained()
                ->onDelete("cascade");
            $table->string("class_title");
            $table->longText("class_description");
            $table->string("class_level");
            $table->string("class_year");
            $table->timestamps();
        });


        Schema::create('class_room_student', function (Blueprint $table) {
            $table->id();
            $table->foreignId("student_id")->constrained()
                ->onDelete("cascade");

            $table->foreignId("class_room_id")->constrained()
                ->onDelete("cascade");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('class_rooms');
        Schema::dropIfExists('class_room_student');
    }
}
