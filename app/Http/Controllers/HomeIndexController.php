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
use App\StudentSay;
use App\Question;
use App\CourseFaq;
use App\CourseItem;
use App\Category;
use App\Sponsor;
use App\Subscribe;
use App\Contact;
use App\User;

class HomeIndexController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(10)->get();
        $courses = Course::orderBy('updated_at', 'desc')->limit(4)->get();
        $bestCourses = Course::orderBy('updated_at', 'desc')->limit(6)->get();
        $nbrPeoples = User::count();
        $lastPosts = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(3)->get();
        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $sponsors = Sponsor::all();
        $studentSays = StudentSay::orderBy('updated_at', 'desc')->limit(10)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();

        return view('visitor.index', compact(
            'posts',
            'courses',
            'bestCourses',
            'nbrPeoples',
            'lastPosts',
            'lastPostsFooter',
            'sponsors',
            'studentSays',
            'coursTows'
        ));
    }

    public function newsletter(Request $request)
    {
        $subscribe = new Subscribe();

        $subscribe->email = $request->input('email');
        $subscribe->save();

        return Response()->json(['etat' => true]);
    }
    
    public function footerFormContact(Request $request)
    {
        $contact = new Contact();

        $contact->email = $request->input('email');
        $contact->content = $request->input('message');

        $contact->save();

        return Response()->json(['etat' => true]);
    }

}
