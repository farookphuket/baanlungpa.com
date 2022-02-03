<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Eloquent;
use DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        $this->call([
            UserSeeder::class,
            RoleSeeder::class,
            VisitorSeeder::class,
            WhatupSeeder::class,
        ]);

        // create pip table
        $this->create_pip_table();
    }


        public function create_pip_table(){
        
            /*
             * the pip table have to create after all main table has created
             * */

            Eloquent::unguard();
            $role_file = 'DB/user_role_link.sqlite';
            DB::unprepared(file_get_contents($role_file));
            $this->command->info("Role of User has been Created!!");
        }
}
