<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /* create admin, author and user */
        /* password for these users is 12345678 */

        $factoryUsers = [
            [
                'first_name' => 'admin user',
                'middle_name' => 'user',
                'last_name' => 'admin',
                'email' => 'admin@admin.com',
                'phone_number' => '+255678500443',
                'password' => '12345678', // 12345678
                'role' => 'admin'
            ],

            [
                'first_name' => 'author user',
                'middle_name' => 'user',
                'last_name' => 'author',
                'email' => 'author@author.com',
                'phone_number' => '+255678500442',
                'password' => '12345678', // 12345678
                'role' => 'author'
            ],

            [
                'first_name' => 'simple user',
                'middle_name' => 'user',
                'last_name' => 'simple',
                'email' => 'user@user.com',
                'phone_number' => '+255678500441',
                'password' => '12345678', // 12345678
                'role' => 'user'
            ],
        ];

        foreach ($factoryUsers as $user) {
            $newUser =  User::factory()->create([
                'first_name' => $user['first_name'],
                'middle_name' => $user['middle_name'],
                'last_name' => $user['last_name'],
                'phone_number' => $user['phone_number'],
                'email' => $user['email'],
                'password' => $user['password'],
            ]);
            $newUser->assignRole($user['role']);
        }
    }
}
