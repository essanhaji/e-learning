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
use App\CourseSession;
use App\Comment;
use App\User;
use App\CommentReply;

class AboutAsController extends Controller
{
    public function index()
    {
        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();
        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(6)->get();
        $nbrTeachers = TeacherProfile::All()->count();

        return view('visitor.about-us', compact(
            'lastPostsFooter',
            'coursTows',
            'bestPriceCourses',
            'nbrTeachers'
        ));
    }
}
