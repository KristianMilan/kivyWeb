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
% include('menus.tpl', applications=True, pivotsip=True)  
  <div class="content-wrapper">
    <section class="content-header">
      <h1>PivotSIP Telepresence</h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                	<div class="box-header">
                		<h3 class="profile-username">Application Info</h3>
                	</div>
                    <div class="box-body box-profile">
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Version</b> 
                              <span class="pull-right">
                                <a>{{app['Version']}} </a>
                                %if isRunning:
                                <span class="btn-xs btn-success">Running</span> 
                                %else:
                                <span class="btn-xs btn-danger">Stopped</span>   
                                %end
                              </span>
                            </li>
                            <!-- <li class="list-group-item">
                              <b>Server</b> 
                              <span class="pull-right">
                                <a>Pivothead</a>                                
                              </span>
                            </li> -->
                        </ul>
                    </div>
                </div>
                <div class="box box-primary">
                	<div class="box-header">
                        <!-- <h3 class="profile-username">Application Settings</h3> -->
                        <h3 class="profile-username">SIP Settings</h3>
                	</div>
                    <div class="box-body box-profile">
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Enable TLS</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" id="tls" {{"checked" if isTLS else ""}}>
                              </span>
                            </li>        
                            
                            <li class="list-group-item">
                              <b>Enable SRTP</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" id="srtp" {{"checked" if isSRTP else ""}}>
                              </span>
                            </li>      
                            
                            <li class="list-group-item">
                              <b>SIP Server</b> 
                              <span class="pull-right">
                                {{sipServer}}
                              </span>
                            </li>
							<!-- <li class="list-group-item">
                              <b>Enable PivotSIP Touch Controls</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal">
                              </span> 
                            </li> -->
                           
<!--
                            <li class="list-group-item">
                              <b>Random Port</b> 
                              <span class="pull-right">                                
                                 <input type="checkbox" class="minimal">                         
                              </span>
                            </li>
-->
                            
                            <li class="list-group-item">
                              <b>Port</b> 
                              <span class="pull-right">           
                                <div id="sipPort" style="display: inline-block; white-space: nowrap">{{sipPort}}</div>
                                <input type="number" id="sipPortEditor" style="display:none">
                                <a id="sipPortBtn" class="btn btn-primary btn-xs">Change</a>  
                              </span>
                            </li>
                            
                            <li class="list-group-item">
                              <b>Audio Port</b> 
                              <span class="pull-right">                                
                                <div id="audioPort" style="display: inline-block; white-space: nowrap">{{audioPort}}</div>                        
                                <input type="number" id="audioPortEditor" style="display:none">
                                <a id="audioPortBtn" class="btn btn-primary btn-xs">Change</a>  
                              </span>
                            </li>
                            
                            <li class="list-group-item">
                              <b>Video Port</b> 
                              <span class="pull-right">                                
                                 <div id="videoPort" style="display: inline-block; white-space: nowrap">{{videoPort}}</div>      
                                <input type="number" id="videoPortEditor" style="display:none">
                                <a id="videoPortBtn" class="btn btn-primary btn-xs">Change</a>  
                              </span>
                            </li>
                                                        
                        </ul>
                              
<!--
                         
-->
                    </div>
                </div>
                <div class="box box-primary">
                    <form action="/sipNetworkPage" method="post" id="sipNetworkForm">
                	<div class="box-header">
                        <h3 class="profile-username">SIP Network</h3>
                	</div>
                    <div class="box-body box-profile">
                        <ul class="list-group list-group-unbordered">                                             

                            <li class="list-group-item">
                                <b>SIP Server</b>
                                <a href="/setSIPPage" class="btn btn-primary btn-xs">Change</a>
                            </li>
                            
                            <li class="list-group-item">
                                <b>STUN Server</b>
                                <a href="/setSTUNPage" class="btn btn-primary btn-xs">Change</a>
                            </li>
                            
                            <li class="list-group-item">
                                <b>SIP Tunnel</b>
                                <a href="/SIPTunnelPage" class="btn btn-primary btn-xs">Change</a>
                            </li>
                            
                            <li class="list-group-item">                             
                              <b>ICE</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" name="ice" {{'checked' if type==1 else ""}}>
                              </span>
                            </li>
                            
                            <li class="list-group-item">
                              <b>Allow IPV6</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" id="ipv6" name="ipv6" {{"checked" if ipv6 else ""}}>
                              </span>
                            </li>
                            
                            <li class="list-group-item">
                              <b>Set Maximum Transmission Unit</b> 
                              <span class="pull-right">
                                <input type="number" class="minimal" id="mtu" name="mtu" min="0" max="2000" style="text-align:right;" value="{{mtu}}">
                              </span>
                            </li>
                        </ul>
                         <span class="pull-right">
                    	   <button type="submit" class="btn btn-primary pull-right">Activate</button>
                        </span>
                    </div>
                    
                    </form>
                </div>
            </div>         
            <div class="col-md-6">
                <div class="box box-primary">
                	<div class="box-header">
                		<h3 class="profile-username">Account Info</h3>
                	</div>
                    <div class="box-body box-profile">
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>User</b> 
                              <span class="pull-right">
                                <a>{{user if user else ""}}</a>                   
                              </span>
                                 
                            </li>                            
                        </ul>
                    </div>
                    <div class="box-footer">
                    	<a href="/PivotSIPLoginPage?app={{app['Package']}}" class="btn btn-primary pull-right">{{"Logout" if user else "Login"}}</a>
                    </div>
                </div>
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">Call Settings</h3>
                        <hr>
                        <p>Setting a contact to speed dial will allow you contact them by quickly pressing and releasing the inside button on the Live Mod Pro. You can only set one contact to speed dial at a time.</p>
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Speed Dial</b> 
                              <span class="pull-right">
                                <a>{{speedDial if speedDial else ""}}</a>                   
                              </span>
                            </li>                            
                        </ul>
                        <form action="/setSeepDial" method="post" id="speedForm">
                          <div class="form-group">
                            <input type="text" list="contacts" name="user" class="form-control" placeholder="Set or replace speed dial" value="">  
                            <datalist id="contacts">
                                %for contact in contacts:
                                <option value="{{contact['contact']}}">
                                %end
                              </datalist>  
                          </div>                                        
                            <div>
                               <a href="javascript:clearSpeedDial();" class="btn btn-default">Clear</a>  
                              <input type="hidden" class="btn btn-xs btn-primary pull-right" value="{{app['Package']}}" name="app">  
                              <input type="hidden" class="btn btn-xs btn-primary pull-right" value="/PivotSIP" name="redirect">
                              <div class="pull-right">                           
                                <a href="/contacts" class="btn btn-primary">Contacts</a>  
                                <button type="submit" class="btn btn-primary" value="Set Speed Dial">Set Speed Dial</button>
                              </div>      
                            </div> 
                          </form>
                        </div> 
                    </div>
                              
                    <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Application Settings
                        </h3>         
                        
                        <ul class="list-group list-group-unbordered">                            
                            <li class="list-group-item">
                              <b>Presence Enabled</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" id='presence' {{'checked' if isPresence else ""}}>
                              </span>                                 
                            </li>
                            <li class="list-group-item">
                              <b>Auto Test</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" id='sipAutoTest' {{'checked' if isAutoTest else ""}}>
                              </span>                                 
                            </li>
                            <li class="list-group-item">
                              <b>SIP Bandwidth Monitor</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" id='sipBandwidth' {{'checked' if sipBandwidth else ""}}>
                              </span>                                 
                            </li>
                            <li class="list-group-item">
                              <b>Custom Log Message</b> 
                              <a id="log_message_btn" class="btn btn-primary btn-xs">Change</a>                                   
                            </li>
<!--
                            <li class="list-group-item">
                              <b>Stream to Pivothead Live</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal" id='pushPortal' {{'checked' if isPushToPortal else ""}}>
                              </span>                                 
                            </li>
-->
<!--
                            <li class="list-group-item">
                              <b>Auto Call Pick Up</b> 
                              <span class="pull-right">
                                <input type="checkbox" class="minimal">
                              </span>                                 
                            </li>
-->
         
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

function clearSpeedDial(){
    $("#user").val("");
    $("#speedForm").submit();
}    
     
    
function enableSRTP(isEnable) {
    var jUrl='/mediaEncryption?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
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
    
function enablePresence(isEnable) {
    var jUrl='/enablePresence?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
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
    
function enableTLS(isEnable) {
    var jUrl='/enableTLS?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
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
    
function enablePush(isEnable) {
    var jUrl='/pushToPortal?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
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
    
function setSIPPort(newport) {
    var jUrl='/sipPort?json=1';
    $.ajax({
        url: jUrl,
        type: 'POST',
        data: { port : newport},
        cache: false,
        timeout:3000,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            if(json.r==0) {
                $('#sipPort').text(newport);
                $('#sipPort').toggle();
                $("#sipPortEditor").css('display', 'none');
                $("#sipPortBtn").text("Change");

            }
        },
        error:function(){   
            alert("Timeout, please try again.");
            location.reload();
        }
    });
}

function setAudioPort(newport) {
    var jUrl='/sipAudioPort?json=1';
    $.ajax({
        url: jUrl,
        type: 'POST',
        data: { port : newport},
        cache: false,
        timeout:3000,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            if(json.r==0) {
                $('#audioPort').text(newport);
                $('#audioPort').toggle();
                $("#audioPortEditor").css('display', 'none');
                $("#audioPortBtn").text("Change");

            }
        },
        error:function(){   
            alert("Timeout, please try again.");
            location.reload();
        }
    });
}
    
function setVideoPort(newport) {
    var jUrl='/sipVideoPort?json=1';
    $.ajax({
        url: jUrl,
        type: 'POST',
        data: { port : newport},
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
    
function enableAutoTest(isEnable) {
    var jUrl='/sipAutoTest?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
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
    
function enableSIPBandWidth(isEnable) {
    var jUrl='/sipBandwidthMonitor?json=1&';
    if(isEnable)
        jUrl += "enable=true";
    else
        jUrl += "enable=false"
    $.ajax({
        url: jUrl,
        type: 'GET',
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
    
function changeCustomLog() {
    $("#logForm").submit();
    log_dialog.dialog( "close" );
}
    
$(document).ready(function() {	
    $('#srtp').on('ifChanged',function(event){
        enableSRTP($('#srtp').prop("checked"));
    });
    $('#presence').on('ifChanged',function(event){
        enablePresence($('#presence').prop("checked"));
    });
    $('#tls').on('ifChanged',function(event){
        enableTLS($('#tls').prop("checked"));
    });
    $('#pushPortal').on('ifChanged',function(event){
        enablePush($('#pushPortal').prop("checked"));
    });
    $('#sipPortBtn').click(function() {      
        if ($("#sipPortEditor").css('display') !== 'none') {
            port = $("#sipPortEditor").val();
            setSIPPort(port);
        }
        else {
            $('#sipPort').toggle();
            $("#sipPortEditor").css({'display':'inline-block', "white-space": "nowrap"});
            $("#sipPortBtn").text("Activate");
        }
    });
    
    $('#audioPortBtn').click(function() {      
        if ($("#audioPortEditor").css('display') !== 'none') {
            port = $("#audioPortEditor").val();
            setAudioPort(port);
        }
        else {
            $('#audioPort').toggle();
            $("#audioPortEditor").css({'display':'inline-block', "white-space": "nowrap"});
            $("#audioPortBtn").text("Activate");
        }
    });
    $('#videoPortBtn').click(function() {      
        if ($("#videoPortEditor").css('display') !== 'none') {
            port = $("#videoPortEditor").val();
            setVideoPort(port);
        }
        else {
            $('#videoPort').toggle();
            $("#videoPortEditor").css({'display':'inline-block', "white-space": "nowrap"});
            $("#videoPortBtn").text("Activate");
        }
    });
    $('#sipAutoTest').on('ifChanged',function(event){
        enableAutoTest($('#sipAutoTest').prop("checked"));
    });
    
    $('#sipBandwidth').on('ifChanged',function(event){
        enableSIPBandWidth($('#sipBandwidth').prop("checked"));
    });
    log_dialog = $("#log_dialog_form").dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      open: function(event, ui) {
        $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
      },    
      buttons: {
        "Change": changeCustomLog,
        Cancel: function() {
          log_dialog.dialog( "close" );
        }
      }
    });
    $('#log_message_btn').click(function(){
       log_dialog.dialog( "open" ); 
    });
});    
</script>

</body>
<div id="log_dialog_form" title="Custom Log Message"> 
  <form id="logForm" action="/customLogMsg?json=1" method="post">
    <fieldset>
      <textarea class="form-control" rows="5" name="log_message" maxlength=1000>{{logMessage if logMessage else ""}}</textarea>
      <input type="hidden" value="1" name="web">
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>
</html>