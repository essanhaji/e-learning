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

class HomeSinglCoursController extends Controller
{
    public function index($slug)
    {

        $categoryIdActive = '';
        $priceActive = '';

        $cours = Course::whereSlug($slug)->first();

        $countFreeCourses = Course::where('price', '=', 0)->count();
        $countNotFreeCourses = Course::where('price', '>', 0)->count();

        $lastPostsFooter = Post::whereStatus('PUBLISHED')->orderBy('updated_at', 'desc')->limit(2)->get();
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();

        $categories = Category::all();
        $teachers = TeacherProfile::orderBy('updated_at', 'desc')->paginate(5);

        $bestPriceCourses = Course::orderBy('price', 'desc')->limit(6)->get();

        return view('visitor.cours-single', compact(
            'cours',
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


    public function addQuestion(Request $request)
    {
        $question = new Question();

        $question->full_name = $request->input('full_name');
        $question->email = $request->input('email');
        $question->question = $request->input('question');
        $question->course_id = $request->input('course_id');

        $question->save();

        return Response()->json(['etat' => true]);
    }

    public function getComment(Request $request, $id)
    {

        $comments = Comment::where('course_id', '=', $id)
                            ->orderBy('updated_at', 'desc')
                            ->get(); 

        // on fait l'appel a les relations
        foreach ($comments as $comment) {
            // $comment->created_at = Course::dateComment($comment->created_at);
            $comment->user; 
            $comment->commentReplies; 
            foreach ($comment->commentReplies as $commentReplie) {
                $commentReplie->user;
            }
        }
        if (Auth::check()) {
            Auth::user()->role;
        }
        return Response()->json(['etat' => true, 'data' => $comments]);
    }
}
