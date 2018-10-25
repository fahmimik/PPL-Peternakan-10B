<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id_usia
 * @property string $usia
 */
class UsiaSapi extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'usia_sapi';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'id_usia';

    /**
     * @var array
     */
    protected $fillable = ['usia'];

}
