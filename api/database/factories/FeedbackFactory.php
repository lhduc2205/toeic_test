<?php

namespace Database\Factories;

use Database\Factories\Helpers\FactoryHelper;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;
use App\Models\Exam;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Feedback>
 */
class FeedbackFactory extends Factory
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
            'content' => $this->faker->realText(),
            'user_id' => FactoryHelper::getRandomModelId(User::class),
            'exam_id' => FactoryHelper::getRandomModelId(Exam::class),
        ];
    }
}
