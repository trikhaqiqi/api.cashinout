<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dream extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'slug', 'when', 'description'];
    
    protected $dates = ['when'];
}
