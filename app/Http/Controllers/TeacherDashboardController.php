<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use App\Course;
use Auth;
use App\Session;
use App\Post;
use App\Comment;
use App\CommentReply;
use DateTime;
use App\User;

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
                'bestCourses'
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
        $bestCourses = Course::whereTeacher_id(Auth::user()->teacher->id)->orderBy('id', 'desc')->limit(3)->get();

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
