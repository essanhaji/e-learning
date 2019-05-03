<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\CourseItem;

class CourseSession extends Model
{
    public function courseItems(){
        return $this->hasMany(CourseItem::class);
    }
}
