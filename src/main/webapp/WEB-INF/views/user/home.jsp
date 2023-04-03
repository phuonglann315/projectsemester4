<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<style type="text/css">
	
		.select2-hidden-accessible {
	    border: 0 !important;
	    clip: rect(0 0 0 0) !important;
	    height: 1px !important;
	    margin: -1px !important;
	    overflow: hidden !important;
	    padding: 0 !important;
	    position: absolute !important;
	    width: 2px !important
		}
		
		.select2-container--default .select2-selection--single,
			.select2-selection .select2-selection--single {
		    border: none;
		    border-radius: 0;
		    padding: 6px 12px;
		    height: 34px
		}
		
		.select2-container--default .select2-selection--single {
		    background-color: #fff;
		   	border: none;
		    border-radius: 4px
		}
		
		.select2-container .select2-selection--single {
		    box-sizing: border-box;
		    cursor: pointer;
		    display: block;
		    height: 28px;
		    user-select: none;
		    -webkit-user-select: none
		}
		
		.select2-container .select2-selection--single .select2-selection__rendered {
		    padding-right: 10px
		}
		
		.select2-container .select2-selection--single .select2-selection__rendered {
		    padding-left: 0;
		    padding-right: 0;
		    height: auto;
		    margin-top: -3px
		}
		
		.select2-container--default .select2-selection--single .select2-selection__rendered {
		    color: #444;
		    line-height: 28px
		}
		
		.select2-container--default .select2-selection--single,
		.select2-selection .select2-selection--single {
			font-size: 18px;
		    border: none; 
		    border-radius: 0 !important;
		    padding: 6px 12px;
		    height: 40px !important
		}
		
		.select2-container--default .select2-selection--single .select2-selection__arrow {
		    height: 26px;
		    position: absolute;
		    top: 6px !important;
		    right: 1px;
		    width: 20px
		}
	
</style>
<mt:userTemplate>	
	<jsp:attribute name="content">
		<!-- home section start -->
		
	<section class="home_section mrg-cls p-0">
		<div>
			<div class="home home-long home-full search-bottom black-layer">
				<img
						src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/background/hotel-bg.jpg"
						class="bg-img img-fluid blur-up lazyload" alt="">
				<div class="container ">
					<div class="row">
						<div class="col-md-12">
							<div class="banner-content d-none d-lg-block banner-center-text">
								<div>
									<h4>welcome to Traveloto</h4>
									<h1>
										Find deals on <span class="txt-rotate" data-period="2000"
												data-rotate='[ "hotels.", "homes.", "Hostels.", "villas.", "apts." ]'></span>
									</h1>
									<a href="#" class="btn btn-solid d-none d-lg-inline-block"
											tabindex="0">seach now</a>
								</div>
							</div>
							<div class="home-content mix-layout">
								<div class="bg-transparent">
									<div class="flight-search">
										<div class="flight-search-detail form-icon p-0">
										<h3>${msg }</h3>
											<form method="GET" class="row m-0" style="height: 74px"
													action="${pageContext.request.contextPath }/list/searchHome">
												<div class="col p-3" style="padding: 3px">
													<div class="form-group">														
													<select class="form-group select2 select2-hidden-accessible" name="provinceid" style="width: 100%; tabindex=-1" id=autoComplete required="required">
													
													</select>													
													</div>
													
												</div>
												
												<div class="col p-0">
													<div class="form-group">														
													          <!-- <label for="inputDate">Date</label> -->
													          <input type="text" name="checkin" placeholder="check-in" class="form-control" id="timeCheckIn" required="required"><i
																class="far fa-calendar-alt icon"></i>													   
													</div>
												</div>
												<div class="col p-0">
													<div class="form-group">
														  <input type="text" name="checkout" placeholder="check-out" class="form-control" id="timeCheckOut" required="required"><i
																class="far fa-calendar-alt icon"></i>														
													</div>
												</div>
												
												
												<div id="dropdate" class="col p-0">
													<div class="form-group rooms-section">
														<input type="number" name="guest" class="form-control open-select"
																placeholder="guests" min="1" id="guest" required="required"> <i
																class="fas fa-user-alt icon"></i>
													</div>
												</div>
												<div id="dropdate" class="col p-0">
													<div class="form-group rooms-section">
														<input type="number" name="room" class="form-control open-select"
																placeholder="rooms" min="1" id="room" required="required"> <i
																class="fas fa-warehouse icon"></i>
													</div>
												</div>																	
												<div class="col search-col p-0">
													<div class="search-btn">
														<input type="submit" class="btn btn-solid color1" value="search">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- home section end -->
	<!-- top cities section start -->
	<div class="bg-white">
		<div class="container">
			<section class="category-part small-section pb-0 ratio_square">
				<div class="row">
					<div class="col">
						<div class="slide-6 no-arrow">
							<div class="category-block">
								<a
										href="${pageContext.request.contextPath }/list/location?provinceid=1"
										tabindex="0">
									<div class="category-image">
										<img
												src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/gallery/hcm.jpg"
												class="img-fluid blur-up lazyload bg-img" alt="">
									</div>
								</a>
								<div class="category-details">
									<a
											href="${pageContext.request.contextPath }/list/location?provinceid=1"
											tabindex="0">
										<h3>Ho Chi Minh</h3>
									</a>
									<h6>${counthcm } accommodations</h6>
								</div>
							</div>
							<div class="category-block">
								<a
										href="${pageContext.request.contextPath }/list/location?provinceid=2"
										tabindex="0">
									<div class="category-image">
										<img
												src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/gallery/hn.jpg"
												class="img-fluid blur-up lazyload bg-img" alt="">
									</div>
								</a>
								<div class="category-details">
									<a
											href="${pageContext.request.contextPath }/list/location?provinceid=2"
											tabindex="0">
										<h3>Ha Noi</h3>
									</a>
									<h6>${counthn } accommodations</h6>
								</div>
							</div>
							<div class="category-block">
								<a
										href="${pageContext.request.contextPath }/list/location?provinceid=6"
										tabindex="0">
									<div class="category-image">
										<img
												src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/gallery/pt.jpg"
												class="img-fluid blur-up lazyload bg-img" alt="">
									</div>
								</a>
								<div class="category-details">
									<a
											href="${pageContext.request.contextPath }/list/location?provinceid=6"
											tabindex="0">
										<h3>Binh Thuan</h3>
									</a>
									<h6>${countpt } accommodations</h6>
								</div>
							</div>
							<div class="category-block">
								<a
										href="${pageContext.request.contextPath }/list/location?provinceid=4"
										tabindex="0">
									<div class="category-image">
										<img
												src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/gallery/nt.jpg"
												class="img-fluid blur-up lazyload bg-img" alt="">
									</div>
								</a>
								<div class="category-details">
									<a
											href="${pageContext.request.contextPath }/list/location?provinceid=4"
											tabindex="0">
										<h3>Khanh Hoa</h3>
									</a>
									<h6>${countnt } accommodations</h6>
								</div>
							</div>
							<div class="category-block">
								<a
										href="${pageContext.request.contextPath }/list/location?provinceid=3"
										tabindex="0">
									<div class="category-image">
										<img
												src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/gallery/dn.jpg"
												class="img-fluid blur-up lazyload bg-img" alt="">
									</div>
								</a>
								<div class="category-details">
									<a
											href="${pageContext.request.contextPath }/list/location?provinceid=3"
											tabindex="0">
										<h3>Da Nang</h3>
									</a>
									<h6>${countdn } accommodations</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- top cities section end -->


	<!-- hotel section start -->
	<section class="process-steps section-b-space bg-white">
		<div class="container">
			<div class="title-1">
				<span class="title-label">deals</span>
				<h2>Featured hotels recommended for you</h2>
			</div>
			
			<div class="step-bg ratio_square">
				<div class="row popular-section">
				<c:forEach var="list" items="${listhotels }">
				<div class="col-lg-3 col-sm-6">
						<div class="step-box">
							<div class="popular-box">
								<div class="popular_img">
									<c:forEach var="photo" items="${list.hotel.hotelimages}">
									<img
													src="${pageContext.request.contextPath }/uploads/hotel/${photo.hotelimagename}"
													alt="" class="img-fluid blur-up lazyload bg-img">
									</c:forEach>	
								</div>
								<div class="special-content">
									<a href="${pageContext.request.contextPath }/page/hotel?hotelid=${ list.hotel.hotelid }">
										<h5>${list.hotel.hotelname }
											
										</h5>
										 <span><i class="fas fa-map-marker-alt"></i>
												${list.hotel.ward.wardname }</span>
									</a>
									<div class="bottom-section">
										<div class="rating">
											
												<c:choose>                                       		
													<c:when test="${ '0' <= list.hotel.totalrating <= '5'}">
															<i class="fas fa-star"></i>
										                    <i class="far fa-star"></i>
										                    <i class="far fa-star"></i>                                            
										                    <i class="far fa-star"></i>
										                    <i class="far fa-star"></i>
													</c:when>  
													<c:when test="${ '5' < list.hotel.totalrating <= '7'}">
															<i class="fas fa-star"></i>
										                    <i class="fas fa-star"></i>
										                    <i class="far fa-star"></i>                                            
										                    <i class="far fa-star"></i>
										                    <i class="far fa-star"></i>
													</c:when> 
													<c:when test="${ '7' < list.hotel.totalrating <= '8'}">
															<i class="fas fa-star"></i>
										                    <i class="fas fa-star"></i>
										                    <i class="fas fa-star"></i>                                            
										                    <i class="far fa-star"></i>
										                    <i class="far fa-star"></i>
													</c:when>  
													<c:when test="${ '8' < list.hotel.totalrating <= '9'}">
															<i class="fas fa-star"></i>
										                    <i class="fas fa-star"></i>
										                    <i class="fas fa-star"></i>                                            
										                    <i class="fas fa-star"></i>
										                    <i class="far fa-star"></i>
													</c:when>											
													<c:otherwise>
															<i class="fas fa-star"></i>
										                    <i class="fas fa-star"></i>
										                    <i class="fas fa-star"></i>                                            
										                    <i class="fas fa-star"></i>
										                    <i class="fas fa-star"></i>											   
													</c:otherwise>
												   </c:choose>  											
											<span>324 review</span>
										</div>
										<div class="price">
											<del>$${ list.roomtype.publicprice }</del>
											<span>$${ list.showprice }</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>					
				</c:forEach>
				</div>
			</div>
					
	
		
		
		</section>
	<!-- hotel section start -->

       <!-- video section start -->
    <section class="video-section parallax-img">
        <img
				src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/background.jpg"
				alt="" class="img-fluid blur-up lazyload bg-img">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="basic-section">
                        <h2>relax and enjoy</h2>
                        <h4>luxury hotel & best resort</h4>
                        <div data-toggle="modal" data-target="#video"
								class="video-icon">
                            <span></span>
                            <div class="animation-circle-inverse">
									<i></i><i></i>
								</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade video-modal" id="video" role="dialog"
			aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered"
				role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                    <iframe
							src="https://www.youtube.com/embed/ezuKIzXJuz8" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- video section end -->

	<!-- blog section start-->
	<section class="blog_section mt-0 section-b-space ratio_55 bg-white" style="height: 700px; padding-bottom: 70px">
		<div class="container">
			<div class="title-1">
				<span class="title-label">blog</span>
				<h2>Travel Guide</h2>
			</div>
			<div class="slide-3 no-arrow">
				<div>
					<div class="blog-wrap rounded-0">
						<div class="blog-image">
							<a href="#"> <img
									src="${pageContext.request.contextPath }/resources/frontend/assets/images/portfolio/4.jpg"
									class="img-fluid blur-up lazyload bg-img" alt="">
							</a>
							<div class="blog-label rounded-0">
								<div>
									<h3>05</h3>
									<h6>nov</h6>
								</div>
							</div>
						</div>
						<div class="blog-details">
							<h6>
								<i class="fas fa-map-marker-alt color-1"></i>phonics, newyork
							</h6>
							<a href="#">
								<h5>Twice profit than before you</h5>
							</a>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry. Lorem Ipsum has been the industry's
								standard dummy text.</p>
						</div>
					</div>
				</div>
				<div>
					<div class="blog-wrap rounded-0">
						<div class="blog-image">
							<a href="#"> <img
									src="${pageContext.request.contextPath }/resources/frontend/assets/images/portfolio/2.jpg"
									class="img-fluid blur-up lazyload bg-img" alt="">
							</a>
							<div class="blog-label rounded-0">
								<div>
									<h3>05</h3>
									<h6>nov</h6>
								</div>
							</div>
						</div>
						<div class="blog-details">
							<h6>
								<i class="fas fa-map-marker-alt color-1"></i>phonics, newyork
							</h6>
							<a href="#">
								<h5>Twice profit than before you</h5>
							</a>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry. Lorem Ipsum has been the industry's
								standard dummy text.</p>
						</div>
					</div>
				</div>
				<div>
					<div class="blog-wrap rounded-0">
						<div class="blog-image">
							<a href="#"> <img
									src="${pageContext.request.contextPath }/resources/frontend/assets/images/portfolio/10.jpg"
									class="img-fluid blur-up lazyload bg-img" alt="">
							</a>
							<div class="blog-label rounded-0">
								<div>
									<h3>05</h3>
									<h6>nov</h6>
								</div>
							</div>
						</div>
						<div class="blog-details">
							<h6>
								<i class="fas fa-map-marker-alt color-1"></i>phonics, newyork
							</h6>
							<a href="#">
								<h5>Twice profit than before you</h5>
							</a>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry. Lorem Ipsum has been the industry's
								standard dummy text.</p>
						</div>
					</div>
				</div>
				<div>
					<div class="blog-wrap rounded-0">
						<div class="blog-image">
							<a href="#"> <img
									src="${pageContext.request.contextPath }/resources/frontend/assets/images/portfolio/2.jpg"
									class="img-fluid blur-up lazyload bg-img" alt="">
							</a>
							<div class="blog-label rounded-0">
								<div>
									<h3>05</h3>
									<h6>nov</h6>
								</div>
							</div>
						</div>
						<div class="blog-details">
							<h6>
								<i class="fas fa-map-marker-alt color-1"></i>phonics, newyork
							</h6>
							<a href="#">
								<h5>Twice profit than before you.</h5>

							</a>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry. Lorem Ipsum has been the industry's
								standard dummy text.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- blog section end-->

    
	<!-- section start -->
	<section class="about-section pt-0 section-b-space bg-white">
		<div class="container">
			<div class="title-1 detail-title">
				<h2>why choose traveloto?</h2>
				<p>Traveloto is the one-stop hotel reservations app that gets you great hotels deals. 
				Our hotel promos make sure you get the most from your travel budget. 
				We are easy to use and booking is fast -- simply type the name of your destination city and see 
				the hotels in the area. </p>
			</div>
			<div class="highlight-section">
				<div class="row">
					<div class="col-xl-3 col-6">
						<div class="highlight-box wow fadeInUp">
							<div>
								<svg version="1.1" id="Capa_2"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
										viewBox="0 0 480 480"
										style="enable-background: new 0 0 480 480;"
										xml:space="preserve">
                                    <g>
                                        <g>
                                            <path
											d="M304,304.808V232c0-13.232-10.768-24-24-24H56c-13.232,0-24,10.768-24,24v72.808C13.768,308.528,0,324.688,0,344v48v80
			c0,4.416,3.584,8,8,8h32c4.416,0,8-3.584,8-8v-24h240v24c0,4.416,3.584,8,8,8h32c4.416,0,8-3.584,8-8v-80v-48
			C336,324.688,322.232,308.528,304,304.808z M48,232c0-4.408,3.592-8,8-8h224c4.408,0,8,3.592,8,8v72h-16v-32
			c0-13.232-10.768-24-24-24h-48c-13.232,0-24,10.768-24,24v32h-16v-32c0-13.232-10.768-24-24-24H88c-13.232,0-24,10.768-24,24v32
			H48V232z M256,272v32h-64v-32c0-4.408,3.592-8,8-8h48C252.408,264,256,267.592,256,272z M144,272v32H80v-32c0-4.408,3.592-8,8-8
			h48C140.408,264,144,267.592,144,272z M320,464h-16v-24c0-4.416-3.584-8-8-8H40c-4.416,0-8,3.584-8,8v24H16v-64h304V464z M320,384
			H16v-40c0-13.232,10.768-24,24-24h32h80h32h80h32c13.232,0,24,10.768,24,24V384z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M472,304H360c-4.416,0-8,3.584-8,8v64v56h16v-48h96v48h16v-56v-64C480,307.584,476.416,304,472,304z M464,368h-96v-48h96
			V368z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <rect x="400" y="336"
											width="32" height="16" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M455.592,237.464l-16-48C438.496,186.2,435.448,184,432,184h-32c-3.448,0-6.496,2.2-7.592,5.472l-16,48
			c-0.816,2.44-0.4,5.12,1.104,7.208c1.504,2.088,3.92,3.32,6.488,3.32h24v24h-16v16h48v-16h-16v-24h24
			c2.568,0,4.984-1.232,6.488-3.328C455.992,242.584,456.4,239.904,455.592,237.464z M395.096,232l10.672-32h20.472l10.664,32
			H395.096z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M475.272,104.696l-232-104c-2.088-0.928-4.464-0.928-6.544,0l-232,104C1.848,105.992,0,108.848,0,112v96h16v-90.824
			L240,16.768l224,100.416V208h16v-96C480,108.848,478.152,105.992,475.272,104.696z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M295.224,110.672l-15.784,2.656c0.376,2.184,0.56,4.424,0.56,6.672c0,22.056-17.944,40-40,40c-22.056,0-40-17.944-40-40
			c0-22.056,17.944-40,40-40c4.576,0,9.072,0.768,13.344,2.28l5.328-15.088C252.68,65.072,246.4,64,240,64c-30.88,0-56,25.12-56,56
			s25.12,56,56,56s56-25.12,56-56C296,116.864,295.736,113.728,295.224,110.672z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M290.344,66.344L240,116.688l-10.344-10.344l-11.312,11.312l16,16c1.56,1.56,3.608,2.344,5.656,2.344
			c2.048,0,4.096-0.784,5.656-2.344l56-56L290.344,66.344z" />
                                        </g>
                                    </g>
                                </svg>
							</div>
							<div class="content-sec">
								<h5>1200 + exclusive hotels</h5>
								<p>We always have special discounts for our special customers.
								Join us to discover more Traveloto member benefits!</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-6">
						<div class="highlight-box wow fadeInUp">
							<div>
								<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 470 470"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										enable-background="new 0 0 470 470">
                                    <g>
                                        <path
											d="M235,148.009c40.806,0,74.004-33.198,74.004-74.005C309.004,33.198,275.806,0,235,0s-74.004,33.198-74.004,74.004   C160.996,114.811,194.194,148.009,235,148.009z M235,15c32.535,0,59.004,26.469,59.004,59.004S267.535,133.009,235,133.009   s-59.004-26.47-59.004-59.005S202.465,15,235,15z">
                                        </path>
                                        <path
											d="m235,178.009c59.812,0 108.922,46.69 112.793,105.539h-173.333c-4.142,0-7.5,3.357-7.5,7.5s3.358,7.5 7.5,7.5h181.08c4.142,0 7.5-3.357 7.5-7.5 0-70.601-57.438-128.039-128.04-128.039s-128.04,57.438-128.04,128.039c0,4.143 3.358,7.5 7.5,7.5h30c4.142,0 7.5-3.357 7.5-7.5s-3.358-7.5-7.5-7.5h-22.254c3.872-58.849 52.983-105.539 112.794-105.539z">
                                        </path>
                                        <path
											d="m140.408,377.712l-41.143-6.905-19.281-36.995c-1.292-2.479-3.855-4.034-6.651-4.034s-5.359,1.555-6.651,4.034l-19.281,36.995-41.143,6.905c-2.757,0.463-5.028,2.42-5.892,5.079-0.864,2.658-0.177,5.577 1.781,7.571l29.227,29.77-6.147,41.263c-0.412,2.766 0.748,5.53 3.01,7.173 2.26,1.644 5.249,1.892 7.751,0.646l37.344-18.597 37.344,18.597c1.058,0.526 2.203,0.786 3.342,0.786 1.557,0 3.104-0.484 4.409-1.433 2.262-1.643 3.422-4.407 3.01-7.173l-6.147-41.263 29.227-29.77c1.958-1.994 2.645-4.913 1.781-7.571-0.862-2.658-3.133-4.615-5.89-5.078zm-38.437,34.577c-1.647,1.678-2.413,4.032-2.066,6.359l4.577,30.723-27.805-13.847c-2.105-1.049-4.581-1.049-6.687,0l-27.806,13.847 4.577-30.723c0.347-2.327-0.418-4.682-2.066-6.359l-21.762-22.166 30.634-5.142c2.32-0.39 4.323-1.845 5.41-3.931l14.356-27.546 14.356,27.546c1.087,2.086 3.09,3.541 5.41,3.931l30.634,5.142-21.762,22.166z">
                                        </path>
                                        <path
											d="m302.075,377.712l-41.143-6.905-19.281-36.995c-1.292-2.479-3.855-4.034-6.651-4.034s-5.359,1.555-6.651,4.034l-19.281,36.995-41.143,6.905c-2.757,0.463-5.028,2.42-5.892,5.079-0.864,2.658-0.177,5.577 1.781,7.571l29.227,29.77-6.146,41.263c-0.412,2.766 0.748,5.53 3.01,7.173 2.26,1.644 5.249,1.892 7.751,0.646l37.344-18.597 37.344,18.597c1.058,0.526 2.203,0.786 3.342,0.786 1.557,0 3.104-0.484 4.409-1.433 2.262-1.643 3.422-4.407 3.01-7.173l-6.146-41.263 29.227-29.77c1.958-1.994 2.645-4.913 1.781-7.571-0.864-2.658-3.135-4.615-5.892-5.078zm-38.437,34.577c-1.647,1.678-2.413,4.032-2.066,6.359l4.576,30.723-27.805-13.847c-1.053-0.524-2.198-0.786-3.343-0.786s-2.291,0.262-3.343,0.786l-27.805,13.847 4.576-30.723c0.347-2.327-0.418-4.682-2.066-6.359l-21.762-22.166 30.634-5.142c2.32-0.39 4.323-1.845 5.41-3.931l14.356-27.545 14.356,27.546c1.087,2.086 3.09,3.541 5.41,3.931l30.634,5.142-21.762,22.165z">
                                        </path>
                                        <path
											d="m469.633,382.791c-0.864-2.659-3.134-4.616-5.892-5.079l-41.143-6.905-19.281-36.995c-1.292-2.479-3.855-4.034-6.651-4.034s-5.359,1.555-6.651,4.034l-19.281,36.995-41.143,6.905c-2.757,0.463-5.028,2.42-5.892,5.079-0.864,2.658-0.177,5.577 1.781,7.571l29.227,29.77-6.147,41.263c-0.412,2.766 0.748,5.53 3.01,7.173 2.26,1.644 5.249,1.892 7.751,0.646l37.344-18.597 37.344,18.597c1.058,0.526 2.203,0.786 3.342,0.786 1.557,0 3.104-0.484 4.409-1.433 2.262-1.643 3.422-4.407 3.01-7.173l-6.147-41.263 29.227-29.77c1.96-1.993 2.647-4.912 1.783-7.57zm-44.328,29.498c-1.647,1.678-2.413,4.032-2.066,6.359l4.577,30.723-27.806-13.847c-1.053-0.524-2.198-0.786-3.343-0.786-1.146,0-2.291,0.262-3.343,0.786l-27.805,13.847 4.577-30.723c0.347-2.327-0.418-4.682-2.066-6.359l-21.762-22.166 30.634-5.142c2.32-0.39 4.323-1.845 5.41-3.931l14.356-27.546 14.356,27.546c1.087,2.086 3.09,3.541 5.41,3.931l30.634,5.142-21.763,22.166z">
                                        </path>
                                        <path
											d="m235,108.009c9.831,0 19.184-4.272 25.66-11.721 2.717-3.126 2.387-7.863-0.739-10.581-3.127-2.718-7.864-2.387-10.581,0.739-3.625,4.171-8.853,6.563-14.34,6.563s-10.714-2.392-14.34-6.563c-2.718-3.126-7.455-3.456-10.581-0.739-3.126,2.718-3.457,7.455-0.739,10.581 6.476,7.448 15.829,11.721 25.66,11.721z">
                                        </path>
                                    </g>
                                </svg>
							</div>
							<div class="content-sec">
								<h5>Real Guest Reviews</h5>
								<p>Our 5,000,000+ verified reviews from real accommodation guests will help you 
								to decide the right accommodation for your stay.</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-6">
						<div class="highlight-box wow fadeInUp">
							<div>
								<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
										viewBox="0 0 512 512"
										style="enable-background: new 0 0 512 512;"
										xml:space="preserve">
                                    <g>
                                        <g>
                                            <polygon
											points="176.748,182.811 176.748,182.811 176.735,182.783 		">
                                            </polygon>
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <polygon
											points="106.342,321.731 106.342,321.744 106.436,321.293 		">
                                            </polygon>
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <polygon
											points="209.806,231.019 209.82,230.958 209.907,230.541 		">
                                            </polygon>
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <polygon
											points="236.261,386.136 236.274,386.094 236.282,386.068 		">
                                            </polygon>
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M357.053,208.842c-22.333,0-40.421,18.095-40.421,40.421s18.089,40.421,40.421,40.421
			c22.326,0,40.421-18.095,40.421-40.421C397.474,226.937,379.379,208.842,357.053,208.842z M357.053,269.474
			c-11.143,0-20.211-9.068-20.211-20.211s9.068-20.211,20.211-20.211c11.143,0,20.211,9.068,20.211,20.211
			S368.196,269.474,357.053,269.474z"></path>
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <g>
                                                <path
											d="M256,0c-38.589,0-75.102,8.656-107.911,23.956C132.352,9.155,111.051,0,87.58,0C39.289,0,0.001,38.535,0.001,85.895
				c0,17.812,10.907,40.26,24.367,61.238C8.806,180.183,0.001,217.047,0.001,255.999C0.001,397.379,114.601,512,256,512
				s255.999-114.621,255.999-255.999S397.4,0,256,0z M20.212,85.895c0-36.292,30.174-65.684,67.368-65.684
				c37.201,0,67.368,29.393,67.368,65.684c0,36.271-67.368,109.474-67.368,109.474S20.212,122.166,20.212,85.895z M20.21,255.996
				c0.001-31.592,6.3-61.732,17.631-89.293c14.801,20.13,29.527,36.547,34.87,42.348l14.868,16.162l14.868-16.162
				c12.146-13.191,72.71-81.132,72.71-123.156c0-16.855-5.045-32.546-13.628-45.824c16.236-7.135,33.414-12.503,51.301-15.839
				l-5.478,9.849c-2.647,4.796-3.632,9.943-3.658,15.023c0.055,6.393,1.549,12.84,5.524,18.513l-0.013-0.013l15.366,21.585
				c0.842,1.145,1.967,3.509,2.702,6.137c0.754,2.627,1.179,5.558,1.172,7.842c0.007,1.037-0.087,1.947-0.202,2.594l0.007-0.021
				l-3.989,21.733c-0.215,1.449-1.482,4.291-3.354,6.649c-1.819,2.398-4.257,4.331-5.605,4.904l-27.021,12.47
				c-8.643,4.021-13.703,12.564-13.703,21.477c0,3.267,0.694,6.649,2.162,9.836l11.406,24.831c0.593,1.266,1.273,3.469,1.725,5.922
				c0.458,2.453,0.707,5.174,0.707,7.619c0,2.162-0.209,4.136-0.499,5.389l-0.134,0.546l-3.106,13.488
				c-0.33,1.623-1.786,4.675-3.793,7.249c-1.967,2.614-4.541,4.803-6.016,5.544l-19.962,10.591c-1.024,0.58-3.348,1.192-5.807,1.166
				c-2.971,0.047-6.056-0.89-7.209-1.704l-16.33-10.516c-5.423-3.429-11.426-4.709-17.381-4.749
				c-5.48,0.034-11.041,1.131-16.158,4.123l-16.354,9.679c-3.146,1.852-5.801,4.412-7.653,7.485
				c-1.846,3.065-2.857,6.629-2.85,10.206c-0.027,5.376,2.264,10.665,6.09,14.599l-0.013-0.013l9.155,9.552
				c0.829,0.835,2.054,2.768,2.87,5.039c0.829,2.256,1.287,4.837,1.273,6.77c0.007,0.815-0.074,1.529-0.182,2.075l-1.826,8.745
				c-0.404,2.069-1.846,5.706-3.759,8.974c-1.867,3.288-4.299,6.36-5.881,7.747l-8.28,7.424
				c-5.51,4.966-12.632,12.396-17.711,18.384C30.699,335.396,20.21,296.902,20.21,255.996z M189.616,442.408l-10.576,36.413
				c-48.843-16.916-90.464-49.408-118.825-91.581c0.916-1.132,1.899-2.358,2.944-3.638c3.989-4.951,12.214-13.581,17.145-17.981
				l8.273-7.424c3.928-3.557,7.141-7.95,9.903-12.698c2.721-4.769,4.911-9.754,6.03-14.929l1.839-8.839
				c0.41-2.028,0.593-4.069,0.593-6.117c-0.007-4.709-0.922-9.331-2.513-13.716c-1.617-4.372-3.866-8.515-7.249-12.073l-9.155-9.56
				l-0.021-0.013l-0.357-0.485l0.485-0.397l16.364-9.681l0.021-0.007c0.977-0.627,3.354-1.321,5.841-1.294
				c2.695-0.034,5.383,0.788,6.447,1.536l16.317,10.51c5.646,3.564,11.918,4.877,18.155,4.924
				c5.174-0.027,10.381-0.956,15.279-3.517l19.962-10.591c5.079-2.742,9.129-6.656,12.577-11.088
				c3.396-4.48,6.13-9.412,7.458-15.023l3.261-14.174c0.701-3.186,0.977-6.44,0.984-9.782c-0.007-3.759-0.364-7.585-1.051-11.298
				c-0.694-3.719-1.684-7.296-3.227-10.678l-11.419-24.859l-0.013-0.027l-0.289-1.34c0-1.307,0.761-2.6,1.96-3.126l27.029-12.47
				c5.376-2.534,9.599-6.413,13.089-10.867c3.449-4.493,6.151-9.552,7.262-15.394l3.989-21.727l0.007-0.021
				c0.378-2.069,0.525-4.136,0.533-6.198c-0.013-4.507-0.714-9.041-1.96-13.399c-1.266-4.359-3.012-8.529-5.673-12.295
				l-15.36-21.578l-0.007-0.013c-0.843-1.064-1.812-3.961-1.765-6.763c-0.021-2.209,0.552-4.265,1.105-5.194l12.753-22.919
				c6.036-0.485,12.099-0.809,18.244-0.809c117.208,0,214.683,85.975,232.751,198.17l-9.027-5.019
				c-3.739-2.062-7.774-3.409-11.999-4.386c-4.224-0.956-8.569-1.489-12.827-1.495c-2.317,0-4.601,0.155-6.892,0.559l-1.867,0.33
				c-17.055-31.763-50.577-53.422-89.085-53.422c-55.72,0-101.052,45.332-101.052,101.052c0,34.055,33.435,83.28,59.203,116.163
				l-15.421,17.341c-0.922,1.092-3.274,2.802-5.962,3.921c-2.661,1.172-5.659,1.799-7.451,1.772l-0.64-0.021l-29.461-2.27
				l-0.741-0.162l-0.034-0.013v-0.101l0.094-0.606l0.027-0.074l5.255-17.509c0.741-2.486,1.058-4.979,1.058-7.398
				c-0.013-4.796-1.219-9.384-3.354-13.528c-2.143-4.123-5.276-7.882-9.573-10.597l-11.816-7.383
				c-4.049-2.526-8.577-3.679-12.982-3.672c-7.505,0.013-15.017,3.274-19.975,9.822l-35.819,47.758
				c-3.167,4.21-4.703,9.223-4.703,14.114c-0.007,7.12,3.241,14.255,9.418,18.896l13.103,9.822c0.72,0.519,1.765,1.738,2.479,3.335
				c0.741,1.576,1.152,3.469,1.139,4.924C189.852,441.303,189.744,441.951,189.616,442.408z M437.896,256.007
				c0,44.632-80.842,134.73-80.842,134.73s-80.842-90.099-80.842-134.73c0-44.665,36.19-80.843,80.842-80.843
				C401.699,175.164,437.896,211.341,437.896,256.007z M256,491.789c-19.86,0-39.154-2.5-57.593-7.148l10.624-36.615
				c0.72-2.513,1.03-5.026,1.03-7.492c-0.013-4.696-1.077-9.216-2.999-13.393c-1.933-4.157-4.722-8.031-8.711-11.041l-13.097-9.822
				c-0.862-0.64-1.321-1.631-1.327-2.721c0.007-0.735,0.202-1.387,0.654-1.988l35.827-47.764c0.66-0.95,2.224-1.752,3.8-1.731
				c0.909,0,1.684,0.236,2.27,0.599l11.81,7.383c0.694,0.418,1.657,1.408,2.351,2.762c0.701,1.34,1.098,2.971,1.085,4.224
				c0,0.66-0.094,1.2-0.209,1.589l-5.234,17.462c-0.674,2.183-0.99,4.393-0.99,6.534c-0.021,5.2,1.98,10.348,5.571,14.06
				c3.571,3.753,8.596,5.988,13.871,6.373l29.461,2.27c0.735,0.055,1.462,0.081,2.19,0.081c5.416-0.027,10.584-1.347,15.455-3.422
				c4.851-2.115,9.371-4.951,13.063-9.047l13.191-14.848c6.164,7.398,11.136,13.036,13.925,16.141l15.037,16.761l15.037-16.768
				c14.37-16.007,86.016-98.378,86.016-148.224c0-9.822-1.476-19.295-4.102-28.281c0.303-0.007,0.573-0.034,0.896-0.034
				c2.5-0.007,5.557,0.35,8.341,0.984c2.776,0.62,5.308,1.57,6.67,2.345l21.498,11.944c0.242,4.325,0.384,8.664,0.384,13.036
				C491.79,386.013,386.014,491.789,256,491.789z"></path>
                                                <polygon
											points="94.172,252.312 94.183,252.306 94.185,252.305 			">
                                                </polygon>
                                            </g>
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M89.256,47.151c-18.614,0-33.677,15.07-33.677,33.684c0,18.607,15.064,33.684,33.678,33.684s33.69-15.077,33.69-33.684
			C122.948,62.228,107.87,47.151,89.256,47.151z M89.257,94.308c-7.431,0.007-13.467-6.043-13.467-13.473
			c0-7.43,6.036-13.473,13.467-13.473c7.438,0,13.48,6.043,13.48,13.473C102.738,88.265,96.695,94.308,89.257,94.308z">
                                            </path>
                                        </g>
                                    </g>
                                </svg>
							</div>
							<div class="content-sec">
								<h5>2,000 + location</h5>
								<p>There are more than one million hotels in Traveloto, so you are spoiled for choice. 
								Whether it is a budget hotel, a resort, 
								Traveloto has it.</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-6">
						<div class="highlight-box wow fadeInUp">
							<div>
								<svg version="1.1" id="Capa_1"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
										viewBox="0 0 480 480"
										style="enable-background: new 0 0 480 480;"
										xml:space="preserve">
                                    <g>
                                        <g>
                                            <path
											d="M440,64h-8V24c0-13.232-10.768-24-24-24h-16c-13.232,0-24,10.768-24,24v40H112V24c0-13.232-10.768-24-24-24H72
                                   C58.768,0,48,10.768,48,24v40h-8C17.944,64,0,81.944,0,104v336c0,22.056,17.944,40,40,40h400c22.056,0,40-17.944,40-40V104
                                   C480,81.944,462.056,64,440,64z M384,72V24c0-4.416,3.584-8,8-8h16c4.416,0,8,3.584,8,8v48v32c0,4.416-3.584,8-8,8h-16
                                   c-4.416,0-8-3.584-8-8V72z M64,72V24c0-4.416,3.584-8,8-8h16c4.416,0,8,3.584,8,8v48v32c0,4.416-3.584,8-8,8H72
                                   c-4.416,0-8-3.584-8-8V72z M464,440c0,13.232-10.768,24-24,24H40c-13.232,0-24-10.768-24-24V208h448V440z M464,192H16v-88
                                   c0-13.232,10.768-24,24-24h8v24c0,13.232,10.768,24,24,24h16c13.232,0,24-10.768,24-24V80h256v24c0,13.232,10.768,24,24,24h16
                                   c13.232,0,24-10.768,24-24V80h8c13.232,0,24,10.768,24,24V192z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M328,104H152c-4.424,0-8,3.576-8,8v48c0,4.424,3.576,8,8,8h176c4.424,0,8-3.576,8-8v-48C336,107.576,332.424,104,328,104z
                                    M320,152H160v-32h160V152z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M104,232H56c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C112,235.576,108.424,232,104,232z
                                    M96,272H64v-24h32V272z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M208,232h-48c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C216,235.576,212.424,232,208,232z
                                    M200,272h-32v-24h32V272z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M320,232h-48c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C328,235.576,324.424,232,320,232z
                                    M312,272h-32v-24h32V272z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M424,232h-48c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C432,235.576,428.424,232,424,232z
                                    M416,272h-32v-24h32V272z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M104,312H56c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C112,315.576,108.424,312,104,312z
                                    M96,352H64v-24h32V352z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M208,312h-48c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C216,315.576,212.424,312,208,312z
                                    M200,352h-32v-24h32V352z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M320,312h-48c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C328,315.576,324.424,312,320,312z
                                    M312,352h-32v-24h32V352z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M424,312h-48c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C432,315.576,428.424,312,424,312z
                                    M416,352h-32v-24h32V352z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M104,392H56c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C112,395.576,108.424,392,104,392z
                                    M96,432H64v-24h32V432z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M208,392h-48c-4.424,0-8,3.576-8,8v40c0,4.424,3.576,8,8,8h48c4.424,0,8-3.576,8-8v-40C216,395.576,212.424,392,208,392z
                                    M200,432h-32v-24h32V432z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M321.856,386.88l-34.392,41.272l-17.808-17.808l-11.312,11.312l24,24C283.84,447.168,285.88,448,288,448
                                   c0.12,0,0.24,0,0.36-0.008c2.248-0.104,4.344-1.144,5.792-2.864l40-48L321.856,386.88z" />
                                        </g>
                                    </g>
                                    <g>
                                        <g>
                                            <path
											d="M417.856,386.88l-34.392,41.272l-17.808-17.808l-11.312,11.312l24,24C379.84,447.168,381.88,448,384,448
                                   c0.12,0,0.24,0,0.36-0.008c2.248-0.104,4.344-1.144,5.792-2.864l40-48L417.856,386.88z" />
                                        </g>
                                    </g>
                                </svg>
							</div>
							<div class="content-sec">
								<h5>1.5m bookings</h5>
								<p>accommodation you are looking for, we have got you covered!
								Traveloto now offers more than 1.5 million accommodations worldwide</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- section start -->
	</jsp:attribute>
</mt:userTemplate>
<!-- slick js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/text-effect.js"></script>
<!-- popper js-->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/popper.min.js"></script>

	<!-- filter js -->
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/filter.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/frontend/assets/js/isotope.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>	
	<script>
	$(document).ready(function() {		
		
		$("#autoComplete").select2({
			placeholder: "Location...",
			allowClear: true,
			ajax: {								
				type: 'GET',
				url: '${pageContext.request.contextPath }/ajaxuser/autocomplete',
				dataType: 'json',
				processResults: function(data){
					return{
						results: $.map(data, function(item){							
							return{									
									text: item.provincename,
									id: item.provinceid,							
							}
						})						
					};
				}
			}
		});	
		
		  $("#guest").on('change',function(){
			 var noguest =  $(this).val();
			 var noroom = $("#room").val();
			 if(noguest < noroom){				 
				 $("#room").val(noguest);
				 alert("Number guest can not greater than number room!")
			 }else if(noguest => noroom){				
				 $("#room").prop('disabled', false);
			 }
		}); 
		
		$("#room").on('change',function(){
			 var noroom =  $(this).val();
			 var noguest = $("#guest").val();
			 if(noguest < noroom){				
				 $("#room").val(noguest);
				 alert("Number guest can not greater than number room!")
			 }else if(noguest => noroom){
				 $("#room").prop('disabled', false);
			 }
		}); 
	});
	</script>
