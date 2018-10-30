<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="{{asset('asset/css/bootstrap.min.css')}}">
  <script src="{{asset('js/bootstrap.min.js')}}"></script>
</head>

<body>
    <center><h1 class="" style=""> INSEMINASI </h1></center>
    <div class=" container">
      <div class="col-sm-12">
        <form class="" action="" method="post">
          {{csrf_field()}}

          <div class="form-group">
            <label class="col-sm-3 control-label" style="text-align:left">Usia</label>
              <select class="col-sm-9 btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" name="usia"><span class="caret"></span>
                @foreach ($usia as $u)
                  <option value="{{$u->id_usia}}">{{ $u->usia }}</option>
                @endforeach
              </select>
          </div>
          <br><br>

          <div class="form-group">
            <label class="col-sm-3 control-label" style="text-align:left">Bobot</label>
              <select class="col-sm-9 btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" name="bobot"><span class="caret"></span>
                @foreach ($bobot as $b)
                <option value="{{$b->id_bobot}}">{{ $b->bobot }}</option>
                @endforeach
              </select>
          </div>
          <br><br>

          <div class="form-group">
            <label class="col-sm-3 control-label" style="text-align:left">Waktu Birahi</label>
              <select class="col-sm-9 btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" name="birahi"><span class="caret"></span>
                @foreach ($birahi as $birahi)
                <option value="{{$birahi->id_waktu_birahi}}">{{ $birahi->waktu_birahi}}</option>
                @endforeach
              </select>
          </div>
          <br><br>

          <div class="form-group">
            <label class="col-sm-3 control-label" style="text-align:left">Kualitas</label>
              <select class="col-sm-9 btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" name="semen"><span class="caret"></span>
                @foreach ($semen as $s)
                <option value="{{$s->id_semen}}">{{ $s->kualitas_semen }}</option>
                @endforeach
              </select>
          </div>
<br><br>

          <button type="submit" class="btn btn-success">Simpan</button>
        </form>
        <br><br>

        <div class="col-sm-6" style="">
          <textarea name="hasil_inseminasi" rows="4" cols="80" class="form-control" placeholder="" ></textarea>
        </div>



      </div>


  </div>
</body>

</html>
