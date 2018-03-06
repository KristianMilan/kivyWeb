<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Live Mod Pro | Pivothead</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <link rel="stylesheet" href="web/css/bootstrap.min.css">
  <link rel="stylesheet" href="web/css/AdminLTE.min.css">
  <link rel="stylesheet" href="web/css/skin-blue.min.css">
  <link rel="stylesheet" href="web/css/font-awesome.min.css">
  <link rel="stylesheet" href="web/plugins/icheck/all.css">
  <link rel="stylesheet" href="web/plugins/bootstrap-slider/slider.css">
  
  <style>
      .m_h{
          min-height: 400px;
      }    
  </style>
  
</head>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">
    % include('sider_header.tpl')      
    % include('menus.tpl', network=True, connect=True)  
    <div class="content-wrapper">
      <section class="content-header">
        <h1>Connect to Wi-Fi Network</h1>
      </section>
      <section class="content">
        <form id="form1" name="form1" method="post" action="/localConnectWifi">
        <div class="row">
          <div class="col-md-6">
            <div class="box box-primary">
              <div class="box-header with-border">
                <div class="row">
                    <div class="col-xs-6">
                        <h3 class="box-title">Connect Now</h3>
                    </div>
                    <div class="col-xs-6">
                        <label class="checkbox pull-right" style="margin-top: 0px;"><input type="checkbox" name="autoConnect" value="true" checked>Auto connect</label>
                    </div>
                </div>
              </div>
              <div class="box-body box-profile">
                
                  <div class="form-group">
                      <label for="networkssid">SSID</label>
                      <input type="text" class="form-control" name="networkname" id="networkname" value="{{networkname}}" disabled/>
                      <span class="lock"></span>
                  </div>
                  <div class="form-group">
                      <label for="networkpassword">Password</label>
                      <input type="password" class="form-control" name="password" id="showPasswordInput" placeholder="Enter network password"/>
                  </div>
                  <div class="checkbox">
                      <label><input type="checkbox" id="showPasswordCheckbox">Show password</label>
                  </div>
              </div>
              <div class="box-footer">
                  <a href="/network_scan" class="btn btn-default">Back to Pre-scanned Networks</a>
                  <a href="javascript:formSubmit();" type="submit" class="btn btn-primary pull-right">Connect to Network</a>
              </div> 
            </div>
          </div>            
        </div>   
        </form>              
      </section> 
    </div>
    <footer class="main-footer">    
      <strong>Copyright &copy; 2016 <a href="#">Pivothead Wearable Imaging</a>.</strong> All rights reserved.
    </footer>
  </div>
  <script src="web/js/jquery.min.js"></script>
  <script src="web/js/bootstrap.min.js"></script>
  <script src="web/js/app.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
      $('#showPasswordCheckbox').change( function(e){
          if($(this).is(":checked")){
              $('#showPasswordInput').prop('type', 'text');

          }else{
              $('#showPasswordInput').prop('type', 'password')
          }

      });
      $("#showPasswordInput").on('keyup', function(e){
          if($(this).val().trim() === '') {
              $('#connectBtn').removeClass('blue-btn').addClass('grey-btn');
          }else{
              $('#connectBtn').removeClass('grey-btn').addClass('blue-btn');
          }

      });

  });
  function formSubmit()
  {
    if(!$.trim($('#showPasswordInput').val()).length ) {
      alert("Password is necessary");
      return;
    }
    var encrypt=getUrlParameter("encrypt");
    $('#form1').append("<input type='hidden' name='ssid' value='{{networkname}}' />");
    $('#form1').append("<input type='hidden' name='encrypt' value='{{encrypt}}' />");
    $('#form1').submit();
  }

  function getUrlParameter(sParam)
  {
      var sPageURL = window.location.search.substring(1);
      var sURLVariables = sPageURL.split('&');
      for (var i = 0; i < sURLVariables.length; i++) 
      {
          var sParameterName = sURLVariables[i].split('=');
          if (sParameterName[0] == sParam) 
          {
              return sParameterName[1];
          }
      }
  }
  </script>
</body>
</html>