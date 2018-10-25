<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id_waktu_birahi
 * @property string $waktu_birahi
 */
class WaktuBirahi extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'waktu_birahi';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'id_waktu_birahi';

    /**
     * @var array
     */
    protected $fillable = ['waktu_birahi'];

}
