<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use Auth;
use DateTime;
use App\Course;
use App\Session;
use App\Post;
use App\Comment;
use App\CommentReply;
use App\User;
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

class TeacherDashboardController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function storeCourse(Request $request)
    {
        $course = new Course();

        $course->title = $request->input('title');
        $course->price = $request->input('price');
        $course->duration = $request->input('duration');
        $course->language = $request->input('language');
        $course->small_description = $request->input('small_description');
        $course->tag = $request->input('tag');
        $course->location = $request->input('location');
        $course->nbr_student = $request->input('nbr_student');
        $course->level = $request->input('level');
        $course->category_id = $request->input('category_id');
        $course->active = $request->input('active');
        $course->description = $request->input('description');
        $course->teacher_id = Auth::user()->teacher->id;
        $course->slug = str_slug($request->input('title'), '-');

        $imageName = 'storage/'.time().'.'.request()->image->getClientOriginalExtension();
        request()->image->move(public_path('images'), $imageName);

        $course->image = $imageName;

        $course->save();

        return back()->with('success', 'Your course is added ');
    }

    public function index()
    {
        //$this->insetData();

        if (Auth::user()->isTeacher()) {

            $totalMyCourses = Course::whereTeacher_id(Auth::user()->teacher->id)->count();
            $totalCourses = Course::all()->count();

            $totalMyStudents = Auth::user()->teacher->totalStudent();
            $totalStudents = Session::all()->count();

            $totalMyPosts = Auth::user()->teacher->totalPosts();
            $totalPosts = Post::all()->count();

            $totalMyComments = Auth::user()->teacher->totalComments();
            $totalComments = Comment::all()->count() + CommentReply::all()->count();

            $axsDate = $this->chartAxX();
            $axsSessions = $this->chartAxY();
            $bestCourses = Course::whereTeacher_id(Auth::user()->teacher->id)->orderBy('id', 'desc')->limit(3)->get();

            $myCourses = Course::whereTeacher_id(Auth::user()->teacher->id)->orderBy('id', 'desc')->get();

            $categories = Category::all();

            return view('teacher.dashboard', compact(
                'totalCourses',
                'totalMyCourses',
                'totalStudents',
                'totalMyStudents',
                'totalMyPosts',
                'totalPosts',
                'totalMyComments',
                'totalComments',
                'axsDate',
                'axsSessions',
                'bestCourses',
                'myCourses',
                'categories'
            ));
        }
    }


    public function arrayYearsMonthNumber_And_arrayYearsMonthCar()
    {
        $axsDateNum = array();
        $arrayDateDoubleCar = array();
        $arrayDateDoubleNum = array();

        $courses = Session::orderBy('created_at', 'Asc')->get();

        foreach ($courses as $course) {

            $dateTime =  $course->created_at;

            $dateArray = explode(' ',$dateTime);
            $date = explode('-',$dateArray[0]);

            $Y = $date[0];
            $M = $date[1];

            $yearsMonthNumber = $Y.'-'.$M;

            $dateObjec = DateTime::createFromFormat('!m', $M);
            $monthName = $dateObjec->format('F');
            $yearsMonthCracter = $Y.'-'.$monthName;

            $arrayDateDoubleNum[] = $yearsMonthNumber;
            $arrayDateDoubleCar[] = $yearsMonthCracter;
        }

        $axsDateNum = array_unique($arrayDateDoubleNum);
        $axsDateCar = array_unique($arrayDateDoubleCar);

        $tooArray = array();

        $tooArray[0] = $axsDateNum;
        $tooArray[1] = $axsDateCar;

        return $tooArray;
    }

    public function chartAxX()
    {
        $axsDateCar = $this->arrayYearsMonthNumber_And_arrayYearsMonthCar()[0];
        $axsDate = "";
        $first = true;
        foreach ($axsDateCar as $key) {
            if ($first) {
                $axsDate = $axsDate." '".$key."' ";
                $first=false;
            }else{
                $axsDate = $axsDate.", '".$key."' ";
            }
        }

        return "[".$axsDate."]";
    }

    public function chartAxY()
    {
        $bestCourses = Course::whereTeacher_id(Auth::user()->teacher->id)->orderBy('id', 'asc')->limit(3)->get();

        $axsDateNum = $this->arrayYearsMonthNumber_And_arrayYearsMonthCar()[0];
        
        $firstOne = true;

        $axY = "";

        foreach ($bestCourses as $bestCourse) {

            $dataSession = "";
            $first = true;
            foreach($axsDateNum as $key){
                if ($first) {
                    $sessions = Session::whereCourse_id($bestCourse->id)
                                    ->where('created_at', '>', $key.'-01 00:00:00')
                                    ->where('created_at', '<', $key.'-30 23:59:59')
                                    ->count();
                    $dataSession = $sessions;
                    $first = false;
                } else {
                    $sessions = Session::whereCourse_id($bestCourse->id)
                                    ->where('created_at', '>', $key.'-01 00:00:00')
                                    ->where('created_at', '<', $key.'-30 23:59:59')
                                    ->count();
                    $dataSession = $dataSession.', '.$sessions;
                }
            }

            $dataSession = '['.$dataSession.']';

            
            if ($firstOne) {
                $axY = $dataSession;
                $firstOne = false;
            } else {
                $axY = $axY.', '.$dataSession;
            }
        }

        //dd($axY);

        return $axY;
    }

    public function insetData()
    {
        for ($i=1; $i <= 12; $i++) {

            $student = new User();
            $student->role_id = 2;
            $student->password = Hash::make('password');
            $student->name = $this->generateRandomString();
            $student->email = 's.'. $student->name.'@gmail.com';
            $student->save();

            for ($j=1; $j <= 3; $j++) {
                $randome = rand (1 ,6 );
                $session = new Session();
                $session->course_id = $randome;
                $session->student_id = $student->id;
                $session->created_at = '2019-'.$i.'-21 10:48:40';
                $session->updated_at = '2019-'.$i.'-21 10:48:40';

                $session->save();

                echo($i .':'.$j); 
                echo('</br>');               
            }
        }
        return 0;
    }

    function generateRandomString($length = 10) {
        return substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ceil($length/strlen($x)) )),1,$length);
    }
    
}
