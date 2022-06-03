<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Database\Seeders\Traits\TruncateTable;
use Database\Seeders\Traits\DisableForeignKeys;
use App\Models\Account;
use Illuminate\Notifications\Action;

class AccountSeeder extends Seeder
{
    use TruncateTable, DisableForeignKeys;
    /**
     * Run the database seeds.a
     *
     * @return void
     */
    public function run()
    {
        //
        $this->disableForeignKeys();
        $this->truncate('users');
        Account::factory(1)->create([
            'user_name' => 'admin',
            'password' => 'admin',
            'is_admin' => true
        ]);
        Account::factory(4)->create();
        $this->enableForeignKeys();
    }
}