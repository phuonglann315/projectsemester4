
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Traveloto">
<meta name="keywords" content="Traveloto">
<meta name="author" content="Traveloto">
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/logo/pandanus-favicon.ico"
	type="image/x-icon">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/logo/pandanus-favicon.ico"
	type="image/x-icon">
<title>${accountname }</title>

<!--Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/animate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/font-awesome.css">
<!--Slick slider css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/slick-theme.css">

<!-- Bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/bootstrap.css">

<!-- Theme css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/color2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/feather-icon.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<body>


	<!-- pre-loader start -->
	<div class="loader-wrapper img-gif">
		<img
			src="${pageContext.request.contextPath }/resources/backend/assets/images/loader/loader.gif"
			alt="">
	</div>
	<!-- pre-loader end -->





	<!-- breadcrumb start -->
	<section class="breadcrumb-section pt-0">
		<img
			src="${pageContext.request.contextPath }/uploads/room/${bg1}"
			class="bg-img img-fluid blur-up lazyload" alt="">
		<div class="title-breadcrumb">${accountname }</div>
	</section>
	<!-- breadcrumb end -->


	<!-- booking section start -->
	<section class="section-b-space bg-inner animated-section"  style="padding-top: 20px;">
		<div class="animation-section">
			<div class="cross po-2"></div>
			<div class="round po-5"></div>
			<div class="round r-2 po-6"></div>
			<div class="round r-2 po-7"></div>
			<div class="round r-y po-8"></div>
			<div class="square po-10"></div>
			<div class="square s-2 po-12"></div>
		</div>
		
		<div class="container" style="max-width: 1315px">
			<div class="row" style="padding: 15px">

				<div class="col-lg-12" style="text-align: center;">
					<h2 style="color: #1C75C2">ROOM ${reservationroom.rooms.roomname }</h2>
					<nav style="display: flex;justify-content: center;">
  
						<ol class="breadcrumb" style="background-color: transparent;">
							<li class="breadcrumb-item "><a style="color: #1C75C2"
							href="${pageContext.request.contextPath }/hotel/dashboard">Hotels</a></li>
						<li class="breadcrumb-item"><a style="color: #1C75C2"
							href="${pageContext.request.contextPath }/hotel/booking/detailsbooking?bookingId=${reservation.reservationid }">
								Booking PND${reservation.reservationid }</a></li>
						<li class="breadcrumb-item active">Room Service</li>
						</ol>
					</nav>
				</div>

			</div>
		</div>
		<div class="container" style="max-width: 1315px">
			
			<div class="row">

				<div class="col-lg-5 booking-order">
					<div class="summery-box">

						<div class=" hotel-section row">
							<div class=" hotel-img col-lg-5">
								<img
									src="${pageContext.request.contextPath }/uploads/room/${bg2}"
									class="img-fluid blur-up lazyload" alt="">
							</div>
							<div class=" hotel-detail">
							<input type="hidden" id="roomtypeid" value="${reservation.roomtype.roomstypeid}">
								<h6>RoomeType: ${reservation.roomtype.roomstypename }</h6>
								<c:if test="${reservationroom.reservationroomtypestt==0 }">

									<span style="color: #5a6268; font-size: 19px;">Status:
										Hold</span>

								</c:if>
								<c:if test="${reservationroom.reservationroomtypestt==1 }">

									<span style="color: #ffc107; font-size: 19px;">Status:
										Deposit</span>
								</c:if>
								<c:if test="${reservationroom.reservationroomtypestt==2  }">
									<span style="color: #28a745; font-size: 19px;">Status:
										Confirm</span>
								</c:if>

								<c:if test="${reservationroom.reservationroomtypestt==3 }">

									<span style="color: #007bff; font-size: 19px;">Status:
										Staying</span>

								</c:if>
								<c:if test="${reservationroom.reservationroomtypestt==4 }">

									<span style="color: #23272b; font-size: 19px;">Status:
										Check-Out</span>

								</c:if>

								<c:if test="${reservationroom.reservationroomtypestt==5 }">

									<span style="color: #23272b; font-size: 19px;">Expired-
										The customer didn't come</span>

								</c:if>
								<c:if test="${reservationroom.reservationroomtypestt==6 }">

									<span style="color: #23272b; font-size: 19px;">Change/
										Upgrade</span>
								</c:if>
								<c:if test="${reservationroom.reservationroomtypestt==7 }">

									<span style="color: #23272b; font-size: 19px;">Refund/Cancel</span>
								</c:if>
								<c:if test="${reservationroom.latecheckoutid >0  }">
									<span style="color: #28a745; font-size: 16px;"></br>Late check-Out
										Booking: <a
										href="${pageContext.request.contextPath }/hotel/booking/detailsbooking?bookingId=${reservationroom.latecheckoutid }">PDN${reservationroom.latecheckoutid }</a></span>
								</c:if>
								
							</div>
						</div>
						<div class="summery-section">

							<div class="row col-lg-12 box">
								<div class="left col-lg-6">
									<div class="up">
										<h6>check in</h6>
										<h6>${checkin }</h6>
										<c:if test="${checkintime !=null }">
											<h6>${checkintime  }</h6>
										</c:if>
										<c:if
											test="${checkintime ==null && showbuttoncheckin == null}">
											<h6>
												<i>waitting checkin</i>
											</h6>
										</c:if>
										<c:if test="${checkintime ==null && (showbuttoncheckin >=0 && showbuttoncheckin <= night) && sokhach ==null}">
											<h5>
												<i><a
													href="${pageContext.request.contextPath }/hotel/reservationroom/checkineachroom?reservationroomdetailsid=${reservationroom.reservationroomdetailsid } ">Check-in</a></i>

											</h5>
										</c:if>
										<c:if test="${checkintime ==null && (showbuttoncheckin >=0 && showbuttoncheckin <= night) && sokhach !=null}">
											<h5>
												<i>waitting customer infor & checkin</i>
											</h5>
										</c:if>
									</div>

								</div>
								<div class="right col-lg-4 col-lg-6">
									<div class="up">
										<h6>check out</h6>
										<h6>${checkout }</h6>
										<c:if test="${checkouttime !=null }">
											<h6>${checkouttime  }</h6>
										</c:if>
										<c:if test="${reservationroom.reservationroomtypestt==2}">
											<h6>
												<i>waitting checkout</i>
											</h6>
										</c:if>
										<c:if test="${reservationroom.reservationroomtypestt==3}">
											<h5>
												<i><a href="#" data-toggle="modal"
													data-target="#show-checkout">Check-out</a></i>

											</h5>
										</c:if>
									</div>

								</div>
							</div>
						</div>
						<div class="summery-section">
							<div class="payment-details">
								<table>
									<tbody>
										<tr>
											<td style="width: 50%"><h5 class="mb-0">Bed type:</h5></td>
											<td><h5 class="mb-0">${reservationroom.rooms.roomtypecontent }
													bed</h5></td>
										</tr>
										<tr>
											<td style="width: 50%"><h5 class="mb-0">Maximum
													Extrabed:</h5></td>
											<td><h5 class="mb-0">${reservationroom.rooms.extrabed }</h5></td>
										</tr>
										<tr>
											<td style="width: 50%"><h5 class="mb-0">Maximum
													Adult:</h5></td>
											<td><h5 class="mb-0">${reservation.roomtype.maxcus }
													Customer</h5></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${ reservationroom.reservationroomtypestt <3}">
							<div class="row summery-section"
							style="margin-top: 15px">
							<form method="get" action="${pageContext.request.contextPath }/hotel/reservationroom/addcustomer">
								
								<h2 style="padding-left: 15px;">Traveller Information</h2>
								<h5 style="color: #28a745; padding-left: 15px;">${msg1 }</h5>
								<div class="col-lg-12 ">
								
									<c:forEach var="g" items="${reservationguestinfos }">
										<div class="row" name="reservationguestinfos">
											<div class="col-lg-6 form-group">
												<h6 class="mb-0">Customer Name:</h6>
												<input type="text" class="form-control" name="guestname"
													value="${g.guestname }" style="width: 100%">
											</div>
											<div class="col-lg-6">
												<h6 class="mb-0">Customer ID:</h6>
												<input type="text" class="form-control"
													name="guestidcardnumber" value="${g.guestidcardnumber }"
													style="width: 100%"> <input type="hidden"
													class="form-control" name="reservationguestinfoid"
													value="${g.reservationguestinfoid }" style="width: 100%">
											</div>
										</div>
									</c:forEach>
									<div class="row" style="margin-top: 15px;">
										<div class="col-lg-12">
											<div class="submit-btn" style="float: right;">
												<input type="hidden" name="reservationroomdetailsid"
													value="${reservationroom.reservationroomdetailsid }">
													<input class="btn btn-solid" value="Save" type="submit"
														style="border-radius: 50px;">
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</c:if>
						<c:if test="${ reservationroom.reservationroomtypestt >=3}">
							<div class="row summery-section"
							style="margin-top: 15px">
								<h2 style="padding-left: 15px;">Traveller Information</h2>
								<h5 style="color: #28a745; padding-left: 15px;">${msg1 }</h5>
								<div class="col-lg-12 ">
								<div class="row" name="reservationguestinfos">
											<div class="col-lg-6 form-group">
												<h5 class="mb-0">Customer Name:</h5>	
											</div>
											<div class="col-lg-6">
												<h5 class="mb-0">Customer IDNo:</h5>
											</div>
										</div>
									<c:forEach var="g" items="${reservationguestinfos }">
										<div class="row" name="reservationguestinfos">
											<div class="col-lg-6 form-group">
												<h6 class="mb-0">${g.guestname }</h6>	
											</div>
											<div class="col-lg-6">
												<h6 class="mb-0"> ${g.reservationguestinfoid }</h6>
											</div>
										</div>
									</c:forEach>
									
								</div>
								<c:if test="${ reservationroom.reservationroomtypestt ==3 && a !=null}">
								<form method="get" action="${pageContext.request.contextPath }/hotel/reservationroom/addcustomer">
								
								<h2 style="padding-left: 15px;">Add Traveller Information</h2>
								<h5 style="color: #28a745; padding-left: 15px;">${msg1 }</h5>
								<div class="col-lg-12 ">
								
									<c:forEach var="g" items="${a }">
										<div class="row" name="reservationguestinfos">
											<div class="col-lg-6 form-group">
												<h6 class="mb-0">Customer Name:</h6>
												<input type="text" class="form-control" name="guestname"
													value="${g.guestname }" style="width: 100%">
											</div>
											<div class="col-lg-6">
												<h6 class="mb-0">Customer ID:</h6>
												<input type="text" class="form-control"
													name="guestidcardnumber" value="${g.guestidcardnumber }"
													style="width: 100%"> <input type="hidden"
													class="form-control" name="reservationguestinfoid"
													value="${g.reservationguestinfoid }" style="width: 100%">
											</div>
										</div>
									</c:forEach>
									<div class="row" style="margin-top: 15px;">
										<div class="col-lg-12">
											<div class="submit-btn" style="float: right;">
												<input type="hidden" name="reservationroomdetailsid"
													value="${reservationroom.reservationroomdetailsid }">
													<input class="btn btn-solid" value="Save" type="submit"
														style="border-radius: 50px;">
											</div>
										</div>
									</div>
								</div>
							</form>
								</c:if>
						
						</div>
					</c:if>

					</div>
				</div>
				<!--end tab trai table -->

				<div class="col-lg-7">
					<div class="guest-detail" style="margin-bottom: 20px">
						<div class=" row col-lg-12 " style="width: 100%;">
							<h3>Add On Service</h3>
							<select id="addaddon" class="form-control" name="addonserviceid">
								<option selected disabled="disabled" value="-1">Please
									Choose Service</option>
								<c:forEach var="a" items="${addonservice }">
									<option value="${a.addonserviceid }">${a.addonservicename }</option>
								</c:forEach>
							</select>
						</div>
						<div class="row col-lg-12" style="width: 100%; margin-top: 20px">
							<div class="col-lg-8"></div>
							<div class="col-lg-4" style="padding: 0px; display: none;"
								id="showbuton">
								<c:if test="${reservationroom.reservationroomtypestt<4 }">
									<a href="#" data-toggle="modal" data-target="#show-add-addon"
										class="btn btn-solid "
										style="border-radius: 50px; float: right;">Add </a>
								</c:if>

							</div>

						</div>
					</div>
					<c:if test="${reservationroom.cusinroom < maxcus }">
						<div class="guest-detail" style="margin-bottom: 20px">
							<div class=" row col-lg-12 " style="width: 100%;">
								<h3>Add Extra Bed</h3>
								<input type="hidden" id="maxextra" value="${reservationroom.rooms.extrabed }">
								<h6>Extra bed will be charged, this room can accommodate up to ${reservationroom.rooms.extrabed } extra beds. Click the Add button if you want to add 1 bed</h6>	
							<select id="extrabed" class="form-control" name="extrabed">
								<option selected disabled="disabled" value="-1">Please
									Choose</option>
								<c:forEach var="a" items="${extrabedservice }">
									<option value="${a.addonserviceid }">${a.addonservicename }</option>
								</c:forEach>
							</select>
							</div>
							<div class="row col-lg-12" style="width: 100%; margin-top: 20px">
								<div class="col-lg-8"></div>
								<div class="col-lg-4" style="padding: 0px;display: none" id="showbuttonaddcustomer">
									<a href="#" data-toggle="modal"
										data-target="#show-add-addon" class="btn btn-solid "
										style="border-radius: 50px; float: right;">Add </a>

								</div>

							</div>
						</div>
					</c:if>
					<c:if test="${reservationroom. cusinroom >= maxcus }"><input type="hidden" id="maxextra" value="-1"></c:if>
					<c:if test="${reservationroom.reservationroomtypestt ==3 && checkouttoday!=null && roomlatecheckout == -1}">
					<input type="hidden" id="showlatecheckout" value="1">
					<div class="guest-detail" style="margin-bottom: 20px">
						<div class=" row col-lg-12 " style="width: 100%;">
							<h3>Late Check-Out Request</h3>
						
							<input type="hidden" id="reservationid" value="${reservation.reservationid }">
								<select id="latedcheckout" class="form-control" name="extrabed">
								<option selected disabled="disabled" value="-1">Please Choose</option>
									
								<c:forEach var="a" items="${latecheckoutservice }">
							
								<c:if test="${a.price >0}">
									<option value="${a.addonserviceid }">${a.addonservicename } charge fee $ ${a.price }</option>

								</c:if>
								<c:if test="${a.price ==0}">
									<option value="${a.addonserviceid }">${a.addonservicename } charge fee $ ${reservation.netprice /2 }</option>

								</c:if>	
								</c:forEach>
							</select>
						</div>
						<div class="row col-lg-12" style="width: 100%; margin-top: 20px" >
							<div class="col-lg-8"><c:if test="${msg3!=null }"><h6 style="color: #ef3f3e">${msg3}</h6></c:if></div>
							<div class="col-lg-4" style="padding: 0px;display: none;" id="showbuttonaddlatecheckout">
								<a href="#" data-toggle="modal" data-target="#show-add-addon"
									class="btn btn-solid "
									style="border-radius: 50px; float: right;">Add </a>

							</div>

						</div>
					</div>
					</c:if>
						<c:if test="${reservationroom.reservationroomtypestt !=3 || checkouttoday==null || roomlatecheckout >-1}">
						<input type="hidden" id="showlatecheckout" value="-1">
						</c:if>
					<c:if test="${reservationaddonservices !=null }">
						<div class="guest-detail" style="width: 100%;">
							<h3>Payment</h3>
							<c:if test="${msg !=null }">
								<div class="row">
									<h5 style="color: #ef3f3e">${msg }</h5>
								</div>
							</c:if>

							<form method="get"
								action="${pageContext.request.contextPath }/hotel/reservationroom/paymentaddon">
									<input type="hidden" name="reservationroomdetailsid" value="${reservationroom.reservationroomdetailsid }"/>	
										<input name="roomlatecheckout" type="hidden" value="${roomlatecheckout }">						
								<table>
									<thead>

										<tr>
											<td
												style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 170px">
												<h6 class="mb-0">DATE</h6>
											</td>
											<td
												style="border: 1px solid #ced4da; text-align: center; padding: 10px 0px; width: 400px">
												<h6 class="mb-0">SERVICE NAME</h6>
											</td>
											<td
												style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 80px">
												<h6 class="mb-0">PRICE</h6>
											</td>
											<td
												style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 80px">
												<h6 class="mb-0">QTY</h6>
											</td>
											<td
												style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 80px">
												<h6 class="mb-0">AMNT</h6>
											</td>
											<td
												style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 80px">
												<h6 class="mb-0">STATUS</h6>
											</td>

											<td
												style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 80px">
												<h6 class="mb-0">PMT</h6>
											</td>
											<td
												style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 80px">
												<h6 class="mb-0">CXL</h6>
											</td>
										</tr>

									</thead>
									<tbody>
										<c:set var="id" value="0"></c:set>
										<c:forEach var="a" items="${reservationaddonservices }">
											<tr>
												<td
													style="border: 1px solid #ced4da; text-align: center; padding: 3px; width: 170px">
													<h6 class="mb-0">
														<fmt:formatDate value="${a.createday }"
															pattern="dd-MM-yyyy" />
													</h6>
												</td>
												<td
													style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 400px">
													<h6 class="mb-0">${a.addonservice.addonservicename }</h6>

												</td>
												<td
													style="border: 1px solid #ced4da; text-align: center; padding: 3px; width: 80px">
													<h6 class="mb-0">$ ${a.price }</h6>
												</td>
												<td
													style="border: 1px solid #ced4da; text-align: center; padding: 3px; width: 80px">
													<h6 class="mb-0">${a.quantity }</h6>
												</td>
												<td
													style="border: 1px solid #ced4da; text-align: center; padding: 3px; width: 80px">
													<h6 class="mb-0">$ ${a.amount }</h6>
												</td>
												<td
													style="border: 1px solid #ced4da; text-align: center; padding: 3px; width: 80px">
													<c:if test="${a.paymentstt ==0 }"><h6 class="mb-0">Postpaid</h6></c:if>														
													<c:if test="${a.paymentstt ==1 }"><h6 class="mb-0">${a.paymentchannel }</h6></c:if>
													<c:if test="${a.paymentstt ==6 }"><h6 class="mb-0">${a.paymentchannel }</h6></c:if>
													<c:if test="${a.paymentstt ==7 }"><h6 class="mb-0">Cancel</h6></c:if>	
													
												</td>
												<c:if test="${a.paymentstt ==0 }">
												<c:set var="id" value="${id+1 }"></c:set>
												<td style="border: 1px solid #ced4da; text-align: center; padding: 3px; width: 80px">													
													<input type="checkbox" name="paymentforid" class="checkbox" value="${a.reservationaddonserviceid }"id="${a.reservationaddonserviceid }">														
												</td>
												<td style="border: 1px solid #ced4da; text-align: center; padding: 3px; width: 80px">													
												<a href="${pageContext.request.contextPath }/hotel/reservationroom/canceladdon?reservationaddonserviceid=${a.reservationaddonserviceid}"><i class="fas fa-window-close" data-toggle="tooltip" style="color: black;"
                                                        data-placement="top" title="cancle service"></i></a>													
												</td>
												</c:if>
												<c:if test="${a.paymentstt !=0 }">
											
												<td style="border: 1px solid #ced4da; text-align: center; padding: 3px; width: 80px" colspan="2">													
																				
												</td>
												</c:if>
										</c:forEach>

										<c:if test="${totalamount !=null}">
											<tr>
												<td class=" form-group"
													style="border: 1px solid #ced4da; text-align: left; padding: 3px 15px;"
													colspan="4">
													<h5 class="mb-0">Total amount</h5>
												</td>
												<td class=" form-group"
													style="border: 1px solid #ced4da; text-align: left; padding: 3px 15px;"
													colspan="2"><h5 class="mb-0">$ ${totalamount}</h5></td>
												<td class=" form-group"
													style="border: 1px solid #ced4da; text-align: center; padding: 3px;"><input
													type="checkbox" name="paymentall" value=" ${id }"
													id="chekall"></td>
													<td class=" form-group"
													style="border: 1px solid #ced4da; text-align: center; padding: 3px;"></td>
											</tr>
											<tr>
												<td colspan="2" style="text-align: left; padding: 3px 15px;">
													<h5 class="mb-0">Payments Channel</h5>
												</td>
												<td colspan="6"><select style="margin-top: 10px"
													class="form-control" name="chonpayment">
														<option selected value="CASH">CASH</option>
														<option value="CARD">CARD</option>
														<option value="TRANSFER">TRANSFER</option>
												</select></td>

											</tr>
										</c:if>	
									</tbody>
								</table>
								<c:if test="${totalamount !=null}">
								<div class="row col-lg-12" style="width: 100%; margin-top: 20px">
									<div class="col-lg-8"></div>
									<div class="col-lg-4" style="padding: 0px;" id="">
										<input type="submit" value="Pay" class="btn btn-solid "
											style="border-radius: 50px; float: right;">
									</div>
								</div>
								</c:if>
								
					

					</form>

				</div>

				</c:if>


			</div>

		</div>
		<!--end show table -->

		</div>










	</section>
	<!-- booking section end -->

	<!-- add card modal payment start -->
	<div class="modal fade edit-profile-modal" id="show-add-addon"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<form method="GET"
				action="${pageContext.request.contextPath }/hotel/reservationroom/addaddonservice">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Add Service Process</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table table-borderless" style="width: 500px;">

							<tbody>
								<tr>
									<td class="form-group" style="padding: 6px 12px; width: 200px;">
										<h6 class="mb-0">Service Name:</h6>

									</td>
									<td class="form-group" style="padding: 6px 12px;width: 450px;"><h6 class="mb-0" id="showservicename"></h6></td>
												
								</tr>
								<tr>
									<td class="form-group" style="padding: 6px 12px;width: 200px;">
										<h6 class="mb-0">Price:</h6>
									</td>
									<td class="form-group" style="padding: 6px 12px;"><h6 class="mb-0" id="showserviceprice"></h6></td>
												
								</tr>

								<tr>
									<td class="form-group" style="padding: 20px 12px;width: 200px;">
										<h6 class="mb-0">Quantity:</h6>
									</td>
									<td> <input
										type="text" name="quantity" id="quantity"
										class="form-control qty-input input-number" value="1" style="border-top-color: transparent;border-left-color: transparent;border-right-color: transparent;">
									
									<input type="hidden" id="maxquantitysercive">
									<input type="hidden" id="typeservice" name="typeservice">		
									</td>

								</tr>
								<tr><td colspan="2"><span style="color: #ef3f3e" id="showerror"></span></td></tr>
								<tr>
									<td class="form-group" style="padding: 6px 12px;">
										<h6 class="mb-0">Total:</h6>
									</td>
									<td><h6 class="mb-0" id="showtotal"></h6></td>
								</tr>
								<tr id="showpayment">
									<td class=" form-group" style="padding: 15px 12px;width: 200px;">
										<h6 class="mb-0">Payments Channel</h6>
									</td>

									<td class=" form-group" style="padding: 6px 12px;"><select
										id="paymentchannel" class="form-control" name="paymentchannel">
											<option selected value="POSTPAID">POSTPAID</option>
											<option value="CASH">CASH</option>
											<option value="CARD">CARD</option>
											<option value="TRANSFER">TRANSFER</option>
									</select>
									</td>									
								</tr>
								
								<tr id="showpayment1" style="display: none">
									<td class=" form-group" style="padding: 6px 12px;width: 250px;">
										<h6 class="mb-0">Payments Channel</h6>
									</td>
									<td class=" form-group" style="padding: 6px 12px;">
									<h6 class="mb-0">POSTPAID</h6>
										<input type="hidden" value="POSTPAID" name="paymentchannel1">	
									</td>									
								</tr>
							</tbody>
						</table>
						<div class="row"  id="showwarning" style="display: none">
						<div class="col-lg-12">
						<h6 style="color: #ef3f3e">This request may affect the check-in of another reservation, please make sure:</h6>
						</div>
						<div class="col-lg-12">
						<h6><input type="radio" id="nohold" value="0" name="checkroomlatecheckout" checked> &nbsp; Don't need hold rooms for late check-out request.</h6>
						</div>
						<div class="col-lg-12">
						<h6><input type="radio" id="hold" value="1" name="checkroomlatecheckout"> &nbsp; Need hold rooms for late check-out request.</h6>
						</div>
						<div class="col-lg-12" >
						<h6  id="showcheckroomavailableresuld"></h6>
						</div>
						</div>
					</div>

					<div class="modal-footer">
						<input name="check" type="hidden" id="check" >
					
						<input type="hidden" id="reservationroomdetailsid" name="reservationroomdetailsid" value="${reservationroom.reservationroomdetailsid }"/>							
						<input name="addonserviceid" type="hidden" id="addonserviceid" >
						<input name="price" type="hidden" id="price">
						<input name="holdroom" type="hidden" id="holdroom" >	

						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>							
						<input type="submit" class="btn btn-solid" value="Save" id="buttonsubmit" />
						<label class="btn btn-solid" id="buttoncheckroom" style="display: none;max-width: 80px;">Check</label>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- edit payment modal start -->


	<!-- add card modal payment start -->
	<!-- add card modal payment start -->
	<div class="modal fade edit-profile-modal" id="show-checkout"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<form method="get"
				action="${pageContext.request.contextPath }/hotel/reservationroom/checkouteachroom">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Check-Out Process</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h5 class="text-dark" style="width: 450px;"></h5>
						<table class="table table-borderless" id="showyes">

							<tbody>

								<tr>
									<td class="form-group" style="padding: 6px 0px;"><c:if
											test="${totalamount !=null }">
											<h5>Please pay the amount incurred before the check-out
												process</h5>
										</c:if> <c:if test="${totalamount ==null  }">
											<h5>After the guest check-out, the information cannot be
												restored</h5>
										</c:if></td>

								</tr>

							</tbody>
						</table>
						
					</div>
						<input type="hidden" name="reservationroomdetailsid" value="${reservationroom.reservationroomdetailsid }"/>							
					<div class="modal-footer">
						
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<c:if test="${totalamount ==null  }">
							<input type="submit" class="btn btn-solid" value="Check-out" />
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- edit payment modal start -->

	<!-- tap to top -->
	<div class="tap-top">
		<div>
			<i class="fas fa-angle-up"></i>
		</div>
	</div>
	<!-- tap to top end -->


	<!-- setting start -->
	<div class="theme-setting">
		<div class="dark">
			<input class="tgl tgl-skewed" id="dark" type="checkbox"> <label
				class="tgl-btn" data-tg-off="Dark" data-tg-on="Light" for="dark"></label>
		</div>
		<div class="rtl">
			<input class="tgl tgl-skewed" id="rtl" type="checkbox"> <label
				class="tgl-btn" data-tg-off="RTL" data-tg-on="LTR" for="rtl"></label>
		</div>
	</div>
	<!-- setting end -->


	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/sticky-kit.js"></script>
	<!-- slick js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/slick.js"></script>


	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/wow.min.js"></script>

	<!-- country select -->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/bootstrap.js"></script>

	<!-- lazyload js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/lazysizes.min.js"></script>

	<!-- Theme js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/script.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/myajax/addonserviceforroomajax.js">
		
	</script>
</body>

</html>

