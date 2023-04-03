
$(document).ready(function() {
	var total = $('#total').val();
	if (total > 0) {
		if(total>=2){
			$('#2').keyup(function() {
			var showmin = parseInt($('#2').val()) + 1;
			console.log(showmin);
			$('#show3').html(showmin);
			$('#3').val(showmin);
			document.getElementById('4').style.display = '';
		});
		}
		

		$('.checkin').bind('click', function(event) {
			var id = jQuery(event.target).attr('id');
			var nextid = (parseInt(id) + 1);
			var nextnextid = (parseInt(id) + 2);
			if (id % 2 == 0 && id > 2) {
				$("#" + id).keyup(function() {
					var inputvalue=$('#'+id).val();
					var min=parseInt(inputvalue);
					var showmin=parseInt(min+1);
					console.log('showmin ' + showmin);
					$('#show' + nextid).html(showmin);
					$('#' + nextid).val(showmin);
					if(nextnextid>total){
						nextnextid==total;
							document.getElementById(nextnextid).style.display = '';
					}
				
				});
			}
		});
	}

});