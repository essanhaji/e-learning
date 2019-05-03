<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\User;

class Role extends \TCG\Voyager\Models\Role
{
    public function users()
    {
        return $this->hasMany(User::class);
    }
}
