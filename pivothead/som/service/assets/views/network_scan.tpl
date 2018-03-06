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
      
      .wifitable-center{
        min-width: 70%;
        margin: 0 auto;
     }
     
    .wifiList{
        max-height: 340px;
        overflow: auto;
        padding-left:11px;
        margin-top:10px;
        /*width:380px;*/
    }

    .wifiList tr{
        background-color: #f4f4f4;
            font-size: 14px;
            border: 1px solid white;
            line-height: 30px;
    }

    .wifiList td{
            vertical-align: middle;
    }

    .wifiList tr.selected{
        background-color: #dcdcdc;
    }

    .wifiList tr encryImage{
        display: inline-block;
        width:8px;
        height: 10px;
        position: absolute;
        right:30px;
    }

    .wifiImage.selected{
    }

    .wifiImage{
        content:'';
        float:left;
        display: inline-block;
        width:14px;
        height:10px;
    }
  </style>
  
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    
% include('sider_header.tpl')  
    
% include('menus.tpl', network=True, connect=True)  
    
  <div class="content-wrapper">
   
    <section class="content-header">
      <h1>
        Connect to an Existing Wi-Fi Network    
      </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary m_h">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">Pre-scanned Networks</h3>
                        <hr>
                        <p>Each time the device boots it scans for networks. This list maybe out of date.</p>
                        <div class="wifiList wifitable-center">
                            <table id="wifiList" width=100% height=100%></table>
                        </div>
                    </div>
                    <div class="box-footer">
                      <form id="form1" name="form1" method="post" action="/localConnectWifi">
                        <div class="form-group">
                          <a href="javascript:history.back()" class="btn btn-default">Go Back</a>
                          <input type="submit" onclick="javascript:formComplete();" class="btn btn-primary pull-right" id="connectBtn" value="Next" disabled="">
                        </div>
                      </form>
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
<script src="web/plugins/icheck/icheck.min.js"></script>
<script src="web/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script type="text/javascript" src="web/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
function pageReload(){
    location.reload();
}
function buttonManager(){
    wifi_row = $('.selected').html();
        if(wifi_row !== undefined && wifi_row.length > 1){
            document.getElementById("connectBtn").disabled = false;
            $('#connectBtn').removeClass('btn-default').addClass('btn-primary');
        }
}
var selectedRow;
function formComplete() {
	if(selectedRow=== undefined || selectedRow===null)
	{
		return;
	}
	var ssid=selectedRow.find('.ssid').text();
	var encryption=selectedRow.find('div.encry').attr("id");
    var ssidInput = $("<input>").attr("type", "hidden").attr("name", "ssid").val(ssid);
    var encryptInput = $("<input>").attr("type", "hidden").attr("name", "encrypt").val(encryption);
    $('#form1').append(ssidInput);
    $('#form1').append(encryptInput);
	if(encryption!='0')
	{
		$('#form1').attr('action', '/connectPage');
	}
	$('#form1').submit();
}
function scan() {
$.ajax({
    url: '/getWiFiCache',
    type: 'GET',
	cache: false,
    success: function (response) {
        var trHTML = '';
		var json = jQuery.parseJSON(response);
		if(typeof(json.r)=='undefined' || json.r==null || isInt(json.r))
		{
			showScanNothing();
			return;
		}
        $.each(json.r, function (i, item) {
			trHTML += '<tr><td class="ssid"><span style="margin-left: 10px;">' + item.name+'</span></td>';
			trHTML+='<td><div class="encry" id="'+item.encry+'" style="display:inline-block;">';
			if(item.encry!=0)
			{
				trHTML+='<div class="encryImage" style="display:inline-block;"><img src="/web/images/lock.jpg"/></div>';
			}
			 trHTML+='</div><div class="wifiImage" style="display:inline-block;"><img id="wifiIcon" src="/web/images/signal-high.jpg"/></div></td>';
        });
        $('#wifiList').append(trHTML);
		$('#wifiList tr').click(function() {
			if($(this).hasClass('selected')){
               $(this).removeClass('selected');
			   $(this).find('.wifiImage').removeClass('selected');
			   $(this).find('#wifiIcon').attr('src', '/web/images/signal-high.jpg');
			   enableConnectBtn(false);
			   selectedRow=null;			   
               return;
           }
           $(this).addClass("selected").siblings().removeClass("selected");
           $(this).addClass('selected');
		   $(this).addClass("selected").siblings().find('.wifiImage').removeClass("selected");
		   $(this).addClass("selected").siblings().find('#wifiIcon').attr('src', '/web/images/signal-high.jpg');
           $(this).find('.wifiImage').addClass('selected');
		   $(this).find('#wifiIcon').attr('src', '/web/images/signal-high-dark.jpg');
		   enableConnectBtn(true);		   
			selectedRow=$(this);
    	});
		showScanCompelete();
    }
});
}

function isInt(value) {
  return !isNaN(value) && 
         parseInt(Number(value)) == value && 
         !isNaN(parseInt(value, 10));
}

function showReadyScan()
{
	$('#reday-scan').show();
	$('#scan-complete').hide();
	$('#scan-nothing').hide();
	selectedRow=null;
}

function showScanCompelete()
{
	enableRescanBtn(true);
	$('#reday-scan').hide();
	$('#scan-complete').show();
	$('#scan-nothing').hide();
}

function showScanNothing()
{
	$('#reday-scan').hide();
	$('#scan-complete').hide();
	$('#scan-nothing').show();
	selectedRow=null;
}

function enableConnectBtn(enabled) {
	if(enabled)
	{
		$('#connectBtn').attr('disabled', false);
        $('#connectBtn').removeClass('btn-default').addClass('btn-primary');
	}
	else
	{
		 $('#connectBtn').attr('disabled', true);
         $('#connectBtn').removeClass('btn-primary').addClass('btn-default');
	}
}

function enableRescanBtn(enabled) {
	if(enabled)
	{
		$('#rescanBtn').attr('disabled', false);
        $('#rescanBtn').removeClass('btn-default').addClass('btn-primary');
	}
	else
	{
		 $('#rescanBtn').attr('disabled', true);
         $('#rescanBtn').removeClass('btn-primary').addClass('btn-default');
	}
}

(function($){
        $(window).on('load', function(){
            $(".wifi-list-cont").mCustomScrollbar({
//                theme:"minimal-dark"
                theme:"minimal"
            });
        });
    })(jQuery);
$(document).ready(function() {
	showReadyScan();
	scan();
	$('#rescanBtn').click(function(event) {
			$('#wifiList').empty();
			enableConnectBtn(false);
		   	enableRescanBtn(false);
			showReadyScan();
			scan();
	});
});
</script>
</body>
</html>