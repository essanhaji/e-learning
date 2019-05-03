<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Auth;

class User extends \TCG\Voyager\Models\User
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function isAdmin()
    {
        if (Auth::check()) {
            $role = Role::whereId(Auth::user()->role_id)->first();
            if ($role->name == 'admin') {
                return true;
            } else{
                return false;
            }
        }
    }

    public function isStudent()
    {
        if (Auth::check()) {
            $role = Role::whereId(Auth::user()->role_id)->first();
            if ($role->name == 'student') {
                return true;
            } else{
                return false;
            }
        }
    }

    public function isTeacher()
    {
        if (Auth::check()) {
            $role = Role::whereId(Auth::user()->role_id)->first();
            if ($role->name == 'teacher') {
                return true;
            } else{
                return false;
            }
        }
    }

    public function teacher(){
        return $this->hasOne(TeacherProfile::class);
    }

}
