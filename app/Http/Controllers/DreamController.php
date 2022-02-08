<?php

namespace App\Http\Controllers;

use App\Models\Dream;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class DreamController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        //get data from table dream
        $dream = Auth::user()->dreams()->latest()->get();

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'List Data activities',
            'data'    => $dream 
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
        $dream = Dream::find($id);

        if (is_null($dream)) {
            $response = [
                'success'       => false,
                'message'       => "dream not found",
            ];

            return response()->json($response, 403);
        }

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Activities',
            'data'    => $dream 
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
        $dream = Auth::user()->dreams()->create([
            'name' => $request->name,
            'slug' => Str::slug($slug),
            'when' => $when,
            'description'   => $request->description
        ]);

        //success save to database
        if($dream) {

            return response()->json([
                'success' => true,
                'message' => 'Dream Created',
                'data'    => $dream  
            ], 201);

        } 

        //failed save to database
        return response()->json([
            'success' => false,
            'message' => 'Dream Failed to Save',
        ], 409);

    }
    
    /**
     * update
     *
     * @param  mixed $request
     * @param  mixed $post
     * @return void
     */
    public function update(Request $request, Dream $dream)
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
        $dream = Dream::findOrFail($dream->id);

        if($dream) {

            $slug = request('name') . "-" . Str::random(6);
            $when = request('when') ?? now();

            //update Activities
            $dream->update([
                'name' => $request->name,
                'slug' => Str::slug($slug),
                'when' => $when,
                'description' => $request->description,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Dream Updated',
                'data'    => $dream  
            ], 200);

        }

        //data Dream not found
        return response()->json([
            'success' => false,
            'message' => 'Dream Not Found',
        ], 404);

    }

    public function search($name)
    {
        $dream = Dream::where("name", "like", "%".$name."%")->get();
        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'Search dream is success',
            'data'    => $dream
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
        $dream = Dream::find($id);

        if($dream) {

            //delete dream
            $dream->delete();

            return response()->json([
                'success' => true,
                'message' => 'Dream Deleted',
            ], 200);

        }

        //data dream not found
        return response()->json([
            'success' => false,
            'message' => 'Learn Not Found',
        ], 404);
    }
}
