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
      .glyphicon-ok {
          color: blue
      }
      .glyphicon-remove {
          color: red
      }
      .fa-refresh {
          color: blue;
      }
  </style>
  
 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

% include('sider_header.tpl')  
<aside class="main-sidebar">

<section class="sidebar">

  <ul class="sidebar-menu">
    <li class="header">LIVE MOD PRO</li>     
    </ul>
      
</section>

</aside>      
      
<div class="content-wrapper">
    <section class="content-header">
        %if isOutbound:
        <h1>Outbound PAM Test</h1>
        %else:
        <h1>Inbount PAM Test</h1>
        %end
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                Status: <span id="staus"></span> 
                <br>Test: /api/pam/v2/in-d-con-video-r-audio
                <br>Total: {{len(apis)}}
                </div>    
                <div id="testResult"></div>
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
<script id="test-template" type="text/x-custom-template">
    <div class="box box-primary">
        <ul class="list-group list-group-unbordered">
            <li class="list-group-item">
                <span id="icon"></span>
                API: <span id="name"></span>
            </li>
            <li class="list-group-item">
                Note: <span id="note"></span>
            </li>
        </ul>
    </div>
</script>    
<script type="text/javascript">
var template = $('#test-template').html();
apis= 
[
    % for api in apis:
    {"uri":"{{api['uri']}}", "value":"{{api['value']}}"},
    % end
];
function test(apis, i) {
    console.debug("run index "+ i);
    if(i>=apis.length) {
        $("#staus").html("Finished");
        alert("Finished");
        return;
    }
    $.ajax({
        url: '/runPAM?value='+apis[i]["value"],
        type: 'GET',
        cache: false,
        success: function (response) {
            var json = jQuery.parseJSON(response);
            console.log(response);
            var item = $(template).clone();
            item.find("#name").html(apis[i]["uri"]);
            item.find("#note").html(response);
            if(json.r == 0) {
                item.find("#icon").addClass("glyphicon glyphicon-ok");
            }
            else {
                item.find("#icon").addClass("glyphicon glyphicon-remove");
            }
            $("#testResult").append(item);
            if(apis.length>0) {
                setTimeout(function() {test(apis, i+1);}, 3000 );                
            }
            else {
                $("#staus").html("Finished");

            }
        },
        error: function(){
            $("#staus").html("Error, Stop");
            alert("Error");
        }
    });
} 

function formSubmit()
{
	$('#form1').submit();
}
  
$(document).ready(function(e) {
    $("#staus").html("Ongoing <span style=\"padding-left: 5px;\"><i class=\"fa fa-refresh fa-spin\"></i></span>");
    test(apis, 0);
});
</script>
</body>
</html>