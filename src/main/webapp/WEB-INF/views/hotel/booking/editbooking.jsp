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
					<h2 style="color: #1C75C2">EDIT PND${reservation.reservationid }</h2>
					<nav style="display: flex;justify-content: center;">
  
						<ol class="breadcrumb" style="background-color: transparent;">
							<li class="breadcrumb-item "><a style="color: #1C75C2"
							href="${pageContext.request.contextPath }/hotel/dashboard">Hotels</a></li>
						<li class="breadcrumb-item"><a style="color: #1C75C2"
							href="${pageContext.request.contextPath }/hotel/booking/detailsbooking?bookingId=${reservation.reservationid }">ReView
								Reservations</a></li>
						<li class="breadcrumb-item active">Update Reservations</li>
						</ol>
					</nav>
				</div>

			</div>
		</div>
		<div class="container" style="max-width: 1315px">
			<div class="row">
				<div class="col-lg-3 booking-order"></div>
				<div class="col-lg-6 booking-order">
					<div class="summery-box">

						<h2>Booking Infomation</h2>

						<div class=" hotel-section">
							<div class=" hotel-img">
								<img
									src="${pageContext.request.contextPath }/uploads/room/${bg2}"
									class="img-fluid blur-up lazyload" alt="">
							</div>
							<div class=" hotel-detail">
								<h6>RoomeType: ${reservation.roomtype.roomstypename }</h6>
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
										<tr > 
											<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">Number
													Customer default:</h5></td>
											<td style="padding: 3px 0px;"><h5 class="mb-0">${guestdefault }</h5></td>
										</tr>
										<tr > 
											<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">Maximum
													Customer:</h5></td>
											<td style="padding: 3px 0px;"><h5 class="mb-0">${maxcus }</h5></td>
										</tr>
										<tr > 
											<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">Total
													Rooms:</h5></td>

											<td style="padding: 3px 0px;"><h5 class="mb-0">${reservation.totalrooms }</h5></td>
										</tr>
										<tr > 
											<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">Total
													night:</h5></td>

											<td style="padding: 3px 0px;"><h5 class="mb-0">${night }</h5></td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<form method="post"
							action="${pageContext.request.contextPath }/hotel/booking/edit">
							<div class="summery-section">
								<div class="payment-details">
									<table>
										<tbody>
										<c:if test="${reservation.reservationstt !=0 &&  reservation.bookingchannels!='DIRECTCHANNEL' }">
											<tr > 
												<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">booking from:</h5></td>
														
												<td style="padding: 3px 0px;"><h5 class="mb-0">${reservation.contractinfo.contractname }</h5>
												</td>
										</tr>
											</c:if>
											<c:if test="${reservation.bookingchannels=='ONLINECHANNEL' }">
												<tr > 
													<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">booking
															person:</h5></td>
													<td style="padding: 3px 0px;"><h5 class="mb-0">${reservation.account.accountname }</h5>
													</td>
												</tr>
									
											<tr > 
												<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">Reservation's
														Channels:</h5></td>

													<td style="padding: 3px 0px;"><h5 class="mb-0">Online Channel</h5></td>
											</tr>
											
											</c:if>

											<c:if test="${reservation.bookingchannels == 'AGENTCHANNEL' && reservation.reservationstt ==0}">
												<tr > 
													<td colspan="2 form-group" style="padding: 3px 0px;">
													<h5 class="mb-0">Reservations Channel</h5>
													<select id="channel2" class="form-control" name="bookingchannels">
														
														
															<option selected value="AGENTCHANNEL">Agent
																Channel</option>
															<option value="DIRECTCHANNEL">Direct Channel</option>

													</select></td>
												</tr>
												<tr id="showchannel">
												<td colspan="2 form-group" style="padding: 3px 0px;">
													<h5 class="mb-0">List Agency</h5><select  class="form-control" name="contractinfoid">
													<c:forEach var="c" items="${ showlistcontract}">
														<option value="${c.contractid }">${c.contractname }</option>
														</c:forEach>

															
													</select>
													
													</td>
												</tr>
												
											</c:if>
											<c:if
												test="${reservation.bookingchannels == 'DIRECTCHANNEL' && reservation.reservationstt ==0}">
												<tr > 
													<td colspan="2 form-group" style="padding: 3px 0px;">
													<h5 class="mb-0">Reservations Channel</h5><select id="channel2" class="form-control" name="bookingchannels">
														
															<option selected value="DIRECTCHANNEL">Direct
																Channel</option>
															<option value="AGENTCHANNEL">Agent Channel</option>
													</select></td>
												</tr>
												<tr id="showchannel" style="display:none">
												<td colspan="2 form-group" style="padding: 3px 0px;">
													<h5 class="mb-0">List Agency</h5><select  class="form-control" name="contractinfoid">
													<c:forEach var="c" items="${ showlistcontract}">
														<option value="${c.contractid }">${c.contractname }</option>
														</c:forEach>

															
													</select></td>
												</tr>
											</c:if>



											<tr > 
												<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">customer
														name:</h5></td>
												<td></td>
											</tr>
											<tr > 

												<td colspan="2" style="padding: 3px 0px;" ><input
													value="${reservation.customername }" name="customername"
													class="form-control" style="width: 100%"></td>
											</tr>
											<tr > 
												<td style="width: 50%;padding: 3px 0px;"><h5 class="mb-0">customer
														phone:</h5></td>

											</tr>
											<tr > 

												<td colspan="2" style="padding: 3px 0px;"><input
													value="${reservation.customerphone }" name="customerphone"
													class="form-control" style="width: 100%"></td>
											</tr>


										</tbody>
									</table>
								</div>
							</div>

							<div class="row" style="margin-top: 15px;">

								<div class="col-lg-6">
									<div class="submit-btn">
										<input type="hidden" name="bookingId"
											value="${reservation.reservationid }"> <input
											class="btn btn-solid" value="Save" type="submit">


									</div>
								</div>

							</div>

						</form>


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
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/sticky-kit.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/bootstrap.js"></script>
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
<script>
	$(document).ready(function(){
		$('#channel2').change(function(){
			
			var channel=$('#channel2 option:selected').val();
			console.log(channel);
				if(channel==='DIRECTCHANNEL'){
					 document.getElementById("showchannel").style.display = 'none';
	            }else if(channel==='AGENTCHANNEL'){
					 document.getElementById("showchannel").style.display = 'contents';
	            };
			
		});
		

});
	</script>
</body>

</html>

