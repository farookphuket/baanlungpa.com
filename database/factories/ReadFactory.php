<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

use App\Models\Blog;

class ReadFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            "ip" => $this->faker->ip(),
            "browser" => "",
            "os" => "",
            "device" => ""
        ];
    }
}
