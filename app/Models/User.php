<?php

namespace App\Models;

use App\Models\Cash;
use App\Models\Dream;
use App\Models\Learn;
use App\Models\Target;
use App\Models\Activity;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function cashes()
    {
        return $this->hasMany(Cash::class);
    }

    public function activities()
    {
        return $this->hasMany(Activity::class);
    }

    public function learns()
    {
        return $this->hasMany(Learn::class);
    }

    public function targets()
    {
        return $this->hasMany(Target::class);
    }

    public function dreams()
    {
        return $this->hasMany(Dream::class);
    }
}
