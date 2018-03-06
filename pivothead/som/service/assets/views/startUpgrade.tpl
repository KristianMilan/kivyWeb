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
  
  <style>
      .m_h {
          min-height: 400px;
      }    
      
      .clock_digit_div_parent {
        color: #0033CC;
        background-color: #efefef;
        margin-right: 2%;
        font-weight: 500;
        border-radius: 3px;
        font-size: 80px;
        padding-left: 30px;
        padding-right: 30px;
      }
      
    .clock_digit_seprater_div_parent {
      color: #666666;
      margin-right: 2%;
      display:inline-table;
      font-size: 80px;
    }
    .list-group-item { word-wrap: break-word; }
    .div-nowrap {
        display: inline-block; 
        white-space: nowrap;
    }
  </style>
  
 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

% include('sider_header.tpl')  
    
% include('menus.tpl')  

  <div class="content-wrapper">
   
    <section class="content-header">
      <h1>
        Device Firmware       
      </h1>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-md-4">
               
                <div class="box box-primary m_h">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Firmware Version
                        </h3>
                       
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item clearfix">
                              <b>Firmware</b> 
                              <div class="pull-right" >
                                <a >{{fwVersion}}</a>
                                &nbsp;  &nbsp; &nbsp;
                                <a class="btn btn-xs btn-warning">Update</a>                                  
                              </div>
                            </li>  
                            
                            <li class="list-group-item text-center clearfix">
                                <p>
                                    Please update to the latest firmware.
                                </p>
                            </li>  
                        </ul>

                    </div>
                </div>
                
            </div>
            
            <div class="col-md-8">
               
                <div class="box box-primary m_h">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Update Firmware
                        </h3>
                        <section id="beforeUpgrading" class="text-center">
                            <ul class="list-group list-group-unbordered  text-center">
                                <li class="list-group-item">
                                    Please stand by and wait for your Glasses to speak “Pivothead Ready To Go”, indicating your firmware install is completed.  
                                    <br>
                                    After this notification, hold the button down on the Live Mod Pro to enter AP mode, and then reconnect to the device’s WiFi.
                                </li>      
                            </ul>
                        </section>
                        <section id="afterUpgrading">
                            <ul class="list-group list-group-unbordered  text-center">
                                <li class="list-group-item">
                                    Firmware upgraded. You may have to reconnect to your device.
                                </li>   

                            </ul>
                        </section>
                        
                 </div>
                               
                    <div class="box-body box-profile" id="warning">
                        <div class="callout callout-danger">
                            <h4>Do not interrupt updating process</h4>

                            <p>Ensure your eyewear are connected to reliable power before continuing. 
                                Interrupting firmware updating may result in the loss of the device.</p>
                        </div>                        
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

<script src="web/js/jquery.min.js"></script>
<script src="web/js/bootstrap.min.js"></script>
<script src="web/js/app.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    var seconds = 60;
    var minutes = 3;
    var var_clock;

    $('#afterUpgrading').hide();
    $('#beforeUpgrading').show();

    function update_message_board(){
        clearInterval(var_clock);
        $('#afterUpgrading').show();
        $('#beforeUpgrading').hide();   
        $('#warning').hide();
    }

    function new_counter_clock() {
        seconds = seconds - 1; 

        if( seconds < 0 ){ seconds = 59; minutes = minutes - 1;}
        if( minutes < 0 ) update_message_board();

    }

    var_clock = setInterval(new_counter_clock, 1000);        
});
</script>

</body>
</html>