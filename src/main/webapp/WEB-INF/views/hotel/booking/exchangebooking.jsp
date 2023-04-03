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

<!-- Icons -->
<!--<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/font-awesome.css">-->

<!-- Animation -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/animate.css">

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
	<section class="small-section">
		<div class="container" style="max-width: 1315px">
			<div class="row" style="padding: 15px">

				<div class="col-lg-12" style="text-align: center;">
					<h2 style="color: #1C75C2">MODIFY BOOKING PND${reservation.reservationid }</h2>
					<nav style="display: flex;justify-content: center;">
  
						<ol class="breadcrumb" style="background-color: transparent;">
							<li class="breadcrumb-item "><a style="color: #1C75C2"
							href="${pageContext.request.contextPath }/hotel/dashboard">Hotels</a></li>
						<li class="breadcrumb-item"><a style="color: #1C75C2"
							href="${pageContext.request.contextPath }/hotel/booking/detailsbooking?bookingId=${reservation.reservationid }">Booking
								Details</a></li>

						<li class="breadcrumb-item active">Modify Booking</li>
						</ol>
					</nav>
				</div>

			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="review-section">
						<div class="review_box">
							<div class="title-top">
								<h5>Change or Refund Reservation</h5>
							</div>
							<div class="flight_detail">
								<div class="row">
									<div class="col-lg-12">

										<div class="accordion addons-according" id="accordionExample">
											<div class="card">
												<div class="card-header" id="headingTwo">
													<h2 class="mb-0">
														<button class="btn btn-link collapsed" type="button"
															data-toggle="collapse" data-target="#collapseTwo"
															aria-expanded="false" aria-controls="collapseTwo">
															<img
																src="${pageContext.request.contextPath }/resources/logo/change.png"
																alt="" class="img-fluid blur-up lazyload"> Change
															Reservation
														</button>
													</h2>
												</div>
												<div id="collapseTwo" class="collapse show"
													aria-labelledby="headingTwo"
													data-parent="#accordionExample">
													<div class="card-body seat-select">


														<div class="row" style="margin-bottom: 15px;">

															<div class="col-lg-7" style="padding-left: 50px;">
																<div class=" ">
																	<div class="container">
																		<div class="flight-search-detail">



																			<div class="form-group">
																				<div class="row">
																					<div class="col-lg-4">
																						<label for="roomtype" style="font-size: 20px">Room
																							Type</label>
																					</div>
																					<div class="col-lg-5" style="padding: 0px">
																						<input type="hidden"
																							value="${ reservation.
																					roomtype.roomstypeid}"
																							id="oldroomtypeid"> <select
																							id="changeroomtype" class="form-control"
																							name="roomtype" style="height: 40px">
																							<c:forEach var="rt" items="${listroomType }">
																								<c:if
																									test="${ rt.roomstypeid == reservation.roomtype.roomstypeid}">
																									<option selected value="${ rt.roomstypeid}">${ rt.roomstypename}</option>

																								</c:if>
																								<c:if
																									test="${ rt.roomstypeid != reservation.roomtype.roomstypeid}">
																									<option value="${ rt.roomstypeid}">${ rt.roomstypename}</option>
																								</c:if>
																							</c:forEach>
																						</select>
																					</div>


																				</div>
																						
																			</div>

																			<div class="form-group">
																				<div class="row">
																					<div class="col-lg-4">
																						<label for="roomtype" style="font-size: 20px">Quantity</label>
																					</div>
																					<div class=" col-lg-4" style="padding: 0px">
																						
																							<c:if test="${reservation.reservationstt <2 }">
																								<div class="qty-box">

																									<div class="input-group">
																										<button type="button" id="minus"
																											class="btn quantity-left-minus"
																											data-type="minus" data-field="">-</button>
																										<input type="text" name="totalroom"
																											id="totalroom"
																											class="form-control qty-input input-number"
																											value="${reservation.totalrooms } ">
																										<button type="button" id="plus"
																											class="btn quantity-right-plus"
																											data-type="plus" data-field="">+</button>
																									</div>
																								</div>
																							</c:if>
																							<c:if test="${reservation.reservationstt >1 }">
																								<input type="text" id="totalroom"
																									class="form-control qty-input input-number"
																									disabled value="${reservation.totalrooms } ">
																								<input type="hidden" name="totalroom"
																									value="${reservation.totalrooms }">
																							</c:if>
																						
																					</div>

																				</div>
																				<div class="row">
																				<div class="col-lg-4">
																						<label for="roomtype" style="font-size: 20px">Bed</label>
																						<input type="hidden" id="oldbed" value="${bedType}"/>		
																					</div>
																					<div class="col-lg-3"
																							style="padding: 10px 0px 0px 0px">
																							<c:if test="${bedType==2 }">
																							<input type="radio" id="allbed" value="2"
																								name="bed" checked />
																							</c:if>
																							<c:if test="${bedType!=2 }">
																							<input type="radio" id="allbed" value="2"
																								name="bed"  />
																							</c:if>
																							<label style="font-size: 16px; font-weight: 600;">&nbsp;No Choose
																							</label>

																						</div>
																						<div class="col-lg-2" style="padding: 10px 0px 0px 0px">
																							<c:if test="${bedType==1 }">
																							<input type="radio" id="twinbed" value="1" name="bed" checked/>
																							</c:if>
																							<c:if test="${bedType!=1 }">
																							<input type="radio" id="twinbed" value="1" name="bed" />
																							</c:if>

																							
																								
																							<label style="font-size: 16px; font-weight: 600;">&nbsp;
																							Twin</label>

																						</div>
																						<div class="col-lg-3"
																							style="padding: 10px 0px 0px 0px">
																							<c:if test="${bedType==0 }">
																							<input type="radio" id="doublebed" value="0" name="bed" checked/>
																							</c:if>
																							<c:if test="${bedType!=0 }">
																							<input type="radio" id="doublebed" value="0" name="bed" />
																							</c:if>
																							
																							<label style="font-size: 16px; font-weight: 600;">&nbsp;Double</label>
																						</div>
																				</div>
																				<div class="row">
																					<div class="col-lg-12">
																						<label id="showavailableroom"
																							style="color: #ef3f3e"></label>
																					</div>
																				</div>
																				<div class="row">
																					<div class="col-lg-12">
																						<label id="showarning"
																							style="color: #ef3f3e"></label>
																					</div>
																				</div>
																			</div>
																			<div class="form-group ">
																				<div class="row">
																					<div class="col-lg-4">
																						<label style="font-size: 20px">Check in</label>
																					</div>
																					<div class="col-lg-5 " style="padding: 0px">
																						<fmt:formatDate var="fd"
																							value="${reservation.checkin }"
																							pattern="dd-MM-yyyy" />
																						<input placeholder="Checkin Date"
																							style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 40px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																							value="${fd }" id="checkin" name="checkin" />
																					</div>
																				</div>
																			</div>
																			<div class="form-group ">
																				<div class="row">
																					<div class="col-lg-4">
																						<label style="font-size: 20px">Check out</label>
																					</div>
																					<div class="col-lg-5 input-daterange"
																						style="padding: 0px">
																						<fmt:formatDate var="fdc"
																							value="${reservation.checkout }"
																							pattern="dd-MM-yyyy" />
																						<input placeholder="Checkout Date"
																							style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 40px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																							value="${fdc }" id="checkout" name="checkout" />
																					</div>
																				</div>
																			</div>
																			<div class="form-group ">
																				<div class="row">
																					<div class="col-lg-4">
																						<label style="font-size: 20px">DeadLine</label>
																					</div>
																					<div class="col-lg-5 input-daterange"
																						style="padding: 0px">
																						<fmt:formatDate var="fde" value="${date }"
																							pattern="dd-MM-yyyy" />
																						<input placeholder="set DeadLine"
																							style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 40px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																							value="${fde }" id="deadLine" name="deadLine" />
																					</div>
																				</div>

																			</div>
																			<div class="form-group ">
																				<div class="row">
																					<div class="col-lg-4">
																						<label style="font-size: 20px">Note</label>
																					</div>
																					<div class="col-lg-5 input-daterange"
																						style="padding: 0px">

																						<textarea rows="9" cols="70"
																							placeholder="Write note here..."
																							style="text-transform: capitalize; border: 1px solid #ced4da; height: 120px; color: #495057; width: 100%; padding: 5px 12px; border-radius: 0.25rem; font-size: 17px;"
																							id="note" name="note">${reservation.note }</textarea>
																					</div>
																				</div>
																			</div>


																		</div>
																	</div>
																</div>
															</div>
															<!-- ket thuc col-8 -->

									
															<div class="col-lg-5 ">

																<div class="sticky-cls-top">
																	<div class="review-section">
																		<div class="review_box">
																			<div class="title-top">
																				<h5>Amount Details</h5>
																			</div>
																			<div class="flight_detail">
																				<div class="summery_box">
																					<table class="table table-borderless">
																						<tbody>
																							<tr>
																								<td style="padding: 5px 0px;"
																									style="padding: 5px 0px;">Room type price</td>
																								<td style="padding: 5px 0px;"
																									id="showroomtyprice">$ ${roomtypeprice}</td>
																							</tr>
																							<tr>
																								<td style="padding: 5px 0px;">Total Rooms</td>
																								<td style="padding: 5px 0px;"
																									id="showtotalrooms2">${reservation.totalrooms }</td>

																							</tr>
																							<tr>
																								<td style="padding: 5px 0px;">Total Night</td>
																								<td style="padding: 5px 0px;" id="shownight">${night }</td>
																							</tr>
																							<tr>
																								<td style="padding: 5px 0px;">Total Paid</td>
																								<td style="padding: 5px 0px;">${reservation.payment1 + reservation.payment2}</td>
																							</tr>

																							<tr>
																								<td style="padding: 5px 0px;"
																									class="grand_total"><h5>Total Price:</h5></td>
																								<td style="padding: 5px 0px;"
																									class="grand_total"><h5
																										id="showtotalamount" name="totalamount">$
																										${reservation.price }</h5></td>
																							</tr>
																							<tr id="showchargefee">
																							</tr>
																							<tr id="amount">


																							</tr>

																						</tbody>
																					</table>

																				</div>
																			</div>
																		</div>
																	</div>

																</div>
																<!-- ket thuc col 4 -->
															</div>
														</div>
														<div class="row ">
															<div class=" col-lg-5"></div>
															<div class=" col-lg-2">
																<div class="continue-btn" id="showbutton">
																	<a href="#" data-toggle="modal" data-target="#change"
																		class="btn btn-solid" style="border-radius: 50px">Change</a>
																</div>
															</div>
															<div class=" col-lg-5"></div>

														</div>
														<!-- ket thuc row -->


														<!-- ket thuc neu kenh ban truc tiep -->


													</div>

												</div>
<c:if test="${alo==null }">
												<div class="card">
													<div class="card-header" id="headingOne">
														<h2 class="mb-0">
															<button class="btn btn-link" type="button"
																data-toggle="collapse" data-target="#collapseOne"
																aria-expanded="true" aria-controls="collapseOne">
																<img
																	src="${pageContext.request.contextPath }/resources/logo/refund.png"
																	alt="" class="img-fluid blur-up lazyload"> Refund
																Reservation

															</button>
														</h2>
													</div>
													<div id="collapseOne" class="collapse"
														aria-labelledby="headingOne"
														data-parent="#accordionExample">
														<div class="row col-lg-12"
															style="margin: 15px 0px 0px 0px; padding: 0px">
															<div class=" col-lg-5" style="padding-left: 30px;">
																<h5>Please choose a reason for the refund case:</h5>
															</div>

															<div class=" col-lg-7" style="padding-righ: 0px;">
																<select id="changereason" class="form-control"
																	name="roomtype" style="height: 40px">
																	<option selected value="0">Refund Due Customer
																		Reason</option>
																	<option value="1">Refund Due To Force Majeure
																		Reason</option>
																</select>
															</div>
														</div>
														<div class="card-body order-menu-section">

															<div class="order-section">
																<div class="order-items">
																	<div class="sticky-cls-top">
																		<div class="review-section">
																			<div class="review_box">
																				<div class="title-top">
																					<h5>Refund Details</h5>
																				</div>

																				<div class="flight_detail">
																					<div class="summery_box">
																						<table class="table table-borderless">
																							<tbody>
																								<tr>
																									<td style="padding: 5px 0px;"
																										style="padding: 5px 0px;">Room type price</td>
																									<td style="padding: 5px 0px;"
																										id="showroomtyprice">$ ${roomtypeprice}</td>
																								</tr>
																								<tr>
																									<td style="padding: 5px 0px;">Total Rooms</td>
																									<td style="padding: 5px 0px;"
																										id="showtotalrooms2">${reservation.totalrooms }</td>

																								</tr>
																								<tr>
																									<td style="padding: 5px 0px;">Total Night</td>
																									<td style="padding: 5px 0px;" id="shownight">${night }</td>
																								</tr>
																								<tr>
																									<td style="padding: 5px 0px;">Total Paid</td>
																									<td style="padding: 5px 0px;">${reservation.payment1 + reservation.payment2}</td>
																								</tr>

																								<tr>
																									<td style="padding: 5px 0px;"
																										class="grand_total"><h5>Total Price:</h5></td>
																									<td style="padding: 5px 0px;"
																										class="grand_total"><h5
																											id="showtotalamount" name="totalamount">$
																											${reservation.price }</h5> <input type="hidden"
																										name="reservationstt"
																										value="${reservation.reservationstt }">
																									</td>
																								</tr>


																								<tr>
																									<td style="padding: 5px 0px;"
																										class="grand_total"><h5>Refund
																											Charge:</h5></td>

																									<td style="padding: 5px 0px;"
																										class="grand_total" id="refundfee"><h5
																											name="refundfee">$ ${refundfee}</h5></td>

																								</tr>


																								<tr>
																									<td style="padding: 5px 0px;"
																										class="grand_total"><h5>Refund
																											Amount:</h5> <input type="hidden"
																										id="paymentamount" name="paymentamount"
																										value="${reservation.payment1 + reservation.payment2}">
																										<input type="hidden" name="refundfee"
																										id="getrefundfee" value="${refundfee }">
																									</td>
																									<td style="padding: 5px 0px; color: #ef3f3e"
																										class="grand_total">
																										<h5 id="refundamount" name="refundamount">$
																											${reservation.payment1 + reservation.payment2 - refundfee}</h5>
																									</td>

																								</tr>

																							</tbody>
																						</table>

																					</div>
																				</div>
																				<div class="row ">
																					<div class=" col-lg-5"></div>
																					<div class=" col-lg-2">
																						<div class="continue-btn">
																							<a href="#" data-toggle="modal"
																								data-target="#refund" class="btn btn-solid"
																								style="border-radius: 50px">Refund</a>
																						</div>
																					</div>
																					<div class=" col-lg-5"></div>

																				</div>


																				</form>
																			</div>
																		</div>

																	</div>
																	<!-- ket thuc col 4 -->
																</div>




															</div>






														</div>
													</div>
												</div>
</c:if>
											</div>
										</div>




									</div>
								</div>
							</div>
						</div>








					</div>

				</div>
	</div></div>
	</section>
	<!-- booking section end -->

	<!-- add card modal start -->
	<div class="modal fade edit-profile-modal" id="refund" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<form method="post"
				action="${pageContext.request.contextPath }/hotel/booking/refund">

				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Are You Sure?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="text-dark">If you refund this reservation will be
							canceled and cannot be restored</p>
						<p class="text-dark">Please tell us why customers like to
							refund this reservation. This information will help us improve.
							(optional)</p>
						<input type="hidden" name="reservationid" id="reservationid"
							value="${reservation.reservationid }"> <input
							type="hidden" name="refundcharge" id="refundcharge"
							value="${refundfee }">


						<textarea class="form-control" id="addnote" rows="3"
							name="addnote">${reservation.note }</textarea>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-solid" value="Refund" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- edit password modal start -->


	<!-- add card modal start -->
	<div class="modal fade edit-profile-modal" id="change" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<form method="post"
				action="${pageContext.request.contextPath }/hotel/booking/action/exchange">


				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Are You Sure?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="text-dark">If you confirm, this reservation will be
							change with new infomation and cannot be restored</p>

	<input type="hidden"  name="oldbed" value="${bedType}"/>
						<input type="hidden" name="roomtype" id="submitroomtype">
<input type="hidden" name="bed" id="submitbed">
						<input type="hidden" name="totalroom" id="submittotalroom">

						<input type="hidden" name="checkin" id="submitcheckin"> <input
							type="hidden" name="deadLine" id="submitdeadLine"> <input
							type="hidden" name="checkout" id="submitcheckout"> <input
							type="hidden" name="hotelid" id="hotelid" value="${hotelid }">
						<input type="hidden" name="accountid" id="accountid"
							value="${accountid }"> <input type="hidden"
							name="reservationid" id="reservationid"
							value="${reservation.reservationid }"> <input
							type="hidden" name="changefee" id="changefee"
							value="${changefee }"> <input type="hidden" name="note"
							id="submitnote">




					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input class="btn btn-solid" type="submit" value="Change">


					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- edit password modal start -->

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


	<!-- latest jquery-->
	<!--<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/jquery-3.5.1.min.js"></script>-->
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
		src="${pageContext.request.contextPath }/resources/backend/assets/myajax/exchangebookingajax.js"></script>


</body>

</html>

