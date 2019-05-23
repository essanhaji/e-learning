<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\CourseRate;
use App\Question;
use App\CourseFaq;
use App\Category;
use App\CourseSession;
use App\Session;
use App\Comment;
use App\TeacherProfile;
use DateTime;

class Course extends Model
{
    
    public function couseRates(){
        return $this->hasMany(CourseRate::class);
    }

    public function questions(){
        return $this->hasMany(Question::class);
    }

    public function courseFaqs(){
        return $this->hasMany(CourseFaq::class);
    }

    public function courseSessions(){
        return $this->hasMany(CourseSession::class);
    }

    public function sessions(){
        return $this->hasMany(Session::class);
    }

    public function comments(){
        return $this->hasMany(Comment::class);
    }
    
    public function teacher(){
        return $this->belongsTo(TeacherProfile::class);
    }

    public function category(){
        return $this->belongsTo(Category::class);
    }




    //=================================================================>>>>>
    // return the rate of the curent object
    public function rate()
    {
        if ($this->couseRates()->count() == 0) {
            return 0;
        } else {
            $rates = CourseRate::where('course_id', '=', $this->id)->sum('value');
            return $rates / $this->couseRates()->count();
        }
    }

    // sorte arraye of rate
    function comparator($object1, $object2) { 
        return $object1->rate() > $object2->rate(); 
    }
    
    // nbr comments 
    public function nbrComments()
    {
        if ($this->comments()->count() == 0) {
            return 0;
        } else {
            $somme = 0;
            foreach ($this->comments as $comment) {
                $somme = $somme + CommentReply::where('comment_id', '=', $comment->id)->count();
            }
            return $somme + $this->comments()->count();
        }
    }

    // date formt
    public static function dateComment($date){
        $date0 = explode(' ',$date);
        $date = explode('-',$date0[0]);
        $M= $date[1];
        $D = $date[2];
        $Y = $date[0];
        $dateObj = DateTime::createFromFormat('!m', $M);
        $monthName = $dateObj->format('F');

        $time =  explode(':',$date0[1]);

        return ($monthName." ".$D.", ".$Y." - ".$time[0].":".$time[1]);
    }
}
