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
    
  <style>
      .m_h{
          min-height: 400px;
      }    
  </style>
  
 </head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

% include('sider_header.tpl')  
    
% include('menus.tpl', applications=True, appOverview=True)  
    
  <div class="content-wrapper">
   
    <section class="content-header">
      <h1>
        Applications 
      </h1>
    </section>

    <section class="content">
        <div class="row">
            %for app in apps:
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            %if app['Package']=='pivotsip' or app['Package']=='pivothead-pivotsip':
                                PivotSIP Telepresence
                            %elif app['Package']=='pivothead-qrcode':
                                PivotSCAN QR
                            %else:
                            {{app['Package']}}
                            %end
                        </h3>
                        
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Version</b> 
                              <div class="pull-right">
                                <a>{{app['Version']}}</a>
                                %if app['Status']=='upgradable' and app['Downloaded']:
                                &nbsp; &nbsp; &nbsp;
                                <a href="upgradeCacheApplication?package={{app['Package']}}" class="btn btn-xs btn-warning">Update</a>                                  
                                %end
                              </div>

                            </li>  
          
                        </ul>
                        
                        <div>
                            %if app['Status']=='installed' or app['Status']=='upgradable':
                                %if 'not-remove' in app:
                                <a class="btn btn-md btn-default" disable>Remove</a>  
                                %else:
                                <a href="/removeApplication?package={{app['Package']}}" class="btn btn-md btn-primary">Remove</a>  
                                %end
                                                 
                            %elif app['Downloaded']:
                            <a href="installCacheApplication?package={{app['Package']}}" class="btn btn-primary">Install</a>
                            %end
                            %if app['Package']=='pivotsip' or app['Package']=='pivothead-pivotsip':
                            <a href="/PivotSIP?app={{app['Package']}}" class="btn btn-primary pull-right">Manage Now</a>
                            %end
                        </div>

                    </div>
                </div>
                
            </div>   
            %end
            
        </div>
        
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Install Application
                        </h3>
                        
                        <hr>
                        
                        <p>
                            Limited to Pivothead Applications
                        </p>
                    
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <b>File input</b>             
                            </li>                
                            
                            <li class="list-group-item">                        
                                <form action="/uploadApplication" method="post" enctype="multipart/form-data">
                                    <input type="file" name="opkgUpload" id="fileToUpload">                                                            
                                        <br>   
                                    <input type="submit" value="Upload" name="submit" class="btn btn-primary">
                                </form>
                            </li>        
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

</body>
</html>