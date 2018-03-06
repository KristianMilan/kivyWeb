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
  </style>
  
 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

% include('sider_header.tpl')  
    
% include('menus.tpl', network=True)  
    
  <div class="content-wrapper">
   
    <section class="content-header">
      <h1>
        Connect to Wi-Fi Network    
      </h1>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-md-6">
               
                <div class="box box-primary m_h">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Connected
                        </h3>
                        
                        <hr>
                        
                        <p>
                            Network Error: {{errorCode}}
                        </p>               

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

</body>
</html>