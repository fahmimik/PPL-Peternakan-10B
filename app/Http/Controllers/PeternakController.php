<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\UsiaSapi;
use App\KualitasSemen;
use App\BobotSapi;
use App\WaktuBirahi;

class PeternakController extends Controller
{
    public function getInseminasi(){
      $usia = UsiaSapi::all();
      $semen = KualitasSemen::all();
      $bobot = BobotSapi::all();
      $birahi = WaktuBirahi::all();
      return view ('inseminasi' ,compact('usia','semen','bobot','birahi'));
    }
}
