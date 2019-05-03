<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Category;
use App\Comment;
use App\User;
use App\CommentReplie;

class Post extends \TCG\Voyager\Models\Post
{
    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function comments(){
        return($this->hasMany(Comment::class));
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function nbrComents()
    {
        if ($this->comments()->count() > 0) {
            $somme = 0;
            foreach ($this->comments() as $comment) {
                $somme = $somme + 1 + $comment->commentReplies()->count();
            }
            return $somme;
        } else {
            return 0;
        }
        
    }
}
