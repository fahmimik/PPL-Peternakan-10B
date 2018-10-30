<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\UsiaSapi;
use App\KualitasSemen;
use App\BobotSapi;
use App\WaktuBirahi;

define("PEMBAGI", 3);
define("MAX", 4);
define("NORMALISASI_U", 0.25);
define("NORMALISASI_B", 0.15);
define("NORMALISASI_W", 0.25);
define("NORMALISASI_S", 0.35);

class PeternakController extends Controller
{
    public function getInseminasi(){
      $usia = UsiaSapi::all();
      $semen = KualitasSemen::all();
      $bobot = BobotSapi::all();
      $birahi = WaktuBirahi::all();
      return view ('inseminasi' ,compact('usia','semen','bobot','birahi'));
    }

    public function calculateInseminasi(Request $request)
    {
      $usia = $request->usia;
      $birahi = $request->birahi;
      $bobot = $request->bobot;
      $semen = $request->semen;

      $u = (MAX - $usia) / PEMBAGI;
      $b = (MAX - $bobot) / PEMBAGI;
      $w = (MAX - $birahi) / PEMBAGI;
      $s = (MAX - $semen) / PEMBAGI;

      $result = array();
      $result['hasil'] = round((($u * NORMALISASI_U) + ($b * NORMALISASI_B) + ($w * NORMALISASI_W) + ($s * NORMALISASI_S)) * 100, 2);
      $result['usia'] = UsiaSapi::find($usia)->usia;
      $result['birahi'] = WaktuBirahi::find($birahi)->waktu_birahi;
      $result['semen'] = KualitasSemen::find($semen)->kualitas_semen;
      $result['bobot'] = BobotSapi::find($bobot)->bobot;

      return view('hasil_inseminasi', compact('result'));
    }

}
