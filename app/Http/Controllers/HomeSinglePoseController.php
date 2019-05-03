<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Response;

use App\Post;
use App\Course;
use App\CourseRate;
use App\Student;
use App\StudentSay;
use App\Teacher;
use App\Question;
use App\CourseFaq;
use App\CourseItem;
use App\Category;
use App\Sponsor;
use App\Subscribe;
use App\Contact;

class HomeSinglePoseController extends Controller
{
    public function index($slug)
    {
        $categoryIdActive = '';

        $post = Post::whereSlug($slug)->first();
        
        $lastPosts = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(4)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();
        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(4)->get();
        $categories = Category::all();
        $blog = Post::whereStatus('PUBLISHED')->get();


        return view('visitor.post-single', compact(
            'coursTows',
            'bestPriceCourses',
            'categoryIdActive',
            'categories',
            'lastPosts',
            'post',
            'blog'
        ));
    }
}
