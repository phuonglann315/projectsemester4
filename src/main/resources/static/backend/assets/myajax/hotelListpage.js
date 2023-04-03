$(document).ready(function() {		
		
		$("#autoComplete").select2({
			placeholder: "Location...",
			allowClear: true,
			ajax: {								
				type: 'GET',
				url: '/ajaxuser/autocomplete',
				dataType: 'json',
				processResults: function(data){
					return{
						results: $.map(data, function(item){							
							return{									
									text: item.provincename,
									id: item.provinceid,							
							}
						})						
					};
				}
			}
		});
		
		$("#autoCompleteHotel").select2({			
			placeholder: "Search hotel...",
			allowClear: true,
			ajax: {								
				type: 'GET',
				url: '/ajaxuser/autocompleteHotel?provinceid=' + $("#autoComplete option:selected").val(),
				dataType: 'json',
				processResults: function(data){
					return{
						results: $.map(data, function(item){							
							return{									
									text: item.hotelname,
									id: item.hotelid,							
							}
						})						
					};					
				}
			}			
		}).on('select2:select', function() {
			  var hotelid = $("#autoCompleteHotel option:selected").val();
			  var checkin = $("#timeCheckIn").val();
			  var checkout = $("#timeCheckOut").val();
			  var provinceid = $("#autoComplete option:selected").val();
			  var guest = $("#guest").val();
			  var room = $("#room").val();
			  $.ajax({
				  url: '/ajaxuser/ajaxHotelName',
				  type: "GET",
					data:{
						hotelid:hotelid,
						provinceid:provinceid,
						checkin:checkin,
						checkout:checkout
					},					
					dataType: 'json',
					success: function(hotels){						
						var r='';
						for(var i=0;i<hotels.length;i++){	
							r+='<div class="list-box col-12 popular grid-item wow fadeInUp">'													
							r+='<div class="list-img">'
							r+='<a href="#">'                               
							r+='<img src="/uploads/hotel/' + hotels[i].hotelimagename + '"class="img-fluid blur-up lazyload">'                   
							r+='</a>'
							r+='</div>'							
							r+='<div class="list-content">'
							r+='<div>'
							r+='<a href="/page/hotel/hotelbook?hotelid=' + hotels[i].hotelid + '&checkin=' + checkin + '&checkout=' + checkout + '&guest=' + guest + '&room=' + room + '">'
							r+='<h5>' + hotels[i].hotelname + '</h5>'
							r+='</a>'
							r+='<p>' + hotels[i].wardname, hotels[i].cityname + '</p>'
                             r+='<div class="rating">'
                            	r+='<i class="fas fa-star"></i>'
                            	r+='<i class="fas fa-star"></i>'
                            	r+='<i class="fas fa-star"></i>'
                            	r+='<i class="fas fa-star"></i>'
                            	r+='<i class="fas fa-star"></i>'                            	
                            	r+='<span>324 review</span>'
                                r+='</div>'
                                r+='<div class="facility-icon">'
                                    r+='<div class="facility-box">'                                            	
                                    	r+='<img src="/resources/frontend/assets/images/icon/hotel/beer.png" class="img-fluid blur-up lazyload" alt="">'                  
                                        r+='<span>bar</span>'
                                    r+='</div>'
                                   r+='<div class="facility-box">'
                                        r+='<img src="/resources/frontend/assets/images/icon/hotel/wifi.png" class="img-fluid blur-up lazyload" alt="">'
                                        r+='<span>wifi</span>'
                                    r+='</div>'
                                    r+='<div class="facility-box">'
                                    r+='<img src="/resources/frontend/assets/images/icon/hotel/sunset.png" class="img-fluid blur-up lazyload" alt="">'
                                    r+='<span>beach</span>'
                                    r+='</div>'
                                    r+='<div class="facility-box">'
                                    r+='<img src="/resources/frontend/assets/images/icon/hotel/pool.png" class="img-fluid blur-up lazyload" alt="">'
                                    r+='<span>swimming</span>'
                                    r+='</div>' 
                                r+='</div>'  
                                r+='<div class="price">'
                                r+='<del>$' + hotels[i].publicprice + '</del>'
                                r+='$' + hotels[i].showprice + '<span>/ per night</span>'
                                r+='<p class="mb-0">login & unlock a secret deal</p>'
                                r+='</div>'
                                //r+='<div class="offer-box"> '
                                //r+='<i class="fas fa-fire"></i> 8 people booked this hotel today</div>'
                                r+='<a href="/page/hotel/hotelbook?hotelid='+ hotels[i].hotelid + '&checkin=' + checkin + '&checkout=' + checkout + '&guest=' + guest + '&room=' + room + '"class="btn btn-solid color1 book-now">select room</a>'
                                r+='</div>'
                                r+='</div>'	 
                        		r+='</div>'
						}
						$('#loadresult').html(r); 
						
					}
					
			  });  
		});
		
		//button search		
		 $("#btnSearch").click(function(){
			 var checkin = $("#timeCheckIn").val();
			 var checkout = $("#timeCheckOut").val();
			 var provinceid = $("#autoComplete option:selected").val();
			 var guest = $("#guest").val();
			 var room = $("#room").val();
			 $("#radio_0").prop("checked", true);
			 $("#autoCompleteHotel").select2({			
					placeholder: "Search hotel...",
					allowClear: true,
					ajax: {								
						type: 'GET',
						url: '/ajaxuser/autocompleteHotel?provinceid=' + provinceid,
						dataType: 'json',
						processResults: function(data){
							return{
								results: $.map(data, function(item){							
									return{									
											text: item.hotelname,
											id: item.hotelid,							
									}
								})	
							};
							
						}
					}			
				});			 
			 
			 	$.ajax({
				  url: '/ajaxuser/ajaxButtonSearch',
				  type: "GET",
					data:{						
						provinceid:provinceid,
						checkin:checkin,
						checkout:checkout
					},					
					dataType: 'json',
					success: function(hotels) {	
						var r='';
						for(var i=0;i<hotels.length;i++){	
							r+='<div class="list-box col-12 popular grid-item wow fadeInUp">'													
							r+='<div class="list-img">'
							r+='<a href="#">'                               
							r+='<img src="/uploads/hotel/' + hotels[i].hotelimagename + '"class="img-fluid blur-up lazyload">'                   
							r+='</a>'
							r+='</div>'							
							r+='<div class="list-content">'
							r+='<div>'
							r+='<a href="/page/hotel/hotelbook?hotelid=' + hotels[i].hotelid + '&checkin=' + checkin + '&checkout=' + checkout + '&guest=' + guest + '&room=' + room + '">'
							r+='<h5>' + hotels[i].hotelname + '</h5>'
							r+='</a>'
							r+='<p>' + hotels[i].wardname + ', ' + hotels[i].cityname + '</p>'
                            r+='<div class="rating">'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<span>324 review</span>'
                               r+='</div>'
                               r+='<div class="facility-icon">'
                                   r+='<div class="facility-box">'                                            	
                                   	r+='<img src="/resources/frontend/assets/images/icon/hotel/beer.png" class="img-fluid blur-up lazyload" alt="">'                  
                                       r+='<span>bar</span>'
                                   r+='</div>'
                                  r+='<div class="facility-box">'
                                       r+='<img src="/resources/frontend/assets/images/icon/hotel/wifi.png" class="img-fluid blur-up lazyload" alt="">'
                                       r+='<span>wifi</span>'
                                   r+='</div>'
                                   r+='<div class="facility-box">'
                                   r+='<img src="/resources/frontend/assets/images/icon/hotel/sunset.png" class="img-fluid blur-up lazyload" alt="">'
                                   r+='<span>beach</span>'
                                   r+='</div>'
                                   r+='<div class="facility-box">'
                                   r+='<img src="/resources/frontend/assets/images/icon/hotel/pool.png" class="img-fluid blur-up lazyload" alt="">'
                                   r+='<span>swimming</span>'
                                   r+='</div>' 
                               r+='</div>'  
                               r+='<div class="price">'
                               r+='<del>$' + hotels[i].publicprice + '</del>'
                               r+='$' + hotels[i].showprice + '<span>/ per night</span>'
                               r+='<p class="mb-0">login & unlock a secret deal</p>'
                               r+='</div>'
                               //r+='<div class="offer-box"> '
                               //r+='<i class="fas fa-fire"></i> 8 people booked this hotel today</div>'
                               r+='<a href="/page/hotel/hotelbook?hotelid='+ hotels[i].hotelid + '&checkin=' + checkin + '&checkout=' + checkout + '&guest=' + guest + '&room=' + room + '" class="btn btn-solid color1 book-now">select room</a>'
                               r+='</div>'
                               r+='</div>'	 
                       		r+='</div>'
						}
						$('#loadresult').html(r); 
						
						var title=$("#autoComplete option:selected").text();							
							r1='<div>' 
							+'<h2>hotels in '+ title + '</h2>'	
							+'<nav aria-label="breadcrumb" class="theme-breadcrumb">'
							+'<ol class="breadcrumb">'
							+'<li class="breadcrumb-item"><a href="index.html">Home</a></li>'
							+ '<li class="breadcrumb-item active" aria-current="page">hotels in ' + title + '</li>'	
							+'</ol>'
							+'</nav>'
							+'</div>'
							$('#loadTitle').html(r1); 
						
						$.ajax({
							  type:'GET',
							  url:'/ajaxuser/getSortWard',				  
							  data: {						
								  provinceid:provinceid				
								},					
							  dataType: 'json',
							  success: function(wards){								
								  var r='';								
								  for(var i=0;i<wards.length;i++){																											
									r+='<label class="chbx-container">' + wards[i].provincename
									r+='<input id="getDis" class="chbx_dis" type="checkbox" name="getWard" value="' + wards[i].provinceid + '" id="' + wards[i].provinceid + '">'
									r+='<span class="checkmark"></span>'
									r+='</label>'									
								 }							
								  $('#loadDistrict').html(r); 								  
							  }
							  
						}); 						
					}					
			  });			 					
    	}); 
		
		//buton sort hotel
		$("#btnSort").click(function() {						
		    var checkin = $("#timeCheckIn").val();
			var checkout = $("#timeCheckOut").val();
			var provinceid = $("#autoComplete option:selected").val();				
			var wardid= [];
			var price = $("input[name='price']:checked").val()
			 var guest = $("#guest").val();
			 var room = $("#room").val();
			$("input:checkbox[name=getWard]:checked").each(function() {								
				wardid.push($(this).val());   
            });	
            
			if(wardid.length == 0){
				wardid.push(0);										
			}	
			//alert(wardid + "-" + price + "-" + provinceid);
			$.ajax({
		                type: "GET",
		                url: '/ajaxuser/ajaxSortDistrict',
		                data:{
		                	wardid: wardid,
		                	price:price,
		                	provinceid:provinceid,
							checkin:checkin,
							checkout:checkout
		                },
		                traditional: true,
		                success: function(hotels) {		                    		                	
		                	var r='';
						for(var i=0;i<hotels.length;i++){	
							r+='<div class="list-box col-12 popular grid-item wow fadeInUp">'													
							r+='<div class="list-img">'
							r+='<a href="#">'                               
							r+='<img src="/uploads/hotel/' + hotels[i].hotelimagename + '"class="img-fluid blur-up lazyload">'                   
							r+='</a>'
							r+='</div>'							
							r+='<div class="list-content">'
							r+='<div>'
							r+='<a href="/page/hotel/hotelbook?hotelid=' + hotels[i].hotelid + '&checkin=' + checkin + '&checkout=' + checkout + '&guest=' + guest + '&room=' + room + '">'
							r+='<h5>' + hotels[i].hotelname + '</h5>'
							r+='</a>'
							r+='<p>' + hotels[i].wardname + ', ' + hotels[i].cityname + '</p>'
                            r+='<div class="rating">'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<i class="fas fa-star"></i>'
                           	r+='<span>324 review</span>'
                               r+='</div>'
                               r+='<div class="facility-icon">'
                                   r+='<div class="facility-box">'                                            	
                                   	r+='<img src="/resources/frontend/assets/images/icon/hotel/beer.png" class="img-fluid blur-up lazyload" alt="">'                  
                                       r+='<span>bar</span>'
                                   r+='</div>'
                                  r+='<div class="facility-box">'
                                       r+='<img src="/resources/frontend/assets/images/icon/hotel/wifi.png" class="img-fluid blur-up lazyload" alt="">'
                                       r+='<span>wifi</span>'
                                   r+='</div>'
                                   r+='<div class="facility-box">'
                                   r+='<img src="/resources/frontend/assets/images/icon/hotel/sunset.png" class="img-fluid blur-up lazyload" alt="">'
                                   r+='<span>beach</span>'
                                   r+='</div>'
                                   r+='<div class="facility-box">'
                                   r+='<img src="/resources/frontend/assets/images/icon/hotel/pool.png" class="img-fluid blur-up lazyload" alt="">'
                                   r+='<span>swimming</span>'
                                   r+='</div>' 
                               r+='</div>'  
                               r+='<div class="price">'
                               r+='<del>$' + hotels[i].publicprice + '</del>'
                               r+='$' + hotels[i].showprice + '<span>/ per night</span>'
                               r+='<p class="mb-0">login & unlock a secret deal</p>'
                               r+='</div>'                           
                               r+='<a href="/page/hotel/hotelbook?hotelid='+ hotels[i].hotelid + '&checkin=' + checkin + '&checkout=' + checkout + '&guest=' + guest + '&room=' + room + '" class="btn btn-solid color1 book-now">select room</a>'
                               r+='</div>'
                               r+='</div>'	 
                       		r+='</div>'
						}
						$('#loadresult').html(r); 
		                },
		                
		            });
		        });
            
		});
				

		$("#guest").on('change',function(){
			 var noguest =  $(this).val();
			 var noroom = $("#room").val();
			 if(noguest < noroom){				 
				 $("#room").val(noguest);
				 alert("Number guest can not greater than number room!")
			 }else if(noguest => noroom){				
				 $("#room").prop('disabled', false);
			 }
		}); 
		
		$("#room").on('change',function(){
			 var noroom =  $(this).val();
			 var noguest = $("#guest").val();
			 if(noguest < noroom){				
				 $("#room").val(noguest);
				 alert("Number guest can not greater than number room!")
			 }else if(noguest => noroom){
				 $("#room").prop('disabled', false);
			 }
		}); 
	
	