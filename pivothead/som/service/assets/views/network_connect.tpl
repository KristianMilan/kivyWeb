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
				<div class="row">
					<div class="col-md-6">
						<!-- general form elements -->
                        <form id="form1" method="post" action="/localConnectWifi", enctype="multipart/form-data">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <h3 class="box-title">Connect Now</h3>
                                        </div>
                                        <div class="col-xs-6">
                                            <label class="checkbox pull-right" style="margin-top: 0px;"><input type="checkbox" class="minimal" name="autoConnect" value="true" checked>Auto connect</label>
                                        </div>
                                    </div>
                                </div><!-- /.box-header -->
                                <!-- form start -->

                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="networkssid">SSID</label>
                                            <input type="email" class="form-control" id="networkssid" name="ssid" placeholder="Enter network ssid">
                                        </div>
                                        <div class="form-group">
                                            <label for="networkpassword">Password</label>
                                            <input type="password" class="form-control" id="showPasswordInput" name="password" placeholder="Enter network password">
                                        </div>
                                        <div class="checkbox">
                                            <label><input type="checkbox" id="showPasswordCheckbox">Show password</label>
                                        </div>
                                        <div class="form-group">
                                            <label>Encryption</label>
                                            <select class="form-control" name="encrypt" id="encrypt">
                                                 <option value="0">None</option>
                                                 <option value="1">WEP</option>
                                                 <option value="3">WPA/WPA2-PSK</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <a href="/network_scan" class="btn btn-primary">Scan Now</a>
                                        <a href="javascript:formSubmit();" type="submit" class="btn btn-primary pull-right">Connect Now</a>
                                    </div>   
                                </div>
				            </form>               
						
					</div>
					<div class="col-md-6">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Saved Networks</h3>
							</div><!-- /.box-header -->
                            <section id="apArea">
							<div class="box-body">
                                <form id="appForm" action="#", enctype="multipart/form-data">
								<table class="table">
									<p>Networks get saved everytime you connect manually or pre-configure a network. By default the device will try to connect automatically to saved networks when booting. You can forget networks that you no longer want the device to connect to.</p>
                                    % max = 5 if len(favorites)>5 else len(favorites)  
                                    % for i in range(max):
									<tr id="{{i}}">                                       
                                        <input type="hidden" id="ssid" value="{{favorites[i]['wifiName']}}">
										<td>{{favorites[i]['wifiName']}}</td>
										<td>
                                            <div class="checkbox pull-right" style="margin-top: 0px">
                                                    <a href="javascript:connectFavorite('{{favorites[i]['wifiName']}}');" style="margin-right: 10px;">Connect</a>
                                                    <a href='javascript:removeFavorite("{{favorites[i]['wifiName']}}");' style="margin-right: 10px;">forget network</a>
                                                    <label><input type="checkbox" id="enable" class="minimal" {{"checked" if favorites[i]['autoConnect'] else ""}}>Auto connect</label>
                                            </div>
										</td>
									</tr>
                                    %end
                                    
								</table>
                                </form>    
							</div><!-- /.box-body -->
                            </section>    
							<div class="box-footer">
								<a href="/network_more" class="btn btn-default pull-right">More Networks</a>
							</div>
						</div><!-- /.box -->
					</div>
				</div>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-6">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Pre-Configure Network</h3>
							</div><!-- /.box-header -->
							<div class="box-body">
								<p>If your environment contains multiple networks, you have the option to pre-configure them here for future use. Upon booting the device will always atempt to connect to these pre-configured networks. </p>
							</div><!-- /.box-body -->
							<div class="box-footer">
								<a href="/network_manually" class="btn btn-primary pull-right">Pre-Configure New Network</a>
							</div>
						</div><!-- /.box -->
					</div>
				</div>
			</section>
		</div>
  
  <footer class="main-footer">    
    <strong>Copyright &copy; 2016 <a href="#">Pivothead Wearable Imaging</a>.</strong> All rights reserved.
  </footer>

</div>

<script src="web/js/jquery.min.js"></script>
<script src="web/js/bootstrap.min.js"></script>
<script src="web/js/app.min.js"></script>
<script src="web/plugins/icheck/icheck.min.js"></script>
<script src="web/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });    
</script>    
<script type="text/javascript">
$('#apArea input[type=checkbox]').each(function(){
    $(this).on('ifChanged',function(event){
        var section="#"+$(this).closest("tr").attr('id');
        var ssid=$(section+"> #ssid").val();      
        setAudoConnect(ssid, $(this).prop("checked"));
    });
});

    
function removeFavorite(ssid) {
    var jUrl='/removeFavorite?json=1&ssid='+encodeURIComponent(ssid);
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            if(typeof(json.r)=='undefined' || json.r==null || json.r!=0)
            {
                alert('Failed to remove remembered network');
                return;
            }
            location.reload();
        }
    });
}    
    
function setAudoConnect(ssid, enable) {
    var jUrl='/setAutoConnectWifi?json=1&ssid='+ssid+"&enable="+enable;
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            if(typeof(json.r)=='undefined' || json.r==null || json.r!=0)
            {
                alert('Failed to enable/disable Auto connect');
                return;
            }
        }
    });
}       

function formSubmit()
{
	if(!$.trim($('#networkssid').val()).length ) {
        alert("SSID is necessary");
        return;
    }
    if($('#encrypt').val()>0 && !$.trim($('#showPasswordInput').val()).length ) {
        alert("Password is necessary");
        return;
    }
	$('#form1').submit();
}
    
function connectFavorite(ssid) {
    window.location.href = "/connectFavorite?ssid="+encodeURIComponent(ssid);
}
    
$(document).ready(function() {

    $('#showPasswordCheckbox').change( function(e){
        if($(this).is(":checked")){
            $('#showPasswordInput').prop('type', 'text');

        }else{
            $('#showPasswordInput').prop('type', 'password')
        }

    });

});    
</script>
</body>
</html>