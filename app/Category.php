<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Course;
use App\Post;

class Category extends \TCG\Voyager\Models\Category
{

    public function courses(){
        return $this->hasMany(Course::class);
    }

    public function posts(){
        return $this->hasMany(Post::class);
    }
}
