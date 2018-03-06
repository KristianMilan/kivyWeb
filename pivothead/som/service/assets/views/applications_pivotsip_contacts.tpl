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
      <h1>Contacts</h1>
    </section>
    <section class="content">
        <div class="box">  

            <div class="box-header">
                <div class="pull-right">                

                    <a href="/contacts/new" class="btn btn-primary">New Contact</a>
                </div>
            </div> 
            <div class="box-body">
            <table class="table table-bordered table-striped">
                <thead> 
                <tr> 
                    <th>Username</th>  
                    <th>Server</th>  
                    <th>Options</th> 
                </tr>
                </thead>
                <tbody>
                    %for i in range(0, len(contacts)):
                    <tr id="cr-{{contacts[i]['id']}}">
                        <td>
                            {{contacts[i]['contact']}}
                        </td>

                        <td>
                            {{contacts[i]['server']}}
                        </td>

                        <td>
                            <a href="contacts/edit?id={{contacts[i]['id']}}" class="btn btn-primary">Edit</a>
                            % if contacts[i]['showSpeed']:
                            <button type="button" class="btn btn-primary speed-contact" data-code="{{contacts[i]['contact']}}" data-toggle="modal">
                                Set Speed Dial
                            </button>
                            % end
                            <button type="button" class="btn btn-danger del-contact" data-code="{{contacts[i]['id']}}" data-target="#delete-contact-popup" data-toggle="modal">
                                Delete
                            </button>
                        </td>
                    </tr>
                    %end
                </tbody>                        
            </table>
        </div>
    </section>
  </div>
  <footer class="main-footer">    
    <strong>Copyright &copy; 2016 <a href="#">Pivothead Wearable Imaging</a>.</strong> All rights reserved.
  </footer>
</div>

<div class="modal fade" id="delete-contact-popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <h4>Are you sure you want to delete this Contact ?</h4>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary blocked confirm_del_contact">Confirm &amp; Delete</button>
            </div>
        </div>
    </div>
</div><div class="modal fade" id="delete-contact-confirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <div class="row">
                    <div class="col-sm-12">
                        <h4>Success!</h4>
                        <p>Contact deleted.</p>
                    </div>
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
    $('.confirm_del_contact').on('click', function (e) {
        e.preventDefault();
        contact_id = $("#delete-contact-popup").data("contact_id");

        $.ajax({
            type: "POST",
            url: "/contacts/delete",
            data: {id : contact_id},
            success: function (response) {
                var json = jQuery.parseJSON(response);
                if(json.r == 0){
                    $('#delete-contact-popup').modal('toggle');
                    $('#delete-contact-confirm').modal('toggle');
                    $("#cr-"+contact_id).remove();
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    });

    $('.del-contact').on('click', function (e) {
        e.preventDefault();
        $("#delete-contact-popup").data("contact_id", $(this).data('code'));
    });
    
    $('.speed-contact').on('click', function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/setSeepDial",
            data: {user : $(this).data('code')},
            success: function (response) {
                window.location = "/PivotSIP";
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    });

});    
</script>
</body>
</html>