<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * @property int $id
 * @property int $id_level
 * @property string $name
 * @property string $address
 * @property string $phone
 * @property string $email
 * @property string $email_verified_at
 * @property string $password
 * @property string $remember_token
 * @property string $created_at
 * @property string $updated_at
 * @property Level $level
 * @property ChatterDiscussion[] $chatterDiscussions
 * @property ChatterPost[] $chatterPosts
 * @property ChatterDiscussion[] $chatterDiscussions
 */
class User extends Authenticatable
{
    /**
     * @var array
     */
    protected $fillable = ['id_level', 'name', 'address', 'phone', 'email', 'email_verified_at', 'password', 'remember_token', 'created_at', 'updated_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function level()
    {
        return $this->belongsTo('App\Level', 'id_level', 'id_level');
    }
}
