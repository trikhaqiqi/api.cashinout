<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Hash;

class APIKEY
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $api_key = $request->header('api_key');
        $key = '$2y$10$8IAQNuc1uLbfDp3UvVFuROJ1dERB.5R2oWGnOAkgXL1bsPjbNbumO';

        if(!Hash::check($api_key, $key)):
            return response()->json([
                'message' => 'Api Key not found'
            ]);
        endif; 
        return $next($request);
    }
}
