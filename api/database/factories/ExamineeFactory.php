<?php

namespace Database\Factories;

use App\Models\Account;
use Illuminate\Database\Eloquent\Factories\Factory;
use Database\Factories\Helpers\FactoryHelper;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Examinee>
 */
class ExamineeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            //
            'name' => $this->faker->name(),
            'email' => $this->faker->unique()->safeEmail(),
            'birthdate' => $this->faker->date(),
            'gender' => $this->faker->boolean(),
            'account_id' => FactoryHelper::getRandomModelId(Account::class)
        ];
    }
}