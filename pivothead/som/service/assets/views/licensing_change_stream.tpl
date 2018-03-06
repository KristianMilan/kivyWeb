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
    
 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

% include('sider_header.tpl')  
    
% include('menus.tpl', licensing=True, license=True)  

<div class="content-wrapper">
   	<section class="content-header">
      <h1>Server Settings</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                	<div class="box-header with-border">
			        	<h4 class="profile-username">Enter New Pro Server Details</h4> 
			        </div>
                    <form id="form1" name="form1" method="post" action="/setupPushStream">
				        <div class="box-body box-profile">
				            <div class="form-group">
				              <label>Media Server IP: (Format: xxx.xxx.xxx.xxx)</label>
				              <input type="text" class="form-control" name="pushIP" id="ipInput" >
				            </div>
				            <div class="form-group">
				              <label>Streaming Port</label>
				              <input class="form-control" name="pushPort" type="text" id="pushPort">
				            </div>
				            <div class="form-group">
				              <label>API Server (Format: URL)</label>
				              <input class="form-control" type="text" value="" name="liveServer" id="liveServer">
				            </div>
				        </div>
				        <div class="box-footer">
				            <a href="javascript:history.back()" class="btn btn-default">Cancel</a>
				            <a href="javascript:formComplete();" id="connectBtn" class="btn btn-md btn-default pull-right" disabled>Activate</a>
				        </div>
			    	</form>
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
<script type="text/javascript">
function buttonManager(){
	ip_address = $("#ipInput").val();
	if(re.test(ip_address) ) {
		$('#connectBtn').attr('disabled', false);
		$('#connectBtn').removeClass('btn-default').addClass('btn-primary');
	}
	else
	{
		$('#connectBtn').attr('disabled', true);
		$('#connectBtn').removeClass('btn-primary').addClass('btn-default');
	}
}

var re = new RegExp(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i);
function formComplete() {
	if(!re.test($('#ipInput').val())) {
		alert("IP is incorrect");
		return;
	}
	$('#form1').submit();
}

$(document).ready(function(e) {
	$("#ipInput").keyup(function(){
		buttonManager();
	});
});

</script>
</body>
</html>