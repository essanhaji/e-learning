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
use App\TeacherProfile;
use App\Question;
use App\CourseFaq;
use App\CourseItem;
use App\Category;
use App\Sponsor;
use App\Subscribe;
use App\Contact;

class HomeCoursesController extends Controller
{

    public function index1(Request $request)
    {

        $categoryIdActive = '';
        $priceActive = '';

        $courses = Course::orderBy('updated_at', 'desc')->paginate(6);
        //echo('All courses');

        $inputCategory = $request->input('category');
        $inputPrice = $request->input('price');
        if ($inputCategory == 'All') {
            $categoryIdActive = '';
            if ($inputPrice == 'Free') {
                $priceActive = 'Free';
                $courses = Course::orderBy('updated_at', 'desc')->where('price', '=', 0)->paginate(6);
                //echo('All / Free');
            } elseif ($inputPrice == 'Paid') {
                $priceActive = 'Paid';
                $courses = Course::orderBy('updated_at', 'desc')->where('price', '>', 0)->paginate(6);
                //echo('All Paid');
            } else {
                $priceActive = '';
                $courses = Course::orderBy('updated_at', 'desc')->paginate(6);
                //echo('All /All');
            }
        } else {
            $categoryIdActive = '' . $inputCategory;
            if ($inputPrice == 'Free') {
                $priceActive = 'Free';
                $courses = Course::orderBy('updated_at', 'desc')->where('price', '=', 0)->where('category_id', '=', $inputCategory)->paginate(6);
                //echo('Category /Free');
            } elseif ($inputPrice == 'Paid') {
                $priceActive = 'Paid';
                $courses = Course::orderBy('updated_at', 'desc')->where('price', '>', 0)->where('category_id', '=', $inputCategory)->paginate(6);
                //echo('Category /Paid');
            } elseif ($inputPrice == 'All') {
                $priceActive = '';
                $courses = Course::orderBy('updated_at', 'desc')->where('category_id', '=', $inputCategory)->paginate(6);
                //echo('Category /All');
            }
        }


        $countFreeCourses = Course::where('price', '=', 0)->count();
        $countNotFreeCourses = Course::where('price', '>', 0)->count();

        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();

        $categories = Category::all();
        $teachers = TeacherProfile::orderBy('updated_at', 'desc')->paginate(3);

        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(4)->get();


        return view('visitor.courses', compact(
            'courses',
            'lastPostsFooter',
            'coursTows',
            'countFreeCourses',
            'countNotFreeCourses',
            'categories',
            'teachers',
            'bestPriceCourses',
            'categoryIdActive',
            'priceActive'
        ));
    }

    //------------------------------------------------------->>>>
    public function index2(Request $request, $slug)
    {

        $categoryObj = Category::whereSlug($slug)->first();

        $categoryIdActive = $categoryObj->id;
        $priceActive = '';

        $courses = Course::orderBy('updated_at', 'desc')->where('category_id', '=', $categoryIdActive)->paginate(6);

        $countFreeCourses = Course::where('price', '=', 0)->count();
        $countNotFreeCourses = Course::where('price', '>', 0)->count();

        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();

        $categories = Category::all();
        $teachers = TeacherProfile::orderBy('updated_at', 'desc')->paginate(3);

        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(4)->get();

        return view('visitor.courses', compact(
            'courses',
            'lastPostsFooter',
            'coursTows',
            'countFreeCourses',
            'countNotFreeCourses',
            'categories',
            'teachers',
            'bestPriceCourses',
            'categoryIdActive',
            'priceActive'
        ));
    }

    //------------------------------------------------------->>>>
    public function index3(Request $request, $slug)
    {

        $teacherObj = TeacherProfile::whereSlug($slug)->first();

        $categoryIdActive = '';
        $priceActive = '';

        $courses = Course::orderBy('updated_at', 'desc')->where('teacher_id', '=', $teacherObj->id)->paginate(6);

        $countFreeCourses = Course::where('price', '=', 0)->count();
        $countNotFreeCourses = Course::where('price', '>', 0)->count();

        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();

        $categories = Category::all();
        $teachers = TeacherProfile::orderBy('updated_at', 'desc')->paginate(3);

        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(4)->get();

        return view('visitor.courses', compact(
            'courses',
            'lastPostsFooter',
            'coursTows',
            'countFreeCourses',
            'countNotFreeCourses',
            'categories',
            'teachers',
            'bestPriceCourses',
            'categoryIdActive',
            'priceActive'
        ));
    }

    //------------------------------------------>>>>>>
    public function index4(Request $request)
    {        
        $categoryIdActive = '';
        $priceActive = '';
        $search = strtolower($request->input('search'));

        $courses = Course::WhereRaw('LOWER(title) like "%'. $search .'%"')
                            ->orWhereRaw('LOWER(description) like "%'. $search .'%"')
                            ->orWhereRaw('LOWER(small_description) like "%'. $search .'%"')
                            ->orWhereRaw('LOWER(level) like "%'. $search .'%"')
                            ->orWhereRaw('LOWER(tag) like "%'. $search .'%"')
                            ->orWhereRaw('LOWER(language) like "%'. $search .'%"')
                            ->orderBy('updated_at', 'desc')
                            ->paginate(6);

        $countFreeCourses = Course::where('price', '=', 0)->count();
        $countNotFreeCourses = Course::where('price', '>', 0)->count();

        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();

        $categories = Category::all();
        $teachers = TeacherProfile::orderBy('updated_at', 'desc')->paginate(3);

        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(4)->get();

        return view('visitor.courses', compact(
            'courses',
            'lastPostsFooter',
            'coursTows',
            'countFreeCourses',
            'countNotFreeCourses',
            'categories',
            'teachers',
            'bestPriceCourses',
            'categoryIdActive',
            'priceActive'
        ));
    }
}
