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
      <h1>Licensing Info</h1>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-primary m_h">
            <div class="box-header with-border">
              <h4 class="profile-username">Current Streaming Server</h4>
            </div>  
            <div class="box-body box-profile">
              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Application</b> 
                  <div class="pull-right">
                    <a>{{mediaServer}}</a>  
                  </div>
                </li>  
                <li class="list-group-item">
                  <b>API Server</b> 
                  <div class="pull-right">
                    <a>{{apiAddr}}</a>  
                  </div>
                </li>
              </ul>
            </div>
            <div class="box-footer">
              <a href="/restorePushStream" class="btn btn-md btn-default">Restore Defaults</a>
              <a href="/setupServers" class="btn btn-md btn-primary pull-right">Change</a> 
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="box box-primary m_h">
            <div class="box-header with-border">
              <h4 class="profile-username">Current SIP Server</h4>
            </div>
            <div class="box-body box-profile">
              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>SIP Proxy</b> 
                  <div class="pull-right">
                    <a>{{sipServer}}</a>   
                  </div>
                </li>
              </ul>
            </div>
            <div class="box-footer">
              <a href="/restoreSIPServer" class="btn btn-md btn-default">Restore Defaults</a> 
              <a href="/setSIPPage" class="btn btn-md btn-primary pull-right">Change</a>
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

</body>
</html>