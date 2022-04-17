<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        "course_year",
        "course_term",
        "course_id",
        "course_credit",
        "course_hours",
        "course_name",
        "course_is_free",
        "course_is_public",
        "released_at",
    ];

    public function student(){
        return $this->belongsToMany(Student::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function teacher(){
        return $this->belongsToMany(Teacher::class);
    }
}
