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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/font-awesome.css">

<!-- Animation -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/animate.css">

<!--    country code-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/intlTelInput.css">

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
	<section class="section-b-space bg-inner animated-section" style="padding-top: 20px;">
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
					<h2 style="color: #1C75C2">BOOKING VIEW PND${reservation.reservationid }</h2>
					<nav style="display: flex;justify-content: center;">
  
						<ol class="breadcrumb" style="background-color: transparent;">
							<li class="breadcrumb-item "><a style="color: #1C75C2"
								href="${pageContext.request.contextPath }/hotel/dashboard">My
									Hotel</a></li>
							<li class="breadcrumb-item"><a style="color: #1C75C2"
								href="${pageContext.request.contextPath }/hotel/booking/managebooking">All
									Bookings</a></li>
							<li class="breadcrumb-item active">View Booking</li>
						</ol>
					</nav>
				</div>

			</div>
		</div>
		<div class="container" style="max-width: 1315px">
			<div class="row">

				<div class="col-lg-5 booking-order">
					<div class="summery-box">
						<div class="row">
							<div class=" col-lg-8">
								<h2>Booking Infomation</h2>
							</div>
							<c:if
								test="${reservation.reservationstt==2 || reservation.reservationstt==1  || reservation.reservationstt==0 }">
								<div class=" col-lg-4">
									<a
										href="${pageContext.request.contextPath }/hotel/booking/edit?bookingId=${reservation.reservationid }&action=edit&policyId=${policy.policiesid}">Edit
										Booking<i class="fas fa-pencil-alt" style="padding: 3px"></i>
									</a>

								</div>
							</c:if>

						</div>

						<div class=" hotel-section">
							<div class=" hotel-img">
								<img
									src="${pageContext.request.contextPath }/uploads/room/${bg2}"
									class="img-fluid blur-up lazyload" alt="">
							</div>
							<div class=" hotel-detail">
								<h4>Room Type: ${reservation.roomtype.roomstypename }</h4>
								<c:if test="${reservation.reservationstt==0 }">

									<span style="color: #5a6268; font-size: 19px;">Status:
										Hold</span>
										<span style="color: #ef3f3e; font-size: 16px;"></br>DeadLine: <fmt:formatDate
																		value="${reservation.deadline }" pattern="dd-MM-yyyy HH: mm: SS" /> </span>
								</c:if>
								<c:if test="${reservation.reservationstt==1 }">

									<span style="color: #ffc107; font-size: 19px;">Status:
										Deposit</span>
									<span style="color: #ef3f3e; font-size: 16px;"></br>DeadLine: <fmt:formatDate
																		value="${reservation.deadline }" pattern="dd-MM-yyyy HH: mm: SS" /> </span>


								</c:if>
								<c:if test="${reservation.reservationstt==2  }">
									<span style="color: #28a745; font-size: 19px;">Status:
										Confirm</span>
								</c:if>

								<c:if test="${reservation.reservationstt==3 }">

									<span style="color: #007bff; font-size: 19px;">Status:
										Staying</span>

								</c:if>
								<c:if test="${reservation.reservationstt==4 }">

									<span style="color: #23272b; font-size: 19px;">Status:
										Check-Out</span>

								</c:if>

								<c:if test="${reservation.reservationstt==5 }">

									<span style="color: #23272b; font-size: 19px;">Expired-
										The customer didn't come</span>

								</c:if>
								<c:if test="${reservation.reservationstt==6 }">

									<span style="color: #23272b; font-size: 19px;">Change/
										Upgrade</span>
								</c:if>
								<c:if test="${reservation.reservationstt==7 }">

									<span style="color: #23272b; font-size: 19px;">Refund/Cancel</span>
								</c:if>
								<c:if test="${relatedid !=null  }">
									<span style="color: #28a745; font-size: 16px;"></br>Related
										Booking: <a
										href="${pageContext.request.contextPath }/hotel/booking/detailsbooking?bookingId=${relatedid }">PDN${relatedid }</a></span>
								</c:if>

							</div>
						</div>
						<div class="summery-section">
							<div class="box">
								<div class="left">
									<div class="up">
										<h6>check in</h6>
										<h5>
											<h5>${checkin }</h5>
										</h5>
									</div>

								</div>
								<div class="right">
									<div class="up">
										<h6>check out</h6>
										<h5>${checkout }</h5>
									</div>

								</div>
							</div>
						</div>
						<div class="summery-section">
							<div class="payment-details">
								<table>
									<tbody>
										<tr>
											<td style="width: 50%"><h5 class="mb-0">Number
													Customer default:</h5></td>
											<td><h5 class="mb-0">${guestdefault }persons/1room</h5></td>
										</tr>
										<tr>
											<td style="width: 50%"><h5 class="mb-0">Maximum
													Customer:</h5></td>
											<td><h5 class="mb-0">${maxcus }persons/1room</h5></td>
										</tr>
										<tr>
											<td style="width: 35%"><h5 class="mb-0">Total
													Rooms:</h5></td>

											<td><h5 class="mb-0">${reservation.totalrooms }</h5></td>
										</tr>
										<tr>
											<td style="width: 35%"><h5 class="mb-0">Total
													night:</h5></td>

											<td><h5 class="mb-0">${night }</h5></td>
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
											<td style="width: 35%"><h5 class="mb-0">booking
													from:</h5></td>
											<td><h5 class="mb-0">${reservation.contractinfo.contractname }</h5>
											</td>
										</tr>
										<c:if test="${reservation.bookingchannels=='ONLINECHANNEL' }">
											<tr>
												<td style="width: 35%"><h5 class="mb-0">booking
														person:</h5></td>
												<td><h5 class="mb-0">${reservation.account.accountname }</h5>
												</td>
											</tr>
										</c:if>
										<tr>
											<td style="width: 35%"><h5 class="mb-0">customer
													name:</h5></td>
											<td><h5 class="mb-0">${reservation.customername }</h5></td>
										</tr>
										<tr>
											<td style="width: 35%"><h5 class="mb-0">customer
													phone:</h5></td>
											<td><h5 class="mb-0">${reservation.customerphone }</h5></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<div class="summery-section">
							<div class="payment-details">
								<h5>Policies Apply</h5>
								<table>
									<tbody>
										<c:forEach var="p" items="${policies }">
											<c:if test="${policy.policiesid == p.policiesid }">
												<tr>
													<td style="color: #ef3f3e">${ p.policiescontent}</td>
												</tr>
											</c:if>
											<c:if test="${policy.policiesid != p.policiesid }">
												<tr>
													<td>${ p.policiescontent}</td>
												</tr>
											</c:if>
										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>

						<div class="summery-section">
							<div class="payment-details">
								<h5>
									<u>Note:</u> <a href="#" data-toggle="modal"
										data-target="#add-note">Quick Notes<i
										class="fas fa-pencil-alt" style="padding: 3px"></i></a>
								</h5>

								<table>
									<tbody>

										<tr>
											<td><i>${ reservation.note}</i></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>

						<div class="summery-section">
							<div class="payment-details">
								<table>
									<tbody>

										<c:if test="${reservation.reservationstt ==7  }">

											<tr>
												<td>Refund Date:</td>
												<td>${refunddate }</td>
											</tr>
										</c:if>

									</tbody>
								</table>
							</div>
						</div>








						<div class="summery-section">
							<div class="payment-details">
								<h5>payment details</h5>
								<table>
									<tbody>
										<tr>
											<td>Base Price:</td>
											<td>$ ${reservation.netprice }</td>
										</tr>
										<tr>
											<td>total Price:</td>
											<td>$ ${reservation.netprice * reservation.totalrooms *  night}</td>
										</tr>
										<c:if test="${oldprice !=null  }">
											<tr>
												<td>Old Base Price:</td>
												<td>$ ${oldprice}</td>
											</tr>
											<tr>
												<td>Old total Price:</td>
												<td>$ ${oldprice * oldnight * oldtotalroom}</td>
											</tr>
										</c:if>
										<tr>
											<td>total Amount:</td>
											<td>$ ${reservation.price }</td>
										</tr>
										<c:if
											test="${(reservation.payment1+reservation.payment2) <reservation.price  }">
											<tr>
												<td>Deposit First Time:</td>
												<c:if test="${reservation.payment1 !=null  }">
													<td>- $ ${reservation.payment1  }</td>
												</c:if>
												<c:if test="${reservation.payment1 ==null  }">
													<td>- $ 0</td>
												</c:if>
											</tr>
											<tr>
												<td>Deposit Second Time:</td>
												<c:if test="${reservation.payment2 !=null  }">
													<td>- $ ${reservation.payment2  }</td>
												</c:if>
												<c:if test="${reservation.payment2 ==null  }">
													<td>- $ 0</td>
												</c:if>
											</tr>
										</c:if>
										<c:if
											test="${(reservation.payment1+reservation.payment2) == reservation.price   }">
											<tr>
												<td>Paid:</td>
												<td>- $ ${(reservation.payment1 + reservation.payment2)  }</td>
											</tr>

										</c:if>
										<c:if test="${reservation.reservationstt ==7  }">
											<tr>
												<td>Refund fee:</td>
												<td>- $ ${refundfee }</td>
											</tr>
										</c:if>
										<c:if test="${reservation.refundamount !=null  }">

											<tr>
												<td>Refund Amount:</td>
												<td>- $ ${reservation.refundamount }</td>
											</tr>

										</c:if>
										<tr>
											<td>Charge fee:</td>
											<td>$ ${reservation.chargefee }</td>
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
											<td>Amount:</td>
											<c:if test="${reservation.reservationstt < 7 }">
												<td class="amount">$
													${reservation.price-reservation.payment1-reservation.payment2 + reservation.refundamount}</td>
											</c:if>
											<c:if test="${reservation.reservationstt == 7 }">
												<td class="amount">$
													${reservation.price-reservation.payment1-reservation.payment2 }</td>
											</c:if>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="row" style="margin-top: 15px;">
							<c:if
								test="${(reservation.reservationstt <3 && relatedid==null ) || (reservation.reservationstt ==2 && relatedid!=null ) || alo!=null}">
								<div class="col-lg-6">
									<div class="submit-btn">
										<a class="btn btn-solid" style="border-radius: 50px"
											href="${pageContext.request.contextPath }/hotel/booking/edit?bookingId=${reservation.reservationid }&action=exchangeorrefund&policyId=${policy.policiesid}"
											type="button">Change or Refund</a>
									</div>
								</div>
							</c:if>

							<c:if test="${reservation.reservationstt <2 && relatedid!=null && roomlatecheckout ==-1}">
								<div class="col-lg-6">
									<div class="submit-btn">
										<a class="btn btn-solid" style="border-radius: 50px" href="#"
											data-toggle="modal" data-target="#show-refund">Refund</a>
									</div>
								</div>

							</c:if>
							<c:if
								test="${(reservation.price-reservation.payment1-reservation.payment2 ) >0  && reservation.reservationstt<2 && roomlatecheckout==-1}">

								<div class="col-lg-6">
									<div class="submit-btn" style="float: right">
										<a href="#" data-toggle="modal" data-target="#show-payment"
											class="btn btn-solid " style="border-radius: 50px">Payment</a>
									</div>
								</div>
							</c:if>

							<c:if
								test="${(reservation.price-reservation.payment1-reservation.payment2 ) ==0 && oldstt ==6 && reservation.reservationstt<2}">
								<div class="col-lg-6">
									<div class="submit-btn" style="float: right">
										<a class="btn btn-solid " style="border-radius: 50px"
											href="${pageContext.request.contextPath }/hotel/booking/confirm?reservationid=${reservation.reservationid}"
											type="button">Confirm</a>
									</div>
								</div>
							</c:if>
						</div>




					</div>
				</div>

				<div class="col-lg-7">
					<div class="guest-detail">
						<div class="row">
							<div class="col-lg-6"
								style="display: flex; justify-content: left;">
								<h2>Rooms List Information</h2>
							</div>
							<div class="col-lg-6"
								style="display: flex; justify-content: right;"></div>


						</div>
						<div class="summery-section">
							<div class="payment-details">


								<div class="row">
									<div class="col-lg-5"
										style="margin-right: 0px; padding-right: 15px;">
										<div class="form-group">
											<input type="text" placeholder="Search by room number..."
												name="searchroomindetailsbooking" class="form-control"
												id="searchroomindetailsbooking"
												style="border: transparent; border-bottom: 1px solid #ced4da; padding-left: 0px;">
											<input type="hidden" id="reservationid" name="reservationid"
												value="${ reservation.reservationid} ">
										</div>
									</div>

									<div class="col-lg-2"
										style="padding-top: 10px; text-align: right; padding-right: 0px;">
										<h5 class="mb-0">Sort by:</h5>
									</div>

									<div class="col-lg-5">
										<div class="form-group">

											<select id="sort" class="form-control" name="sort">
												<option selected value="-1">all Room</option>
												<option value="0">Arise Add On Service</option>


											</select>
										</div>
									</div>
								</div>

								<div class="row" style="margin-bottom: 15px;">
									<div class="col-lg-6"></div>

									<div class="col-lg-6">
										<c:if test="${checkintoday !=null || (showbuttoncheckin >=0 && showbuttoncheckin < night) }">
											
											<div class="submit-btn" style="float: right">
												<a class="btn btn-solid " style="border-radius: 50px"
													href="#" data-toggle="modal"
													data-target="#all-checkin-confirm" type="button">Check-In
													All Room</a>
											</div>
										</c:if>
										<c:if test="${checkouttoday !=null &&  addonservice ==0 }">
											<div class="submit-btn" style="float: right">
												<a class="btn btn-solid " style="border-radius: 50px"
													href="#" data-toggle="modal"
													data-target="#all-checkout-confirm" type="button">Check-Out
													All Room</a>
											</div>
										</c:if>
									</div>

								</div>
								<div class="row">
									<div class="col-lg-12"
										style="margin-right: 0px; padding-right: 15px;">
										<table style="justify-content: center; width: 100%"
											id="showlistroom">

											<thead>

												<tr>
													<td
														style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 100px">
														<h5 class="mb-0">Rooms Number</h5>
													</td>
													<td
														style="border: 1px solid #ced4da; text-align: center; padding: 10px;">
														<h5 class="mb-0">Customer Name</h5>
													</td>
													<td
														style="border: 1px solid #ced4da; text-align: center; padding: 10px;">
														<h5 class="mb-0">Amount</h5>
													</td>
													<td
														style="border: 1px solid #ced4da; text-align: center; padding: 10px;">
														<h5 class="mb-0">Status</h5>
													</td>

												</tr>

											</thead>
											<tbody>

												<c:forEach var="rs" items="${reservationroomdetails }">
													<tr>
														<td
															style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 100px">

															<h5 class="mb-0">
																<a class="mb-0"
																	href="${pageContext.request.contextPath }/hotel/reservationroom/showreservationroom?reservationroomdetailsid=${rs.reservationroomdetailsid }">${rs.rooms.roomname }</a>
															</h5>
														</td>
														<td
															style="border: 1px solid #ced4da; text-align: left; padding: 3px; width: 340px">
															<c:forEach var="reservationguestinfo"
																items="${rs.reservationguestinfos }">


																<div class="row"
																	style="text-align: left; margin-left: 0px; margin-right: 0px">
																	<h5>- ${reservationguestinfo.guestname }</h5>
																</div>

															</c:forEach>
														</td>
														<td
															style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 110px">

															<c:set var="a" value="0" /> <c:forEach
																var="reservationaddonservice"
																items="${rs.reservationaddonservices }">
																<c:if
																	test="${reservationaddonservice.reservationroomdetails.reservation.reservationid == reservation.reservationid && reservationaddonservice.reservationroomdetails.rooms.roomid== rs.rooms.roomid && reservationaddonservice.paymentstt ==0}">
																	<c:set var="a"
																		value="${a +  reservationaddonservice.amount}" />
																</c:if>

															</c:forEach>
															<h5>$ ${a }</h5>
														</td>

														<td
															style="border: 1px solid #ced4da; text-align: center; padding: 10px; width: 110px">
															<h5 class="mb-0">
																<c:if test="${rs.reservationroomtypestt ==0}">Hold </c:if>
																<c:if test="${rs.reservationroomtypestt ==1}">Deposit </c:if>
																<c:if test="${rs.reservationroomtypestt ==2}">Confirm </c:if>
																<c:if test="${rs.reservationroomtypestt ==3}">Staying </c:if>
																<c:if test="${rs.reservationroomtypestt ==4}">Check-out  </c:if>
																<c:if test="${rs.reservationroomtypestt ==5}">Expired</c:if>

															</h5>
														</td>


													</tr>


												</c:forEach>
												<tr>
													<td colspan="2"
														style="border: 1px solid #ced4da; text-align: center; padding: 10px;">
														<h5 class="mb-0">Total</h5>
													</td>
													<td
														style="border: 1px solid #ced4da; text-align: center; padding: 10px;">
														<h5 class="mb-0">$ ${addonservice }</h5>
													</td>
													<td
														style="border: 1px solid #ced4da; text-align: center; padding: 10px;">
														<h5 class="mb-0"></h5>
													</td>

												</tr>



											</tbody>



										</table>



									</div>
								</div>


							</div>
						</div>

					</div>
				</div>


			</div>
		</div>
	</section>
	<!-- booking section end -->




	<!-- tap to top -->
	<div class="tap-top">
		<div>
			<i class="fas fa-angle-up"></i>
		</div>
	</div>
	<!-- tap to top end -->
	<!-- add card modal start -->
	<div class="modal fade edit-profile-modal" id="add-note" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<form method="post"
				action="${pageContext.request.contextPath }/hotel/booking/addnote">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Quick Notes</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="text-dark">Record information to support your work
							better(optional)</p>
						<input type="hidden" name="reservationid" id="reservationid"
							value="${reservation.reservationid }">


						<textarea class="form-control" id="addnote" rows="3"
							name="addnote">${reservation.note }</textarea>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-solid" value="Save" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- edit password modal start -->

	<!-- add card modal start -->
	<div class="modal fade edit-profile-modal" id="show-refund"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<form method="post"
				action="${pageContext.request.contextPath }/hotel/booking/refund">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Are You Sure</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="text-dark">Due to this reservation being changed
							from another reservation and this reservation is not confirmed.
							So when refunding the reservation, the refund will be calculated
							on the original booking with the following information</p>
						<p></p>
						<input type="hidden" name="reservationid" value="${relatedid }">
						<input type="hidden" name="refundcharge" value="${refundcharge }">

						<table class="table table-borderless">
							<tbody>
								<tr>
									<td style="padding: 5px 0px;" style="padding: 5px 0px;">Room
										type price</td>
									<td style="padding: 5px 0px;">$ ${oldNetPrice}</td>
								</tr>
								<tr>
									<td style="padding: 5px 0px;">Total Rooms</td>
									<td style="padding: 5px 0px;">${oldtotalroom }</td>

								</tr>
								<tr>
									<td style="padding: 5px 0px;">Total Night</td>
									<td style="padding: 5px 0px;">${oldnight }</td>
								</tr>
								<tr>
									<td style="padding: 5px 0px;">Total Paid</td>
									<td style="padding: 5px 0px;">${oldPaid}</td>
								</tr>
								<tr>
									<td style="padding: 5px 0px;">Refund fee</td>
									<td style="padding: 5px 0px;">${refundcharge}</td>
								</tr>
								<tr>
									<td style="padding: 5px 0px;">Refund Amount</td>
									<td style="padding: 5px 0px;">${amount}</td>
								</tr>
							</tbody>
						</table>
						<textarea class="form-control" id="addnote" rows="3"
							name="addnote">${oldnote}</textarea>
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
	<!-- add card modal payment start -->
	<div class="modal fade edit-profile-modal" id="show-payment"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<form method="get"
				action="${pageContext.request.contextPath }/hotel/booking/payment">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Payment Process</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="text-dark" style="width: 400px;">Please select
							payment options</p>
						<input type="hidden" name="reservationid" id="reservationid"
							value="${reservation.reservationid }">

						<table class="table table-borderless">

							<tbody>
								<tr>
									<td colspan="2 form-group" style="padding: 3px 0px;">
										<h5 class="mb-0">Payments Channel</h5> <select
										id="paymentchannel" class="form-control" name="paymentchannel">
											<option selected value="CASH">CASH</option>
											<option value="CARD">CARD</option>
											<option value="TRANSFER">TRANSFER</option>
									</select>
									</td>
								</tr>

								<tr>
									<td colspan="2 form-group" style="padding: 3px 0px;">
										<input type="hidden" name="maxamount" id="maxamount" value="${ reservation.price-reservation.payment1 }"> 
										<c:if test="${reservation.reservationstt==0}">											
											<h5 class="mb-0">Amount</h5>
											<span style="color: #ef3f3e" id="showerror"></span>
											<input name="amount" class="form-control" style="width: 100%" id="amount" value="${reservation.price-reservation.payment1 }">
											<input type="hidden" name="minamount"  id="minamount" value="0">
												 
										</c:if> 
										<c:if test="${reservation.reservationstt ==1}">
											<h5 class="mb-0">Amount :$ ${ reservation.price-reservation.payment1  }</h5>
											<input type="hidden" name="minamount"  id="minamount" value="${ reservation.price-reservation.payment1  }">
											<input type="hidden" name="amount"  id="amount" value="${ reservation.price-reservation.payment1  }">
										</c:if> 

										<input type="hidden" name="check" class="form-control" style="width: 100%" id="check">
										</td>
								</tr>


							</tbody>
						</table>

						<textarea class="form-control" id="paymentsnote" rows="3"
							placeholder="payment note here..." name="paymentsnote"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-solid" value="next" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- edit payment modal start -->

	<!-- add card modal payment start -->
	<div class="modal fade edit-profile-modal" id="all-checkin-confirm"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Quick Check-in Process</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p class="text-dark" style="width: 400px;">Are you sure? When
						you click to confirm, the reservation will change status to
						Staying and Customer can not chang or refund</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a
						href="${pageContext.request.contextPath }/hotel/reservationroom/chekinforall?reservationid=${ reservation.reservationid}"
						class="btn btn-solid">Confirm</a>
				</div>
			</div>

		</div>
	</div>
	<!-- edit payment modal start -->

	<!-- add card modal payment start -->
	<div class="modal fade edit-profile-modal" id="all-checkout-confirm"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Quick Check-out Process</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p class="text-dark" style="width: 400px;">Are you sure? When
						you click to confirm, the reservation will change status to
						checkout</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a
						href="${pageContext.request.contextPath }/hotel/reservationroom/chekoutforall?reservationid=${ reservation.reservationid}"
						class="btn btn-solid">Confirm</a>
				</div>
			</div>

		</div>
	</div>
	<!-- edit payment modal start -->





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
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/jquery-3.5.1.min.js"></script>
	<!-- popper js-->






	<!-- slick js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/slick.js"></script>



	<!-- country select -->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/intlTelInput.js"></script>
	<!-- Bootstrap js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/bootstrap.js"></script>
	<!-- lazyload js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/lazysizes.min.js"></script>

	<!-- Theme js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/script.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/myajax/detailsbookingajax.js">
		
	</script>


</body>

</html>

