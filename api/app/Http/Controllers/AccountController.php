<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Http\Requests\StoreAccountRequest;
use App\Http\Requests\UpdateAccountRequest;
use Illuminate\Http\Request;
use App\Http\Resources\AccountResource;
use App\Repositories\AccountRepository;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

class AccountController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $accounts = Account::get();
        return AccountResource::collection($accounts);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, AccountRepository $repository)
    {
        // 
        $payload = $request->only([
            "user_name",
            "password",
            "is_admin"
        ]);
        $created = $repository->create($payload);
        return new AccountResource($created);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Account  $account
     * @return \Illuminate\Http\Response
     */
    public function show(Account $account)
    {
        //

        return new AccountResource($account);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Account  $account
     * @return \Illuminate\Http\Response
     */
    public function edit(Account $account)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Account  $account
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Account $account, AccountRepository $repository)
    {
        //
        $payload = $request->only([
            'password'
        ]);
        $updated = $repository->update($account, $payload);
        return new AccountResource($updated);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Account  $account
     * @return \Illuminate\Http\Response
     */
    public function destroy(Account $account, AccountRepository $repository)
    {
        //
        $deleted = $repository->forceDelete($account);
        return new AccountResource($deleted);
    }
}