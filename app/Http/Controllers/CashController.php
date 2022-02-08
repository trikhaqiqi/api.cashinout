<?php

namespace App\Http\Controllers;

use App\Models\Cash;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Resources\CashResource;
use Illuminate\Support\Facades\Auth;

class CashController extends Controller
{
    public function index()
    {
        // $debit = Auth::user()->cashes()->whereBetween('when', [ now()->firstOfMonth(), now() ])->where('amount', '>=', 0)->get('amount')->sum('amount');
        // $credit = Auth::user()->cashes()->whereBetween('when', [ now()->firstOfMonth(), now() ])->where('amount', '<', 0)->get('amount')->sum('amount');
        
        // $balances = Auth::user()->cashes()->get('amount')->sum('amount');
        // $transactions = Auth::user()->cashes()->whereBetween('when', [ now()->firstOfMonth(), now() ])->latest()->get();
        // return response()->json([
        //     'balances' => formatPrice($balances),
        //     'debit' => formatPrice($debit) ,
        //     'credit' => formatPrice($credit),
        //     'transactions' => CashResource::collection($transactions),
        // ]);

        $from = request('from');
        $to = request('to');
        if ($from && $to) {
            $debit = $this->getBalances($from, $to, ">=");
            $credit = $this->getBalances($from, $to, "<");
            $transactions = Auth::user()->cashes()->whereBetween('when', [ $from, $to ])->latest()->get();
        } else {
            $debit = $this->getBalances(now()->firstOfMonth(), now(), ">=");
            $credit = $this->getBalances(now()->firstOfMonth(), now(), "<");
            $transactions = Auth::user()->cashes()->whereBetween('when', [ now()->firstOfMonth(), now() ])->latest()->get();
        }

        return response()->json([
            'balances' => formatPrice(Auth::user()->cashes()->get('amount')->sum('amount')),
            'debit' => formatPrice($debit),
            'credit' => formatPrice($credit),
            'transactions' => CashResource::collection($transactions),
            'now' => now()->format("Y-m-d"),
            'firstOfMonth' => now()->firstOfMonth()->format("Y-m-d"),
        ]);
    }

    public function single($id)
    {
        $cash = Cash::find($id);

        if (is_null($cash)) {
            $response = [
                'success'       => false,
                'message'       => "cash not found",
            ];

            return response()->json($response, 403);
        }

        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'Edit is success',
            'data'    => $cash
        ], 200);
    }

    public function search($name)
    {
        $cash = Cash::where("name", "like", "%".$name."%")->get();
        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'Search cash is success',
            'data'    => $cash
        ], 200);
    }

    public function store()
    {
        request()->validate([
            'name' => 'required',
            'amount' => 'required|numeric',
        ]);

        $slug = request('name') . "-" . Str::random(6);
        $when = request('when') ?? now();
        
        $cash = Auth::user()->cashes()->create([
            'name' => request('name'),
            'slug' => Str::slug($slug),
            'when' => $when,
            'amount' => request('amount'),
            'description' => request('description'),
        ]);

        return response()->json([
            'message' => 'The transaction has been saved.',
            'cash' => new CashResource($cash)
        ]);
    }

    public function update(Request $request, $id)
    {
        $cash = Cash::find($id);

        $request->validate([
            'name' => 'required',
            'amount' => 'required|numeric',
            'description' => 'required',
        ]);

        $slug = request('name') . "-" . Str::random(6);
        $when = request('when') ?? now();

        $cash->update([
            'name' => $request->name,
            'slug' => Str::slug($slug),
            'when' => $when,
            'amount' => $request->amount,
            'description' => $request->description,
        ]);

        return response()->json([
            'code_response' => 200,
            'status' => true,
            'message' => 'Cashes updated success',
            'data'    => $cash
        ], 200);
    }

    public function delete($id)
    {
        //find post by ID
        $cash = Cash::find($id);

        if($cash) {

            //delete cas$cash
            $cash->delete();

            return response()->json([
                'success' => true,
                'message' => 'Cash Deleted',
            ], 200);

        }

        //data cas$cash not found
        return response()->json([
            'success' => false,
            'message' => 'Number id cash not found',
        ], 404);
    }

    public function show(Cash $cash) 
    {        
        $this->authorize('show', $cash);
        return new CashResource($cash);
    }

    public function getBalances($from, $to, $operator)
    {
        return Auth::user()->cashes()
                            ->whereBetween('when', [ $from, $to ])
                            ->where('amount', $operator, 0)
                            ->get('amount')
                            ->sum('amount');
    }
}
