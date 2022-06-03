<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use App\Models\Account;

class AccountRepository extends BaseRepository
{
    function create(array $attributes)
    {
        return DB::transaction(function () use ($attributes) {
            $created = Account::create([
                'user_name' => data_get($attributes, 'user_name'),
                'password' => data_get($attributes, 'password'),
                'is_admin' => data_get($attributes, 'is_admin', false)
            ]);
            return $created;
        });
    }

    /**
     * 
     */
    function update($model, array $attributes)
    {
        return DB::transaction(function () use ($model, $attributes) {
            $updated = $model->update([
                'password' => data_get($attributes, 'password')
            ]);
            if (!$updated)
                throw new \Exception('Loi roi cha');
            return $model;
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