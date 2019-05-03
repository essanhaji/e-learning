<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Role;


class HomeController extends Controller
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

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }


    public function userHasLogin()
    {
        if (Auth::check()) {
            $role = Role::whereId(Auth::user()->role_id)->first();
            if ($role->name == 'student') {
                return redirect('student');
            } elseif ($role->name == 'teacher') {
                return redirect('teacher');
            } elseif ($role->name == 'admin') {
                return redirect('admin');
            } 
        }
        
    }

    public function indexStudent()
    {   
        if (Auth::user()->isStudent()) {
            return view('student.dashboard');
        }
    }

    public function indexTeacher()
    {   
        if (Auth::user()->isTeacher()) {
            return view('teacher.dashboard');
        }
    }
}
