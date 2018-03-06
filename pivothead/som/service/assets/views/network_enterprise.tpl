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
    % include('menus.tpl', network=True, enterprise=True)     
        <div class="content-wrapper">
            <section class="content-header">
                <h1>Enterprise Network Settings</h1>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="box box-primary m_h">
                            <div class="box-header with-border">
                                <h4 class="profile-username">Enterprise Network Setup</h4>
                            </div>
                            <form id="form1" name="form1" method="post" action="/connectWPAEnterprise" enctype="multipart/form-data">
                                <div class="box-body box-profile">
                                    <p>Your device will use these credentials to connect to enterprise networks.</p> 
                                    <div class="form-group">
                                        <label for="networkssid">Network</label>
                                        <input type="text" class="form-control" name="ssid" id="networkname" value="{{networkname if networkname else ""}}" {{"readonly" if networkname else ""}}/>
                                        <span class="lock"></span>
                                    </div>
                                    <div id="userArea">
                                        <div class="form-group">
                                            <label>User</label>
                                            <input type="text" class="form-control" name="user" id="showUserInput"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" class="form-control" name="password" id="showPasswordInput"/>
                                    </div>
                                    <div class="form-group">
                                        <label>EAP Method</label>
                                        <select class="form-control" name="eapType">
                                            <option value="2">PEAP</option>
                                            <option value="1">EAP-TLS</option>
                                            <option value="3">EAP-TTLS</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Phase2 Authentication</label>
                                        <select name="auth">
                                            <option value="none">None</option>
                                            <option value="PAP">PAP</option>
                                            <option value="MSCHAPV2">MSCHAPV2</option>
                                            <option value="GTC">GTC</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Private Key Password</label>
                                        <input class="form-control" type="password" value="" name="keyPwd" id="pkPasswordInput">
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <a href="javascript:formSubmit();" id="connectBtn" class="btn btn-primary pull-right">Connect</a>
                                </div>                         
                            </form>
                        </div>
                    </div> 
                    <div class="col-md-6">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h4 class="profile-username">CA Certificate (optional)</h4>
                            </div>
                            <div class="box-body box-profile">
                                % if hasCA:
                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>CA Certificate</b> 
                                        <div class="pull-right">
                                            <a>{{caFileName}}</a>                                
                                            <a href="/removeWiFiCertification?type=ca" class="btn btn-danger">Remove</a>                                  
                                        </div>
                                    </li>  
                                </ul>
                                %else:
                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>File input</b> <br>
                                        <form action="/uploadWiFiCertification" method="post" enctype="multipart/form-data">
                                            <input type="file" name="caUpload" id="caUpload">              
                                            <br>
                                            <input type="submit" value="Upload" class="btn btn-primary">
                                        </form>
                                    </li>                              
                                </ul>
                                %end
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h4 class="profile-username">Client Certificate (optional)</h4>
                            </div>
                            <div class="box-body box-profile">
                                %if hasCert:
                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>Client Certificate</b> 
                                        <div class="pull-right">
                                            <a>{{certFileName}}</a>                                
                                            <a href="/removeWiFiCertification?type=certifcation" class="btn btn-danger"> Remove</a>
                                        </div>
                                    </li>  
                                </ul>
                                %else:
                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>File input</b>
                                        <br>
                                        <form action="/uploadWiFiCertification" method="post" enctype="multipart/form-data">
                                            <input type="file" name="certificateUpload" id="certificateUpload">                                
                                            <br>
                                            <input type="submit" value="Upload" class="btn btn-primary">
                                        </form>
                                    </li>                              
                                </ul>
                                %end
                            </div>
                        </div>
                        <div class="box box-primary">
                            <div class="box-header">
                                <h4 class="profile-username">Private Key (optional)</h4>
                            </div>
                            <div class="box-body box-profile">
                                %if hasKey:
                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>Private Key</b> 
                                        <div class="pull-right">
                                            <a>{{keyFileName}}</a>                                
                                            <a href="/removeWiFiCertification?type=privatekey" class="btn btn-danger"> Remove</a>
                                        </div>
                                    </li>  
                                </ul>
                                %else:
                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>File input</b>
                                        <br> 
                                        <form action="/uploadWiFiCertification" method="post" enctype="multipart/form-data">
                                            <input type="file" name="privatekeyUpload" id="privatekeyUpload" >
                                            <br>
                                            <input type="submit" value="Upload" class="btn btn-primary">
                                        </form>
                                    </li>
                                </ul>
                                %end
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
    <script type="text/javascript">
    $(document).ready(function(){
        $('#showPasswordCheckbox').change( function(e){
            if($(this).is(":checked")){
                $('#showPasswordInput').prop('type', 'text');

            }else{
                $('#showPasswordInput').prop('type', 'password')
            }

        });
    });

    function formSubmit()
    {
        if(!$.trim($('#showPasswordInput').val()).length ) {
    		alert("Password is necessary");
    		return;
    	}
        $('#form1').append("<input type='hidden' name='encrypt' value='{{encrypt}}' />");
    	$('#form1').submit();
    }

    </script>
</body>
</html>