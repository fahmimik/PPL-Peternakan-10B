<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id_bobot
 * @property string $bobot
 */
class BobotSapi extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'bobot_sapi';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'id_bobot';

    /**
     * @var array
     */
    protected $fillable = ['bobot'];

}
