<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Database\Seeders\Traits\TruncateTable;
use Database\Seeders\Traits\DisableForeignKeys;
use App\Models\User;
use Illuminate\Notifications\Action;

class UserSeeder extends Seeder
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
        User::factory(5)->create();
        $this->enableForeignKeys();
    }
}