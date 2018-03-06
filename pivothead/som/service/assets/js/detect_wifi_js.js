var selectedRow;
function formComplete() {
	if(selectedRow=== undefined || selectedRow===null)
	{
		return;
	}
	var ssid=selectedRow.find('.ssid').html();
	var encryption=selectedRow.find('div.encry').attr("id");
	$('#form1').append("<input type='hidden' name='ssid' value='"+ssid+"' />");
	$('#form1').append("<input type='hidden' name='encrypt' value='"+encryption+"' />");
	if(encryption!='0')
	{
		$('#form1').attr('action', '/connectPage');
	}
	$('#form1').submit();
}
function scan() {
$.ajax({
    url: '/zGetWifiList',
    type: 'GET',
	cache: false,
    success: function (response) {
        var trHTML = '';
		var json = jQuery.parseJSON(response);
		if(typeof(json.r)=='undefined' || json.r==null || isInt(json.r))
		{
			showScanNothing();
			return;
		}
        $.each(json.r, function (i, item) {
			trHTML += '<tr><td class="ssid">' + item.name+'</td>';
			trHTML+='<td><div class="encry" id="'+item.encry+'" style="display:inline-block;">';
			if(item.encry!=0)
			{
				trHTML+='<div class="encryImage" style="display:inline;"><img src="/web/images/lock.jpg"/></div>';
			}
			 trHTML+='</div><div class="wifiImage" style="display:inline;"><img id="wifiIcon" src="/web/images/signal-high.jpg"/></div></td>';
			/*
            trHTML += '<li class="signal-high"><div class="ssid" style="display:inline;">' + item.name+'</div>';
			trHTML+='<div class="encry" id="'+item.encry+'" style="display:inline;"/>';
			if(item.encry!=0)
			{
				trHTML+='<span class="lock"></span>';
			}
			 trHTML+='</li>';
			 */
        });
        $('#wifiList').append(trHTML);
		$('#wifiList tr').click(function() {
			if($(this).hasClass('selected')){
               $(this).removeClass('selected');
			   $(this).find('.wifiImage').removeClass('selected');
			   $(this).find('#wifiIcon').attr('src', '/web/images/signal-high.jpg');
               $('#connectBtn').removeClass('blue-btn').addClass('grey-btn');
			   selectedRow=null			   
               return;
           }
           $(this).addClass("selected").siblings().removeClass("selected");
           $(this).addClass('selected');
		   $(this).addClass("selected").siblings().find('.wifiImage').removeClass("selected");
		   $(this).addClass("selected").siblings().find('#wifiIcon').attr('src', '/web/images/signal-high.jpg');
           $(this).find('.wifiImage').addClass('selected');
		   $(this).find('#wifiIcon').attr('src', '/web/images/signal-high-dark.jpg');
           $('#connectBtn').removeClass('grey-btn').addClass('blue-btn');
		   $('#rescanBtn').removeClass('grey-btn').addClass('blue-btn');
			selectedRow=$(this);
    	});
		/*$('.wifi-list-cont li').on('click', function(e){
           if($(this).hasClass('selected')){
               $('.wifi-list-cont li').removeClass('selected');
               $('#connectBtn').removeClass('blue-btn').addClass('grey-btn');
			   selectedRow=null			   
               return;
           }
           $('.wifi-list-cont li').removeClass('selected');
           $(this).addClass('selected');
           $('#connectBtn').removeClass('grey-btn').addClass('blue-btn');
		   $('#rescanBtn').removeClass('grey-btn').addClass('blue-btn');
		   selectedRow=$(this);
     	});*/
		showScanCompelete();
    }
});
}

function isInt(value) {
  return !isNaN(value) && 
         parseInt(Number(value)) == value && 
         !isNaN(parseInt(value, 10));
}

function showReadyScan()
{
	$('#reday-scan').show();
	$('#scan-complete').hide();
	$('#scan-nothing').hide();
	selectedRow=null;
}

function showScanCompelete()
{
	$('#reday-scan').hide();
	$('#scan-complete').show();
	$('#scan-nothing').hide();
}

function showScanNothing()
{
	$('#reday-scan').hide();
	$('#scan-complete').hide();
	$('#scan-nothing').show();
	selectedRow=null;
}

(function($){
        $(window).load(function(){
            $(".wifi-list-cont").mCustomScrollbar({
                theme:"minimal-dark"
            });
        });
    })(jQuery);
$(document).ready(function() {
	showReadyScan();
	scan();
	$('#rescanBtn').click(function(event) {
			$('#wifiList').empty();
			$('#connectBtn').removeClass('blue-btn').addClass('grey-btn');
		   	<!--$('#rescanBtn').removeClass('blue-btn').addClass('grey-btn');-->
			showReadyScan();
			scan();
	});
});