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

class HomeBlogController extends Controller
{
    public function index($category='', $slug='')
    {
        $categoryIdActive = '';

        if ($category =="category") {
            $category = Category::whereSlug($slug)->first();
            $categoryIdActive = $category->id;
            $blog = Post::whereStatus('PUBLISHED')->where('category_id', '=', $category->id)->orderBy('updated_at', 'asc')->paginate(6);
        } else {
            $blog = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'asc')->paginate(6);
        }
        


        
        $lastPosts = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(4)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();
        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(4)->get();
        $categories = Category::all();



        return view('visitor.blog', compact(
            'coursTows',
            'blog',
            'bestPriceCourses',
            'categoryIdActive',
            'categories',
            'lastPosts'
        ));
    }
}
