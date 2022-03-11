<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "allow_edit",
        "is_available",
        "teached_at"
    ];

    public function student(){
        return $this->belongsToMany(Student::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }

    public function classroom(){
        return $this->belongsToMany(ClassRoom::class);
    }
}
