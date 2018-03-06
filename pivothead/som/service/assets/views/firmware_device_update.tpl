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
      }
      
    .clock_digit_seprater_div_parent {
      color: #666666;
      margin-right: 2%;
      display:inline-table;
       font-size: 80px;
    }
  </style>
  
 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

% include('sider_header.tpl')  
    
% include('menus.tpl', livemodpro=True, firmware=True)  

  <div class="content-wrapper">
    <section class="content-header">
      <h1>Device Firmware</h1>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-md-4">
          <div class="box box-primary m_h">
            <div class="box-body box-profile">
              <h3 class="profile-username">Firmware Version</h3>
              <ul class="list-group list-group-unbordered">
                <li class="list-group-item clearfix">
                  <b>Firmware</b> 
                  <div class="pull-right">
                    <a>{{fwVersion}}</a>
                    %if isUpgradable:
                    <a href="/startUpgrade" class="btn-xs btn-warning">Update</a> 
                    %else:
                    <span class="btn-xs btn-success">Latest</span>                          
                    %end
                    </div>
                  </li>   
                    <li class="list-group-item text-center clearfix">
                        <p>
                            New Applications has been downloaded.
                            <br>
                            Please update your device.
                        </p>
                    </li> 
                </ul>  
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="profile-username">Update Device</h3> 
            </div>
            <div class="box-body box-profile">
              <br>                      
              <div id="uploadArea">
                <ul class="list-group list-group-unbordered  text-center">
                  <li class="list-group-item">Updating Applications to device</li>   
                </ul>
                <div class="progress lg">
                  <div class="progress-bar progress-bar-aqua" style="width: 0%" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" id="progressbar">
                    <div id="progressText">0 / {{total}}</div>
                  </div>
                </div>                        
              </div>    
            </div>
            <div id="console"></div>
            <div class="box-body box-profile">
              <div class="callout callout-danger">
                <h4>Do not interrupt updating process</h4>
                <p>Ensure your eyewear are connected to reliable power before continuing. Interrupting firmware updating may result in the loss of the device.</p>
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
<script type="text/javascript" src="/web/js/jquery-ui.js"></script>
<script type="text/javascript" src="/web/js/plupload.full.min.js"></script>    
<script type="text/javascript">
var tryTimes=0;
function updateApps() {
    var total = {{total}};
    $.ajax({
        url: '/getUpgradeAppsProgress?json=1',
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            console.log(response);
            if(json.total==0) {
                $('#progressbar').css('width', 100+'%').attr('aria-valuenow', 100);
                $("#progressText").html(json.count+" / "+total);
                alert('All apps are upgraded.')
                window.location = "/upgrade"
                return;
            }
            else if(total==json.count) {
                $('#progressbar').css('width', 100+'%').attr('aria-valuenow', 100);
                $("#progressText").html(json.count+" / "+total); 
                alert('All apps are upgraded.')
                window.location = "/upgrade"
                return;
            }
            else {
                var progress=((json.count/total)*100) | 0;
                console.log('total='+total);
                console.log(progress+'%');
                $('#progressbar').css('width', progress+'%').attr('aria-valuenow', progress);
                $("#progressText").html(json.count+" / "+total)
                setTimeout( updateApps, 2000 );
            }
        },
        error: function(){
            if(tryTimes<3) {
                tryTimes++;
                setTimeout( updateApps, 2000 );
                return;
            }
            alert("Upgrading is failed and go to device page.")
            window.location = "/upgrade"
        }
    });
} 
 
    
$(document).ready(function(e) {
    updateApps();
    
});
</script>

</body>
</html>