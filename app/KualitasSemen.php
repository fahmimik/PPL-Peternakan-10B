<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id_semen
 * @property string $kualitas_semen
 */
class KualitasSemen extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'kualitas_semen';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'id_semen';

    /**
     * @var array
     */
    protected $fillable = ['kualitas_semen'];

}
