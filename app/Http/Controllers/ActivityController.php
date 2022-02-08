<?php

namespace App\Http\Controllers;

use App\Models\Activity;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class ActivityController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        //get data from table posts
        $activity = Auth::user()->activities()->latest()->get();

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'List Data activities',
            'data'    => $activity 
        ], 200);

    }
    
     /**
     * show
     *
     * @param  mixed $id
     * @return void
     */
    public function show($id)
    {
        //find post by ID
        $activity = Activity::find($id);

        if (is_null($activity)) {
            $response = [
                'success'       => false,
                'message'       => "activity not found",
            ];

            return response()->json($response, 403);
        }

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Activities',
            'data'    => $activity 
        ], 200);

    }
    
    /**
     * store
     *
     * @param  mixed $request
     * @return void
     */
    public function store(Request $request)
    {
        //set validation
        $validator = Validator::make($request->all(), [
            'name'   => 'required',
            'description' => 'required',
        ]);
        
        //response error validation
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $slug = request('name') . "-" . Str::random(6);
        $when = request('when') ?? now();

        //save to database
        $activity = Auth::user()->activities()->create([
            'name' => $request->name,
            'slug' => Str::slug($slug),
            'when' => $when,
            'description'   => $request->description
        ]);

        //success save to database
        if($activity) {

            return response()->json([
                'success' => true,
                'message' => 'Activity Created',
                'data'    => $activity  
            ], 201);

        } 

        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Activities Failed to Save',
        ], 409);

    }
    
    /**
     * update
     *
     * @param  mixed $request
     * @param  mixed $post
     * @return void
     */
    public function update(Request $request, Activity $activity)
    {
        //set validation
        $validator = Validator::make($request->all(), [
            'name'   => 'required',
            'description' => 'required',
        ]);
        
        //response error validation
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        //find Activities by ID
        $activity = Activity::findOrFail($activity->id);

        if($activity) {

            $slug = request('name') . "-" . Str::random(6);
            $when = request('when') ?? now();

            //update Activities
            $activity->update([
                'name' => $request->name,
                'slug' => Str::slug($slug),
                'when' => $when,
                'description' => $request->description,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Activities Updated',
                'data'    => $activity  
            ], 200);

        }

        //data Activities not found
        return response()->json([
            'success' => false,
            'message' => 'Activities Not Found',
        ], 404);

    }

    public function search($name)
    {
        $activity = Activity::where("name", "like", "%".$name."%")->get();
        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'Search activity is success',
            'data'    => $activity
        ], 200);
    }
    
    /**
     * destroy
     *
     * @param  mixed $id
     * @return void
     */
    public function destroy($id)
    {
        //find post by ID
        $activity = Activity::find($id);

        if($activity) {

            //delete activity
            $activity->delete();

            return response()->json([
                'success' => true,
                'message' => 'Activity Deleted',
            ], 200);

        }

        //data activity not found
        return response()->json([
            'success' => false,
            'message' => 'Number id activity not found',
        ], 404);
    }
}
