$(document).ready(function() {
			
			$('#searchroomindetailsbooking').keyup(function(){
				var searchroomindetailsbooking=$('#searchroomindetailsbooking').val();
				var reservationid =$('#reservationid').val();
				$.ajax({
					type: 'GET',
					data: {
						reservationid:reservationid,
						searchroomindetailsbooking :searchroomindetailsbooking
					},
					url: '/ajax/search/searchByRoomName',
					success: function(list){
						showtable(list);
					}
				});
			});			

							
			$('#amount').keyup(function(){
			var	minamount=$('#minamount').val();
			var	maxamount=$('#maxamount').val();
			var amount=$('#amount').val();
			console.log('minamount '+minamount);
			console.log('maxamount '+maxamount);
			console.log('amount '+amount);
		if ((amount.match("^(\\d+)(.?\\d+)?$"))){
			console.log('neu dung');
				console.log('amount - minamount'+ (amount - minamount));
				console.log('maxamount - amount'+ (maxamount - amount));
			if((amount - minamount) <0  || (maxamount - amount) <0 )
			{
				$('#showerror').html('Amount need between '+minamount+' and '+maxamount  );
				$('#check').val('erros');
			}
			else{
				$('#showerror').html('');
				$('#check').val('');
			}
		}else{
			$('#showerror').html('incorrect format');
			$('#check').val('erros');
		}
	
		});
							
		$('#sort').change(function(){
			var	sortType=$('#sort').val();
			var searchroomindetailsbooking=$('#searchroomindetailsbooking').val();
				var reservationid =$('#reservationid').val();
				$.ajax({
					type: 'GET',
					data: {
						reservationid:reservationid,
						searchroomindetailsbooking :searchroomindetailsbooking,
						sortType:sortType
					},
					url: '/ajax/search/sort',
					success: function(list){
						showtable(list);
					}
				});
		})					
							
		
	
		
		
	function showtable(list){
		var s='';
						var total=0;
						for(var i=0;i<list.length;i++){
						s+='	<tr>';
						s+='	<td style="border: 1px solid #ced4da; text-align: center; padding: 10px;width: 100px">';
						s+='	<h5 class="mb-0">';
						s+='		<a class="mb-0" href="/hotel/reservationroom/showreservationroom?reservationroomdetailsid='+list[i].reservationroomdetailsid+'">'+list[i].roomName+'</a>'
						;
							
						s+=			'</h5>'	;
						s+=		'</td>';			

						s+='<td style="border: 1px solid #ced4da; text-align: left; padding: 3px;width: 340px">'		;
					var listcus=list[i].customername;
						for(var j=0;j<listcus.length;j++){
							s+='<div class="row" style="text-align: left; margin-left: 0px; margin-right: 0px">';
							s+='<h5>- '+listcus[j]+'</h5>';
							s+='</div>';
						}
						s+='</td>';
						s+='<td style="border: 1px solid #ced4da; text-align: center; padding: 10px;width: 110px">';			
						s+='<h5>$ '+list[i].amount+'</h5>'	;			
						s+='</td>'	;	
						s+='<td style="border: 1px solid #ced4da; text-align: center; padding: 10px;width: 110px">';			
						s+='<h5> '+list[i].reservationroomtypestt+'</h5>'	;			
						s+='</td>'	;
						s+='</tr>'	;
						total+=list[i].amount;
						}
						s+='<tr>';
						s+='<td style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 100px">'	;
						s+='<h5 class="mb-0"></h5>';	
						s+='</td>';		
						s+='<td style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 340px">'	;
						s+='<h5 class="mb-0"></h5>';	
						s+='</td>';	
						s+='<td style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 110px">'	;
						s+='<h5 class="mb-0"> $'+total+'</h5>';	
						s+='</td>';	
						
						s+='<td style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 110px">'	;
						s+='<h5 class="mb-0"></h5>';	
						s+='</td>';											
						s+='</tr>';												
						
						$('#showlistroom tbody').html(s);
	}	
							
});