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
    
% include('menus.tpl', licensing=True, license=True)  
    
  <div class="content-wrapper">
   
    <section class="content-header">
      <h1>
        Licensing Info 
      </h1>
    </section>

    <section class="content">
           
        <div class="row">
            <div class="col-md-6">
                
                <div class="box box-primary m_h">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Device Status
                        </h3>
            
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>License</b> 
                              <div class="pull-right">                 
                                %if isValid:  
                                <a class="btn btn-xs btn-success">Active</a>                                  
                                %else:
                                <a class="btn btn-xs btn-danger">InActive</a>
                                %end  
                              </div>

                            </li>  
                            
                            <li class="list-group-item">
                              <b>Expires</b> 
                              <div class="pull-right">                      
                                <a>{{expireDate if expireDate else ""}}</a>                                  
                              </div>

                            </li>  

                        </ul>
                        
                        <br>
                        
                        <div>
                            <a class="btn btn-default pull-right" href="/uploadLicense">Unlock</a>
                        </div>

                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                
                <div class="box box-primary m_h">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            Streaming Servers
                        </h3>
            
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                              <b>Server</b> 
                              <div class="pull-right">                      
                                <a href="{{"" if isValid else ""}}">{{mediaServer}}</a>                                  
                              </div>

                            </li>  
                            
                            <li class="list-group-item">
                              <b>API</b> 
                              <div class="pull-right">                      
                                <a>{{apiAddr}}</a>                                  
                              </div>

                            </li>  
                            
                            <li class="list-group-item">
                              <b>Stun</b> 
                              <div class="pull-right">                      
                                <a>sip.pivothead.tv</a>                                  
                              </div>

                            </li>  
                            
                            <li class="list-group-item">
                              <b>Media</b> 
                              <div class="pull-right">                      
                                <a>-</a>                                  
                              </div>

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

<script src="web/js/jquery.min.js"></script>
<script src="web/js/bootstrap.min.js"></script>
<script src="web/js/app.min.js"></script>
<script src="web/plugins/icheck/icheck.min.js"></script>
<script src="web/plugins/bootstrap-slider/bootstrap-slider.js"></script>

</body>
</html>