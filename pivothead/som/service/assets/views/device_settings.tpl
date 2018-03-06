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
    
% include('menus.tpl', livemodpro=True, deviceSettings=True)  

  <div class="content-wrapper">
   
    <section class="content-header">
      <h1>
        Device Settings       
      </h1>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-md-6">
               
                <div class="box box-primary m_h">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Device Info
                        </h3>
                        
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Firmware</b> 
                              <span class="pull-right">
                                <a>{{fwVersion}}</a>
                                %if isUpgradable:
                                    <a href="/startUpgrade" class="btn btn-xs btn-warning"> Update</a> 
                                %end
                              </span>
                                 
                            </li>
                            
                            <li class="list-group-item">
                              <b>Software</b> 
                              <span class="pull-right">
                                <a>{{swVersion}}</a>
                                %if isAvailableApps:
                                    <a href="/upgrade" class="btn btn-xs btn-warning"> Update</a> 
                                %end
                              </span>
                                 
                            </li>
                            
                            <li class="list-group-item">
                              <b>Serial</b> <a class="pull-right">{{serial}}</a>
                            </li>
                            
                            <li class="list-group-item">
                              <b>MAC Address</b> <a class="pull-right">{{macAddr}}</a>
                            </li>
                            
                            <li class="list-group-item">
                              <b>Live Mod Pro IP Address</b> <a class="pull-right">{{ip}}</a>
                            </li>
                            
                            <li class="list-group-item">
                              <b>Eyewear IP Address</b> <a class="pull-right">{{glassesIP}}</a>
                            </li>
                            
                            <li class="list-group-item">
                              <b>Server</b> <a class="pull-right">{{mediaServer}}</a>
                            </li>
                            
                            <li class="list-group-item">
                              <b>API</b> <a class="pull-right">{{apiAddr}}</a>
                            </li> 
                            
                            %if defined('ips') and ips:
                            <li class="list-group-item">
                              <b>IP History</b> <a href="/network_ip_history" class="pull-right btn btn-xs btn-info">Show</a> 
                            </li> 
                            %end
                            
                            <li class="list-group-item">
                              <b>NTP Server</b> <a href="/device/ntp" class="pull-right btn btn-xs btn-primary">Change</a> 
                            </li>
                            
                            <li class="list-group-item">
                              <b>Timezone</b> 
                                <span class="pull-right">
                                    <a>{{timezone}}</a>
                                    <a href="/getTimeZone?web=True" class="btn btn-xs btn-primary">Change</a> 
                                </span>
                            </li>
                        </ul>

                    </div>
                </div>
                
                
<!--
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Eyewear Settings
                        </h3>
                        
                        <ul class="list-group list-group-unbordered">
                           <li class="list-group-item">
                              <b>Enable Eyewear Touch Gestures</b> 
                              <span class="pull-right">
                                 <input id="touchCheckbox" type="checkbox" class="minimal" checked>
                              </span> 
                            </li>    
                            
                            <li class="list-group-item">
                              <b>Enable Eyewear LED Notifications</b> 
                              <span class="pull-right">
                                 <input id="touchCheckbox" type="checkbox" class="minimal" checked>
                              </span> 
                            </li>    
                            
                            <li class="list-group-item">
                              <b>Enable Eyewear Sound Notifications</b> 
                              <span class="pull-right">
                                 <input id="touchCheckbox" type="checkbox" class="minimal" checked>
                              </span> 
                            </li>    
                        </ul>

                    </div>
                </div>
-->
                
            </div>
            
            <div class="col-md-6">
               
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Device Status
                        </h3>
                        
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Wi-Fi</b> <a class="pull-right">{{frequency}}Ghz</a>
                            </li>       
                            
                            <li class="list-group-item">
                              <b>Bluetooth</b> <a class="pull-right" id="blueStatus">{{"Enabled" if isBle else "Disabled"}}</a>
                            </li>       
                            
                            <li class="list-group-item">
                              <b>Media Server Version</b> <a class="pull-right">7105</a>
                            </li>       
                            
                            <li class="list-group-item">
                                <b>Media Server</b> 
                                %if isMediaServerRunning:    
                                <a class="pull-right btn btn-xs btn-success">Running</a>
                                %else:
                                <a class="pull-right btn btn-xs btn-danger">Stop</a>
                                %end
                            </li>
                            
                            <li class="list-group-item">
                                <b>License</b> 
                                %if isLicenseValid:
                                <a class="pull-right btn btn-xs btn-success">Active</a>
                                %else:
                                <a class="pull-right btn btn-xs btn-danger">Pilot</a>
                                %end
                            </li>
                            
                        </ul>
                        
                    </div>
                </div>
                
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Device Settings
                        </h3>
                        
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Auto Download New Firmware</b> 
                              <span class="pull-right">
                                 <input type="checkbox" class="minimal" id="autoFW" {{"checked" if isAutoFW else ""}}>
                              </span> 
                            </li>
                            
                            <li class="list-group-item">
                              <b>Auto Download Application Updates</b> 
                              <span class="pull-right">
                                 <input type="checkbox" class="minimal" id="autoApp" {{"checked" if isAutoApp else ""}}>
                              </span> 
                            </li>
                            
                            <li class="list-group-item">
                              <b>Enable Bluetooth</b> 
                              <span class="pull-right">
                                 <input type="checkbox" class="minimal" id="bleCheckBox" {{"checked" if isBle else ""}}>
                              </span> 
                            </li>
                            
                            <li class="list-group-item">
                              <b>Check Internet</b> 
                              <span class="pull-right">
                                 <input type="checkbox" class="minimal" id="isCheckNetwork" {{"checked" if isCheckNetwork else ""}}>
                              </span> 
                            </li>
                            
                            <li class="list-group-item">
                              <b>QR Code Scanning</b> 
                              <span class="pull-right">
                                 <input type="checkbox" class="minimal" id="isQRScan" {{"checked" if isQRScan else ""}}>
                              </span> 
                            </li>
                            
                            <li class="list-group-item">
                              <b>Enable External Microphone</b> 
                              <span class="pull-right">
                                 <input type="checkbox" class="minimal" id="isMic" {{"checked" if isMic else ""}}>
                              </span> 
                            </li>
                            
                            <li class="list-group-item">
                              Headphone Volume 
                              <br>
                               <input type="text" id="headphoneSlider" value="" class="slider form-control" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="90" data-slider-orientation="horizontal" data-slider-selection="before" data-slider-tooltip="show" data-slider-id="blue">

                            </li>
                            
                            <li class="list-group-item">
                              Speaker Volume 
                              <br>
                               <input type="text" id="speakerSlider" value="" class="slider form-control" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="90" data-slider-orientation="horizontal" data-slider-selection="before" data-slider-tooltip="show" data-slider-id="blue">

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

<script>
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });    
</script>    
    
<script>
  $(function () {
    /* BOOTSTRAP SLIDER */
    $('.slider').slider();
  });
</script>
<script type="text/javascript">
function enableBluetooth(isEnable) {
    var jUrl='/enableBluetooth?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            if(typeof(json.r)=='undefined' || json.r==null || json.r!=0)
            {
                if(isEnable)
                    alert('Failed to enable Bluetooth');
                else
                    alert('Failed to disable Bluetooth');
                return;
            }
            if(isEnable) {
                $('#blueStatus').html("Enabled")
            }
            else {
                $('#blueStatus').html("Disabled")
            }
        }
    });
}
    
function setSpeaker(volume) {
    var jUrl='/setSpeaker?json=1&volume='+volume;
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            if(typeof(json.r)=='undefined' || json.r==null || json.r!=0)
            {
                alert('Failed to set speaker volume');
                return;
            }
        }
    });
}    
    
function setHeadphone(volume) {
    var jUrl='/setHeadphone?json=1&volume='+volume;
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            if(typeof(json.r)=='undefined' || json.r==null || json.r!=0)
            {
                alert('Failed to set headphone volume');
                return;
            }
        }
    });
}        
    
function enableAutoApp(isEnable) {
    var jUrl='/autoDownloadPackage?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
        }
    });
}    
    
function enableAutoFW(isEnable) {
    var jUrl='/autoDownloadFW?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
        }
    });
}     
    
function enableCheckNetwork(isEnable) {
    var jUrl='/checkNetwork?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            console.log(response);
        }
    });
}         
    
function enableScanQR(isEnable) {
    var jUrl='/enableScanQR?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            console.log(response);
        }
    });
}    
    
function enableMic(isEnable) {
    var jUrl='/enableMicrophone?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
        cache: false,
        success: function (response) {
            console.log(response);
        }
    });
}      
    
$(document).ready(function() {
	$('#bleCheckBox').on('ifChanged',function(event){
        enableBluetooth($('#bleCheckBox').prop("checked"));
    });
    //volume
    $('#speakerSlider').slider('setValue', {{speakerVol}});
    $('#headphoneSlider').slider('setValue', {{headphoneVol}});
    $('#speakerSlider').slider().on('slideStop', function(event){
        setSpeaker(event.value);
    });
    $('#headphoneSlider').slider().on('slideStop', function(event){
        setHeadphone(event.value);
    });
    $('#autoApp').on('ifChanged',function(event){
        enableAutoApp($('#autoApp').prop("checked"));
    });
    $('#autoFW').on('ifChanged',function(event){
        enableAutoFW($('#autoFW').prop("checked"));
    });
    $('#isCheckNetwork').on('ifChanged',function(event){
        enableCheckNetwork($('#isCheckNetwork').prop("checked"));
    });
    $('#isQRScan').on('ifChanged',function(event){
        enableScanQR($('#isQRScan').prop("checked"));
    });
    
    $('#isMic').on('ifChanged',function(event){
        enableMic($('#isMic').prop("checked"));
    });
});
</script>
</body>
</html>