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
% include('menus.tpl', licensing=True, license=True)  
  <div class="content-wrapper">
    <section class="content-header">
      <h1>STUN Server</h1>
    </section>
    <section class="content">
      <form id="form1" name="form1" method="post" action="/setSTUNServer">
        <div class="row">
          <div class="col-md-6">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="profile-username">Enter New STUN Server</h3>
                </div>
                <div class="box-body box-profile">
                  <div class="form-group">
                    <label>STUN Server: (Format: URL)</label>
                    <input type="text" class="form-control" name="stunServer" id="stunServer" value="{{stunServer if stunServer else ''}}">
                  </div>
                </div>
                <div class="box-body box-profile">  
                    <div class="form-group">
                        <label>STUN PORT:</label>
                        <input type="text" class="form-control" name="stunPort" value="{{stunPort if stunPort else ''}}">
                    </div>    
                </div>
                <div class="box-footer">
                    <a href="javascript:history.back()" class="btn btn-default">Cancel</a>
                    <a href="javascript:formComplete();" class="btn btn-primary pull-right" id="connectBtn">Activate</a>
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

function formComplete() {
	if(!$('#stunServer').val()) {
		alert("You need put STUN server");
		return;
	}
	$('#form1').submit();
}

$(document).ready(function(e) {

});

</script>
</body>
</html>