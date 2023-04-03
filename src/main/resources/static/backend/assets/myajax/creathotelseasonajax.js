
$(document).ready(function() {
	var total = $('#totaldate').val();
	function getFormattedDate(date) {
		let year = date.getFullYear();
		let month = (1 + date.getMonth()).toString().padStart(2, '0');
		let day = date.getDate().toString().padStart(2, '0');

		return day + '-' + month + '-' + year;
	}
	if (total > 0) {
		var year = $('#chooseyear').val();
		var mindate = new Date(year + '-01-02');
		$('#2').datepicker({
			dateFormat: 'dd-mm-yy',
			minDate: mindate,
			onSelect: function() {

				var todate = $('#2').datepicker("getDate");
				var min = new Date(year, todate.getMonth(), todate.getDate() + 1);
				var showmin = getFormattedDate(min);
				$('#show3').html(showmin);
				$('#3').val(showmin);


			}
		});
		$('.date').bind('click', function(event) {
			var id = jQuery(event.target).attr('id');
			var prtodate = parseInt(id) - 2;
			var nextid = parseInt(id) + 1;
			if (nextid > total) {
				nextid = total;
			}
			if (id % 2 == 0 && id > 2) {


				$("#" + id).datepicker({
					dateFormat: 'dd-mm-yy',
					minDate: jQuery('#' + prtodate).val() + '2D',
					beforeShow: function() {
						var date = $('#' + prtodate).datepicker("getDate");
						var min = new Date(year, date.getMonth(), date.getDate() + 2);
						jQuery(this).datepicker('option', 'minDate', min);
					},
					onSelect: function() {
						var todate = $('#' + id).datepicker("getDate");
						var min = new Date(year, todate.getMonth(), todate.getDate() + 1);
						var showmin = getFormattedDate(min);
						console.log(showmin);
						console.log(showmin);
						console.log('#show' + nextid);
						console.log('#' + nextid);
						$('#show' + nextid).html(showmin);
						$('#' + nextid).val(showmin);

					}
				});
			}
		});
	}
	
});