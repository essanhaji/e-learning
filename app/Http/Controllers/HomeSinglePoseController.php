<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Response;

use App\TeacherProfile;
use App\CourseSession;
use App\Comment;
use App\User;
use App\CommentReply;
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



    public function getComment(Request $request, $id)///==>
    {
        $comments = Comment::where('post_id', '=', $id)
                            ->orderBy('updated_at', 'desc')
                            ->get(); 

        // on fait l'appel a les relations
        foreach ($comments as $comment) {
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



    public function addComment(Request $request)
    {
        $comment = new Comment;
        $comment->user_id = $request->input('user_id');
        $comment->post_id = $request->input('post_id');
        $comment->type = $request->input('type');
        $comment->comment = $request->input('comment');
        $comment->save();

    $comment->user; 
        $comment->commentReplies; 
        foreach ($comment->commentReplies as $commentReplie) {
            $commentReplie->user;
        }
        return Response()->json(['etat' => true, 'comment' => $comment]);
    }


    public function updateComment(Request $request)
    {
        $comment = Comment::whereId($request->input('id'))->first();

        $comment->user_id = $request->input('user_id');
        $comment->post_id = $request->input('post_id');
        $comment->type = $request->input('type');
        $comment->comment = $request->input('comment');

        $comment->save();

        $comment->user; 
        $comment->commentReplies; 
        foreach ($comment->commentReplies as $commentReplie) {
            $commentReplie->user;
        }
        return Response()->json(['etat' => true, 'comment' => $comment]);
    }


    public function deleteComment($id)
    {
        $comment = Comment::whereId($id)->first();

        foreach ($comment->commentReplies as $commentReplie) {
            $commentReplie->delete();
        }

        $comment->delete(); 

        return Response()->json(['etat' => true]);
    }


    public function addCommentReply(Request $request)
    {
        $commentReply = new CommentReply;
        $commentReply->user_id = $request->input('user_id');
        $commentReply->type = $request->input('type');
        $commentReply->comment = $request->input('comment');
        $commentReply->comment_id = $request->input('comment_id');

        $commentReply->save();

        $commentReply->user; 
        $commentReply->comment; 

        return Response()->json(['etat' => true, 'commentReply' => $commentReply]);
    }

    public function deleteCommentReply($id)
    {
        $commentReply = CommentReply::whereId($id)->first();

        $commentReply->delete(); 

        return Response()->json(['etat' => true]);
    }

    public function updateCommentReply(Request $request)
    {
        $commentReply = CommentReply::whereId($request->input('id'))->first();
        $commentReply->comment = $request->input('comment');

        $commentReply->save();

        return Response()->json(['etat' => true]);
    }
}
