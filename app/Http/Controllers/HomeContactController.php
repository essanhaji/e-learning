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

class HomeContactController extends Controller
{    
    public function index()
    {
        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();
        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(6)->get();

        return view('visitor.contact', compact(
            'lastPostsFooter',
            'coursTows',
            'bestPriceCourses'
        ));
    }


    public function addContact(Request $request)
    {
        $contact = new Contact();

        $contact->email = $request->input('email');
        $contact->content = $request->input('content');
        $contact->full_name = $request->input('full_name');
        $contact->object = $request->input('object');
        
        $contact->save();

        return back()->with('success', 'Your message is send ');
    }
}