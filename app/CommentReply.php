<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Comment;
use App\TeacherProfile;

class CommentReply extends Model
{
    public function comment(){
        return $this->belongsTo(Comment::class);
    }

    public function student(){
        return $this->belongsTo(User::class);
    }

    public function teacher()
    {
        return $this->belongsTo(TeacherProfile::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
}
