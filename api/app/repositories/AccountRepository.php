<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use App\Models\Account;
use Illuminate\Support\Facades\Log;

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
     * @param Account $account
     */
    function update($account, array $attributes)
    {
        return DB::transaction(function () use ($account, $attributes) {
            $updated = $account->update([
                'password' => data_get($attributes, 'password', $account->password)
            ]);
            if (!$updated)
                throw new \Exception('Loi roi cha');
            return $account;
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