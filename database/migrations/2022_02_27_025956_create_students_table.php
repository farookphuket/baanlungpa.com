<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->foreignId("user_id")->constrained()
                    ->onDelete("cascade");
            $table->boolean("is_study_now")->default(0);
            $table->timestamp("studied_at");
            $table->timestamp("successed_at")->nullable();
            $table->timestamps();
        });

        Schema::create('course_student', function (Blueprint $table) {
            $table->id();

            $table->foreignId("course_id")->constrained()
                                          ->onDelete("cascade");
            
            $table->foreignId("student_id")->constrained()
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
        Schema::dropIfExists('students');
        Schema::dropIfExists('course_student');
    }
}
