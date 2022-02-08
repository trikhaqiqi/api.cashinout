<?php

namespace App\Http\Controllers;

use App\Models\Target;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TargetController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        //get data from table posts
        $target = Auth::user()->targets()->latest()->get();

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'List data targets',
            'data'    => $target 
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
        $target = Target::find($id);

        if (is_null($target)) {
            $response = [
                'success'       => false,
                'message'       => "target not found",
            ];

            return response()->json($response, 403);
        }

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Targets',
            'data'    => $target 
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
        $target = Auth::user()->targets()->create([
            'name' => $request->name,
            'slug' => Str::slug($slug),
            'when' => $when,
            'description'   => $request->description
        ]);

        //success save to database
        if($target) {

            return response()->json([
                'success' => true,
                'message' => 'Target Created',
                'data'    => $target  
            ], 201);

        } 

        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Target Failed to Save',
        ], 409);

    }
    
    /**
     * update
     *
     * @param  mixed $request
     * @param  mixed $post
     * @return void
     */
    public function update(Request $request, Target $target)
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
        $target = Target::findOrFail($target->id);

        if($target) {

            $slug = request('name') . "-" . Str::random(6);
            $when = request('when') ?? now();

            //update Activities
            $target->update([
                'name' => $request->name,
                'slug' => Str::slug($slug),
                'when' => $when,
                'description' => $request->description,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Target Updated',
                'data'    => $target  
            ], 200);

        }

        //data Target not found
        return response()->json([
            'success' => false,
            'message' => 'Target Not Found',
        ], 404);

    }

    public function search($name)
    {
        $target = Target::where("name", "like", "%".$name."%")->get();
        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'Search target is success',
            'data'    => $target
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
        $target = Target::find($id);

        if($target) {

            //delete cas$target
            $target->delete();

            return response()->json([
                'success' => true,
                'message' => 'Target Deleted',
            ], 200);

        }

        //data cas$target not found
        return response()->json([
            'success' => false,
            'message' => 'Number id target not found',
        ], 404);
    }
}
