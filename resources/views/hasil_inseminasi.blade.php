@extends('layouts.app')

@section('content')
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="{{asset('asset/css/bootstrap.min.css')}}">
  <link rel="stylesheet" href="{{asset('asset/style.css')}}">
</head>
<body>
  <div class="container-fluid">
    <div class="">
      <div class="col-md-4"></div>
      <div class="col-md-4">
        <!-- form start -->
        <form class="form-container">
          <h1 class="text-center">HASIL INSEMINASI</h1><br>
          <div class="form-group">
            <label>Usia</label>
            <p>{{ $result['usia'] }} <br></p>
            <!-- <input type="Username" class="form-control" placeholder="Username" name="" value=""> -->
          </div>
          <div class="form-group">
            <label>Bobot</label>
            <p>{{ $result['bobot'] }}</p>
            <!-- <input type="password" class="form-control" placeholder="Password" name="" value=""> -->
          </div>
          <div class="form-group">
            <label>Waktu Birahi</label>
            <p>{{ $result['birahi'] }}</p>
            <!-- <input type="password" class="form-control" placeholder="Password" name="" value=""> -->
          </div>
          <div class="form-group">
            <label>Kualitas Semen</label>
            <p>{{ $result['semen'] }}</p>
            <!-- <input type="password" class="form-control" placeholder="Password" name="" value=""> -->
          </div>
          <div class="form-group">
            <center>
            <label><h3>Memiliki Tingkat Keberhasilan Sebesar</label></h3>
            <p><h2>{{ $result['hasil'] }}%</p></h2>
          </center>
          </div>

          <a href="/inseminasi"><button class="btn btn-success btn-block">Kembalikan Saya.</button></a>

        </form>
        <!-- end form -->

      </div>

    </div>

  </div>
  <br><br><br>

  </body>
  </html>
@endsection
