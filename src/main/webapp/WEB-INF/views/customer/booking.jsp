<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

   
<mt:userTemplate>	
	<jsp:attribute name="content">
	 <!--    country code-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/intlTelInput.css">
	<style type="text/css">
		.required:after {
		   content:" *";
		   color: red;
		},
		.error-test {
			font-family: sans-serif;		
			font-size: 10px;
			font-style: italic;
			font-weight: bold;
			color: red;
		}
		 
	</style>
	      <!-- breadcrumb start -->
    <section class="breadcrumb-section pt-0">
    <c:forEach var="img" items="${reservation.roomtype.roomtypeimages }">
         <img src="${pageContext.request.contextPath }/uploads/room/${img.roomtypeimagename}" class="bg-img img-fluid blur-up lazyload" alt="">
    </c:forEach>  
        <%-- <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/inner-pages/bg-bread.jpg" class="bg-img img-fluid blur-up lazyload" alt=""> --%>
        <div class="breadcrumb-content">
            <div>
                <h2>review</h2>
                <nav aria-label="breadcrumb" class="theme-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/home">Home</a></li>
                        <li class="breadcrumb-item">hotels</li>
                        <li class="breadcrumb-item active">review</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="title-breadcrumb">Rica</div>
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
         <s:form method="post" modelAttribute="reservation" action="${pageContext.request.contextPath }/user/createbooking">
          <h5 style="color: red;">${msg }</h5>  
            <div class="row">                  
             <div class="col-lg-7">
                    <div class="guest-detail">
                        <h2>Customer Information</h2>                         
                        <s:hidden path="contractinfo" />   
                        <s:hidden path="account" />                                                                                                                                     
                        <s:hidden path="checkin" />
                        <s:hidden path="checkout" />
                        <s:hidden path="totalrooms" /> 
                        <s:hidden path="roomtype" />
                        <s:hidden path="reservationstt" />
                        <s:hidden path="netprice" />
                        <s:hidden path="price" />
                        <s:hidden path="servicefee" />
                        <s:hidden path="createday" />
                        <s:hidden path="createby" />
                        <s:hidden path="deadline" />
                        <s:hidden path="bookingchannels" />
                            <div class="form-group">
                                <div class="row">
                                    <div class="col first-name">                                 
                                    <label class="required">Full name</label>
                                    <c:choose>
                                    	<c:when test="${not empty account }">
                                    	   <input id="accname" type="text" value="${account.accountname }" class="form-control" placeholder="Fullname" required="required" />                  
                                    	</c:when>
                                    	<c:when test="${empty account }">
                               				<s:input name="fullname" id="fullname" type="text" path="customername" class="form-control" placeholder="Fullname" required="required" />      	                                   		                                   		                                   		                                   		                                   
                                    	</c:when>
                                    </c:choose>
                                    <div id="errorName"></div>                                    
                                    </div>                                 
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="required">Email address</label>
                                <s:input type="email" name="email" id="cusEmail" path="customeremail" class="form-control" placeholder="Enter email" required="required" />
                                <small id="emailHelp" class="form-text text-muted">Booking confirmation will be sent to
                                    this email ID.</small> 
                                <div id="errorEmail"></div>                                
                            </div>
                            
                            <div class="form-group">
                                <label class="required">Contact info</label>
                                <s:input path="customerphone" name="phone" id="cusPhone" class="form-control" placeholder="Enter phone" required="required" />                                                    
                            	<div id="errorPhone"></div> 
                            </div> 
                                                                            
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Special request</label>
                                <s:textarea class="form-control" path="note" rows="3"
                                    placeholder="e.g.. early check-in, airport transfer"></s:textarea>
                            </div> 
						<c:if test="${not empty account }">
							<div class="form-group" style="margin-bottom: 0px">
						    <div class="checkbox">
						      <label data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
						        <input type="checkbox"/> Please tick if you are making this booking for someone else!
						      </label>
						    </div>
						  </div>
						  <div id="collapseOne" aria-expanded="false" class="collapse">
						       <div class="card-body" style="padding-top: 10px">
						       <h5>Guest information</h5>
                                       <form>
                                            <div class="form-group">
                                                 <label class="required" for="c-name">Full name</label>
                                                 <s:input type="text" class="form-control" id="c-name" path="customername" />                                              
                                            </div>                                                                                                                                                     
                                       </form>
                                  </div>
						  	</div>	
						  </c:if>						  					                                                                       
                    </div>
                </div>
             <div class="col-lg-5 booking-order">
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
                                <p>${reservation.roomtype.hotel.ward.wardname}, ${reservation.roomtype.hotel.ward.city.cityname}, ${reservation.roomtype.hotel.ward.city.province.provincename }</p>
                            </div>
                        </div>
                        <div class="summery-section">
                            <div class="box">
                                <div class="left">
                                    <div class="up">
                                        <h6>check in</h6>                                       
                                        <h5>${checkin }</h5>
                                    </div>
                                    <div class="down">
                                        <h6>check in time</h6>
                                        <h5>2.00 pm</h5>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="up">
                                        <h6>check out</h6>                                   
                                        <h5>${checkout }</h5>
                                    </div>
                                    <div class="down">
                                        <h6>check out time</h6>
                                        <h5>12.00 pm</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="summery-section">
                            <h5 class="mb-0">${reservation.totalrooms } ${reservation.roomtype.roomstypename }, Maximum: ${reservation.roomtype.numcusdefault * reservation.totalrooms } guest, ${night } night</h5>                                                      
                            <a href="${pageContext.request.contextPath }/page/hotel/hotelbook?hotelid=${reservation.roomtype.hotel.hotelid}&checkin=${checkin }&checkout=${checkout }&room=${reservation.totalrooms}&guest=2" class="edit-cls">edit</a>                            
                        </div> 
                        <div class="summery-section">
                        <div class="payment-details">  
                        <h5>Bed reference (if available)</h5>                      
                         	<c:forEach var="type" items="${typebed }">                      
                        		<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="typebed" value="${type }">
								  <label class="form-check-label" for="typebed" style="font-size: 16px">${type }</label>
								</div>
                        	</c:forEach>
                        	<s:hidden path="paymentsnote1" id="settypebed"/>
                        </div>                       
                        </div>
                        <div class="summery-section">
                            <div class="payment-details">                          
                                <h5>policies details</h5>
                                <c:forEach var="policy" items="${listpolicies }">                                 	
                                	 <h6>* ${policy.policiescontent }</h6> 
                                	 <br>
                                </c:forEach>                               
                            </div>
                        </div>                       
                        <div class="summery-section">
                            <div class="payment-details">                          
                                <h5>payment details</h5>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>room price</td>
                                            <td>$${reservation.price } </td>
                                        </tr>                                       
                                        <tr>
                                            <td>service fees</td>
                                            <td>+ $${reservation.servicefee }</td>
                                        </tr>                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="summery-section">
                            <div class="payment-details">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>payable amount</td>
                                            <td class="amount">$${reservation.price  + reservation.servicefee }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                         <div class="summery-section">
                         <div class="box">
                         <div class="right" style="width: 530px">
                         	<div class="submit-btn">
                         		<button type="button" class="btn btn-solid" data-toggle="modal" data-target="#confirmModal"
                                    >cancel</button>
                                <button class="btn btn-solid" type="submit" id="booknow"
                                    >book now</button>                               
                            </div>
                        </div> 
                        </div>
                         </div> 
                    </div>                    
                </div>                                         
            </div>
        </s:form> 
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
					         Are you sure to want to cancel?
					       </div>					      					      					      
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-success" onclick="window.location.href='${pageContext.request.contextPath }/home'" >Confirm</button>
					      </div>
					    </div>
					  </div>
					</div>
        </div>
    </section>
    <!-- booking section end -->        
	</jsp:attribute>
</mt:userTemplate>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>  
<script>

	$(document).ready(function() {	
		
		$('input[name="typebed"]').click(function () {
	        var value = $('input[name="typebed"]:checked').val();
	        $("#settypebed").val(value);	
	    });	

	$('#fullname').keyup(function(){
		 var fullname = document.getElementById("fullname").value;
		 var regExName=/^[a-zA-Z ]*$/;
	     if(fullname.length < 3){
			 $('#errorName').html('<span class="error-test" style="color: red; font-size: 16px;">Fullname must at least 2 characters</span>');
			 document.querySelector('#booknow').disabled = true;
	     }else if (!regExName.test(fullname)){
		    $('#errorName').html('<span class="error-test" style="color: red; font-size: 16px;">Fullname must consists of only characters and separated by spaces</span>');
		    document.querySelector('#booknow').disabled = true;
	     }else{
	    	 $('#errorName').html('');
	    	 document.querySelector('#booknow').disabled = false;
	     } 
	});
	
	$('#cusPhone').keyup(function(){
		var phone = document.getElementById("cusPhone").value;
		var regExNumber = /^[0-9]+$/
		     if(phone.length != 10){
		         $('#errorPhone').html('<span class="error-test" style="color: red; font-size: 16px;">Phone must be 10 numbers!</span>'); 		         
		         document.querySelector('#booknow').disabled = true;
		     }else if(!regExNumber.test(phone)){
		         $('#errorPhone').html('<span class="error-test" style="color: red; font-size: 16px;">Phone must be consists of only numbers!</span>');  
		         document.querySelector('#booknow').disabled = true;
		     }else{
		    	 $('#errorPhone').html('');
		    	 document.querySelector('#booknow').disabled = false;
		     }		
	});
	
	$('#cusEmail').keyup(function(){
		var email = document.getElementById("cusEmail").value;
		var regExEmail = /^\w+([\.]?\w+)+@\w+([\.:]?\w+)+(\.[a-zA-Z0-9]{2,3})+$/; 
			 if(email.length < 5){
				 $('#errorEmail').html('<span class="error-test" style="color: red; font-size: 16px;">This field is required!</span>');  
				 document.querySelector('#booknow').disabled = true;
			 }
			 else if(!regExEmail.test(email)){
		         $('#errorEmail').html('<span class="error-test" style="color: red; font-size: 16px;">Invalid e-mail!</span>'); 
		         document.querySelector('#booknow').disabled = true;
		     }else{
		    	 $('#errorEmail').html('');
		    	 document.querySelector('#booknow').disabled = false;
		     }		
	});
	
});
	
</script>


