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
% include('menus.tpl', applications=True, pivotsip=True)    
  <div class="content-wrapper">
    <section class="content-header">
      <h1>New Contacts</h1>
    </section>
    <section class="content">
        <div class="box">  

        <form method="POST" action="{{action}}?id={{id}}" accept-charset="UTF-8" id="form1">
        <div class="box-body">            

        <div class="box-body">
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <label for="username">Sip Username</label>
                </div>
                
                <div class="col-sm-4">
                    <input class="form-control" placeholder="Input sip username" name="username" type="text" value="{{user if defined('user') and user else ''}}" id="username">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <label for="f_name">First name</label>
                </div>

                <div class="col-sm-4">
                    <input class="form-control" placeholder="Input sip First name" name="f_name" type="text" value="{{fname if defined('fname') and fname else ''}}" id="f_name">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <label for="l_name">Last name</label>
                </div>

                <div class="col-sm-4">
                    <input class="form-control" placeholder="Input sip Last name" name="l_name" type="text" value="{{lname if defined('lname') and lname else ''}}" id="l_name">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <label for="sip_server">SIP Server</label>
                </div>
                
                <div class="col-sm-4">
                    <input class="form-control" placeholder="Input sip server" name="sip_server" type="text" value="{{sip if defined('sip') and sip else 'sip.pivothead.tv'}}" id="sip_server">
                </div>
            </div>
        </div>   

        </div>
        
        <div class="box-footer">
            <div>              
                <a href="/contacts" class="btn btn-default">Back</a>
                
                <button class="btn btn-success" id="btn-create">{{'Update' if '/contacts/edit' in action else 'Create'}}</button>   
            </div>
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


<div class="modal fade" id="warm-no-user" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6" style="margin-top:35px;">
                        <img src="http://iot.pivothead.tv/images/PH_logo.PNG" class="img-responsive" style="width: 250px;" alt="Pivothead Logo">
                    </div>
                </div>
            </div>

            <div class="modal-body">
                    <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-ban"></i> Error</h4>
                                <li>Username is required</li>
                        </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="/web/js/jquery.min.js"></script>
<script src="/web/js/bootstrap.min.js"></script>
<script src="/web/js/app.min.js"></script>
<script src="/web/plugins/icheck/icheck.min.js"></script>
<script src="/web/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>
$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
  checkboxClass: 'icheckbox_minimal-blue',
  radioClass: 'iradio_minimal-blue'
});    


$(document).ready(function(){
    $('#btn-create').on('click', function (e) {
        e.preventDefault();
        if(!$('#username').val()) {
            $('#warm-no-user').modal('toggle');
            return;
        }
        $('#form1').submit();
    });


});    
</script>
</body>
</html>