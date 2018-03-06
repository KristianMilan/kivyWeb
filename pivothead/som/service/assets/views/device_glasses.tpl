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
    
% include('menus.tpl', livemodpro=True, glasses=True)  
    
		<div class="content-wrapper">
			<section class="content-header">
				<h1>Glasses</h1>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-6">
						<!-- general form elements -->
                        <form id="form1" method="post" action="/glassesSetting", enctype="multipart/form-data">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <h3 class="box-title">Settings</h3>
                                        </div>
                                    </div>
                                </div><!-- /.box-header -->
                                <!-- form start -->

                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Video Bitrate:</label>
                                            <select class="form-control" name="bitrate" id="bitrate">
                                                 <option value="2.0" {{'selected' if bitrate==2.0 else ''}}>2Mb/s</option>
                                                 <option value="1.0" {{'selected' if bitrate==1.0 else ''}}>1Mb/s</option>
                                                 <option value="0.75" {{'selected' if bitrate==0.75 else ''}}>750Kb/s</option>
                                                 <option value="0.5" {{'selected' if bitrate==0.5 else ''}}>500Kb/s</option>
                                                 <option value="0.3" {{'selected' if bitrate==0.3 else ''}}>300Kb/s</option>
                                                 <option value="0" {{'selected' if bitrate==0 else ''}}>Auto</option>
                                            </select>
                                            
                                        </div>
                                        <div class="form-group">
                                            % if defined('autoBitrate'):                                                                                       
                                            <b>Auto Bitrate Value:</b> <a class="pull-right"><div id="autoBitrate" style="display: inline-block; white-space: nowrap">{{autoBitrate}}</div>Mb/s</a>
                                            % end
                                        </div>
                                        % if defined('isTouch') and isTouch is not None:
                                        <div class="form-group">
                                            <b>Enable Touch Panel:</b> 
                                                <span class="pull-right">
                                                    <input type="checkbox" class="minimal" name="isTouch" id="touchCheck" {{'checked' if isTouch else ''}}>
                                                </span>
                                        </div>
                                        % end
                                    </div>
                                    <div class="box-footer">
                                        <a href="javascript:formSubmit();" type="submit" class="btn btn-primary pull-right">Save</a>
                                    </div>   
                                </div>
				            </form>               
						
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
    
<script type="text/javascript">
$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
  checkboxClass: 'icheckbox_minimal-blue',
  radioClass: 'iradio_minimal-blue'
});   
function updateAutoBitrate() {
    $.ajax({
        url: '/sipAutoBitrate?json=1',
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            console.log(response);
            $("#autoBitrate").html(json.r);
            setTimeout( updateAutoBitrate, 10000 );
        },
        error: function(){
            setTimeout( updateAutoBitrate, 10000 );
        }
    });
} 

function formSubmit()
{
	$('#form1').submit();
}
  
$(document).ready(function(e) {
    % if defined('autoBitrate'):       
        updateAutoBitrate();
    % end
    
});
</script>
</body>
</html>