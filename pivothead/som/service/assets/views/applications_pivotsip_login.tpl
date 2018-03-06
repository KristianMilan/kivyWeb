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
      <h1>PivotSIP</h1>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="profile-username">Set PivotSIP Account Information</h3>
            </div>
            <form id="form1" action="/PivotSIPLogin" method="post" enctype="multipart/form-data">
              <div class="box-body">
<!--
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="isSAML" id="samlCheck">
                        Pivothead SAML Login
                    </label>
                </div>
-->
                <div class="form-group">
                    <label for="user">Username</label>
                    <input type="text" class="form-control" name="user" id="userInput"/>
                </div>
                <div id="passwordArea">
                <div class="form-group">
                    <label for="networkpassword">Password</label>
                    <input type="password" class="form-control" name="password" id="showPasswordInput"/>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" id="showPasswordCheckbox">Show password</label>
                </div>
                <div class="form-group">
                    <label>checksum: <div id="checksum" style="display: inline-block; white-space: nowrap; color:blue"></div></label>                   
                </div>  
                </div>
                </div>
                
              <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-default">Cancel</a>
                <input type="hidden" value="{{app}}" name="app">
                <input type="button" onclick="javascript:formComplete();" class="btn btn-primary pull-right" value="Set Account">
              </div>
            </form>
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
<script>
$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
  checkboxClass: 'icheckbox_minimal-blue',
  radioClass: 'iradio_minimal-blue'
});    
var letters = /[^0-9a-zA-Z@#$%^&*!()|+=\-\[\];,.\/{}:<>?~\\_]+$/;
    
function formComplete() {    
	if(!checkInput($("#userInput").val()) || !checkInput($("#showPasswordInput").val())) {
		return;
	}
	$('#form1').submit();
}
    
function calculateChecksum(){
    var user = $("#userInput").val();
    var passwd = $("#showPasswordInput").val();
    var sum = 0;
    for (var i = 0; i < user.length; i++) {
        sum += user.charCodeAt(i);
    }
    for (var i = 0; i < passwd.length; i++) {
        sum += passwd.charCodeAt(i);
    }
    sum = sum % 256;
    $('#checksum').text(sum.toString(16).toUpperCase());
}
    
function checkInput(input) {
    
    if(letters.test(input)) {
        alert("Username or Password allowed characters are a to z, A to Z, 0 to 9, and special characters # $ % ^ & * ( ) | + = - [ ] ; , . / { } : < > ? ~ \ ! _");
        return false; 
    }

    return true;
}
    
$(document).ready(function(){
    $('#showPasswordCheckbox').change( function(e){
        if($(this).is(":checked")){
            $('#showPasswordInput').prop('type', 'text');

        }else{
            $('#showPasswordInput').prop('type', 'password')
        }

    });
    $("#userInput").on('input propertychange paste', function(e){
		calculateChecksum();
        if($("#userInput").val() &&!checkInput($("#userInput").val())) {
            var newStr = $("#userInput").val().replace(letters, '');
            $("#userInput").val(newStr);
        }
	});
    $("#showPasswordInput").on('input propertychange paste', function(e){
		calculateChecksum();
        if($("#showPasswordInput").val() && !checkInput($("#showPasswordInput").val())) {
            var newStr = $("#showPasswordInput").val().replace(letters, '');
            $("#showPasswordInput").val(newStr);
        }
	});
    $("#samlCheck").change(function(e){
        if($(this).is(":checked")){
            $("#passwordArea").hide();
        }
        else {
            $("#passwordArea").show();
        }
    });

});    
</script>
</body>
</html>