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
use App\Role;
use App\User;

class HomeTeachersController extends Controller
{
    public function index($search='', $key='')
    {
        $active = '';
        $role = Role::whereName('teacher')->first();

        if ($search == 'search') {
            $active = $key;
            $teachers = User::WhereRaw('LOWER(name) like LOWER("'. $key .'%")')
                                ->where('role_id', '=', $role->id)
                                ->orderBy('name', 'asc')
                                ->paginate(12);

        } elseif ($search == 'category') {
            $category = Category::whereSlug($key)->first();
            $teachers = User::Where('category_id','=', $category->id)
                                ->where('role_id', '=', $role->id)
                                ->orderBy('name', 'asc')
                                ->paginate(12);

        } else {
            $teachers = User::where('role_id', '=', $role->id)
                                ->orderBy('name', 'asc')
                                ->paginate(12);
        }
        
        $coursTows = Course::orderBy('updated_at', 'desc')->limit(2)->get();

        return view('visitor.teachers', compact(
            'coursTows',
            'teachers',
            'active'
        ));
    }
}
