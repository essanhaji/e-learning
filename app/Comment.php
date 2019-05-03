<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


use App\CommentReply;
use App\course;
use App\Post;
use App\TeacherProfile;
use App\User;

class Comment extends Model
{
    public function commentReplies(){
        return $this->hasMany(commentReply::class);
    }

    public function user()
    {
        return($this->belongsTo(User::class));
    }

    public function student(){
        return $this->belongsTo(User::class);
    }

    public function course(){
        return $this->belongsTo(Course::class);
    }

    public function teacher()
    {
        return($this->belongsTo(TeacherProfile::class));
    }

    public function post()
    {
        return($this->belongsTo(Post::class));
    }
}