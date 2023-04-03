$(document).ready(function() {
	var checkname = 0;
	var checknetprice = 0;
	var checkprice = 0;
	$('#addonservicename').keyup(function() {
		var addonservicename = $('#addonservicename').val();
		if ((addonservicename.trim().length > 0)) {
			checkname = 1;
			$('#showservicenameerror').html('');
			showbutton();
		} else {
			$('#showservicenameerror').html('Input only character, no number, no space, consist of 2 or more words');
			checkname = 0;
			showbutton();
		}
	});
	
	$('#netprice').keyup(function() {
		var netprice = $('#netprice').val();
		if ((netprice.match("\\d+") && netprice >= 0)) {
			checknetprice = 1;
			$('#shownetpriceerror').html('');
			showbutton();
		} else {
			$('#shownetpriceerror').html('Input only number, no character, no space');
			checknetprice = 0;
			showbutton();
		}
	});

	$('#price').keyup(function() {
		var netprice = $('#netprice').val();
		var price = $('#price').val();
		if ((price.match("\\d+") && price >= netprice)) {
			checkprice = 1;
			$('#showpriceerror').html('');
			showbutton();
		} else {
			$('#showpriceerror').html('Input only number, no character, no space and greater than or equal to '+netprice);
			checkprice = 0;
			showbutton();
		}
	});
	function showbutton() {
		if (checkname == 1 && checknetprice == 1 && checkprice == 1) {
			document.getElementById("showbuttonaddlatecheckout").style.display = '';
			return true;
		}else{
			document.getElementById("showbuttonaddlatecheckout").style.display = 'none';
			return false;
		}
	}
});