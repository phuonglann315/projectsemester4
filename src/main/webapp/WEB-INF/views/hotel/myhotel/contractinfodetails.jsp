<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" uri="http://mytags.com"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Rica admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Rica admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="pixelstrap">
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/logo/pandanus-favicon.ico"
	type="image/x-icon">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/logo/pandanus-favicon.ico"
	type="image/x-icon">
<title>${accountname }</title>
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- FontAsowme css start  -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/font-awesome.css">

<!-- Themify icon-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/themify.css">
<!-- ratio start -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/ratio.css">

<!-- Feather icon-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/feather-icon.css">
<!-- Plugins css start-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/scrollbar.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/animate.css">
<!-- Plugins css Ends-->
<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">



<!-- Bootstrap css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/bootstrap.css">
<!-- vector map css start -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vector-map.css">
<!-- vector map css start -->
<!-- slick slider-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/slick-theme.css">
<!-- App css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/style.css">
<!-- Responsive css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/responsive.css">

</head>

<body>


	<!-- pre-loader start -->
	<div class="loader-wrapper">
		<img
			src="${pageContext.request.contextPath }/resources/backend/assets/images/loader/loader.gif"
			alt="loader gif">
	</div>
	<!-- pre-loader End -->

	<!-- tap on top starts-->
	<div class="tap-top">
		<i data-feather="chevrons-up"></i>
	</div>
	<!-- tap on tap ends-->
	<!-- page-wrapper Start-->
	<div class="page-wrapper compact-wrapper modern-type" id="pageWrapper">
		<!-- Page Header Start-->
		<div class="page-header">
			<div class="header-wrapper row m-0">

				<div class="header-logo-wrapper col-auto p-0"
					style="margin-right: calc(10px + ( 30 - 10)* ((100vw- 350px)/(300- 100)))">


					<div class="logo-wrapper">
						<a href="${pageContext.request.contextPath }/home"><img
							class="img-fluid main-logo"
							src="${pageContext.request.contextPath }/uploads/hotel/${logo}"
							alt="logo"> <img class="img-fluid white-logo"
							src="${pageContext.request.contextPath }/uploads/hotel/${logo}"
							alt="logo" style="width: 200%"></a>
					</div>
					<div class="toggle-sidebar">
						<i class="status_toggle middle sidebar-toggle"
							data-feather="align-center"></i>
					</div>
				</div>


				<div class="nav-right col-4 pull-right right-header p-0">
					<ul class="nav-menus">


						<li>
							<div class="mode">
								<i class="fa fa-moon-o" aria-hidden="true"></i>
							</div>
						</li>


						<li class="maximize"><a class="text-dark" href="#!"
							onclick="javascript:toggleFullScreen()"><i
								data-feather="maximize"></i></a></li>
						<li class="profile-nav onhover-dropdown pe-0 me-0">
							<div class="media profile-media">
								<img class="user-profile rounded-circle"
									src="${pageContext.request.contextPath }/uploads/account/${avatar}"
									alt="profile-picture">
								<div class="user-name-hide media-body">
									<span>${accountname }</span>
									<p class="mb-0 font-roboto">${role }
										<i class="middle fa fa-angle-down"></i>
									</p>
								</div>
							</div>
							<ul class="profile-dropdown onhover-show-div">
								<li><a href="#"><i data-feather="user"></i><span>Account
									</span></a></li>
								<li><a href="#"><i data-feather="mail"></i><span>Inbox</span></a></li>
								<li><a href="#"><i data-feather="file-text"></i><span>Taskboard</span></a></li>
								<li><a
									href="${pageContext.request.contextPath }/account/logout"><i
										data-feather="settings"></i><span>Settings</span></a></li>
								<li><a data-bs-toggle="modal"
									data-bs-target="#staticBackdrop" href="javascript:void(0)"><i
										data-feather="log-out"> </i><span>Log out</span></a></li>

							</ul>
						</li>
					</ul>
				</div>
				<script class="result-template" type="text/x-handlebars-template">
            <div class="ProfileCard u-cf">                        
            <div class="ProfileCard-avatar"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-airplay m-0"><path d="M5 17H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-1"></path><polygon points="12 15 17 21 7 21 12 15"></polygon></svg></div>
            <div class="ProfileCard-details">
            <div class="ProfileCard-realName">{{name}}</div>
            </div>
            </div>
        </script>
				<script class="empty-template" type="text/x-handlebars-template"><div class="EmptyMessage">Your search turned up 0 results. This most likely means the backend is down, yikes!</div></script>
			</div>
		</div>
		<!-- Page Header Ends -->
		<!-- Page Body Start-->
		<div class="page-body-wrapper">
			<!-- Page Sidebar Start-->
			<div class="sidebar-wrapper" style="top: 150px">
				<div>
					<div class="logo-wrapper">
						<span class="back">Back</span>
						<div class="back-btn">
							<i class="fa fa-angle-left"></i>
						</div>
						<div class="toggle-sidebar">
							<i class="status_toggle middle sidebar-toggle"
								data-feather="grid"> </i>
						</div>
					</div>
					<div class="logo-icon-wrapper">
						<a href="${pageContext.request.contextPath }/home"><img
							class="img-fluid"
							src="${pageContext.request.contextPath }/resources/logo/dove.png"
							alt=""></a>
					</div>
					<nav class="sidebar-main">
						<div class="left-arrow" id="left-arrow">
							<i data-feather="arrow-left"></i>
						</div>
						<div id="sidebar-menu">
							<ul class="sidebar-links" id="simple-bar">
								<li class="back-btn"><a
									href="${pageContext.request.contextPath }/home"><img
										class="img-fluid"
										src="${pageContext.request.contextPath }/resources/logo/dove.png"
										alt=""></a>
									<div class="mobile-back text-end">
										<span>Back</span><i class="fa fa-angle-right ps-2"
											aria-hidden="true"></i>
									</div></li>

								<li class="sidebar-list"><a
									class="sidebar-link sidebar-title link-nav"
									href="${pageContext.request.contextPath }/hotel/dashboard"><i
										data-feather="home"> </i><span>Dashboard</span></a></li>
								<li class="sidebar-list"><a
									class="sidebar-link sidebar-title link-nav"
									href="${pageContext.request.contextPath }/hotel/booking/bookingtoday"><i
										data-feather="bookmark"> </i><span>Booking Today</span></a></li>
								<li class="sidebar-list"><a
									class="sidebar-link sidebar-title link-nav"
									href="${pageContext.request.contextPath }/hotel/booking/service"><i
										data-feather="coffee"> </i><span>Add-on Services</span></a></li>
								<li class="sidebar-list"><a
									class="sidebar-link sidebar-title" href="#"><i
										data-feather="map"></i><span>Bookings</span></a>
									<ul class="sidebar-submenu">

										<li><a
											href="${pageContext.request.contextPath }/hotel/booking/createbooking">Create
												New Booking</a></li>
										<li><a
											href="${pageContext.request.contextPath }/hotel/booking/managebooking">Manage
												Bookings</a></li>
									</ul></li>
								<li class="sidebar-list"><a
									class="sidebar-link sidebar-title" href="#"><i
										data-feather="users"></i><span>My Account </span></a>
									<ul class="sidebar-submenu">

										<li><a
											href="${pageContext.request.contextPath }/hotel/editmyaccount">Edit
												My Information</a></li>
									</ul></li>
								<li class="sidebar-list"><a
									class="linear-icon-link sidebar-link sidebar-title" href="#"><i
										data-feather="briefcase"></i><span>My Hotel </span></a>
									<ul class="sidebar-submenu">
										<li><a
											href="${pageContext.request.contextPath }/hotel/roomtype/showroomtype">Room
												Type</a></li>
										<li><a
											href="${pageContext.request.contextPath }/hotel/rooms/showrooms">Rooms</a></li>
										<li><a
											href="${pageContext.request.contextPath }/hotel/addonservices/showaddonservices">Add
												On Services</a></li>
										<li><a
											href="${pageContext.request.contextPath }/hotel/hotelseason/showhotelseason">Hotel
												Season</a></li>
										<li><a
											href="${pageContext.request.contextPath }/hotel/policies/showpolicies">Policies</a></li>
										<li><a
											href="${pageContext.request.contextPath }/hotel/contractinfo/showcontractinfo">Agency</a></li>
									</ul></li>


								<li class="sidebar-list"><a
									class="sidebar-link sidebar-title link-nav"
									href="${pageContext.request.contextPath }/hotel/reviews"><i
										data-feather="message-square"> </i><span>Reviews</span></a></li>





							</ul>
						</div>
						<div class="right-arrow" id="right-arrow">
							<i data-feather="arrow-right"></i>
						</div>
					</nav>
				</div>
			</div>
			<!-- Page Sidebar Ends-->
			<div class="page-body" style="margin-top: 180px">
				<c:if test="${errorContent != null}">
					<div class="alert alert-danger" role="alert">${errorContent}
					</div>
				</c:if>
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="row">
								<div class="col-sm-12">
									<!--Hotel detail start-->
									<div class="card">
										<h3>${msg }</h3>
										<div class="card-body form-group">
											
										
											<div class="card-header">
												<h5>Contract Info Details</h5>
												
												<c:if test="${contractinfo.contractinfostt==2 }">

									<span style="color: #5a6268; font-size: 19px;">Terminate</span>
										
								</c:if>
								<c:if test="${contractinfo.contractinfostt==0 }">

									<span style="color: #ffc107; font-size: 19px;">New</span>
									


								</c:if>
								<c:if test="${contractinfo.contractinfostt==1  }">
									<span style="color: #28a745; font-size: 19px;">Take effect</span>
								</c:if>
											</div>

											<div class="card-body form-group">												
													<div class="row g-3" style="margin-bottom: 16px">

														<div class="col-sm-6 ">
															<label class="form-label-title">Name:</label> <input
																type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																id="contractname" name="contractname" value=${contractinfo.contractname }
																readonly="readonly" />
														</div>
														<div class="col-sm-6 ">
															<label class="form-label-title">Taxcode: </label> <input
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																value="${contractinfo.taxcode }" readonly="readonly" /> 
														</div>
														<div class="col-sm-6 ">
															<label class="form-label-title">From Date:</label>

															<fmt:formatDate var="fd" value="${contractinfo.fromdate }"
																pattern="dd-MM-yyyy" />
															<input type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																value="${fd }" readonly="readonly" />
														</div>

														<div class="col-sm-6 ">
															<label class="form-label-title">To Date:</label> 
																<fmt:formatDate var="td" value="${contractinfo.todate }"
																pattern="dd-MM-yyyy" />
															<input type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																value="${td }" readonly="readonly" />

														</div>
														<div class="col-sm-6 ">
															<label class="form-label-title">Email:</label> <input
																type="email"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																id="email" name="email" readonly="readonly" value="${contractinfo.email }" />
														</div>
														<div class="col-sm-6 ">
															<label class="form-label-title">Phone:</label> <input
																type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																id="phone" name="phone" readonly="readonly" value="${contractinfo.phone }"/>
														</div>
														<div class="col-sm-12 ">
															<label class="form-label-title">Address:</label> <input
																type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																id="address" name="address"readonly="readonly" value="${contractinfo.address }" />
														</div>
														<div class="col-sm-12 ">
															<label class="form-label-title">Agent Channel:</label> 
														<input
																type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																id="address" name="address"readonly="readonly" value="${contractinfo.channel }" />
														</div>
														<c:forEach var="r" items="${Contractinforoomtypes }">
														<div class="col-sm-4 ">
															<label class="form-label-title">Type:</label> <input
																type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																value="${r.roomtype.roomstypename }" readonly="readonly" />
														</div>
														<div class="col-sm-4 ">
															<label class="form-label-title">High Season Price:</label> <input
																type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																id="hightseasonprice" name="hightseasonprice" readonly="readonly"  value="${r.hightseasonprice }"/>
														</div>
														<div class="col-sm-4 ">
															<label class="form-label-title">Low Season Price:</label> <input
																type="text"
																style="border-radius: 0; text-transform: capitalize; border: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;"
																id="lowseasonprice" name="lowseasonprice" readonly="readonly"  value="${r.lowseasonprice }" />
														</div>
														</c:forEach>	
														<div class="card-footer text-end">
														<c:if test="${contractinfo.contractinfostt ==0}"><a
																href="${pageContext.request.contextPath }/hotel/contractinfo/editcontract?contractinfoid=${contractinfo.contractid}"
																class="btn btn-outline-primary">Edit</a></c:if>
																<c:if test="${contractinfo.contractinfostt <2}">
														<a data-bs-toggle="modal" data-bs-target="#ChangeStatus" href="javascript:void(0)" class="btn  btn--yes btn-primary">Change Status</a>
														</c:if>
														</div>
													</div>
											</div>
										</div>


									</div>
									<!--Hotel detail end-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<!-- footer start-->
					<footer class="footer">

						<div class="row">
							<div class="col-md-12 footer-copyright text-center">
								<p class="mb-0">
									Copyright 2022 © KhongMapLam Team <i class="fas fa-heart"></i>
								</p>
							</div>
						</div>

					</footer>
				</div>
			</div>
		</div>

	</div>
	<!-- Modal -->
	<div class="modal fade " id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<h5 class="modal-title" id="staticBackdropLabel">Logging Out</h5>
					<p>Are you sure you want to log out?</p>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
					<div class="button-box">
						<button type="button" class="btn btn--no " data-bs-dismiss="modal">No</button>
						<a href="${pageContext.request.contextPath }/account/logout"
							class="btn  btn--yes btn-primary">Yes</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="customizer-links"></div> -->
<div class="modal fade " id="ChangeStatus" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<h5 class="modal-title" id="staticBackdropLabel">Change Status</h5>
					<p>Are you sure you want to Change Status?</p>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
					<div class="button-box">
					<c:if test="${contractinfo.contractinfostt==0 }">
					<a href="${pageContext.request.contextPath }/hotel/contractinfo/changestt?contractid=${contractinfo.contractid}&stt=2"
							class="btn btn--no " >Non-Active</a>
					
					<a href="${pageContext.request.contextPath }/hotel/contractinfo/changestt?contractid=${contractinfo.contractid}&stt=1"
							class="btn  btn--yes btn-primary">Active</a>
					</c:if>
					<c:if test="${contractinfo.contractinfostt==1 }">
					<a href="${pageContext.request.contextPath }/hotel/contractinfo/changestt?contractid=${contractinfo.contractid}&stt=2"
							class="btn btn--no " >Non-Active</a>
					</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- latest jquery-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap js-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- feather icon js-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/icons/feather-icon/feather.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/icons/feather-icon/feather-icon.js"></script>
	<!-- scrollbar js-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/scrollbar/simplebar.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/scrollbar/custom.js"></script>
	<!-- Sidebar jquery-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/config.js"></script>


	<!-- tooltip init js  start-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/tooltip-init.js"></script>
	<!-- tooltip init js  end-->

	<!-- slick js start -->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/slick.js"></script>
	<!-- slick js end -->

	<!-- Plugins JS start-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/sidebar-menu.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/notify/bootstrap-notify.min.js"></script>


	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/notify/index.js"></script>



	<!-- Plugins JS Ends-->

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	<!-- Apexchar js start -->
	<!-- ratio start  -->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/ratio.js"></script>
	<!-- vector map start -->
	<!-- customizer js start  -->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/customizer.js"></script>
	<!-- customizer js start  -->

	<!-- Theme js-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/script.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/myajax/createContract.js"></script>

	<!-- login js-->
	<!-- Plugin used-->
</body>

</html>