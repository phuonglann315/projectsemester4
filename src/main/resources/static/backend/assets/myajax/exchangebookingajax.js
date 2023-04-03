
$(document).ready(function() {

	var oldroomtypeid = $('#oldroomtypeid').val();
	var bed = $('input[name=bed]:checked').val();
	$('input[name=bed]:radio').click(function() {
		console.log('---------------');
		if ($('#allbed').is(":checked")) {
			bed = $('#allbed').val();
			 show();
			console.log(bed);
		} if ($('#twinbed').is(":checked")) {
			bed = $('#twinbed').val();
			 show();
			console.log(bed);
		} if ($('#doublebed').is(":checked")) {
			bed = $('#doublebed').val();
			 show();
			console.log(bed);
		}
	});
	$('#changeroomtype').change(function() {
		show();

	});

	$('#totalroom').keyup(function() {
		show();

	});

	$('#minus').click(function() {
		show();
	});

	$('#plus ').click(function() {
		show();
	});

	$("#checkin").datepicker({


		dateFormat: 'dd-mm-yy',
		minDate: new Date(),
		onSelect: function() {
			var checkin = $("#checkin").datepicker("getDate");
			var checkout = $("#checkout").datepicker("getDate");

			if (!(checkin < checkout)) {
				var min = new Date(checkin.getFullYear(), checkin.getMonth(), checkin.getDate() + 1);

				$("#checkout").datepicker("setDate", min);
				show();
			} else {
				show();
			}
		}

	});
	$("#checkout").datepicker({
		dateFormat: 'dd-mm-yy',
		minDate: jQuery('#checkin').val() + '1D',
		beforeShow: function() {
			var checkin = $("#checkin").datepicker("getDate");
			var min = new Date(checkin.getFullYear(), checkin.getMonth(), checkin.getDate() + 1);
			jQuery(this).datepicker('option', 'minDate', min);
		},
		onSelect: function() {
			show();
		}

	});

	$("#deadLine").datepicker(
		{

			dateFormat: 'dd-mm-yy',
			minDate: new Date(),
			beforeShow: function() {
				var checkin = $("#checkin").datepicker("getDate");
				jQuery(this).datepicker('option', 'maxDate', checkin);

			}

		});





	function show() {
		var deadLine = $('#deadLine').val();
		var roomstypeid = $('#changeroomtype option:selected').val();
		var checkindate = $('#checkin').val();
		var checkoutdate = $('#checkout').val();
		var totalroom = $('#totalroom').val();
		var reservationid = $('#reservationid').val();
		var changefee = $('#changefee').val();
		var hotelid = $('#hotelid').val();
		var note = $('#note').val();
		var oldbed=$('#oldbed').val();
		if (totalroom.match("\\d+")) {
			$
				.ajax({
					type: 'GET',
					data: {
						roomstypeid: roomstypeid,
						hotelid: hotelid,
						totalroom: totalroom,
						checkindate: checkindate,
						checkoutdate: checkoutdate,
						reservationid: reservationid,
						changefee: changefee,
						bed:bed,
						oldbed:oldbed

					},
					url: '/ajax/changeroomtype',
					success: function(newReservationInfo) {
						var showavailableroom = newReservationInfo.msg;
						$('#showavailableroom').html(showavailableroom);
						if (showavailableroom != null) {
							document.getElementById("showbutton").style.display = 'none';
						} else {
							document.getElementById("showbutton").style.display = 'contents';
						}
						var showroomtyprice = '$ ' + newReservationInfo.roomtypeprice;
						$('#showroomtyprice').html(showroomtyprice);
						var availableroom = newReservationInfo.availableroom
						$('#totalroom').val(availableroom);
						$('#showtotalrooms2').html(availableroom);
						$('#submittotalroom').val(availableroom);
						$('#submitroomtype').val(roomstypeid);
						$('#submitcheckin').val(checkindate);
						$('#submitcheckout').val(checkoutdate);
						$('#submitdeadLine').val(deadLine);
						$('#submitnote').val(note);
						var showtotalamount = '$ ' + newReservationInfo.totalamout;
						$('#showtotalamount').html(showtotalamount);

						var shownight = newReservationInfo.night;
						$('#shownight').html(shownight);
						var checkchargfee = newReservationInfo.chargefee;
						if (checkchargfee > -1) {
							var showchargefee = '<td style="padding: 5px 0px;"  >Charge fee</td><td style="padding: 5px 0px;color:#ef3f3e" >' + checkchargfee + '</td>'
							$('#showchargefee').html(showchargefee);

						} else {
							$('#showchargefee').html('');

						}
						var amount = newReservationInfo.amount;
						$('#amount1').val(amount);

						var str = '<td style="padding: 5px 0px;"class="grand_total"><h5>Amount:</h5></td><td style="padding: 5px 0px; color:#ef3f3e"class="grand_total"><h5>'
							+ amount
							+ '</h5></td>'
						$('#amount').html(str);
						
						var b=newReservationInfo.bed;
						 $('#submitbed').val(b);
						$("input[name=bed][value=" + b + "]").prop('checked', true);
						var warning=newReservationInfo.warning;
						if(warning !=null){
							$('#showarning').html(warning);
						}else{
							$('#showarning').html(warning);
						}
						

					}
				});
		} else {
			$('#totalroom').val(0);
			$('#showavailableroom').html('please input only number');
			$('#showtotalrooms2').html(0);
			$('#showtotalamount').html(0);
			$('#amount').html('');
		}
	}


	//------------------refun


	$('#changereason').change(function() {
		var reason = $('#changereason option:selected').val();
		var paymentamount = $('#paymentamount').val();
		var chargefee = $('#getrefundfee').val();
		if (reason == 1) {
			$('#refundfee').html('<h5 name="refundfee">$ 0</h5>');
			$('#refundamount').html('$ ' + paymentamount);
			$('#refundcharge').val(0);
		} else {
			var paymentamount1 = paymentamount - chargefee;
			$('#refundamount').html('$ ' + paymentamount1);
			$('#refundcharge').val(chargefee);
			var str = '<h5 name="refundfee">$ ' + chargefee + '</h5>';
			console.log(str);
			console.log('chargefee ' + chargefee);
			$('#refundfee').html(str);
		}
	});




});