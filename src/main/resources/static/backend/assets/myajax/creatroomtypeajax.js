
$(document).ready(function() {
			$('#roomstypename').keyup(function(){
				checkinput();
			});
			$('#views').keyup(function(){
				checkinput();
			});
			

			
			$('#roomsize').keyup(function(){
				checkinput();
			});
			$('#netprice').keyup(function(){
				checkinput();
			});
			$('#publicprice').keyup(function(){
				checkinput();
			});
			$('#numcusdefault').keyup(function(){
				checkinput();
			});
			$('#maxcus').keyup(function(){
				checkinput();
			});
			$('#roomsize').change(function(){
				checkinput();
			});
			$('#netprice').change(function(){
				checkinput();
			});
			$('#publicprice').change(function(){
				checkinput();
			});
			$('#numcusdefault').change(function(){
				checkinput();
			});
			$('#maxcus').change(function(){
				
				checkinput();
			});
			$('#file').change(function(){
				checkinput();
			});
			function checkinput(){
				var roomstypename=$('#roomstypename').val();
				var views=$('#views').val();

				var netprice=$('#netprice').val();
				var publicprice=$('#publicprice').val();
	var numcusdefault=$('#numcusdefault').val();
	var maxcus=$('#maxcus').val();
				var file=$('#file').val();
				if(roomstypename.trim().length >0 && views.trim().length >0 && netprice<=publicprice
				&& file.trim().length >0 && numcusdefault<=maxcus){
					console.log('ahihi');
					document.getElementById("showbutton").style.display = '';
					$('#showerr').html('');
				}else{
				console.log('ahihi');
					document.getElementById("showbutton").style.display = 'none';
					
				}
			}	


});