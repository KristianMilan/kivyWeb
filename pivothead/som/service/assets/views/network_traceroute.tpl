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
    
 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
% include('sider_header.tpl')  
% include('menus.tpl', network=True, nettool=True, traceroute=True)  
  <div class="content-wrapper">
    <section class="content-header">
      <h1>Trace route to host</h1>
    </section>
    <section class="content">
      <form id="form1" name="form1" method="post" action="/network/traceroute/save">
        <div class="row">
          <div class="col-md-6">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="profile-username">Traceroute</h3>
                </div>
                <div class="form-group">
                <div class="box-body box-profile">
                    <label>Target:</label>
                    <input type="text" class="form-control" name="target" id="target" value="{{target if target else ''}}">
                  </div>
                <div class="box-body box-profile">
                    <label>Argument: (Optional)</label>
                    <br>Usage: traceroute [-FIldnrv] [-f 1ST_TTL] [-m MAXTTL] [-p PORT] [-q PROBES]
        [-s SRC_IP] [-t TOS] [-w WAIT_SEC] [-g GATEWAY] [-i IFACE]
        [-z PAUSE_MSEC]
                    <input type="text" class="form-control" name="argument" id="argument" value="{{arg if arg else ''}}">
                  </div>
                <div class="box-body box-profile">
                    <label>Bytes: (Optional)</label>
                    <input type="text" class="form-control" name="bytes" id="bytes" value="{{arg_bytes if arg_bytes else ''}}">
                  </div>    
                </div>               
                <div class="box-footer">
                    %if isInternet:
                    <a href="javascript:run();" class="btn btn-primary pull-right" id="connectBtn">Run</a>
                    %else:
                    <a href="javascript:formComplete();" class="btn btn-primary pull-right" id="connectBtn">Activate</a>
                    %end
                </div>
              </div>
            </div>

          </div>    
          <div class="row" id="oarea">
              <div class="col-md-6">
                <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="profile-username">Output</h3>
                </div>
                <div class="form-group">
                <div class="box-body box-profile" id="darea">
                        <b>Traceroute Records</b> 
                        <span class="pull-right">
                            <a id="downloadBtn" href="/network/traceroute/download" class="btn btn-xs btn-primary">Download</a>
                            &nbsp;<a id="clearBtn" href="/network/traceroute/remove" class="pull-right btn btn-xs btn-primary">Clean</a>
                        </span>                                
                </div>
                    <div class="box-body box-profile">
                        <textarea class="form-control" rows="10" id="output" readonly></textarea>
                    </div>
 
                </div>               
              </div>
            </div>
          </div>
      </form>
    </section>
  </div>
  <footer class="main-footer">    
    <strong>Copyright &copy; 2016 <a href="#">Pivothead Wearable Imaging</a>.</strong> All rights reserved.
  </footer>
</div>
<script src="/web/js/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="/web/js/app.min.js"></script>
<script type="text/javascript">
function run() {
    $("#oarea").hide();
    $.ajax({
        url: '/network/traceroute/run',
        type: 'POST',
        cache: false,
        data: {"target": $("#target").val(), "argument": $("#argument").val(), "bytes": $("#bytes").val()},
        success: function (response) {
            var json = jQuery.parseJSON(response);
            console.log(response);
            if(json.length>0) {
                output = json.join("\n\r");
                $("#output").html(output);
            }
            setTimeout( showOutput, 2000 );
        },
        error: function(){
            console.log("failed to get output");
        }
    });
}      
    
function showOutput() {
    $.ajax({
        url: '/network/traceroute/output',
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            console.log(response);
            if(json['output'].length>0) {
                $("#oarea").show();
                output = json['output'].join("\n\r");
                $("#output").html(output);
                if(json['isRun']) {
                    $("#darea").hide();
                }
                else {
                    $("#darea").show();
                }
            }
            setTimeout( showOutput, 2000 );
        },
        error: function(){
            console.log("failed to get output");
        }
    });
}    

function formComplete() {
	if(!$('#target').val()) {
		alert("You need put target");
		return;
	}
	$('#form1').submit();
}

$(document).ready(function(e) {
    showOutput();
%if isLog:
%if isEnable:
    $("#darea").hide();
%end    
%else:
    $("#oarea").hide();
    $("#darea").hide();
%end

});

</script>
</body>
</html>