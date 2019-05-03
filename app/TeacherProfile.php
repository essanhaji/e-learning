<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\User;
use App\Category;
use App\TeacherRate;

class TeacherProfile extends Model
{
    public function user(){
        return $this->belongsTo(User::class);
    }
    
    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function teacherRates(){
        return $this->hasMany(TeacherRate::class);
    }

    // return the rate of the curent object
    public function rate()
    {
        if ($this->teacherRates()->count() == 0) {
            return 0;
        } else {
            $rates = TeacherRate::where('teacher_profile_id', '=', $this->id)->sum('value');
            return $rates / $this->teacherRates()->count();
        }
    }
}
