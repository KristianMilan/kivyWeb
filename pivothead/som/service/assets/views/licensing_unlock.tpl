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
        <h1>Licensing Info</h1>
      </section>
      <section class="content">  
        <div class="row">
          <div class="col-md-6">
          <form action="/saveLicense" method="post" enctype="multipart/form-data">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="profile-username">Unlock Device</h3>
              </div>
              <div class="box-body box-profile">
              <p>To unlock device, please contact <a href="mailto:support@pivothead.com">Pivothead</a>. You will asked for the below MAC address.</p>     
              <div>
                  <b>MAC Address: </b> {{mac}} &nbsp;&nbsp;&nbsp;
                  <a class="clipboard btn btn-xs btn-primary" data-clipboard-text="{{mac}}"> Copy</a>
              </div>
                <div class="form-group">
                  <label>Upload License File</label>
                  <input type="file" name="licenseUpload" id="fileToUpload">
                </div>
              </div>    
              <div class="box-footer">
                  <a href="javascript:history.back()" class="btn btn-default">Cancel</a>
                  <input type="submit" value="Upload" name="submit" class="btn btn-primary pull-right">
              </div>
            </div>
          </form>          
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
  <script src="/web/js/ZeroClipboard.js"></script>
  <script type="text/javascript">
  var client = new ZeroClipboard($(".clipboard"));
  </script>
</body>
</html>