<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

    <!--    country code-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/intlTelInput.css">
	<style type="text/css">
		.required:after {
		   content:" *";
		   color: red;
		}
		.error {
			color: red;
		}
		 
	</style>
<mt:userTemplate>	
	<jsp:attribute name="content">
	  <!-- breadcrumb start -->
    <section class="breadcrumb-section pt-0">
        <c:forEach var="img" items="${reservation.roomtype.roomtypeimages }">
         <img src="${pageContext.request.contextPath }/uploads/room/${img.roomtypeimagename}" class="bg-img img-fluid blur-up lazyload" alt="">
    	</c:forEach> 
        <div class="breadcrumb-content">
            <div>
                <h2>checkout</h2>
                <nav aria-label="breadcrumb" class="theme-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/home">Home</a></li>
                        <li class="breadcrumb-item"><a href="hotel-booking.html">review</a></li>
                        <li class="breadcrumb-item active">checkout</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="title-breadcrumb">Travoloto</div>
    </section>
    <!-- breadcrumb end -->
	           <!-- booking section start -->
    <section class="section-b-space bg-inner animated-section">
        <div class="animation-section">
            <div class="cross po-2"></div>
            <div class="round po-5"></div>
            <div class="round r-2 po-6"></div>
            <div class="round r-2 po-7"></div>
            <div class="round r-y po-8"></div>
            <div class="square po-10"></div>
            <div class="square s-2 po-12"></div>
        </div>
        <div class="container">
            <div class="row">               
                <div class="col-lg-7 booking-order">
                    <div class="summery-box">
                        <h2>booking summary</h2>
                        <div class="hotel-section">
                            <div class="hotel-img">
                                <c:forEach var="img" items="${reservation.roomtype.roomtypeimages }" begin="1" end="1">
                            	<img src="${pageContext.request.contextPath }/uploads/room/${img.roomtypeimagename}" class="img-fluid blur-up lazyload" alt="">
                            </c:forEach> 
                            </div>
                            <div class="hotel-detail">
                               <h6>${reservation.roomtype.hotel.hotelname }</h6>
                               <input id="hotelname" type="hidden" value="${reservation.roomtype.hotel.hotelname }" />  
                               <%-- <input id="hotelmail" type="hidden" value="${hotelinfo.email }" />  
                               <input id="hotelphone" type="hidden" value="${hotelinfo.phone }" /> --%>                      
                                <p>${reservation.roomtype.hotel.ward.wardname}, ${reservation.roomtype.hotel.ward.city.cityname}, ${reservation.roomtype.hotel.ward.city.province.provincename }</p>                              
							</div>						
                        </div>
                        <div class="summery-section">
                            <div class="box">
                                <div class="left">
                                    <div class="up">
                                        <h6>check in</h6>
                                        <input type="hidden" id="getin" value="${in }" />
                                        <h5>${in }</h5>
                                    </div>
                                    <div class="down">
                                        <h6>check in time</h6>
                                        <h5>2.00 pm</h5>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="up">
                                        <h6>check out</h6>
                                        <h5>${out }</h5>
                                    </div>
                                    <div class="down">
                                        <h6>check out time</h6>
                                        <h5>12.00 pm</h5>
                                    </div>
                                </div>
                                <input type="hidden" value="${night}" id="night" >
                            </div>
                        </div>   
                        <c:if test="${not empty listpolicies}">
                        	<div class="summery-section">
                            <div class="payment-details">                          
                                <h5>policies details</h5>
                                <c:forEach var="policy" items="${listpolicies }">                                 	
                                	 <h6>* ${policy.policiescontent }</h6> 
                                	 <br>
                                </c:forEach>                               
                            </div>
                        	</div>                         
                        </c:if>                  
                         
                        <div class="summery-section">
                            <div class="payment-details">
                                 <h5>payment details</h5>
                                <table>
                                    <tbody>  
                                 <c:if test="${ empty reservation.payment2 }">  
                                 	<tr>
                                            <td>total room</td>
                                            <td>${reservation.totalrooms } rooms</td>                                          
                                        </tr>   
                                        <tr>
                                            <td>total night</td>
                                            <td>${night } nights</td>                                          
                                        </tr>
                                    	<tr>
                                            <td>room price</td>
                                            <td>$${reservation.netprice }</td>                                          
                                        </tr>
                                        <br>
                                        <tr>
                                            <td>total room price</td>
                                            <td>$${reservation.netprice * reservation.totalrooms * night }</td>                                          
                                        </tr>                                                                                                                   
                                        <tr>
                                            <td>service fees</td>
                                            <td>+ $${reservation.servicefee }</td>
                                        </tr>                                   
                                 </c:if>
                                    	                                   
                                                                     
                                    <c:if test="${not empty reservation.payment2}">  
                                    	<tr>
                                            <td>total room</td>
                                            <td>${reservation.totalrooms } rooms</td>                                          
                                        </tr>   
                                        <tr>
                                            <td>total night</td>
                                            <td>${night } nights</td>                                          
                                        </tr>
                                    	<tr>
                                            <td>room price</td>
                                            <td>$${reservation.netprice }</td>                                          
                                        </tr>
                                        <br>                                       
                                        <tr>
                                            <td>total room price</td>
                                            <td>$${reservation.netprice * reservation.totalrooms * night }</td>                                          
                                        </tr>                                                                                                                    
                                        <tr>
                                            <td>service fees</td>
                                            <td>+ $${reservation.servicefee}</td>
                                        </tr>                                    
                                        <tr>
                                            <td>charge fees</td>
                                            <c:if test="${not empty reservation.chargefee }">
                                            	<td>+ $${reservation.chargefee }</td>
                                            </c:if>                                            
                                            <c:if test="${empty reservation.chargefee }">
                                            	<td>+ $0</td>
                                            </c:if>                                                                                      
                                        </tr>  
                                        <!-- <tr>
                                        	<td>change fees</td>                                            
                                            	<td>+ $${reservation.servicefee }</td>  
                                        </tr> -->                                    
                                    </c:if> 
                                    
                                    <%-- <c:if test="${not empty reservation.payment2 and reservation.reservationstt == 2}"> 
                                    	<tr>
                                            <td>total room</td>
                                            <td>${reservation.totalrooms } rooms</td>                                          
                                        </tr>   
                                        <tr>
                                            <td>total night</td>
                                            <td>${night } nights</td>                                          
                                        </tr>
                                    	<tr>
                                            <td>room price</td>
                                            <td>$${reservation.price } </td>                                          
                                        </tr>                                                                                                                    
                                        <tr>
                                            <td>service fees</td>
                                            <td>+ $${reservation.servicefee }</td>
                                        </tr>                                    
                                        <tr>
                                        <tr>
                                            <td>charge fees</td>
                                            <c:if test="${not empty reservation.chargefee }">
                                            	<td>+ $${reservation.chargefee }</td>
                                            </c:if>                                            
                                            <c:if test="${empty reservation.chargefee }">
                                            	<td>+ $0</td>
                                            </c:if>   
                                        </tr> 
                                    </c:if>   --%> 
                                                                                                                                                
                                    </tbody>
                                </table>
                                <input type="hidden" id="oldPrice" value="${reservation.netprice }" />
                                
                            </div>
                        </div>
                        <div class="summery-section">
                            <div class="payment-details">
                                <table>
                                    <tbody>
                                    <c:if test="${empty reservation.payment2 }">
                                    	<tr>
                                            <td>payable amount</td>
                                            <td class="amount">$${reservation.price + reservation.servicefee }</td>                                           
                                        </tr>
                                    </c:if>
                                    <c:if test="${not empty reservation.payment2 and reservation.reservationstt == 0}">
                                    	<tr>
                                            <td>total amount</td>                         
                                            <td class="amount">$${reservation.price + reservation.servicefee }</td>                                          
                                        </tr>
                                        <c:if test="${not empty oldreservation}">
                                        <tr>
                                        	<td>amount paid</td>
                                        	<%-- <c:if test="${ empty oldreservation}">
                                        		<td class="amount">- $${reservation.price }</td>
                                        	</c:if> --%>
                                               
                                            	<td class="amount">- $${oldreservation.price - oldreservation.chargefee }</td>                                                        	                                                                                	
                                        </tr>
                                        </c:if>
                                        <tr>
                                        	<td>payable amount</td>   
                                            <td class="amount">$${reservation.payment2 }</td>  
                                        </tr>
                                    </c:if>
                                    
                                   <c:if test="${not empty reservation.payment2 and reservation.reservationstt == 2}">                                    	
                                        <tr>
                                        	<td>payable amount</td>   
                                            <td class="amount">$${reservation.price + reservation.servicefee}</td>  
                                        </tr>
                                    </c:if>
                                    
                                    <c:if test="${not empty reservation.payment2 and reservation.reservationstt > 2 }">                                    	
                                        <tr>
                                        	<td>payable amount</td>   
                                            <td class="amount">$${reservation.price + reservation.servicefee}</td>  
                                        </tr>
                                    </c:if>
                                        
                                    </tbody>
                                </table>
                                <c:if test="${ not empty refundamount }">
                                	<input id="refundamount" type="hidden" value="${refundamount }" >
                                </c:if>
                                <%-- <c:if test="${empty reservation.chargefee}">
                                	<input id="refundamount" type="hidden" value="${refundamount }" >
                                </c:if> --%>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 booking-order">
                <div class="summery-box">
                        <h2>room summary</h2>
                        <h6>Customer name: ${reservation.customername }</h6>
                        <h6>Customer phone: ${reservation.customerphone }</h6>
                        <h6>Customer e-mail: ${reservation.customeremail }</h6>
                        <h6>Room type: ${reservation.roomtype.roomstypename }</h6>
                        <input type="hidden" id="roomtypeid" value="${reservation.roomtype.roomstypeid }" />
                        
                        <input type="hidden" id="totalrooms" value="${reservation.totalrooms }" />
                                                                                   
                        <c:if test="${not empty reservationroom }">
                        	<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">Room</th>
						      <th scope="col">Maximum Guest</th>						    
						      <th scope="col">View</th>
						      <th scope="col">Bed</th>
						    </tr>
						  </thead>
						  <tbody>				
						  <c:forEach var="room" items="${reservationroom }">
						  	<tr>
						      <th scope="row">${room.rooms.roomname }</th>
						      <td>${reservation.roomtype.numcusdefault } guests</td>						     
						      <td>${reservation.roomtype.views }</td>
						      <td>${room.rooms.roomtypecontent }</td>
						    </tr>
						  </c:forEach>						    						   
						  </tbody>
						</table>
                       </c:if>
                        <c:choose>
                        
                        	<c:when test="${ reservation.reservationstt == 0}">
                        		<c:if test="${ not empty msg and empty reservation.payment2}">
                        			<h5 style="color: red;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/cancel1.png">${msg }</h5> 
                        		</c:if>                        		
                        	</c:when>
                        	
                        	<c:when test="${ reservation.reservationstt == 2 }">
                        		<h5 style="color: green;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/check-mark.png"> ${msg1 }</h5> 
                        		<c:if test="${ empty reissue }">
                        			<h5 style="color: red;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/cancel1.png"> You cannot change the booking date.</h5>          
                        		</c:if>
                        		<c:if test="${ empty refund }">
                        			<h5 style="color: red;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/cancel1.png"> You cannot refund for this booking.</h5>          
                        		</c:if>
                        	</c:when>
                        	<c:when test="${ reservation.reservationstt == 3 }">
                        		<c:if test="${ not empty msg1 }">
                        			<h5 style="color: green;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/check-mark.png"> ${msg1 }</h5>                        			
                        		</c:if>
                        	</c:when>
                        	<c:when test="${ reservation.reservationstt == 4 }">
                        		<c:if test="${ not empty msg1 }">                        			
                        			<h5 style="color: green;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/check-mark.png"> ${msg1 }</h5>                        			
                        			<c:if test="${not empty reservation.customercomment }">                        				
                        				<div class="leave-comment">
				                            <h4 class="comment">your review:</h4>
				                                <div class="row">
				                                	<div class="form-group col-md-12">
				                                		<h5 style="color: blue;">Score: ${reservation.rating }</h5>
				                                	</div>				                                    
				                                    <div class="form-group col-md-12">
				                                        <textarea class="form-control" id="exampleTextarea" disabled="disabled"
				                                            placeholder="Leave a Comment" rows="4">${reservation.customercomment }</textarea>
				                                    </div>
				                                </div>				                               				             
				                        </div>
                        			</c:if>
                        			<c:if test="${empty reservation.customercomment and countday <= 30 and not empty reservation.account.accountid }">  
                        				<div class="leave-comment">
				                            <h4 class="comment">leave your comment:</h4>
				                            <form method="post" action="${pageContext.request.contextPath }/user/updatecomment">				                            	
				                                <div class="row">
				                                	<div class="form-group col-md-12">
				                                		<input type="number" class="form-control" min="0" max="10" name="rating" required="required" placeholder="Enter score...">
				                                	</div>				                                    
				                                    <div class="form-group col-md-12">
				                                        <textarea class="form-control" id="commentText" required="required"
				                                            placeholder="Leave a Comment" rows="4" name="comment"></textarea>
				                                            <c:if test="${not empty forbidden }">
				                                            	<h5 style="color: red">${forbidden }</h5>
				                                            </c:if>	
				                                            <br>
				                                         <div id="checkWord"></div>			                                            
				                                    </div>
				                                </div>
				                                  <input type="hidden" name="revId" value="${reservation.reservationid }">
				                                <div class="submit-btn" style="padding-left: 352px">
				                                    <button class="btn btn-solid" type="submit" id="submitPost">post comment</button>
				                                </div>				                            
				                            </form>
				                        </div>
                        			</c:if>
                        			
                        	<c:if test="${not empty reservation.replyfromhotel }">                        			
				                  <div class="comment-section" style="margin-left: 30px">                        				
				                            <h5 class="comment">Reply from ${reservation.roomtype.hotel.hotelname }:</h5>
				                            <div class="comment-wrapper">
				                                <div class="comment-box">          
				                      <div class="media inner-comment">
                                        <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/hotel-sm.png" class="img-fluid blur-up lazyload"
                                            alt="">
                                        			<div class="media-body">                                            		
                                            <div class="comment-detail">                                               
                                                <h6 style="color: blue; margin-left: 10px">${reservation.replyfromhotel }</h6>
                                           </div>                                            
                                        			</div>
                                    			</div>
				                    		</div>
				                    	</div>
				                    </div>                               				                      				
                        			</c:if>
                        		</c:if>
                        	</c:when>
                        	<c:when test="${ reservation.reservationstt == 5 }">
                        		<c:if test="${ not empty msg }">
                        			<h5 style="color: red;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/cancel1.png"> ${msg }</h5>                        			
                        		</c:if>
                        	</c:when>
       						<c:when test="${ reservation.reservationstt == 6 }">
                        		<c:if test="${ not empty msg1 }">
                        			<h5 style="color: green;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/check-mark.png"> ${msg1 }</h5>                        			
                        		</c:if>
                        	</c:when>
                        	                 	
                        	<c:when test="${ reservation.reservationstt == 7 }">
                        		<c:if test="${ not empty msg1 }">
                        			<h5 style="color: green;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/check-mark.png"> ${msg1 }</h5>          			
                        			<h5 style="color: blue;">Refund amount: $${reservation.price + reservation.servicefee - refundamount}</h5>
                        			<h5 style="color: blue;">Refund fee: $${refundamount}</h5>                        			
                        		</c:if>
                        	</c:when>
                        	
                        	
                        	<c:when test="${ reservation.reservationstt == 8 }">
                        		<c:if test="${ not empty msg}">
                        			<h5 style="color: red;"><img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/cancel1.png"> ${msg }</h5> 
                        		</c:if>
                        	</c:when>
                        
                        </c:choose>     
                  </div> 
                   
                  <div class="summery-box"> 
                  
                  	<c:choose>
                  		<c:when test="${reservation.reservationstt == 0 }">             		
                  			<!-- payment new booking -->
                  			<c:if test="${ empty msg and empty reservation.reservationidcode and empty reservation.payment2 }">                 				
                  				<div class="payment-btn" style="padding-left: 160px"> 
                            	<form method="post" action="${posturl }">
									<input type="hidden" name="upload" value="1" /> 
									<input type="hidden" name="return" value="${returnurl }" /> 
									<input type="hidden" name="cmd" value="_cart" /> 
									<input type="hidden" name="business" value="${business }" />	
														
									
									<c:forEach var="item" items="${reservationroom }" varStatus="i" begin="0" end="0"> 
										<input type="hidden" name="item_number_${i.index + 1 }" value="${item.reservation.reservationid }">
										<input type="hidden" name="item_name_${i.index + 1 }" value="${item.reservation.reservationid  }">
										<input type="hidden" name="quantity_${i.index + 1 }" value="1">
										<input type="hidden" name="amount_${i.index + 1 }" value="${item.reservation.price + item.reservation.servicefee }">
									</c:forEach>
					                <button class="btn btn-solid color1" type="submit" value="${reservation.reservationid}">
		                            			pay now</button> 
		                            <a href="${pageContext.request.contextPath }/user/confirm/paylater?reservationid=${reservation.reservationid}">
                                      <input type="button" class="btn btn-solid color1" value="PAY LATER"></a>                        	
                         		  
                                     <input type="button" class="btn btn-solid color1" value="CANCEL" class="btn btn-solid" data-toggle="modal" data-target="#confirmModal">
		  						    </form> 
                            	
                               </div>
                  			</c:if>
                  			
                  			<!-- payment change date -->
                  			<c:if test="${ empty msg and not empty reservation.reservationidcode and not empty reservation.payment2}">
                  				<div class="payment-btn" style="padding-left: 290px">   
                  				<form method="post" action="${posturl }">
									<input type="hidden" name="upload" value="1" /> 
									<input type="hidden" name="return" value="${returnurl }" /> 
									<input type="hidden" name="cmd" value="_cart" /> 
									<input type="hidden" name="business" value="${business }" />	
														
									
									<c:forEach var="item" items="${reservationroom }" varStatus="i" begin="0" end="0"> 
										<input type="hidden" name="item_number_${i.index + 1 }" value="${item.reservation.reservationid }">
										<input type="hidden" name="item_name_${i.index + 1 }" value="${item.reservation.reservationid  }">
										<input type="hidden" name="quantity_${i.index + 1 }" value="1">
										<input type="hidden" name="amount_${i.index + 1 }" value="${item.reservation.payment2}">
									</c:forEach>
					                <button class="btn btn-solid color1" type="submit" value="${reservation.reservationid}">
		                            			pay now</button>
		                            <input type="button" class="btn btn-solid color1" value="CANCEL" class="btn btn-solid" data-toggle="modal" data-target="#confirmModal">  
		  						    </form>               				     
                               </div>                  			
                  			</c:if>
                  			
                  			<!-- payment hold booking  -->
                  			<c:if test="${ empty msg and not empty reservation.reservationidcode and empty reservation.payment2}">                 				
                  				<div class="payment-btn" style="padding-left: 290px">   
                  				<form method="post" action="${posturl }">
									<input type="hidden" name="upload" value="1" /> 
									<input type="hidden" name="return" value="${returnurl }" /> 
									<input type="hidden" name="cmd" value="_cart" /> 
									<input type="hidden" name="business" value="${business }" />	
														
									
									<c:forEach var="item" items="${reservationroom }" varStatus="i" begin="0" end="0"> 
										<input type="hidden" name="item_number_${i.index + 1 }" value="${item.reservation.reservationid }">
										<input type="hidden" name="item_name_${i.index + 1 }" value="${item.reservation.reservationid  }">
										<input type="hidden" name="quantity_${i.index + 1 }" value="1">
										<input type="hidden" name="amount_${i.index + 1 }" value="${item.reservation.price + item.reservation.servicefee }">
									</c:forEach>
					                <button class="btn btn-solid color1" type="submit" value="${reservation.reservationid}">
		                            			pay now</button>
		                            <input type="button" class="btn btn-solid color1" value="CANCEL" class="btn btn-solid" data-toggle="modal" data-target="#confirmModal">  
		  						    </form>               				     
                               </div>
                  			</c:if>
                  		</c:when>
                  	
                  		<c:when test="${reservation.reservationstt == 2 }">
                  			<c:if test="${not empty reissue and not empty refund}">
                  				<div class="payment-btn" style="padding-left: 250px">   
                      	 			<input type="button" class="btn btn-solid color1" id="changedate" value="CHANGE DATE" data-toggle="collapse" data-target="#collapseChange" aria-expanded="false" aria-controls="collapseChange">                     
                      				<input type="button" class="btn btn-solid color1" id="refundBtn" value="REFUND" data-toggle="collapse" data-target="#collapseRefund" aria-expanded="false" aria-controls="collapseRefund"> 
                      			</div>                       			                			
                  			</c:if>
                  			<c:if test="${not empty refund and  empty reissue}">
                  				<div class="payment-btn" style="padding-left: 410px">                     	 							                        
                            		<input type="button" class="btn btn-solid color1" id="refundBtn" value="REFUND" data-toggle="collapse" data-target="#collapseRefund" aria-expanded="false" aria-controls="collapseRefund"> 
                        		</div>
                  			</c:if>
                  			<c:if test="${empty refund and not empty reissue}">
                  				<div class="payment-btn" style="padding-left: 410px">                     	 							                        
                            		<input type="button" class="btn btn-solid color1" id="changedate" value="CHANGE DATE" data-toggle="collapse" data-target="#collapseChange" aria-expanded="false" aria-controls="collapseChange">                     
                        		</div>
                  			</c:if>
                  		</c:when>
                  	</c:choose>            
                     
                     <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      	<div class="modal-body" style="font-size: 20px">
					         Are you sure to want to cancel booking?
					       </div>					      					      					      
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-success" onclick="window.location.href='${pageContext.request.contextPath }/user/cancelbooking?reservationid=${reservation.reservationid }'" >Confirm</button>
					      </div>
					    </div>
					  </div>
					</div>
  				<br>
  				 <div class="collapse" id="collapseChange">
  							<div class="card card-body">
  						    <h2>Change date</h2>  
  						    <div class="form-group">
  						    	<label for="checkin">Check in</label>
  						    	<input type="text" class="form-control" required="required"
											id="timeCheckIn" value="${in }" placeholder="Check In" name="checkin"/> 						    
  						    </div>
  						    <input type="hidden" id="contract" value="${reservation.contractinfo.contractid }">
  						    
  						    <c:if test="${reissue > 0}">
  						   		<h5 style="color: blue;">You will be charge ${reissue }% booking payment!</h5>
  						   		<h5 style="color: green;">Your charge fee: ${chargefee} </h5> 						
  						   </c:if>  
  						    <c:if test="${reissue == 0}">
  						   		<h5 style="color: blue;">You will not be charged for change date!</h5> 						   		
  						   </c:if>						   
  						    <div id="checkRoom"></div>
  						   <div class="form-group">
  						    <!-- <label for="checkout">Check out</label> -->
  						    	<input type="hidden" class="form-control" required="required"
											id="timeCheckOut" value="${out }" placeholder="Check Out" name="checkout" disabled="disabled"/>  						 
  						   </div>  						  
  						    	<div class="payment-btn" style="padding-left: 365px">
  						    	<input type="submit" id="confirmchange" data-toggle="modal" data-target="#confirmChange"
				                        class="btn btn-solid color1" value="CONFIRM">
				                </div>
  							</div>
  				</div>
  				<br>
  				<div class="collapse" id="collapseRefund">
  					<div class="card card-body">
  							<input type="hidden" value="${reservation.price + reservation.servicefee - refundamount}" id="totalrefund"> 
  						    <h2>Refund</h2>  
  						    <div class="form-group">
  						    <label for="reason">Please, let us know your reason!</label>
  						    	<select class="form-control" id="reason">
  						    		<option value="-1" selected="selected" disabled="disabled">---Select one---</option>
  						    		<option value="0">Personal</option>
  						    		<option value="1">Force Majeure</option>
  						    	</select>  						   
  						   </div>
  						   <div id="showResult"></div> 						  
  						    	<div class="payment-btn" style="padding-left: 365px">
  						    	<input type="submit" id="confirmrefund" data-toggle="modal" data-target="#confirmRefund"
				                        class="btn btn-solid color1" value="CONFIRM">
				                </div>            
  					</div>
  				</div>
  				
					  				
					
					<!-- Modal Refund-->
					<div class="modal fade" id="confirmRefund" tabindex="-1" role="dialog" aria-labelledby="confirmRefundLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <c:if test="${refundamount == 0.0 }">
					      	<div class="modal-body" style="font-size: 20px">
					         Are you sure to want a refund?
					       </div>
					      </c:if>
					      <c:if test="${refundamount > 0.0 }">
					      	<div class="modal-body" style="font-size: 20px">
					         Are you sure you want to be charged ${refund }% of the amount paid for the refund?
					       </div>
					      </c:if>					      
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath }/user/confirmRefund?reservationid=${reservation.reservationid}&refund=${refund }'" >Confirm</button>
					      </div>
					    </div>
					  </div>
					</div>
  				
  				
  				<!-- Modal change date-->
					<div class="modal fade" id="confirmChange" tabindex="-1" role="dialog" aria-labelledby="confirmChangeLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      
					      <!-- form change date -->
					      <form method="get" action="${pageContext.request.contextPath }/user/changdatebooking">
					      	
					      	<%-- <input type="hidden" name="upload" value="1" /> 
							<input type="hidden" name="return" value="${returnurl2 }" /> 
							<input type="hidden" name="cmd" value="_cart" /> 
							<input type="hidden" name="business" value="${business }" />
					      	
					      	<c:forEach var="item" items="${reservationroom }" varStatus="i" begin="0" end="0"> 
									<input type="hidden" name="item_number_${i.index + 1 }" value="${item.reservation.reservationid }">
									<input type="hidden" name="item_name_${i.index + 1 }" value="${item.reservation.reservationid  }">
									<input type="hidden" name="quantity_${i.index + 1 }" value="1">
									<input type="hidden" id="paypalnewprice" name="amount_${i.index + 1 }" value="${paypalnewprice }" >
							</c:forEach> --%>
					      	
					      	<input type="hidden" id="payment1" value="${reservation.payment1 }">
					      	<input type="hidden" name="reservationid" value="${reservation.reservationid }">
					      	<input type="hidden" id="checkindate" name="checkin">
					      	<input type="hidden" id="checkoutdate" name="checkout">
					      	<input type="hidden" id="priceDif" name="priceDif" value="${priceDif }"/> 
					      	<input type="hidden" id="chargefee" name="chargefee" value="${chargefee }"/> 
					      	<input type="hidden" id="roompricenew" name="roompricenew" value="${roompricenew }"/> 
					      	<c:if test="${chargefee == 0.0 }">
						      	<div class="modal-body" style="font-size: 20px">
						         Are you sure to want to change date?
						       </div>
						      </c:if>
						      <c:if test="${chargefee > 0.0 }">
						      	<div class="modal-body" style="font-size: 20px">
						         Are you sure you want to be charged ${reissue }% of the amount paid for the change date?
						       </div>
						      </c:if>					      
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>						   						   
						        <button type="submit" class="btn btn-primary">Confirm</button>
						      </div>					      
					      </form>	
				      									      								      
					    </div>
					  </div>
					</div> 				
  				</div>
                </div>
            </div>
        </div>
    </section>
    <!-- booking section end -->
	</jsp:attribute>
</mt:userTemplate>

<script>
		
  $(document).ready(function() {	
	  document.querySelector('#confirmrefund').disabled = true;
	  $("#reason").change(function () {
	        var reason = this.value;
	        var roomtypeid = $("#roomtypeid").val();
	        var checkindate = $("#getin").val();	
	        var refundamount = $("#refundamount").val();
	        var totalrefund = $("#totalrefund").val();
	       
	        if(reason == "0"){	  	        	
	        	$.ajax({
					  type:'GET',
					  url:'${pageContext.request.contextPath }/ajaxuser/ajaxCheckRefund',				  
					  data: {						
						  roomtypeid:roomtypeid,
						  checkindate: checkindate					  
						},					
					  dataType: 'json',
					  success: function(refund){							  
							  var r='';									 
							  if(refund  > 0) {								
							  for(var i=0;i<refund.length;i++){									
								r+='<h5 style="color: blue;">You will be charge ' + refund[i] + '% booking payment!</h5>'	
								r+='<h5 style="color: green;">Refund amount: $' + totalrefund + '</h5>'
								r+='<h5 style="color: green;">Refund fee: $' + refundamount + '</h5>'
							 }							
							  $('#showResult').html(r); 
							  document.querySelector('#confirmrefund').disabled = false;
							 } else {								  
								  $('#showResult').html('<h5 style="color: blue;">You will not be charged for refunds!</h5>'
								  +'<h5 style="color: green;">Refund amount: $' + totalrefund + '</h5>'
								  + '<h5 style="color: green;">Refund fee: $' + refundamount + '</h5>')							 						
								  document.querySelector('#confirmrefund').disabled = false;
							  }							
					  }					  
				});
	        	
	        }
	        else if(reason == "1") {
	        	var hotelname = $("#hotelname").val();	        	
	        	$('#showResult').html('<h5 style="color: blue;">Please, Contact the hotel with the following information:</h5>' +
	        	 '<h6 style="color: green;">Hotel: ' + hotelname + '</h6>' +
	        	 '<h6 style="color: green;">E-mail: customerservice@email.com</h6>' +
	        	 '<h6 style="color: green;">Tel: 1900 8080'); 	        
	        	document.querySelector('#confirmrefund').disabled = true;
	        }	        
	    });
	
	  
	  $("#timeCheckIn").on('changeDate', function(){
		  var roomtypeid = $("#roomtypeid").val();
		  var checkindate = $("#timeCheckIn").val();		  
		  var night = $("#night").val();
		  var totalrooms = $("#totalrooms").val();
		  var contractid = $("#contract").val();
		  var oldPrice = $("#oldPrice").val();
		  var chargefee = $("#chargefee").val();
		  
		   $.ajax({
			  type:'GET',
			  url:'${pageContext.request.contextPath }/ajaxuser/ajaxCheckRoomChange',				  
			  data: {						
				  roomtypeid:roomtypeid,
				  checkindate: checkindate,
				  night: night,
				  totalrooms: totalrooms,
				  contractid: contractid,
				  oldPrice: oldPrice,				 
				  chargefee: chargefee
				},					
			  dataType: 'json',
			  success: function(rooms){		
				 
				  if(totalrooms > rooms.availableroom){
					  $('#checkRoom').html('<h5 style="color: red;">Room not avaible!</h5>');
				  }else{					  
						if(chargefee > 0)  {
							var total = rooms.payment2+chargefee;
							 var diff = rooms.priceDif
							$('#checkRoom').html('<h5 style="color: #cccc00;">New booking available: </h5>'	
									  + '<h5 style="color: orange;">Checkin: ' + rooms.checkindate + '</h5>'
									  + '<h5 style="color: orange;">Checkout: ' + rooms.checkoutdate + '</h5>'
									  + '<h5 style="color: orange;">Price Difference: $' + rooms.priceDif  +'</h5>'
									  + '<h5 style="color: orange;">Service fee: $3 </h5>');							
									  //+ '<h5 style="color: orange;">Total payment: $' + total + '</h5>'); 
						}else{
							 $('#checkRoom').html('<h5 style="color: #cccc00;">New booking available: </h5>'	
									  + '<h5 style="color: orange;">Checkin: ' + rooms.checkindate + '</h5>'
									  + '<h5 style="color: orange;">Checkout: ' + rooms.checkoutdate + '</h5>'
									  + '<h5 style="color: orange;">Price Difference: $' + rooms.priceDif  +'</h5>'
									  + '<h5 style="color: orange;">Service fee: $3 </h5>');							
									  //+ '<h5 style="color: orange;">Total payment: $' + rooms.payment2 + '</h5>');
						}
					  
						  $("#priceDif").val(rooms.priceDif);
						  $("#checkindate").val(rooms.checkindate);
						  $("#checkoutdate").val(rooms.checkoutdate);
						  $("#roompricenew").val(rooms.showprice);						  
						  $("#paypalnewprice").val(rooms.payment2);	
						  
			     }
			 }
		});  
	 });
	  
	 $("#commentText").keyup(function(){	 
		 var comment = $(this).val();
		     if (comment.length < 5) {
		        $('#checkWord').html('<h5 style="color: red;">Minimum 10 words!</h5>');
		        document.querySelector('#submitPost').disabled = true;			        	
		     }else {
		        $('#checkWord').html('');
		        document.querySelector('#submitPost').disabled = false;	
		     } 
	 });
	 
	 
	 function checkValue(value, arr) {
		    var status = false;
		    for (var i = 0; i < arr.length; i++) {
		        var name = arr[i];
		        if (name == value) {
		        	status = true;		        		           
		            break;
		        }
		    }
		    return status;
		}
  
  });
</script>




