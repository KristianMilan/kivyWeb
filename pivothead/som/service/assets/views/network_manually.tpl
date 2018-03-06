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
				<h1>Pre-Configure Network</h1>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-6">
                            <form id="preconfnetwork" name="form1" method="post" action="/save_favorite">
				              <!-- general form elements -->
				              <div class="box box-primary">
				                <div class="box-header with-border">
				                	<div class="row">
				                		<div class="col-xs-6">
				                			<h3 class="box-title">Pre-Configure Network</h3>
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
                                        <div id="eapArea">
                                            <div class="form-group">
                                                <label>
                                                    User:
                                                </label>
                                                <input type="text" class="form-control" name="user" id="showUserInput"/>
                                            </div>
                                            <div class="form-group">       
                                                <label>
                                                    EAP Method
                                                </label>
                                                <select class="form-control" name="eapType">
                                                     <option value="2">PEAP</option>
                                                     <option value="1">EAP-TLS</option>
                                                     <option value="3">EAP-TTLS</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>
                                                    PHASE2 AUTHENTICATION:
                                                </label>      
                                                <select class="form-control" name="auth">
                                                         <option value="none">None</option>
                                                         <option value="PAP">PAP</option>
                                                         <option value="MSCHAPV2">MSCHAPV2</option>
                                                         <option value="GTC">GTC</option>
                                                </select>
                                            </div>
                                            <div class="form-group">       
                                                <label>
                                                    Private Key Password
                                                </label>
                                                <input class="form-control" type="password" value="" name="keyPwd" id="pkPasswordInput">
                                            </div>
                                        </div> 
									</div>
									<div class="box-footer">
                                        <a href="javascript:history.back()" class="btn btn-default">Go Back</a>
										<a href="javascript:formSubmit();" type="submit" class="btn btn-primary pull-right">Save Network</a>
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
$(document).ready(function(){
    $('#eapArea').hide();
    $('#showPasswordCheckbox').change( function(e){
        if($(this).is(":checked")){
            $('#showPasswordInput').prop('type', 'text');

        }else{
            $('#showPasswordInput').prop('type', 'password')
        }

    });
    $('#pkPasswordInput').change( function(e){
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
    
    $("#encrypt").change(function(){
       if($('#encrypt').val()<=3) {
           $('#eapArea').hide();
       }
        else{
            $('#eapArea').show();
        }
    });
    

});
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
    $('#preconfnetwork').submit();
}


</script>

</body>
</html>