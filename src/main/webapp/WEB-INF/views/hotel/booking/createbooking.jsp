<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:hotelTemplate>
	<jsp:attribute name="content">

                <!-- Container-fluid starts-->
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <!--Hotel detail start-->
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Add New Booking</h5>
                                        </div>
                                        <div class="card-body">
                                            <form class="theme-form mega-form">
                                                <div class="mb-3">
                                                   <label class="form-label-title">Type Booking</label>													
													<select class="form-control" id="showcontract" >
														<option selected value="0" class="form-control">Non Contract</option>
														<option value="1" class="form-control">Contract</option>
	                                                </select>
                                                </div>
												<div class="mb-3" style="display: none" id="showlistcontract">
                                                   <label class="form-label-title">Contract Info</label>
                                                   <span id="showerrorlistcontract" style="color: #ef3f3e"></span>													
													<select class="form-control" name="contractid" id="contractid">									
														<option selected disabled="disabled" value="-1">Please Choose Contract</option>
														<c:forEach var="c" items="${ contractinfos}">
														<option value=${ c.contractid} class="form-control"> ${ c.contractname}</option>
														</c:forEach>												
                                               		</select>
                                                </div>
 												<div class="row g-3" style="margin-bottom: 16px">
                                                    <div class="col-sm-6 ">
	                                                    <div class="col-sm-12" >
	                                                    	 <label class="form-label-title">Check-In</label>	
                                                         	<fmt:formatDate var="fd" value="${checkin }" pattern="dd-MM-yyyy" />	
                                                         	<input placeholder="Checkin Date"value="${fd }"style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"									
															id="checkin" name="checkin"  />
	                                                    </div>
                                                        <div class="col-sm-12" >
                                                          	<span id="showerrorcheckin" style="color: #ef3f3e"></span>	
                                                         	<fmt:formatDate var="fd" value="${checkin }" pattern="dd-MM-yyyy" />	
	                                                    </div>
				 																	
                                                    </div>

                                                    <div class="col-sm-6 ">
	                                                    <div class="col-sm-12" >
		                                                    <label class="form-label-title">Check-Out</label>	
	                                                        <fmt:formatDate var="fd" value="${checkout }" pattern="dd-MM-yyyy" />	
	                                                        <input placeholder="Checkout Date"value="${fd }"style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"									
															id="checkout" name="checkout" />
	                                                    </div>
                                                        <div class="col-sm-12" >
	                                                        <span id="showerrorcheckout" style="color: #ef3f3e"></span>	
	                                                    </div>
                                                    </div>

                                                </div>
    
                                                <div class="row g-3" style="margin-bottom: 16px">
                                                    <div class="col-sm-6" id="showlistroomype">
	                                                    <div class="col-sm-12" >
			                                                    	<label class="form-label-title">Room Type:</label>												
																	<select class="form-control" name="roomtypeid" id="roomtypeid" >												
																	<option selected disabled="disabled" value="-1">Please Choose Room Type</option>
																	<c:forEach var="c" items="${ roomtypes}">
																	<option value=${ c.roomstypeid} class="form-control"> ${ c.roomstypename}</option>
																</c:forEach>												
		                                               			</select>
	                                                    </div>
                                                        <div class="col-sm-12" >
                                                        <span id="showerrorroomtype" style="color: #ef3f3e"></span>
                                                        </div>																
                                                    </div>

                                                    <div class="col-sm-6">
	                                                    <div class="row">
	                                                    	<div class="col-sm-5" >
			                                                    <label class="form-label-title">Quantity:</label>					
																<input type="text" value="0" style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"									
																	id="quantity" name="quantity" />
		                                                    </div>
		                                                    <div class="col-sm-3" style="padding: 45px 0px 0px 0px">		
		                                                    
																<input type="radio"	id="allbed" value="2" name="bed" checked/><lable style="font-size: 16px; font-weight: 600;">&nbsp;No Choose </lable>	
   																							
		                                                    </div>
		                                                    <div class="col-sm-2" style="padding: 45px 0px 0px 0px">		
		                                                    
																<input type="radio"	id="twinbed" value="1" name="bed" /><lable style="font-size: 16px; font-weight: 600;">&nbsp; Twin</lable>	
   																							
		                                                    </div>
		                                                    <div class="col-sm-2" style="padding: 45px 0px 0px 0px">	
		                                                		
																<input type="radio"	id="doublebed" value="0" name="bed" /><lable style="font-size: 16px; font-weight: 600;">&nbsp;Double</lable>																								
		                                                    </div>
	                                                    </div>
	                                                    <div class="row">
	                                                    	<div class="col-sm-12" >
	                                                        <span id="showerrorquantity" style="color: #ef3f3e"></span>	
	                                                        </div>
	                                                    </div>
	                                                    
                                                        
                                                    </div>
                                                </div>
                                                  <div class="row g-3" style="margin-bottom: 16px">
                                                    <div class="col-sm-6" >
	                                                    <div class="col-sm-12" >
	                                                    	<label class="form-label-title">Base Price:</label>									
															<input type="text" style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"									
														id="price" readonly />	
														<input type="hidden" id="price1" name="price" />		 							
														
	                                                    </div>
                                                     	<div class="col-sm-12" >                                                    
                                                   			<span id="showerrorprice" style="color: #ef3f3e"></span>													
                                                    	</div>														
                                                    </div>

                                                    <div class="col-sm-6">
	                                                    <div class="col-sm-12" >
	                                                    <label class="form-label-title">DeadLine:</label>	
	                                                    	<fmt:formatDate var="fd" value="${checkin }" pattern="dd-MM-yyyy" />	
                                                         	<input placeholder="Deadline Date"value="${fd }"style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"									
															id="Deadline" name="Deadline"  />
	                                                    </div>
                                                          <div class="col-sm-12">
                                                         <span id="showerrordeadline" style="color: #ef3f3e"></span>	
                                                    </div>
                                                    </div>
                                                </div>
                                                	<div class="mb-3">
                                                   <div class="col-sm-12" >
	                                                     	<label class="form-label-title">CusTomer Name:</label>								
															<input type="text" style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"									
															id="customername" name="customername" />	
														 </div>	
														 <div class="col-sm-12" >                                                     	
                                                   			<span id="showerrorcustomername" style="color: #ef3f3e"></span>																																							
                                                    	</div>
                                                </div>
                                                <div class="row g-3" style="margin-bottom: 16px">
                                                    <div class="col-sm-6" >
                                                    	<div class="col-sm-12" >
	                                                     	<label class="form-label-title">CusTomer Email:</label>								
															<input type="text" style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"									
															id="customeremail" name="customeremail" />	
														 </div>	
														 <div class="col-sm-12" >                                                     	
                                                   			<span id="showerrorcustomeremail" style="color: #ef3f3e"></span>																																							
                                                    	</div>														
                                                    </div>

                                                    <div class="col-sm-6">
                                                     	<div class="col-sm-12" >
	                                                         <label class="form-label-title">CusTomer Phone:</label>										
															<input type="text" style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"									
															id="customerphone" name="customerphone" />
														 </div>
														 <div class="col-sm-12">
                                                  		 	<span id="showerrorcustomerphone" style="color: #ef3f3e"></span>										
                                                    	</div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                   <label class="form-label-title">Note:</label>													
													<textarea id="note" name="note" rows="4" cols="50"
													style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
													></textarea>
                                                </div>
                                                
                                                
                                             <input type="hidden" name="hotelid" id="hotelid" value="${hotelid }">
 											<input type="hidden" name="checkquantity" id="checkquantity" value="1">
 											<input type="hidden" name="checkname" id="checkname" value="1">
 											<input type="hidden" name="checkphone" id="checkphone" value="1">
 											<input type="hidden" name="checkroomtype" id="checkroomtype" value="1">
 											<input type="hidden" name="checkprice" id="checkprice" value="1">
 											<input type="hidden" name="checkdeadline" id="checkdeadline" value="0">
 											<input type="hidden" name="checkcheckin" id="checkcheckin" value="0">	
 											<input type="hidden" name="checkcheckout" id="checkcheckout" value="0">	
 											<input type="hidden" name="checkcontract" id="checkcontract" value="1">
 											<input type="hidden" name="checkemail" id="checkemail" value="1">
 											<input type="hidden" name="maxquantity" id="maxquantity" value="0">		
 											<div class="card-footer text-end" id="showbutton">
			
	                                            <input class="btn btn-primary me-3" type="button" value="Add New Reservation" id="dd">
                                        	</div>
                                                
                                            </form>
                                            
                                        </div>
										</div>
										</div>
                                    </div>
                                    <!--Hotel detail end-->
                                </div>

                            </div>
                        </div>
          
                <!-- Container-fluid Ends-->

<!-- add card modal payment start -->
	<div class="modal fade edit-profile-modal" id="confirm"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">	
		<input type="hidden" id="ok" value='0'>	
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="title"></h5>
					</div>
					<div class="modal-body">
						<p class="text-dark" style="width: 400px;" id="loi"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-dismiss="modal" id="close">Close</button>
						
					</div>
				</div>
			
		</div>
	</div>
	<!-- edit payment modal start -->
                
          
          
	
		</jsp:attribute>
</mt:hotelTemplate>