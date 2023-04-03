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
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/color1.css">
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
			src="${pageContext.request.contextPath }/resources/backend/images/room/${bg1}"
			class="bg-img img-fluid blur-up lazyload" alt="">
		<div class="breadcrumb-content">
			<div>
				<h2 style="color:#1C75C2 ">Refund Reservation</h2>
				<nav aria-label="breadcrumb" class="theme-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item "><a style="color:#1C75C2 "
							href="${pageContext.request.contextPath }/hotel/booking/dashboard">Hotels</a></li>
						<li class="breadcrumb-item"><a style="color:#1C75C2 "
							href="${pageContext.request.contextPath }/hotel/booking/detailsbooking?bookingId=${reservation.reservationid }">ReView Reservation</a></li>
						<li class="breadcrumb-item active">Refund Reservation</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="title-breadcrumb">${accountname }</div>
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
		<div class="container" style="max-width: 1315px">
			<div class="row">

				<div class="col-lg-12 booking-order">
					<div class="summery-box">
						
								<h2>Booking Infomation</h2>
							
						<div class=" hotel-section">
							<div class=" hotel-img">
								<img
									src="${pageContext.request.contextPath }/resources/backend/images/room/${bg2}"
									class="img-fluid blur-up lazyload" alt="">
							</div>
							<div class=" hotel-detail">
								<h6>RoomeType: ${reservation.roomtype.roomstypename }</h6>
								<c:if test="${reservation.reservationstt==0 }">

									<span class="btn btn-info">Hold</span>

								</c:if>
								<c:if test="${reservation.reservationstt==1 }">

									<span class="btn btn-outline-success">Deposit</span>

								</c:if>
								<c:if test="${reservation.reservationstt==2 }">

									<span class="btn btn-success">Confirm</span>

								</c:if>
								<c:if test="${reservation.reservationstt==3 }">

									<span class="btn btn-warning">Staying</span>

								</c:if>
								<c:if test="${reservation.reservationstt==4 }">

									<span class="btn btn-secondary">Check-Out</span>

								</c:if>

								<c:if test="${reservation.reservationstt==5 }">

									<span class="btn btn-dark">Expired- The customer didn't
										come</span>

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
											<td><h5 class="mb-0">${guestdefault }</h5></td>
										</tr>
										<tr>
											<td style="width: 50%"><h5 class="mb-0">Maximum
													Customer:</h5></td>
											<td><h5 class="mb-0">${maxcus }</h5></td>
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
													<td style="color: red">${ p.policiescontent}</td>
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
								<h5>payment details</h5>
								<table>
									<tbody>
										<tr>
											<td>Base Price:</td>
											<td>$ ${reservation.price }</td>
										</tr>
										<c:if test="${reservation.payment1 <reservation.price  }">
											<tr>
												<td>Deposit First Time:</td>
												<td>- $ ${reservation.payment1  }</td>
											</tr>
											<tr>
												<td>Deposit Second Time:</td>
												<td>- $ ${reservation.payment2  }</td>
											</tr>
										</c:if>
										<c:if test="${reservation.payment1 == reservation.price   }">
											<tr>
												<td>Deposit:</td>
												<td>- $ ${reservation.payment1  }</td>
											</tr>

										</c:if>
										<tr>
											<td>Add On Service:</td>
											<td>$ ${addonservice  }</td>
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
											<td class="amount">$
												${reservation.price-reservation.payment1-reservation.payment2 + addonservice }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row" style="margin-top: 15px;">

							<div class="col-lg-6">
								<div class="submit-btn">
									<a class="btn btn-solid"
										href="${pageContext.request.contextPath }/hotel/booking/edit?booking=${reservation.reservationid }&action=exchange"
										type="button">Exchange</a>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="submit-btn" style="float: right">
									<a class="btn btn-solid"
										href="${pageContext.request.contextPath }/hotel/booking/edit?booking=${reservation.reservationid }&action=refund"
										type="button">Refund</a>
								</div>
							</div>
						</div>




					</div>
				</div>


			</div>
			<!--end show table -->


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

	<!-- slick js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/slick.js"></script>

	<!-- Bootstrap js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/bootstrap.bundle.min.js"></script>

	<!-- country select -->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/intlTelInput.js"></script>

	<!-- lazyload js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/lazysizes.min.js"></script>

	<!-- Theme js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/script.js"></script>

	<script>
		var input = document.querySelector("#mobile-no");
		window
				.intlTelInput(
						input,
						{
							utilsScript : "${pageContext.request.contextPath }/resources/frontend/assets/js/utils.js",
						});
	</script>

</body>

</html>

