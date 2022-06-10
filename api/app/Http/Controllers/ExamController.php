<?php

namespace App\Http\Controllers;

use App\Http\Resources\ExamResource;
use App\Http\Resources\UserResource;
use App\Models\Exam;
use App\Repositories\ExamRepository;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Symfony\Component\HttpFoundation\Response as HttpFoundationResponse;

class ExamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $exams = Exam::get();
        return ExamResource::collection($exams);
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
    public function store(Request $request, ExamRepository $repository)
    {
        //
        $payload = $request->only([
            "title",
            "topic",
            "desc",
            "time_limit",
            "question_amount"
        ]);
        $created = $repository->create($payload);
        if (!$created)
            return new \Exception("Loi r cha", HttpFoundationResponse::HTTP_BAD_REQUEST);
        return new ExamResource($created);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Exam  $exam
     * @return \Illuminate\Http\Response
     */
    public function show(Exam $exam)
    {
        //
        return new ExamResource($exam);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\exam  $exam
     * @return \Illuminate\Http\Response
     */
    public function edit(exam $exam)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\exam  $exam
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, exam $exam, ExamRepository $repository)
    {
        //
        $payload = $request->only([
            "title",
            "topic",
            "desc",
            "time_limit",
            "question_amount"
        ]);
        $updated = $repository->update($exam, $payload);
        if (!$updated)
            return new \Exception("Loi r cha", HttpFoundationResponse::HTTP_BAD_REQUEST);
        return new ExamResource($updated);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Exam  $exam
     * @return \Illuminate\Http\Response
     */
    public function destroy(Exam $exam, ExamRepository $repository)
    {
        //
        $deleted = $repository->forceDelete($exam);
        if (!$deleted)
            return new \Exception("Loi r cha", HttpFoundationResponse::HTTP_FORBIDDEN);
        return new ExamResource($deleted);
    }
}