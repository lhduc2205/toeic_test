<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use App\Models\Exam;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

class ExamRepository extends BaseRepository
{
    function create(array $attributes)
    {
        return DB::transaction(function () use ($attributes) {
            $created = Exam::create([
                'title' => data_get($attributes, 'title'),
                'topic' => data_get($attributes, 'topic'),
                'desc' => data_get($attributes, 'desc', ''),
                'time_limit' => data_get($attributes, 'time_limit'),
                'question_amount' => data_get($attributes, 'question_amount'),
            ]);
            return $created;
        });
    }

    /**
     * @param Exam $Exam
     */
    function update($exam, array $attributes)
    {
        return DB::transaction(function () use ($exam, $attributes) {
            $updated = $exam->update([
                'title' => data_get($attributes, 'title', $exam->title),
                'topic' => data_get($attributes, 'topic', $exam->topic),
                'desc' => data_get($attributes, 'desc', $exam->desc),
                'time_limit' => data_get($attributes, 'time_limit', $exam->time_limit),
                'question_amount' => data_get($attributes, 'question_amount', $exam->question_amount)
            ]);
            if (!$updated)
                throw new \Exception('Loi roi cha');
            return $exam;
        });
    }

    function forceDelete($model)
    {
        return DB::transaction(function () use ($model) {
            $deleted = $model->forceDelete();
            if (!$deleted)
                throw new \Exception('Loi roi cha');
            return $model;
        });
    }
}