<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\User;
use App\Category;
use App\TeacherRate;
use App\Post;
use App\Comment;
use App\CommentReply;

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

    public function courses(){
        return $this->hasMany(Course::class);
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


    public function totalStudent()
    {
        $somme = 0;
        $courses = Course::whereTeacher_id($this->id)->get();
        
        foreach ($courses as $course) {
            $somme = $somme + $course->sessions->count();
        }
        return $somme;
    }


    public function totalPosts()
    {
        $postsCount = Post::whereUser_id($this->user->id)->count();
        return $postsCount;
    }


    public function totalComments()
    {
        $somme = $this->user->comments->count() + $this->user->commentReplys->count();
        return $somme;
    }

}
