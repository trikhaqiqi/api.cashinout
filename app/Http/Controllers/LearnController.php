<?php

namespace App\Http\Controllers;

use App\Models\Learn;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
// use Illuminate\Support\Facades\Validator;
use Validator;

class LearnController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        //get data from table posts
        $learn = Auth::user()->learns()->latest()->get();


        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'List Data activities',
            'data'    => $learn 
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
        $learn = Learn::find($id);
        
        if (is_null($learn)) {
            $response = [
                'success'       => false,
                'message'       => "learn not found",
            ];

            return response()->json($response, 403);
        }

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'Detail Data learns',
            'data'    => $learn 
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
        $learn = Auth::user()->learns()->create([
            'name' => $request->name,
            'slug' => Str::slug($slug),
            'when' => $when,
            'description'   => $request->description
        ]);

        //success save to database
        if($learn) {

            return response()->json([
                'success' => true,
                'message' => 'Learn Created',
                'data'    => $learn  
            ], 201);

        } 

        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Learn Failed to Save',
        ], 409);

    }
    
    /**
     * update
     *
     * @param  mixed $request
     * @param  mixed $post
     * @return void
     */
    public function update(Request $request, Learn $learn)
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
        $learn = Learn::findOrFail($learn->id);

        if($learn) {

            $slug = request('name') . "-" . Str::random(6);
            $when = request('when') ?? now();

            //update Activities
            $learn->update([
                'name' => $request->name,
                'slug' => Str::slug($slug),
                'when' => $when,
                'description' => $request->description,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Learn Updated',
                'data'    => $learn  
            ], 200);

        }

        //data Learn not found
        return response()->json([
            'success' => false,
            'message' => 'Learn Not Found',
        ], 404);

    }

    public function search($name)
    {
        $learn = Learn::where("name", "like", "%".$name."%")->get();
        
        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'Search learn is success',
            'data'    => $learn
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
        $learn = Learn::find($id);

        if($learn) {

            //delete learn
            $learn->delete();

            return response()->json([
                'success' => true,
                'message' => 'Learn Deleted',
            ], 200);

        }

        //data learn not found
        return response()->json([
            'success' => false,
            'message' => 'Number id learn not found',
        ], 404);
    }
}
