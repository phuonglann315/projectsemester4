<%@ tag language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" uri="http://mytags.com"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="content" fragment="true"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="rica">
<meta name="keywords" content="rica">
<meta name="author" content="rica">
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/logo/dove.ico"
	type="image/x-icon" />
<title>Traveloto</title>
<!--Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Vampiro+One&display=swap"
	rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/font-awesome.css">

<!-- Animation -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/animate.css">

<!-- Date-time picker css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/datepicker.min.css">

<!-- price range css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/price-range.css">

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

<!-- Themify icon -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/frontend/assets/css/themify-icons.css">
	
<link href="${pageContext.request.contextPath }/resources/frontend/assets/datepicker/css/bootstrap.min.css" rel="stylesheets">
<link href="${pageContext.request.contextPath }/resources/frontend/assets/datepicker/css/datepicker.css" rel="stylesheet">		  	
</head>

<body>
	<!-- pre-loader start -->
	<div class="loader-wrapper img-gif">
		<img
			src="${pageContext.request.contextPath }/resources/frontend/assets/images/loader.gif"
			alt="">
	</div>
	<!-- pre-loader end -->

	<!-- header start -->
	<header class="overlay-black">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="menu">
						<div class="brand-logo">
							<a href="${pageContext.request.contextPath }/home/index"> <img
								src="${pageContext.request.contextPath }/resources/logo/logo.png"
								alt="" width="300px" class="img-fluid blur-up lazyload">
							</a>
						</div>						
					   <c:choose>
						    <c:when test="${not empty account }">	
						    	<nav>
                            	<div class="main-navbar"></div>
                            	</nav>
						    	<ul class="header-right">	
						    	<li>
						    	<div class="main-navbar">                            	
                                    <div class="toggle-nav"><i class="fa fa-bars sidebar-bar"></i></div>
                                    <div class="menu-overlay"></div>
                                    <ul class="nav-menu">
                                    
                                    <li class="dropdown">
                                            <a href="#" class="nav-link menu-title">Welcome, ${account.accountname }</a>
                                            <ul class="nav-submenu menu-content">
                                            	<c:choose>
                                            		<c:when test="${role == 'CUSTOMER' }">
                                            			<li><a href="${pageContext.request.contextPath }/customer" class="menu-title">User dashboard</a></li>
                                            		</c:when>
                                            		<c:when test="${role == 'HOTEL' }">
                                            			<li><a href="${pageContext.request.contextPath }/hotel" class="menu-title">Hotel dashboard</a></li>
                                            		</c:when>
                                            		<c:when test="${role == 'ADMIN' }">
                                            			<li><a href="${pageContext.request.contextPath }/admin" class="menu-title">Admin dashboard</a></li>
                                            		</c:when>
                                            		<c:when test="${role == 'AGENTSCS' }">
                                            			<li><a href="${pageContext.request.contextPath }/agentcs" class="menu-title">AgentCS dashboard</a></li>
                                            		</c:when>
                                            	</c:choose>                                         
                                                <li style="margin-left: 0"><a href="${pageContext.request.contextPath }/account/logout" class="menu-title">Logout</a></li>
                                    		</ul>
                                    </li>
                                    </ul>                                 	
                            	</div>  						    
						    	</li>							    										    							    																			 																														
								</ul> 			
						    </c:when>    
						    <c:otherwise>
						    	<nav>
                            	<div class="main-navbar"></div>
                            	</nav>
						    	<ul class="header-right">							
								<li class="user user-light"><a
								href="${pageContext.request.contextPath }/account/login"><i class="fas fa-user"></i>
								</a></li>
								<li class="setting"><a href="#"> <i class="fas fa-cog"></i>
								</a>															 								
								</ul> 						       
						    </c:otherwise>
						</c:choose>						
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--  header end -->

	<jsp:invoke fragment="content"></jsp:invoke>


	<!-- footer start -->
	<footer>
		<div class="footer section-b-space section-t-space">
			<div class="container">
				<div class="row order-row">
					<div class="col-xl-2 col-md-6 order-cls">
						<div class="footer-title mobile-title">
							<h5>contact us</h5>
						</div>
						<div class="footer-content">
							<div class="contact-detail">
								<div class="footer-logo">
									<img
										src="${pageContext.request.contextPath }/resources/logo/logo.png"
										alt="" class="img-fluid blur-up lazyload">
								</div>
								<p>be helpful in your quest to find the hotel that best suit
									your needs.</p>
								<ul class="contact-list">
									<li><i class="fas fa-map-marker-alt"></i> 36/5 D5, Hcm
										City.</li>
									<li><i class="fas fa-phone-alt"></i> 518 - 457 - 5181</li>
									<li><i class="fas fa-envelope"></i>
										roisiestore.hcm@gmail.com</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-md-3">
						<div class="footer-space">
							<div class="footer-title">
								<h5>about</h5>
							</div>
							<div class="footer-content">
								<div class="footer-links">
									<ul>
										<li><a href="${pageContext.request.contextPath }/aboutus">about
												us</a></li>				
										<li><a href="${pageContext.request.contextPath }/account/login">login</a></li>
										<li><a href="${pageContext.request.contextPath }/account/login">register</a></li>
										<li><a href="#">terms & co.</a></li>
										<li><a href="#">privacy</a></li>
										<li><a href="#">support</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="footer-title">
							<h5>our location</h5>
						</div>
						<div class="footer-content">
							<div class="footer-map">
								<iframe
									src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1959.5305762351531!2d106.71134567192927!3d10.806628414100652!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528a330e608a5%3A0x4cc00c5927dcb361!2zMzUsIDYgxJDGsOG7nW5nIEQ1LCBQaMaw4budbmcgMjUsIELDrG5oIFRo4bqhbmgsIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCA3MjMwOCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1668583095347!5m2!1svi!2s"
									allowfullscreen></iframe>
							</div>

						</div>
					</div>
					<div class="col-xl-2 col-md-3 order-cls">
						<div class="footer-space">
							<div class="footer-title">
								<h5>useful links</h5>
							</div>
							<div class="footer-content">
								<div class="footer-links">
									<ul>
										<li><a href="#">home</a></li>
										<li><a href="#">our vehical</a></li>
										<li><a href="#">latest video</a></li>
										<li><a href="#">services</a></li>
										<li><a href="#">booking deal</a></li>
										<li><a href="#">emergency call</a></li>
										<li><a href="#">mobile app</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="footer-title">
							<h5>new topics</h5>
						</div>
						<div class="footer-content">
							<div class="footer-blog">
								<div class="media">
									<div class="img-part">
										<a href="#"><img
											src="${pageContext.request.contextPath }/resources/frontend/assets/images/cab/blog-footer/1.jpg"
											class="img-fluid blur-up lazyload" alt=""></a>
									</div>
									<div class="media-body">
										<h5>recent news</h5>
										<p>Lorem Ipsum is simply dummy text of the printing and
											typesetting industry. Lorem Ipsum has been the industry's
											standard dummy text ever since the 1500s, when an unknown
											printer took a galley of type and scrambled it to make a type
											specimen book. It has survived not only five centuries</p>
									</div>
								</div>
								<div class="media">
									<div class="img-part">
										<a href=""><img
											src="${pageContext.request.contextPath }/resources/frontend/assets/images/cab/blog-footer/2.jpg"
											class="img-fluid blur-up lazyload" alt=""></a>
									</div>
									<div class="media-body">
										<h5>recent news</h5>
										<p>Lorem Ipsum is simply dummy text of the printing and
											typesetting industry. Lorem Ipsum has been the industry's
											standard dummy text ever since the 1500s, when an unknown
											printer took a galley of type and scrambled it to make a type
											specimen book. It has survived not only five centuries</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="sub-footer">
			<div class="container">
				<div class="row ">
					<div class="col-xl-6 col-md-6 col-sm-12">
						<div class="footer-social">
							<ul>
								<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
								<li><a href="#"><i class="fab fa-instagram"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"></i></a></li>
								<li><a href="#"><i class="fab fa-google"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-6 col-md-6 col-sm-12">
						<div class="copy-right">
							<p>
								copyright 2022 traveloto by <i class="fas fa-heart"></i>
								pixelstrap
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer end -->


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

	<!-- price range js -->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/price-range.js"></script>

	<!-- date-time picker js -->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/date-picker.js"></script>

	<!-- slick js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/slick.js"></script>

	<!-- Bootstrap js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/bootstrap.js"></script>

	<!-- lazyload js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/lazysizes.min.js"></script>

	<!-- Theme js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/script.js"></script>

	<!-- tilt effect js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/tilt.jquery.js"></script>

	<!-- wow js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/wow.min.js"></script>

	<!-- portfolio js -->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/jquery.magnific-popup.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/zoom-gallery.js"></script>
	<!-- smooth scroll js -->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/smooth-scroll.js"></script>
	
	<script src="${pageContext.request.contextPath }/resources/frontend/assets/datepicker/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/frontend/assets/datepicker/js/bootstrap-datepicker.js"></script>

	<script>
	$(function () {
        'use strict';
        var nowTemp = new Date();   
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var checkin = $('#timeCheckIn').datepicker({
        	format: "dd-mm-yyyy",
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            if (ev.date.valueOf() + 2 > checkout.date.valueOf()) {
                var newDate = new Date(ev.date)
                newDate.setDate(newDate.getDate() + 1);
                checkout.setValue(newDate);
            }
            checkin.hide();
            $('#timeCheckOut')[0].focus();
        }).data('datepicker');
        var checkout = $('#timeCheckOut').datepicker({
        	format: "dd-mm-yyyy",
            onRender: function (date) {
                return date.valueOf() < checkin.date.valueOf() + 1 ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            checkout.hide();
        }).data('datepicker');
    });
		new WOW().init();
	</script>
	
	 <!-- popper js-->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/popper.min.js"></script>
	
    <!-- Bootstrap js-->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/bootstrap.bundle.min.js"></script>
	
	<!-- stick section js -->
    <script src='${pageContext.request.contextPath }/resources/frontend/assets/js/sticky-kit.js'></script>

    <!-- stick section js -->
    <script src='${pageContext.request.contextPath }/resources/frontend/assets/js/apexcharts.js'></script>
    <script src='${pageContext.request.contextPath }/resources/frontend/assets/js/chart.js'></script>

     <script>
        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4',
            format: 'dd mmmm yy'
        });

        $(document).ready(function () {
            if ($(window).width() > 991) {
                $(".product_img_scroll, .pro_sticky_info").stick_in_parent();
            }
        });
    </script>
	
	 <script src='${pageContext.request.contextPath }/resources/backend/assets/myajax/hotelpage.js'></script>
	
</body>

</html>

