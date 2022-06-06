<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Examinee
 *
 * @property int $id
 * @property string $name
 * @property string $email
 * @property int $gender
 * @property string $birthdate
 * @property int $account_id
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Database\Factories\ExamineeFactory factory(...$parameters)
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee query()
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee whereAccountId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee whereBirthdate($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee whereEmail($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee whereGender($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Examinee whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Examinee extends Model
{
    use HasFactory;
}
