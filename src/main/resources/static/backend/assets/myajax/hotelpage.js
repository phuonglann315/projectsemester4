

	$(document).ready(function() {	
	
		$("#timeCheckIn").on('changeDate',function(){
			loadlist();			
		}); 
		
		$("#timeCheckOut").on('changeDate',function(){
			loadlist();					
		}); 
		
		function loadlist(){
			var hotelid = $("#hotelid").val();
			var checkin = $("#timeCheckIn").val();
			var checkout = $("#timeCheckOut").val();
			
			$.ajax({
				  url: '/ajaxuser/ajaxListHotelPage',
				  type: "GET",
					data:{						
						hotelid:hotelid,
						checkin:checkin,
						checkout:checkout
					},					
					dataType: 'json',
					success: function(rooms){						
						var r='';
						for(var i=0;i<rooms.length;i++) {								
							r+='<table class="rooms-box">'                                                                  
							r+='<tr>'
                            r+='<td>'
                            r+='<h6 class="room-title">' + rooms[i].roomstypename + '</h6>'                                           
                            r+='<div class="slide-1 zoom-gallery no-arrow" style="max-width: 230px; max-height: 210px">'                        						    
						    r+='<a href="/uploads/room/' + rooms[i].roomtypeimagename + '">'
						    r+='<img src="/uploads/room/' + rooms[i].roomtypeimagename + '" class="img-fluid blur-up lazyload " width="230px" height="210px" alt="">'
						    r+='</a>'					   
						    r+='</div>'                                                                                                                                                  
						    r+='</td>'
						    r+='<td>'
                            r+='<div class="room-detail">'
                            r+='<div class="row">'
                            r+='<div class="col-6 p-0">'
                            r+='<h6>Amenities</h6>'
                            r+='<div class="facility-detail">'                       
                            r+='<ul>'
                            r+='<li><img src="/resources/frontend/assets/images/icon/tour/bed.png" class="img-fluid blur-up lazyload" alt=""> doub/twin'
                            r+='</li>'
                            r+='<li><img src="/resources/frontend/assets/images/icon/hotel/shower.png" class="img-fluid blur-up lazyload" alt=""> Shower'
                            r+='</li>'                               
                            r+='<li><img src="/resources/frontend/assets/images/icon/hotel/television.png" class="img-fluid blur-up lazyload" alt=""> LCD TV</li>'                               
                            r+='<li><img src="/resources/frontend/assets/images/icon/hotel/couch.png" class="img-fluid blur-up lazyload" alt=""> couch</li>'                               
                            r+='</ul>'                            
                            r+='</div>'                        
                            r+='</div>'
                            r+='<div class="col-6 p-0">'
                            r+='<h6>inclusion</h6>'                   
                            r+='<div class="facility-detail" style="width: 230px;">'
                            r+='<ul>'
                            r+='<li><i class="fas fa-check"></i> Wi-Fi</li>'
                            r+='<li><i class="fas fa-check"></i> Breakfast</li>'   
                            r+='<li><i class="fas fa-check"></i>' + rooms[i].numcusdefault + ' guests</li>'
                            r+='<li><i class="fas fa-check"></i>Avaiable room: ' + rooms[i].availableroom + '</li>' 
                            r+='</ul>'
                            r+='</div>'
                            r+='</div>'                                
                            r+='</div>' 
                            r+='</div>'
                            r+='</td>' 
                            r+='<td>'
                            r+='<div class="price-details">'
                            r+='<div style="width: 200px;">'
                            r+='<h6><del>$' + rooms[i].publicprice + '</del></h6>'
							r+='<h5>$' + rooms[i].showprice + '</h5>'
							r+='<span>per night</span>'
							r+='<input type="hidden" value="">'
							
							if(rooms[i].availableroom == 0){
							    r+='<button class="btn btn-rounded btn-sm color1 book3" disabled="disabled" >sold out</button>'
							}else if(rooms[i].availableroom > 0){
							    r+='<button class="btn btn-rounded btn-sm color1 book3" value="' + rooms[i].roomstypeid + '">book now</button>'	
							}						
                            r+='</div>'
                            r+='</div>'
                            r+='</td>'
                            r+='</tr>'
                            r+='</table>'
						}
						$('#rooms').html(r);
					}
				});
		}
	

		$(".book2").on('click', function(){						
			var roomtype = $(this).val();	
			var noroom = $("#room").val();		
			var checkin = $("#timeCheckIn").val();
			var checkout = $("#timeCheckOut").val();
			if(noroom == ""){
				document.getElementById('checkmaxroom').innerHTML = 'Please, select number of room!';
        		document.getElementById('room').focus();
			}else if(checkin == ""){				
        		document.getElementById('timeCheckIn').focus();
			}else if(checkout == ""){
        		document.getElementById('timeCheckOut').focus();
			}
			else{
				checkRoom(roomtype, noroom, checkin, checkout);
			}
		}); 
		
		
		$("#rooms").on('click', '.book3', function(){						
			var roomtype = $(this).val();	
			var noroom = $("#room").val();		
			var checkin = $("#timeCheckIn").val();
			var checkout = $("#timeCheckOut").val();
			if(noroom == ""){
				document.getElementById('checkmaxroom').innerHTML = 'Please, select number of room!';
        		document.getElementById('room').focus();
			}else if(checkin == ""){				
        		document.getElementById('timeCheckIn').focus();
			}else if(checkout == ""){
        		document.getElementById('timeCheckOut').focus();
			}
			else{
				checkRoom(roomtype, noroom, checkin, checkout);
			}
		}); 
		
		
		function checkRoom(roomtype, noroom, checkin, checkout){							
			var hotelid = $("#hotelid").val();
			var contractid = $("#contractid").val();
			var url = "/user/createbooking?hotelid=" + hotelid + "&contractid=" + 	contractid 
					+ "&checkin=" + checkin + "&checkout=" + checkout + "&roomstypeid=" + roomtype + "&totalrooms=" + noroom
				$.ajax({
				 	type: "GET",
	                url: '/ajaxuser/ajaxCheckRoom',
	                data:{
	                	roomtypeid:roomtype,	
	                	checkin:checkin,
	                	checkout:checkout
	                },
	                success: function(countroom) {	
	                    if(countroom > 9 ){
	                    	if(noroom > countroom ){
	                    		document.getElementById('checkmaxroom').innerHTML = 'Maximmum booking room: 9';
		                		document.getElementById('room').focus();
		                		$("#room").val("9");
	                    	}else if(noroom > 9){
	                    		document.getElementById('checkmaxroom').innerHTML = 'Maximmum available room: 9';
		                		document.getElementById('room').focus();
		                		$("#room").val("9");
	                    	}else{
	                    		window.location.href=url;
	                    	}	                		
	                	}
	                    else if(countroom < 9){ 
	                		if(countroom < noroom ){	                			
		                		document.getElementById('checkmaxroom').innerHTML = 'Maximmum available room: ' + countroom;
		                		document.getElementById('room').focus();
		                		$("#room").val(countroom);
		                	} 
	                		else{
	                				window.location.href=url;		    		               
		    		        }	
		               	}
	                }
			}); 
			
		}
	
	});


