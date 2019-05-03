<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\User;

class StudentSay extends Model
{
    public function student(){
        return $this->belongsTo(User::class);
    }
}
