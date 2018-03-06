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
				<h1>Saved Networks</h1>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Saved Networks</h3>
							</div><!-- /.box-header -->
							<div class="box-body">
								<table class="table" id="apsArea">
									<p>Networks get saved everytime you connect manually or pre-configure a network. By default the device will try to connect automatically to saved networks when booting. You can forget networks that you no longer want the device to connect to.</p>
                                    % for ap in favorites:
									<tr>
                                        <input type="hidden" id="ssid" name="ssid" value="{{ap['wifiName']}}">
										<td>{{ap['wifiName']}}</td>
										<td>
											<div class="checkbox pull-right" style="margin-top: 0px">
												<a href='javascript:removeFavorite("{{ap['wifiName']}}");' style="margin-right: 10px;">forget network</a>
												<label><input type="checkbox" id="enable" class="minimal" {{"checked" if ap['autoConnect'] else ""}}>Auto connect</label>
											</div>
										</td>
									</tr>
									% end
								</table>
							</div><!-- /.box-body -->
							<div class="box-footer">
                                <a href="javascript:history.back()" class="btn btn-default">Go Back</a>
								<a href="javascript:clearFavorites();" class="btn btn-default pull-right">Clear All</a>
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
<script src="/web/js/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="/web/js/app.min.js"></script>
<script src="/web/plugins/icheck/icheck.min.js"></script>
<script src="/web/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });    
</script>       
<script type="text/javascript">
$('#apsArea input[type=checkbox]').each(function(){
    $(this).on('ifChanged',function(event){
        var tr=$(this).closest("tr");
        var ssid=tr.find("#ssid").val();      
        setAudoConnect(ssid, $(this).prop("checked"));
    });
});
    
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

function clearFavorites() {
    var jUrl='/clearFavorites?json=1';
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            if(typeof(json.r)=='undefined' || json.r==null || json.r!=0)
            {
                alert('Failed to clear remembered network');
                return;
            }
            location.reload();
        }
    });
}  
   
</script>

</body>
</html>