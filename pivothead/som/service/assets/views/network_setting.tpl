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
    
 </head>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">
  % include('sider_header.tpl')  
  % include('menus.tpl', network=True, networkSettings=True)  
    <div class="content-wrapper">
      <section class="content-header">
        <h1>Network Settings</h1>
      </section>
      <section class="content">
        <div class="row">
          <div class="col-md-6">
            <div class="box box-primary">
              <form method="post" action="/network_settings" id="wifimode" name="wifimodechange" >
                <div class="box-header with-border">
                  <h4 class="profile-username">Wi-Fi Settings</h4>
                </div>
                <div class="box-body box-profile">
                  <div class="form-group">
                    <label>Wi-Fi Mode</label>
                    <select class="form-control" name="mode">
                      <option value="3" {{'selected="selected"' if mode==3 else ""}}>Both 2.4Ghz &#38; 5Ghz</option>
                      <option value="1" {{'selected="selected"' if mode==1 else ""}}>5Ghz Only</option>
                      <option value="2" {{'selected="selected"' if mode==2 else ""}}>2.4Ghz Only</option>
                      <!-- <option value="4" {{'selected="selected"' if mode==4 else ""}}>Off</option> -->
                    </select>
                    <p class="help-block">Changing this will restart the Wi-Fi network. You will need to reconnect.</p>
                  </div>                       
                </div>
                <div class="box-footer">
                  <a href="javascript:history.back()" class="btn btn-default">Cancel</a>
                  <a href="javascript:formSubmit();" class="btn btn-primary pull-right" id="connectBtn">Set &#38; Restart Wi-Fi</a>
                </div>
              </form>
            </div>
            <div class="box box-primary">
              <form method="post" action="/apModeConfig" id="AP_SSID" name="ssidChange" >
                <div class="box-header with-border">
                  <h4 class="profile-username">Access Point Settings</h4>
                </div>
                <div class="box-body box-profile">
                  <div class="form-group">
                    <div class="form-group">
                        <label for="networkssid">WIFI Network SSID</label>
                        <input type="text" class="form-control" id="ap_ssid" name="ssid" placeholder="Enter AP ssid" value="{{apName if apName else ''}}">
                        <input type="hidden" name="redirect" value="/network_setting_confirm">
                        <input type="hidden" name="encrypt" value=0>
<!--
                        <div class="form-group">
                            <label>Encryption</label>
                            <select class="form-control" name="encrypt" id="encrypt" onchange="encryptChanged();">
                                 <option value="0" {{'encryption="selected"' if mode==3 else ""}}>None</option>
                                 <option value="2">WPA-PSK</option>
                                 <option value="3">WPA-PSK2</option>
                            </select>
                        </div>
                        <div class="form-group" id="password_area">
                            <label for="networkpassword">Password</label>
                            <input type="password" class="form-control" id="showPasswordInput" name="password" placeholder="Enter AP password">
                            <div class="checkbox">
                                <label><input type="checkbox" id="showPasswordCheckbox">Show password</label>
                            </div>
                        </div>
-->
                        
                        
                    </div>
                  </div>                       
                </div>
                <div class="box-footer">
                  <a href="javascript:apformSubmit();" class="btn btn-primary pull-right" id="connectBtn">Set &#38; Restart Wi-Fi</a>
                </div>
              </form> 
            </div>     
                 
          </div>                    
          <div class="col-md-6">
            <div class="box box-primary">
                    <form action="/networkSecurity" method="post" id="sipNetworkForm">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Device Network Security
                        </h3>
                        
                        <ul class="list-group list-group-unbordered">
                                                        
                            
                            <li class="list-group-item">
                              <b>Enable Device Password Protection</b> 
                              <span class="pull-right">
                                 <input type="checkbox" class="minimal" id="internetAuth" name="internetAuth" {{"checked" if isAuthClient else ""}}>
                              </span> 
                            </li>
                            <li class="list-group-item">
                              <b>Use Device Default Password (The Password is LMPdash8)</b> 
                              <span class="pull-right">
                                 <input type="checkbox" class="minimal" id="defaultCheck" name="isDault" {{"checked" if isDault else ""}}>
                              </span> 
                            </li>
<!--
                            <li class="list-group-item" id="userArea">
                                <label for="networkssid">User</label>
                                <input type="text" class="form-control" id="auth_user" name="user" placeholder="Enter User" value="{{webUser if webUser else ''}}">
                                
                            </li>
-->
                            <li class="list-group-item" id="passwdArea">
                                <label for="networkpassword">Password</label>
                                <input type="password" class="form-control" id="auth_passwd" name="password" placeholder="Enter password">
                                <input type="hidden" name="redirect" value="/network_settings">
                            <div class="checkbox">
                                <label><input type="checkbox" id="showAuthPassword">Show password</label>
                            </div>
                            </li>
                            
                        </ul>
                        <span class="pull-right">
                    	   <button type="submit" class="btn btn-primary pull-right">Activate</button>
                        </span>
                        
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
  <script src="web/js/jquery.min.js"></script>
  <script src="web/js/bootstrap.min.js"></script>
  <script src="web/js/app.min.js"></script>

    
<script type="text/javascript">
function formSubmit()
{
    $('#wifimode').submit();
}
function apformSubmit()
{
    $('#AP_SSID').submit();
}
    
function encryptChanged() {
    
}
    
$(document).ready(function() {
    $('#showPasswordCheckbox').change( function(e){
        if($(this).is(":checked")){
            $('#showPasswordInput').prop('type', 'text');

        }else{
            $('#showPasswordInput').prop('type', 'password')
        }

    });
    $('#showAuthPassword').change( function(e){
        if($(this).is(":checked")){
            $('#auth_passwd').prop('type', 'text');

        }else{
            $('#auth_passwd').prop('type', 'password')
        }

    });
    
    $('#defaultCheck').change( function(e){
        if($(this).is(":checked")){
            $('#passwdArea').hide();

        }else{
            $("#passwdArea").show();
        }

    });
    
    %if isDault:
        $('#passwdArea').hide();
    %end
        

});
  </script>
</body>
</html>