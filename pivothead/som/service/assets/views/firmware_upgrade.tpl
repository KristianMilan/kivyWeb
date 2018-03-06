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
                    <li class="list-group-item clearfix" id="downloadStatus">
                        <b>Status:</b>
                        <div class="pull-right">
                        <span class="btn-xs">Downloading</span>
                        </div>
                    </li>
                    <li class="list-group-item clearfix" id="downloadProgress">
                        <b>Progress:</b>
                        <div class="pull-right">
                        <span class="btn-xs" id="dprogress">{{status['progress']}}%</span>
                        </div>
                    </li>
                %if isUpgradable:
                    <li class="list-group-item text-center clearfix">
                        <p>
                            New firmware has been downloaded.
                            <br>
                            Please update to the latest firmware.
                        </p>

                        <a href="/startUpgrade" class="btn btn-primary">
                            Update Now
                        </a>
                    </li>  
                %elif isAvailableApps:
                    <li class="list-group-item text-center">
                        <p>
                            New Applications has been downloaded.
                            <br>
                            Please update your device.
                        </p>

                        <a href="/upgradeCacheBaseApps" class="btn btn-primary">
                            Update Now
                        </a>
                    </li> 
                %end
                </ul>  
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="profile-username">Update Firmware</h3> 
            </div>
            <div class="box-body box-profile">
              <br>                      
              <form method="post" enctype="multipart/form-data">
                <input type="file" name="fileToUpload" id="browse">
                <br>                       
                <p id="filelist">Example file: <strong>promod-20161201-001.zip</strong></p>
                <br><br>     
                <input value="Start Update" name="submit" class="btn btn-primary" id="sendBtn">
              </form>
              <div id="uploadArea">
                <ul class="list-group list-group-unbordered  text-center">
                  <li class="list-group-item">Uploading firmware to device</li>   
                </ul>
                <div class="progress lg">
                  <div class="progress-bar progress-bar-aqua" style="width: 0%" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" id="progressbar">
                    <div id="progressText">0%</div>
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

var uploader = new plupload.Uploader({
  runtimes : 'html5,flash,silverlight,html4',
  browse_button: 'browse', // this can be an id of a DOM element or the DOM element itself
  url: '/upload',
  dragdrop: true,
  chunk_size: '2048kb',
  multi_selection: false,
  flash_swf_url : '/web/js/Moxie.swf',
  silverlight_xap_url : '/web/js/Moxie.xap'
});
 
uploader.init();

uploader.bind('BeforeUpload', function(up, file) {
	$('#inputArea').hide();
	$('#uploadArea').show();
});
 
uploader.bind('FilesAdded', function(up, files) {
    if (uploader.files.length == 2) {
        uploader.removeFile(uploader.files[0]);
    }
    var html = '';
    plupload.each(files, function(file) {
      html += 'Upload Firmware file:&nbsp;' + file.name + ' (' + plupload.formatSize(file.size) + ')';
    });
    document.getElementById('filelist').innerHTML = html;
    up.refresh();
});
 
uploader.bind('UploadProgress', function(up, file) {
	var percent=file.percent;
	//$('#progressbar').text(percent+'%');
    $('#progressbar').css('width', percent+'%').attr('aria-valuenow', percent);
    $('#progressText').html(percent+'%');
});
 

uploader.bind('Error', function(up, err) {
	
  document.getElementById('console').innerHTML += "\nError #" + err.code + ": " + err.message;
});

uploader.bind('UploadComplete', function() {
  window.location='/startUpgrade';
});

$('#sendBtn').click( function(){
    
    if (uploader.files.length === 0) {
        alert("No files selected.");
        return;
    }
    uploader.start();
});    
isDownloading = false;    
function updateFW() {
    $.ajax({
        url: '/GetUpdateProgress?json=1',
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            console.log(response);
            if(json.status==4) {
                $("#dprogress").html("100%");
                if(isDownloading) {
                    alert('Firmware is alread downloaded.');
                    window.location = "/upgrade";
                }
            }
            else if(json.status==1){
                isDownloading = true;
                $("#downloadStatus").show();
                $("#downloadProgress").show();
                var progress=json.progress;
                console.log(progress+'%');
                $("#dprogress").html(progress+'%');
                setTimeout( updateFW, 2000 );
            }
            else if(json.status==0){
                setTimeout( updateFW, 2000 );
            }
            else {
                alert("Downloading is failed and go to device page.");
            }
        },
        error: function(){
            
            alert("Downloading is failed and go to device page.");
            window.location = "/upgrade";
        }
    });
}    
    
$(document).ready(function(e) {
    $("#downloadStatus").hide();
    $('#downloadProgress').hide();
    $("#uploadArea").hide();
    updateFW();
});
</script>

</body>
</html>