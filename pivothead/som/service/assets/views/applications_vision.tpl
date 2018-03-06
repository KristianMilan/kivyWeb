<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Live Mod Pro | Pivothead</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <link rel="stylesheet" href="/web/css/bootstrap.min.css">
  <link rel="stylesheet" href="/web/css/AdminLTE.min.css">
  <link rel="stylesheet" href="/web/css/skin-blue.min.css">
  <link rel="stylesheet" href="/web/css/font-awesome.min.css">
  <link rel="stylesheet" href="/web/plugins/icheck/all.css">
  <link rel="stylesheet" href="/web/plugins/bootstrap-slider/slider.css">
  <link rel="stylesheet" href="/web/css/jquery-ui.css">
  <style>
      .m_h{
          min-height: 400px;
      }    
  </style>
  
 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
% include('sider_header.tpl')  
% include('menus.tpl', applications=True, pivotvision=True)  
  <div class="content-wrapper">
    <section class="content-header">
      <h1>PivotVision</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                	<div class="box-header">
                		<h3 class="profile-username">Application Setting</h3>
                	</div>
                    <div class="box-body box-profile">
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Enable Vision</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" id="enableCheck" {{"checked" if isVision else ""}}>
                              </span>
                            </li>
                            <li class="list-group-item">
                                <b>Vision SIP Server</b>
                                <span class="pull-right">
                                <a href="/setVisionSIPPage" class="btn btn-primary btn-xs">Change</a>
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
           </div>         
        </div>
    </section>
  </div>
  <footer class="main-footer">    
    <strong>Copyright &copy; 2016 <a href="#">Pivothead Wearable Imaging</a>.</strong> All rights reserved.
  </footer>
</div>

<script src="/web/js/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="/web/js/app.min.js"></script>
<script src="/web/plugins/icheck/icheck.min.js"></script>
<script src="/web/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="/web/js/jquery-ui.js"></script>
<script>
var log_dialog;    
    
$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
  checkboxClass: 'icheckbox_minimal-blue',
  radioClass: 'iradio_minimal-blue'
});    


function enableVision(isEnable) {
    var jUrl='/PivotVision/enable?json=1';
    $.ajax({
        url: jUrl,
        type: 'POST',
        data: { enable : isEnable},
        cache: false,
        timeout:3000,
        success: function (response) {
            console.log(response);
        },
        error:function(){   
            alert("Timeout, please try again.");
            location.reload();
        }
    });
}

$(document).ready(function() {	
    $('#enableCheck').on('ifChanged',function(event){
        enableVision($('#enableCheck').prop("checked"));
    });
    
});    
</script>

</body>
>
</html>