<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Learn;
use Illuminate\Auth\Access\HandlesAuthorization;

class LearnPolicy
{
    use HandlesAuthorization;

    // public function show(User $user, Learn $learn) 
    // {
    //     return $user->id === $learn->user_id;
    // }
}
