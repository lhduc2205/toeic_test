<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Http\Requests\StoreExamineeRequest;
use App\Http\Requests\UpdateExamineeRequest;
use App\Http\Resources\UserResource;
use App\Repositories\UserRepository;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $users = User::get();
        return UserResource::collection($users);
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
    public function store(Request $request, UserRepository $repository)
    {
        //
        $payload = $request->only([
            'email',
            'password',
            'is_admin'
        ]);

        $created = $repository->create($payload);
        return new UserResource($created);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Examinee  $examinee
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
        return new UserResource($user);
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
    public function update(Request $request, User $user, UserRepository $repository)
    {
        //
        $payload = $request->only([
            "name",
            "gender",
            "birthdate",
            "password"
        ]);
        $updated = $repository->update($user, $payload);
        if (!$updated)
            return new \Exception("loi r cha");
        return new UserResource($updated);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Examinee  $examinee
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user, UserRepository $repository)
    {
        //
        $deleted = $repository->forceDelete($user);
        if (!$deleted)
            return new \Exception("loi r cha");
        return new UserResource($deleted);
    }
}