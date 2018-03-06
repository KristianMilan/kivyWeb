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
% include('menus.tpl', livemodpro=True, deviceAdvanced=True)  
  <div class="content-wrapper">
    <section class="content-header">
      <h1>Device Advanced Setting</h1>
    </section>
    <section class="content">
<!--
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                	<div class="box-header">
                		<h3 class="profile-username">Press and Hold button for 10 seconds to Reset</h3>
                	</div>
                    <div class="box-body box-profile">
                        <span >
                    	   <button id="resetBtn" type="submit" class="btn btn-primary center-block">Reset</button>
                        </span>
                    </div>
                </div>
           </div>         
        </div>
-->
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                	<div class="box-header">
                		<h3 class="profile-username">TCP Dump</h3>
                	</div>
                    <div class="box-body box-profile">
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Run TCP Dump</b>          
                            <span class="pull-right">
                            <form action="/device/tcpdump" method="post" id="tcpForm">  
                                
                                <input type="hidden" name="redirect" value="/device/advanced">
                              %if isRunning:    
                                <input type="hidden" name="enable" value="false">
                                <input type="button" value="Stop" id="stopBtn" class="pull-right btn btn-xs btn-primary" onclick="this.form.submit();">                              
                              %else:
                                <input type="hidden" name="enable" value="true">
                                <input type="button" value="Start" id="startBtn" class="pull-right btn btn-xs btn-primary" onclick="this.form.submit();">     
                              %end
                             
                            </form>
                            </span>       
                            </li>
                            %if tcpPath and not isRunning:
                            <li class="list-group-item">
                              <b>Download TCP Dump File</b> 
                              <span class="pull-right">
                                <a id="downloadBtn" href="/device/tcpdump/download" class="pull-right btn btn-xs btn-primary">Download</a>
                              </span>                                
                            </li>
                            <li class="list-group-item">
                              <b>TCP Dmp Clean File</b> 
                              <span class="pull-right">
                                <a id="downloadBtn" href="/device/tcpdump/remove" class="pull-right btn btn-xs btn-primary">Clean</a>
                              </span>                                
                            </li>
                            %end
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


function reset() {
    window.location = '/device/reset_done';
}


$(document).ready(function() {	
    var timeoutId = 0;

    $('#resetBtn').on('mousedown', function() {
        timeoutId = setTimeout(reset, 10000);
    }).on('mouseup mouseleave', function() {
        clearTimeout(timeoutId);
    });
    

    
});    
</script>

</body>
>
</html>