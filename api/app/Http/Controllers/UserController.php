<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Http\Requests\StoreExamineeRequest;
use App\Http\Requests\UpdateExamineeRequest;

class ExamineeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param  \App\Http\Requests\StoreExamineeRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreExamineeRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Examinee  $examinee
     * @return \Illuminate\Http\Response
     */
    public function show(User $examinee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Examinee  $examinee
     * @return \Illuminate\Http\Response
     */
    public function edit(User $examinee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateExamineeRequest  $request
     * @param  \App\Models\Examinee  $examinee
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateExamineeRequest $request, User $examinee)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Examinee  $examinee
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $examinee)
    {
        //
    }
}