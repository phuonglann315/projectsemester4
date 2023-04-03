
$(document).ready(function() {


	$('#addaddon').change(function() {
		var addonserviceid = $('#addaddon option:selected').val();
		document.getElementById("showbuton").style.display = '';
		var l = $('#showlatecheckout').val();
		if (l != -1) {
			document.getElementById("showbuttonaddlatecheckout").style.display = 'none';
		}

		document.getElementById("showpayment1").style.display = 'none';
		document.getElementById("showpayment").style.display = '';
		var c = $('#maxextra').val();
		if (c != -1) {
			document.getElementById("showbuttonaddcustomer").style.display = 'none';
		}
		document.getElementById("showwarning").style.display = 'none';

		$('#addonserviceid').val(addonserviceid);
		$.ajax({
			type: 'GET',
			data: {
				addonserviceid: addonserviceid
			},
			url: '/ajax/serviceforroom/shownameservice',
			success: function(xuanAddonservice) {
				var x = xuanAddonservice.addonservicename;
				$('#showservicename').html(x);
				var price = '$ ' + xuanAddonservice.price;
				$('#showserviceprice').html(price);
				$('#showtotal').html(price);
				$('#price').val(xuanAddonservice.price);
				$('#maxquantitysercive').val(0);
				$('#typeservice').val(0);
				$('#quantity').val(1);

			}
		});
	});
	$('#extrabed').change(function() {

		var addonserviceid = $('#extrabed option:selected').val();
		var maxextra = $('#maxextra').val();
		$('#addonserviceid').val(addonserviceid);
		$.ajax({
			type: 'GET',
			data: {
				addonserviceid: addonserviceid
			},
			url: '/ajax/serviceforroom/shownameservice',
			success: function(xuanAddonservice) {
				var x = xuanAddonservice.addonservicename;
				$('#showservicename').html(x);
				var price = '$ ' + xuanAddonservice.price;
				$('#showserviceprice').html(price);
				$('#showtotal').html(price);
				$('#price').val(xuanAddonservice.price);
				$('#maxquantitysercive').val(maxextra);
				$('#typeservice').val(1);
				$('#quantity').val(1);
				document.getElementById("showbuton").style.display = 'none';
				var l = $('#showlatecheckout').val();
				if (l != -1) {
					document.getElementById("showbuttonaddlatecheckout").style.display = 'none';
				}
				document.getElementById("showbuttonaddcustomer").style.display = '';
				document.getElementById("showwarning").style.display = 'none';
				document.getElementById("showpayment1").style.display = 'none';
				document.getElementById("showpayment").style.display = '';



			}
		});
	});

	$('#latedcheckout').change(function() {
		var reservationid = $('#reservationid').val();
		var addonserviceid = $('#latedcheckout option:selected').val();
		document.getElementById("showbuton").style.display = 'none';
		document.getElementById("showbuttonaddlatecheckout").style.display = '';
		var c = $('#maxextra').val();
		if (c != -1) {
			document.getElementById("showbuttonaddcustomer").style.display = 'none';
		}

		$('#addonserviceid').val(addonserviceid);
		$.ajax({
			type: 'GET',
			data: {
				addonserviceid: addonserviceid,
				reservationid: reservationid
			},
			url: '/ajax/serviceforroom/shownameservice',
			success: function(xuanAddonservice) {
				var x = xuanAddonservice.addonservicename;
				$('#showservicename').html(x);
				var price = '$ ' + xuanAddonservice.price;
				$('#showserviceprice').html(price);
				$('#showtotal').html(price);
				$('#price').val(xuanAddonservice.price);
				$('#maxquantitysercive').val(1);
				$('#quantity').val(1);
				$('#typeservice').val(0);
				document.getElementById("showwarning").style.display = '';

			}
		});
	});





	$('#quantity').keyup(function() {
		var quantity = $('#quantity').val();
		var maxquantitysercive = $('#maxquantitysercive').val();
		var price = $('#price').val();
		if ((quantity.match("\\d+")) && quantity > 0) {

			if (maxquantitysercive == 0) {
				$('#showtotal').html('$ ' + (price * quantity));
				$('#showerror').html('');
				$('#check').val(null);
			} else {
				if (quantity > maxquantitysercive) {
					$('#showerror').html('this type of service only add up to' + maxquantitysercive);
					$('#check').val('erros');
				} else if (quantity <= maxquantitysercive) {
					$('#showtotal').html('$ ' + (price * quantity));
					$('#showerror').html('');
					$('#check').val(null);
				}
			}

		} else {
			$('#showerror').html('Input only number, no character, no space, quantity needs to be greater than 0');
			$('#check').val('erros');
		}

	});


	$('input[name=checkroomlatecheckout]:radio').click(function() {
		if ($('#nohold').is(":checked")) {
			document.getElementById("buttonsubmit").style.display = '';
			document.getElementById("buttoncheckroom").style.display = 'none';
			document.getElementById("showpayment1").style.display = 'none';
			document.getElementById("showpayment").style.display = '';
			$('#showcheckroomavailableresuld').html('');
		} if ($('#hold').is(":checked")) {
			document.getElementById("buttonsubmit").style.display = 'none';
			document.getElementById("buttoncheckroom").style.display = '';
			document.getElementById("showpayment1").style.display = '';
			document.getElementById("showpayment").style.display = 'none';
		}
	});


	$('#buttoncheckroom').click(function() {
		var reservationroomdetailsid = $('#reservationroomdetailsid').val();
		var roomtypeid = $('#roomtypeid').val();
		console.log('reservationroomdetailsid ' + reservationroomdetailsid)
		$.ajax({
			type: 'GET',
			data: {
				reservationroomdetailsid: reservationroomdetailsid,
				roomtypeid: roomtypeid
			},
			url: '/ajax/serviceforroom/holdforcheckoutlate',
			success: function(result) {
				if (result > 0) {
					$('#showcheckroomavailableresuld').html('The request can be fulfilled. ');
					$('#holdroom').val("ok");
					document.getElementById("showcheckroomavailableresuld").style.color = '#28a745';
					document.getElementById("buttonsubmit").style.display = '';
					document.getElementById("buttoncheckroom").style.display = 'none';
				} else {
					$('#showcheckroomavailableresuld').html('The request cannot be fulfilled because the room is already booked by another reservation');
					document.getElementById("showcheckroomavailableresuld").style.color = '#ef3f3e';
					document.getElementById("buttonsubmit").style.display = 'none';
					document.getElementById("buttoncheckroom").style.display = 'none';
				}
			}
		});

	});
	//-----------------------------------
	var quantity1 = parseInt($('#chekall').val());

	var countt = 0;
	$('.checkbox').click(function() {

		var id = $(this).val();
		if ($('#' + id + ':checked').val() !== undefined) {
			countt += 1;

		}
		else {
			countt -= 1;
		}

		if (countt == quantity1) {
			$('#chekall').prop('checked', true);
		} else {

			$('#chekall').prop('checked', false);
		}
	});



	$('#chekall').click(function() {

		if ($("#chekall").is(':checked')) {
			$('.checkbox').each(function() { this.checked = true; });
			countt = quantity1;
		} else {
			$('.checkbox').each(function() { this.checked = false; });
			countt = 0;
		}
	});





	$('#button1').click(function() {
		var x = $('#option1').val();
		document.getElementById("showyes").style.display = 'contents';
		document.getElementById("showno").style.display = 'none';
	});
	$('#button2').click(function() {
		document.getElementById("showyes").style.display = 'none';
		document.getElementById("showno").style.display = 'contents';

	});

	$('#addaddon1').change(function() {

		var addonserviceid = $('#addaddon1 option:selected').val();
		document.getElementById("show1").style.display = 'contents';
		$('#addon').val(addonserviceid);
		$.ajax({
			type: 'GET',
			data: {
				addonserviceid: addonserviceid
			},
			url: '/ajax/serviceforroom/shownameservice',
			success: function(xuanAddonservice) {
				var price = '$ ' + xuanAddonservice.price;
				$('#showamount').html(price);


			}
		});
	});



});