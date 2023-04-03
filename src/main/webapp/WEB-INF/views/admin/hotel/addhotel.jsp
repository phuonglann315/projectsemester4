<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

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
	href="${pageContext.request.contextPath }/resources/logo/dove.ico"
	type="image/x-icon">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/logo/dove.ico"
	type="image/x-icon">
<title>Traveloto</title>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/date-picker.css">
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
							src="${pageContext.request.contextPath }/resources/logo/logo.png"
							alt="logo"> <img class="img-fluid white-logo"
							src="${pageContext.request.contextPath }/resources/logo/logo.png"
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
									src="${pageContext.request.contextPath }/resources/logo/dove.png"
									alt="profile-picture">
								<div class="user-name-hide media-body">
									<span>${accountname }</span>
									<p class="mb-0 font-roboto">${role }
										<i class="middle fa fa-angle-down"></i>
									</p>
								</div>
							</div>
							<ul class="profile-dropdown onhover-show-div">
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
			<div class="sidebar-wrapper">
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
									class="sidebar-link sidebar-title" href="#"><i
										data-feather="map"></i><span>Hotel</span></a>
									<ul class="sidebar-submenu">
									<li><a
											href="${pageContext.request.contextPath }/admin/hotel/showlisthotel">My List hotel</a></li>
										<li><a
											href="${pageContext.request.contextPath }/admin/hotel/addhotel">Add New Hotel</a></li>
									</ul></li>
									<li class="sidebar-list"><a
									class="sidebar-link sidebar-title" href="#"><i
										data-feather="user"></i><span>Account</span></a>
									<ul class="sidebar-submenu">
									<li><a
											href="${pageContext.request.contextPath }/admin/account/showlistaccount">My List Account</a></li>
										<li><a
											href="${pageContext.request.contextPath }/admin/account/addaccount">Add New Account</a></li>
												
										<li><a
											href="${pageContext.request.contextPath }/admin/account/editaccount">Edit Account</a></li>
												
									</ul></li>

								

								<li class="sidebar-list"><a
									class="sidebar-link sidebar-title link-nav" href="${pageContext.request.contextPath }/admin/myaccount/changepass"><i
										data-feather="message-square"> </i><span>My Account</span></a></li>





							</ul>
						</div>
						<div class="right-arrow" id="right-arrow">
							<i data-feather="arrow-right"></i>
						</div>
					</nav>
				</div>
			</div>
			<!-- Page Sidebar Ends-->
			<div class="page-body">
	 <div class="container-fluid">
                    <div class="row">

                        <div class="col-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <!--Hotel detail start-->
                                    <div class="card">
                                        <div class="card-header">
                                            <h5>Add New Hotel</h5>
                                        </div>
                                        <div class="card-body">
                        
										
                                                <div class="mb-3">
                                                    <label
												class="form-label-title">Hotel Name</label>
                                                    <input class="form-control" type="text" placeholder="Hotel Name" name="hotelname" id="hotelname">
													
												       
                                                </div>
                                                
                                                <div class="mb-3">                                              
                                                    <label class="form-label-title ">Province</label>												
                                                    <select class="form-control js-example-basic-single col-sm-12" id="province">
													<option selected disabled="disabled" value="-1">Please Choose Province</option>
 														<c:forEach var="province" items="${provinces }">
                                                        <option
														value="${province.provinceid }"> ${province.provincename }</option> 		
                                                        </c:forEach>
                                                    </select>                                              
                                                 </div>
                                                 <input type="hidden" id="checkshowprovince" value="0">
                                                 <input type="hidden" id="checkshowcity" value="0">
                                                 <input type="hidden" id="checkshowward" value="0">
                                                  <div class="mb-3" id="showcities" style="display: none">                                              
                                        
                                                 </div>
                                                 <div class="mb-3" id="showward" style="display: none">                                              
                                        
                                                 </div>
													<div class="mb-3">
                                                    <label class="form-label-title">Street: </label>
												
                                                    <input class="form-control" type="text" placeholder="Street" name="street" id="street">
												
												       
                                                </div>
                                                    <div class="row g-2">
                                                        <div
																		class=" col-xl-12 col-xxl-6 ">
                                                            <label
																			class="form-label-title ">Hotel Inclusion</label>
                                                            <div
																			class="row g-3">
                                                                <div
																				class=" col-xs-12 col-sm-4">
                                                                    <label
																					class="d-block" for="spa">
                                                                        <input class="checkbox_animated" id="spa" type="checkbox" value="0" name="spa">Spa
																					
																					
                                                                    </label>
                                                                    <label
																					class="d-block" for="pool">
                                                                        <input
																					class="checkbox_animated" id="pool" value="0"
																					type="checkbox" name="pool">Pool
                                                                    </label>
                                                                    <label
																					class="d-block" for="beach">
                                                                        <input
																					class="checkbox_animated" id="beach" value="0"
																					type="checkbox"  name="beach"> Beach
                                                                    </label>
                                                                    <label
																					class="d-block" for="bar">
                                                                        <input
																					class="checkbox_animated" id="bar" value="0"
																					type="checkbox" name="bar"> Bar

                                                                    </label>
                                                                </div>
                                                                <div
																				class=" col-xs-12 col-sm-4">
                                                                    <label
																					class="d-block" for="restaurants">
                                                                        <input
																					class="checkbox_animated" id="restaurants"  value="0"
																					type="checkbox"  name="restaurants"> Restaurants
																					
                                                                    </label>
                                                                    <label
																					class="d-block" for="frontdesk">
                                                                        <input
																					class="checkbox_animated" id="frontdesk"  value="0"
																					type="checkbox" name="frontdesk"> Frontdesk 
                                                                    </label>
                                                                    <label
																					class="d-block" for="transport">
                                                                        <input
																					class="checkbox_animated" id="transport"  value="0"
																					type="checkbox"  name="transport"> Transport
                                                                    </label>
                                                                    <label
																					class="d-block" for="shuttle">
                                                                        <input
																					class="checkbox_animated" id="shuttle"  value="0"
																					type="checkbox" name="shuttle"> Shuttle 
                                                                    </label>
                                                                </div>
                                                                
                                                                <div
																				class=" col-xs-12 col-sm-4">
                                                                   <label
																					class="d-block" for="parking">
                                                                        <input
																					class="checkbox_animated" id="parking"  value="0"
																					type="checkbox"  name="parking">Parking
                                                                    </label>
                                                                    <label
																					class="d-block" for="fitnesscenter">
                                                                        <input
																					class="checkbox_animated" id="fitnesscenter"  value="0"
																					type="checkbox" name="fitnesscenter"> Fitnesscenter
                                                                    </label>
                                                                </div>
                                                            </div>


                                                        </div>
													</div>
                                                         <div class="mb-3" >              
                                                         <label class="form-label-title ">Hotel Description</label>
                                                        
                                                    	<textarea class="form-control" id="description" name="description" cols="30" rows="10">
                                                    	</textarea>
                                                    	</div>
                                                    	
                                                         <div class="card-footer text-end" >
														
                                           					 <input class="btn btn-primary me-3" type="button" value="Add New Hotel" id="dd">

                                        				</div>

                                   
                                       

                                    </div>
                                </div>

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
                                <p class="mb-0">Copyright 2022 © KhongMapLam Team <i class="fas fa-heart"></i></p>
                            </div>
                        </div>

                    </footer>
                </div>
			</div>
		</div>

	</div>
	
	<!-- add card modal payment start -->
	<div class="modal fade edit-profile-modal" id="confirm"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">	
		<input type="hidden" id="ok" value='0'>	
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="showtitle"></h5>
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

	<!-- ratio start  -->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/ratio.js"></script>
	<!-- vector map start -->
	<!-- customizer js start  -->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/customizer.js"></script>
	<!-- customizer js start  -->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/vector-map/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/vector-map/map/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/vector-map/map-vector.js"></script>
	<!-- vector map end -->
	<!-- Theme js-->
	<script
		src="${pageContext.request.contextPath }/resources/backend/assets/js/script.js"></script>
		
		
<script  src="${pageContext.request.contextPath }/resources/backend/assets/myajax/adminshowaddhotel.js"></script>
	<!-- Plugin used-->

</body>

</html>