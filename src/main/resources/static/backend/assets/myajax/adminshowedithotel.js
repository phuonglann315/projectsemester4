

$(document).ready(function() {
	$('#dd').click(function() {

		checkerror();


	});

	$('#close').click(function() {
		var result = $('#ok').val();
		console.log('ok ' + ok);
		if (result != 0) {
			window.location.href = 'http://localhost:9597/admin/hotel/profilehotel?hotelid=' + result;
		}
		$('#confirm').modal('hide');
	});
	function checkerror() {

		var hotelname = $('#hotelname').val();
		var checkshowprovince = $('#checkshowprovince').val();
		var checkshowcity = $('#checkshowcity').val();
		var checkshowward = $('#checkshowward').val();
		console.log(checkshowprovince == 1);
		console.log(checkshowcity == 1);
		console.log(checkshowward == 1);
		var street = $('#street').val();
		var description = $('#street').val();
		if (hotelname.trim().length > 0 &&
			checkshowprovince == 1 && checkshowcity == 1 && checkshowward == 1 &&
			street.trim().length > 0 &&
			description.trim().length > 0) {
			var ward = $('#ward option:selected').val();
			var spa = 0;
			if ($("#spa").is(':checked')) { spa = 1; };
			var pool = 0; if ($("#pool").is(':checked')) { pool = 1; };
			var beach = 0; if ($("#beach").is(':checked')) { beach = 1; };
			var bar = 0; if ($("#bar").is(':checked')) { bar = 1; };
			var restaurants = 0; if ($("#restaurants").is(':checked')) { restaurants = 1; };
			var frontdesk = 0; if ($("#frontdesk").is(':checked')) { frontdesk = 1; };
			var transport = 0; if ($("#transport").is(':checked')) { transport = 1; };
			var shuttle = 0; if ($("#shuttle").is(':checked')) { shuttle = 1; };
			var parking = 0;
			if ($("#parking").is(':checked')) {
				parking = 1;
			};
			var fitnesscenter = 0;
			if ($("#fitnesscenter").is(':checked')) {
				fitnesscenter = 1;
			};
			var hotelid = $('#hotelid').val();
			$.ajax({
				type: 'POST',
				data: {
					ward: ward,
					street: street,
					hotelname: hotelname,
					spa: spa,
					pool: pool,
					beach: beach,
					bar: bar,
					restaurants: restaurants,
					frontdesk: frontdesk,
					transport: transport,
					shuttle: shuttle,
					parking: parking,
					fitnesscenter: fitnesscenter,
					description: description,
					hotelid: hotelid

				},
				url: '/ajax/addhotel/edithotelaction',
				success: function(result) {
					if (result != 0) {

						$('#showtitle').html('Success!!!!');
						$('#loi').html('Edit Hotel have been Success');
						$('#ok').val(result);
						$('#confirm').modal('show');
						return true;
					} else {
						$('title').html('Error!!!!');
						$('#loi').html('UnSuccess, please contact with IT');
						$('#confirm').modal('show');
						return false;
					}

				}
			});
		} else {
			$('#showtitle').html('Error!!!!');
			$('#loi').html('UnSuccess, please input value');
			$('#confirm').modal('show');
		}
	};

	$('#province ').change(function() {
		var provinceid = $('#province option:selected').val();
		$('#checkshowprovince').val(1)
		document.getElementById('showcities').style.display = '';
		$.ajax({
			type: 'GET',
			data: {
				provinceid: provinceid
			},
			url: '/ajax/addhotel/showlistcity',
			success: function(XuanLocation) {
				var s = '<label class="form-label-title ">City</label>';
				s += '<select class="form-control js-example-basic-single col-sm-12" id="chooseward">';
				s += '<option selected disabled="disabled" value="-1">Please Choose City</option>';
				for (var i = 0; i < XuanLocation.length; i++) {
					s += '<option value="' + XuanLocation[i].cityid + '"> ' + XuanLocation[i].cityname + '</option> ';
				}
				s += '</select> ';
				$('#showcities').html(s);
				$('#checkshowcity').val(0);
				$('#checkshowward').val(0);
				document.getElementById('showward').style.display = 'none';
			}
		});
	});
	
	$('#showcities').on('change', '#chooseward', function() {
		var cityid = $('#chooseward option:selected').val();
		$('#checkshowcity').val(1);
		document.getElementById('showward').style.display = '';
		$.ajax({
			type: 'GET',
			data: {
				cityid: cityid
			},
			url: '/ajax/addhotel/showlistward',
			success: function(XuanLocation) {
				var s = '<label class="form-label-title ">Ward</label>';
				s += '<select class="form-control js-example-basic-single col-sm-12" name="ward" id="ward">';
				s += '<option selected disabled="disabled" value="-1">Please Choose Ward</option>';
				for (var i = 0; i < XuanLocation.length; i++) {

					s += '<option value="' + XuanLocation[i].cityid + '"> ' + XuanLocation[i].cityname + '</option> ';
				}
				s += '</select> ';
				$('#showward').html(s);
				$('#showward').on('change', '#ward', function() {
					$('#checkshowward').val(1)
				});

			}
		});
	});
	
	
	//-----
	
	$('#showcities').change(function() {
		var cityid = $('#selectcity option:selected').val();
		$('#checkshowward').val(0);
		$.ajax({
			type: 'GET',
			data: {
				cityid: cityid
			},
			url: '/ajax/addhotel/showlistward',
			success: function(XuanLocation) {
				var s = '<label class="form-label-title ">Ward</label>';
				s += '<select class="form-control js-example-basic-single col-sm-12" name="ward" id="ward">';
				s += '<option selected disabled="disabled" value="-1">Please Choose Ward</option>';
				for (var i = 0; i < XuanLocation.length; i++) {

					s += '<option value="' + XuanLocation[i].cityid + '"> ' + XuanLocation[i].cityname + '</option> ';
				}
				s += '</select> ';
				$('#showward').html(s);
				$('#showward').on('change', '#ward', function() {
					$('#checkshowward').val(1)
				});
			}
		});
		
	});

});
