<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Post;
use App\Course;
use App\CourseRate;
use App\Student;
use App\StudentSay;
use App\TeacherProfile;
use App\Question;
use App\CourseFaq;
use App\CourseItem;
use App\Category;
use App\Sponsor;
use App\Subscribe;
use App\Contact;

class HomeControllerAuth extends Controller
{
    public function login()
    {
        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();
        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(6)->get();

        return view('visitor.login', compact(
            'lastPostsFooter',
            'coursTows',
            'bestPriceCourses'
        ));
    }
}
