
$(document).ready(function() {
	var bed = 2;

	function checkCheckin() {
		var checkin = $('#checkin').val();
		if (checkdate(checkin) != 0) {
			$('#showerrorcheckin').html('');
			$('#checkcheckin').val('0');
			return true;
		} else {
			$('#showerrorcheckin').html('wrong format date');
			$('#checkcheckin').val('1');
			return false;
		}
	}
	function checkCheckout() {
		var checkout = $('#checkout').val();
		if (checkdate(checkout) != 0) {
			$('#showerrorcheckout').html('');
			$('#checkcheckout').val('0');
			return true;
		} else {
			$('#showerrorcheckout').html('wrong format date');
			$('#checkcheckout').val('1');
			return false;
		}
	}

	function checkroomtypeid() {
		if (checkChooseContract() == true) {
			var roomtypeid = $('#roomtypeid option:selected').val();
			if (roomtypeid == -1) {
				$('#checkroomtype').val('1');
				$('#showerrorroomtype').html('Please Choose Room Type');
				return false;
			} else {
				$('#checkroomtype').val('0');
				$('#showerrorroomtype').html('');
				return true;
			}
		} else {
			$('#roomtypeid').val('-1').change();
		}

	}
	function checkDeadline() {
		var checkdead = $('#Deadline').val();
		if (checkdate(checkdead) == true) {
			$('#showerrordeadline').html('');
			$('#checkdeadline').val('0');
			return true;
		} else {
			$('#showerrordeadline').html('wrong format date');
			$('#checkdeadline').val('1');
			return fasle;
		}
	}
	function checkdate(field) {
		var pattern = new RegExp(/^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.](\d{4})$/);
		var match = pattern.exec(field);
		if (match == null)
			return 0;
		var year = match[3];
		var month = match[2] * 1;
		var day = match[1] * 1;
		var date = new Date(year, month - 1, day); // because months starts from 0.
		return (date.getFullYear() == year && date.getMonth() == (month - 1) && date.getDate() == day);

	}




	function checkname() {
		var customername = $('#customername').val();
		if ((customername.match('^(([A-Za-z]{1,16})([ ]{0,1})([A-Za-z]{1,16})?([ ]{0,1})?([A-Za-z]{1,16})?([ ]{0,1})?([A-Za-z]{1,16}))$'))) {
			$('#checkname').val('0');
			$('#showerrorcustomername').html('');
			return true;
		} else {
			$('#showerrorcustomername').html('Input only character, no number, no space, consist of 2 or more words');
			$('#checkname').val('1');
			return false;
		}
	}


	function checkphone() {
		var customerphone = $('#customerphone').val();
		if ((customerphone.match('^([0-9]{10,12})$'))) {
			$('#checkphone').val('0');
			$('#showerrorcustomerphone').html('');
			return true;

		} else {
			$('#showerrorcustomerphone').html('Input only number, no character, no space,length form 10 to 12');
			$('#checkphone').val('1');
			return false;
		}
	}


	function checkquantity() {
		var q = $('#quantity').val();
		var m = $('#maxquantity').val();
		if ((q.match("\\d+"))) {
			var quan = parseInt(q);
			var maxquantity = parseInt(m);
			if (quan <= maxquantity && 0 < quan) {
				$('#checkquantity').val('0');
				$('#showerrorquantity').html('');
				return true;
			} else {
				$('#showerrorquantity').html('the number of rooms need to be greater than 0 and less than' + maxquantity);
				$('#checkquantity').val('1');
				return false;
			}
		} else {
			$('#showerrorquantity').html('Input only number, no character, no space');
			$('#checkquantity').val('1');
			return false;
		}

	}

	function checkprice() {
		var price = $('#price').val();
		if ((price.match('\\d+'))) {
			$('#checkprice').val('0');
			$('#showerrorprice').html('');
			return true;
		} else {
			$('#showerrorprice').html('Input only number, no character, no space');
			$('#checkprice').val('1');
			return false;
		}
	}
	$('#showcontract').change(function() {
		var showcontract = $('#showcontract option:selected').val();
		if (showcontract == 1) {
			document.getElementById("showlistcontract").style.display = 'contents';
			$('#roomtypeid').val('-1').change();
			$('#price').val(null);
			$('#quantity').val(null);
		} else {
			document.getElementById("showlistcontract").style.display = 'none';
			$('#roomtypeid').val('-1').change();
			$('#showerrorlistcontract').html('');
			$('#checkcontract').val('0');
			$('#contractid').val(-1);
			actionshowprice();
		}

	});
	function checkChooseContract() {
		var showcontract = $('#showcontract option:selected').val();;
		var contractid = $('#contractid option:selected').val();
		if (showcontract == 1 && (contractid == undefined || contractid == -1)) {
			$('#showerrorlistcontract').html('please choose contract info or change type booking to non contract ');
			$('#checkcontract').val('1');
			return false;
		} else {
			$('#showerrorlistcontract').html('');
			$('#checkcontract').val('0');
			return true;
		}
	}
	$('#contractid').change(function() {
		var showcontract = $('#showcontract option:selected').val();
		var contractid = $('#contractid option:selected').val();
		if (showcontract == 1 && (contractid == undefined || contractid == -1)) {
			$('#showerrorlistcontract').html('please choose contract info or change type booking to non contract ');
			$('#checkcontract').val('1');
			return false;
		} else {
			$('#showerrorlistcontract').html('');
			$('#checkcontract').val('0');
			actionshowprice();
			return true;
		}


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
			}
			$('#showerrorcheckin').html('');
			$('#checkcheckin').val('0');
			actionshowprice();
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
			$('#showerrorcheckout').html('');
			$('#checkcheckout').val('0');
			actionshowprice();
		}


	});

	$("#Deadline").datepicker(
		{
			dateFormat: 'dd-mm-yy',
			minDate: new Date(),
			beforeShow: function() {
				var checkin = $("#checkin").datepicker("getDate");
				jQuery(this).datepicker('option', 'maxDate', checkin);

			},
			onSelect: function() {
				$('#showerrordeadline').html('');
				$('#checkdeadline').val('0');
			}

		});

	$('#quantity').keyup(function() {
		checkquantity();
	});

	$("#customeremail").keyup(function() {
		checkemail();
	});

	function checkemail() {
		var customeremail = $('#customeremail').val();
		if ((customeremail.match('^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$'))) {
			$('#checkemail').val('0');
			$('#showerrorcustomeremail').html('');
			return true;
		} else {
			$('#showerrorcustomeremail').html('wrong format email!');
			$('#checkemail').val('1');
			return false;
		}
	};
	$('#roomtypeid').change(function() {
		checkroomtypeid();
		actionshowprice();

	});
	$("#checkin").keyup(function() {
		checkCheckin();
		actionshowprice();
	});
	$("#checkout").keyup(function() {
		checkCheckout();
		actionshowprice();
	});

	$("#Deadline").keyup(function() {
		checkDeadline();
	});

	$('#customername').keyup(function() {
		checkname();
	});


	$('#customerphone').keyup(function() {
		checkphone();
	});

	$('#price').keyup(function() {
		checkprice();
	});


	$('#dd').click(function() {
		checkerror();
		//var quantity = $("#quantity").val(); console.log('--quantity ' + quantity);
	});

	function checkerror() {
var quantity = $("#quantity").val(); console.log('--quantity ' + quantity);
		var checkquantity1 = checkquantity();
		var checkname1 = checkname();
		var checkphone1 = checkphone();
		var checkroomtype1 = checkroomtypeid();
		var checkprice1 = checkprice();
		var checkdeadline1 = checkDeadline();
		var checkcheckin1 = checkCheckin();
		var checkcheckout1 = checkCheckout();
		var checkcontract1 = checkChooseContract();
		var checkemail1 = checkemail();
		console.log('------------------');


		if (checkquantity1 == true && checkname1 == true && checkphone1 == true && checkroomtype1 == true && checkprice1 == true && checkdeadline1 == true &&
			checkcheckin1 == true && checkcheckout1 == true && checkcontract1 == true && checkemail1 == true) {
			var roomtypeid = $('#roomtypeid option:selected').val(); console.log('--roomtypeid ' + roomtypeid);
			var checkin = $("#checkin").val(); console.log('--checkin ' + checkin);
			var checkout = $("#checkout").val(); console.log('--checkout ' + checkout);
			var Deadline = $("#Deadline").val(); console.log('--Deadline ' + Deadline);
			
			var price = $("#price1").val(); console.log('--price ' + price);
			var customername = $("#customername").val(); console.log('--customername ' + customername);
			var customerphone = $("#customerphone").val(); console.log('--customerphone ' + customerphone);
			var hotelid = $("#hotelid").val(); console.log('--hotelid ' + hotelid);
			var customeremail = $('#customeremail').val();
			var showcontract = $('#showcontract option:selected').val(); console.log('--showcontract ' + showcontract);
			var contractid;
			if (showcontract == 0) {
				contractid = -1;
			} else {
				contractid = $('#contractid option:selected').val();
			}
			var note = $('#note').val();
			console.log('--contractid ' + contractid);
			$.ajax({
				type: 'POST',
				data: {
					roomtypeid: roomtypeid,
					checkin: checkin,
					checkout: checkout,
					contractid: contractid,
					quantity: quantity,
					price: price,
					customername: customername,
					customerphone: customerphone,
					Deadline: Deadline,
					hotelid: hotelid,
					customeremail: customeremail,
					note: note,
					bed: bed

				},
				url: '/ajax/addbooking/createbooking',
				success: function(result) {
					//var s = 'http://localhost:9597/' + link;
					//window.location.href = s;
					if (result != 0) {

						$('title').html('Success!!!!');
						$('#loi').html('Add new Reservation have been Success');
						$('#ok').val(result);
						$('#confirm').modal('show');
						return true;
					} else {
						$('title').html('Error!!!!');
						$('#loi').html('UnSuccess, please contact with admin');
						$('#confirm').modal('show');
						return false;
					}

				}
			});
		} else {

			$('#loi').html('Something wrong, please re-check information ');
			$('#confirm').modal('show');
			return false;
		}

	}

	$('#close').click(function() {
		var result = $('#ok').val();
		console.log('ok ' + ok);
		if (result != 0) {
			window.location.href = 'http://localhost:9597/hotel/booking/detailsbooking?bookingId=' + result;
		}
		$('#confirm').modal('hide');
	})


	function actionshowprice() {
		if (checkCheckin() == true && checkCheckout() == true && checkroomtypeid() == true && checkChooseContract() == true) {
			showprice();
		} else {
			$('#price').val(null);
			$('#quantity').val(null);

		}
	}

	$('input[name=bed]:radio').click(function() {
		console.log('---------------');
		if ($('#allbed').is(":checked")) {
			bed = $('#allbed').val();
			actionshowprice();
			console.log(bed);
		} if ($('#twinbed').is(":checked")) {
			bed = $('#twinbed').val();
			actionshowprice();
			console.log(bed);
		} if ($('#doublebed').is(":checked")) {
			bed = $('#doublebed').val();
			actionshowprice();
			console.log(bed);
		}
	});
	function showprice() {
		var roomtypeid = $('#roomtypeid option:selected').val();
		var checkin = $('#checkin').val();
		var checkout = $('#checkout').val();
		var showcontract = $('#showcontract option:selected').val();
		var contractid;
		if (showcontract == 0) {
			contractid = -1;
		} else {
			contractid = $('#contractid option:selected').val();
		}
		var hotelid = $('#hotelid').val();
		console.log(bed);
		$.ajax({
			type: 'GET',
			data: {
				roomtypeid: roomtypeid,
				checkin: checkin,
				checkout: checkout,
				contractid: contractid,
				hotelid: hotelid,
				bed: bed
			},
			url: '/ajax/addbooking/findPriceRoomtypeByContract',
			success: function(XuanContractinforoomtype) {
				var maxquantity = XuanContractinforoomtype.availableroom;
				$('#maxquantity').val(maxquantity);
				$('#quantity').val(maxquantity);
				$('#price').val(XuanContractinforoomtype.price);
				$('#price1').val(XuanContractinforoomtype.price);
				$('#customeremail').val(XuanContractinforoomtype.email);
				$('#customerphone').val(XuanContractinforoomtype.phone);
				$('#showerrorquantity').html('');
				if (XuanContractinforoomtype.checkroom != null) {
					$('#showerrorquantity').html(XuanContractinforoomtype.checkroom);
				}
				$('#showerrorcustomerphone').html('');
				$('#showerrorcustomeremail').html('');
				$('#showerrorcustomername').html('');
				$('#checkquantity').val('0');
				$('#checkprice').val('0');
				$('#showerrorprice').html('');


			}
		});


	}

});