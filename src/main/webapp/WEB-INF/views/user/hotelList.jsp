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
	
       .chbx-container {
	  display: block;
	  position: relative;
	  padding-left: 35px;
	  margin-bottom: 12px;
	  cursor: pointer;
	  font-size: 16px;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	}
	
	/* Hide the browser's default checkbox */
	.chbx-container input {
	  position: absolute;
	  opacity: 0;
	  cursor: pointer;
	  height: 0;
	  width: 0;
	}
	
	/* Create a custom checkbox */
	.checkmark {
	  position: absolute;
	  top: 0;
	  left: 0;
	  height: 20px;
	  width: 20px;
	  background-color: #eee;
	}
	
	/* On mouse-over, add a grey background color */
	.chbx-container:hover input ~ .checkmark {
	  background-color: #ccc;
	}
	
	/* When the checkbox is checked, add a blue background */
	.chbx-container input:checked ~ .checkmark {
	  background-color: #1C75C2;
	}
	
	/* Create the checkmark/indicator (hidden when not checked) */
	.checkmark:after {
	  content: "";
	  position: absolute;
	  display: none;
	}
	
	/* Show the checkmark when checked */
	.chbx-container input:checked ~ .checkmark:after {
	  display: block;
	}
	
	/* Style the checkmark/indicator */
	.chbx-container .checkmark:after {
	  left: 9px;
	  top: 5px;
	  width: 5px;
	  height: 10px;
	  border: solid white;
	  border-width: 0 3px 3px 0;
	  -webkit-transform: rotate(45deg);
	  -ms-transform: rotate(45deg);
	  transform: rotate(45deg);
	}
   
</style>
<mt:userTemplate>

	<jsp:attribute name="content">
	   <!-- breadcrumb start -->
    <section class="breadcrumb-section pt-0">
        <img
				src="${pageContext.request.contextPath }/resources/frontend/assets/images/inner-pages/bg-bread.jpg"
				class="bg-img img-fluid blur-up lazyload" alt="">
        <div class="breadcrumb-content" id="loadTitle">
            	<div>
						<c:choose>
    						<c:when test="${not empty province }">
    								<h2>hotels in ${province.provincename }</h2>		
    						</c:when>    
    						<c:when test="${not empty city.cityname }">
    								<h2>hotels in ${city.cityname }</h2>	
    						</c:when>
						</c:choose>                 
                <nav aria-label="breadcrumb" class="theme-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
								href="index.html">Home</a></li>	
						<c:choose>
    						<c:when test="${not empty province }">
        							<li class="breadcrumb-item active" aria-current="page">hotels in ${province.provincename }</li>		
    						</c:when>    
    						<c:when test="${not empty city.cityname }">
        							<li class="breadcrumb-item active" aria-current="page">hotels in ${city.cityname }</li>	
    						</c:when>
						</c:choose>                       
                    </ol>
                </nav>
            </div>
        </div>
        <div class="title-breadcrumb">Traveloto</div>
    </section>
    <!-- breadcrumb end -->
    <!-- search section start -->
    <section class="bg-white pt-0 search-panel" id="searchBar">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-section">
                        <div class="search-box">
                            <div class="left-part">
                                <div class="search-body title-hotel" style="width: 350px; padding-left: 5px; padding-right: 5px">
                                    <h6>Location</h6>
                                    <c:choose>
                                    	<c:when test="${not empty province }">
                                    		 <%-- <input type="text" name="province" id="autoComplete"
											placeholder="${province.provincename }" class="form-control "> --%>
											<select class="form-group select2 select2-hidden-accessible" required="required"
											name="provinceid" style="width: 100%; tabindex=-1" id=autoComplete>
													<option value="${province.provinceid }" selected>${province.provincename }</option>
											</select>
                                    	</c:when>
                                    	<c:when test="${not empty city.cityname }">
                                    		<select class="form-group select2 select2-hidden-accessible" required="required"
											name="provinceid" style="width: 100%; tabindex=-1" id=autoComplete>
													<option value="${city.province.provinceid }" selected>${city.province.provincename }</option>
											</select>
                                    		 <input type="text" name="text"
											placeholder="${city.cityname }" class="form-control ">
                                    	</c:when>
                                    </c:choose>                                  
                                </div>
                                <div class="search-body">
                                    <h6>check in</h6>
                                    <c:choose>
                                    	<c:when test="${not empty today }">
                                    	<input type="text" class="form-control" required="required"
											id="timeCheckIn" value="${today }"/>
                                    	</c:when>
                                    	<c:when test="${not empty checkin }">
                                    	<input type="text" class="form-control" required="required"
											id="timeCheckIn" value="${checkin }"/>
                                    	</c:when>
                                    </c:choose>
                                    
                                </div>
                                <div class="search-body">
                                    <h6>check out</h6>
                                    <c:choose>
                                    	<c:when test="${not empty tomorrow }">
                                    	<input type="text" class="form-control" required="required"
											id="timeCheckOut" value="${tomorrow }" />
                                    	</c:when>
                                    	<c:when test="${not empty checkout }">
                                    	<input type="text" class="form-control" required="required"
											id="timeCheckOut" value="${checkout }"/>
                                    	</c:when>
                                    </c:choose>
                                    
                                </div>
                                <div class="search-body">
                                    <h6>guests</h6>
                                    <div class="qty-box">
                                        <div class="input-group">                                          
                                            <c:choose>
                                            	<c:when test="${not empty guest }">
                                            		<input type="number" min="1" id="guest" required="required"
													name="guest" class="form-control input-number" value="${guest }">
                                            	</c:when>
                                            	<c:when test="${empty guest }">
                                            		<input type="number" min="1" id="guest" required="required"
													name="guest" class="form-control input-number" value="2">
                                            	</c:when>
                                            </c:choose>                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="search-body">
                                    <h6>room</h6>
                                    <div class="qty-box">
                                        <div class="input-group">                                          
                                           <c:choose>
                                            	<c:when test="${not empty room }">
                                            		<input type="number" min="1" id="room" required="required"
													name="guest" class="form-control" value="${room }">
                                            	</c:when>
                                            	<c:when test="${empty room }">
                                            		<input type="number" min="1" id="room" required="required"
													name="guest" class="form-control" value="1">
                                            	</c:when>
                                            </c:choose>                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="search-body btn-search">
                                    <div class="right-part">
                                        <a href="#"
												class="btn btn-solid color1" id="btnSearch">search</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- search section end -->

	<p id="test"></p>
    <!-- section start -->
    <section class="pt-0 xs-section bg-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left-sidebar">
                        <div class="back-btn">
                            back
                        </div>
                        <div class="search-bar">
                        <i class="fas fa-search"></i>
                            <!-- <input type="text"
									placeholder="Search here.."> -->
							<select class="form-group select2 select2-hidden-accessible"
											name="hotelid" style="width: 100%; tabindex=-1" id=autoCompleteHotel>																					
							</select>
                        </div>
                        
                        <div
								class="middle-part collection-collapse-block open">
                            <a href="javascript:void(0)"
									class="section-title collapse-block-title">
                                <h5>latest filter</h5>
                                <img
									src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/adjust.png"
									class="img-fluid blur-up lazyload" alt="">
                            </a>
                            <div
									class="collection-collapse-block-content ">
                                <div class="filter-block">
                                    <div
											class="collection-collapse-block open" >
                                        <h6 class="collapse-block-title" >district</h6>
                                         <div id="loadDistrict">
                                        <c:forEach var="city" items="${province.cities }">
                                        <c:forEach var="ward" items="${city.wards }">                                       
                                        <label class="chbx-container">${ward.wardname }
  											<input id="getDis" class="chbx_dis" type="checkbox" name="getWard" value="${ward.wardid }" id="${ward.wardid }">
  												<span class="checkmark"></span>
											</label>
                                        </c:forEach>                                       	 
                                        </c:forEach>  
                                        </div>                                                                             
                                    </div>
                                </div>
                               
                                <div class="filter-block">
                                    <div
											class="collection-collapse-block open">
                                        <h6 class="collapse-block-title">facility</h6>
                                        <div
												class="collection-collapse-block-content">
                                            <div
													class="collection-brand-filter">
													<label class="chbx-container">restaurant
  													<input type="checkbox" id="restaurant">
  														<span class="checkmark"></span>
													</label>
                                               		<label class="chbx-container">wifi
  													<input type="checkbox" id=wifi>
  														<span class="checkmark"></span>
													</label>
													<label class="chbx-container">spa & salon
  													<input type="checkbox" id=spa>
  														<span class="checkmark"></span>
													</label>                                              		
													<label class="chbx-container">parking
  													<input type="checkbox" id=parking>
  														<span class="checkmark"></span>
													</label>
                                                	<label class="chbx-container">swimming
                                                        pool
  													<input type="checkbox" id=swimming>
  														<span class="checkmark"></span>
													</label>
                                              		<label class="chbx-container">fitness
  													<input type="checkbox" id=fitness>
  														<span class="checkmark"></span>
													</label>                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="filter-block">
                                    <div
											class="collection-collapse-block open">
                                        <h6 class="collapse-block-title">price range</h6>
                                        <div
												class="collection-collapse-block-content">
                                            <div class="wrapper">                                               
                                                <div
													class="collection-brand-filter">
													<label class="chbx-container">All
  													<input type="radio" id="radio_0" value="0" name="price" checked="checked">
  														<span class="checkmark"></span>
													</label>
													<label class="chbx-container">$10 - $80
  													<input type="radio" id="radio_1" value="1" name="price">
  														<span class="checkmark"></span>
													</label>
                                               		<label class="chbx-container">$81 - $100
  													<input type="radio" id="radio_2" value="2" name="price">
  														<span class="checkmark"></span>
													</label>
													<label class="chbx-container">$101 - $150
  													<input type="radio" id="radio_3" value="3" name="price">
  														<span class="checkmark"></span>
													</label>
                                               		<label class="chbx-container">above $151
  													<input type="radio" id="radio_4" value="4" name="price">
  														<span class="checkmark"></span>
													</label>													                                              	                                             
                                            	</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                        </div>
                        <div class="bottom-info">
                        	<button class="btn btn-rounded color1" style="margin-left: 60px" id="btnSort">sort hotel</button>
                        </div>
                        <div class="bottom-info">
                            <h5>
									<span>i</span> need help</h5>
                            <h4>856 - 215 - 211</h4>
                            <h6>Monday to Friday 9.00am - 7.30pm</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 ratio3_2">
                    <a href="javascript:void(0)"
							class="mobile-filter mt-3">
                        <h5>latest filter</h5>
                        <img
							src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/adjust.png"
							class="img-fluid blur-up lazyload" alt="">
                    </a>
                    <div class="container">                  
                        <div class="list-view row content grid" id="loadresult">                      
                    <c:forEach var="list" items="${listhotels }">
                     <div
										class="list-box col-12 popular grid-item wow fadeInUp">
                                <div class="list-img">
                                    <a href="#">                                  
                                     <img
												src="${pageContext.request.contextPath }/uploads/hotel/${ list.hotelimagename}"
												class="img-fluid blur-up lazyload" alt="">                       
                                    </a>
                                </div>
                                <div class="list-content">
                                    <div>
                                    	<c:choose>
                                    		<c:when test="${not empty checkin and not empty checkout }">
                                    		 <a href="${pageContext.request.contextPath }/page/hotel/hotelbook?hotelid=${list.hotel.hotelid}&checkin=${checkin}&checkout=${checkout}&guest=${guest}&room=${room}">
                                            	<h5>${list.hotel.hotelname }</h5>
                                        	</a>
                                    		</c:when>
                                    		<c:when test="${empty checkin and empty checkout }">
                                    		<a href="${pageContext.request.contextPath }/page/hotel?hotelid=${list.hotel.hotelid}">
                                            	<h5>${list.hotel.hotelname }</h5>
                                        	</a>
                                    		</c:when>
                                    	</c:choose>
                                       
                                        <p>${list.hotel.ward.wardname }, ${list.hotel.ward.city.cityname }</p>
                                        <div class="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <span>324 review</span>
                                        </div>
                                        <div class="facility-icon">
                                            <div class="facility-box">                                            	
                                            	<img
															src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/hotel/beer.png"
															class="img-fluid blur-up lazyload" alt="">                  
                                                <span>bar</span>
                                            </div>
                                            <div class="facility-box">
                                                <img
															src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/hotel/wifi.png"
															class="img-fluid blur-up lazyload" alt="">
                                                <span>wifi</span>
                                            </div>
                                            <div class="facility-box">
                                                <img
															src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/hotel/sunset.png"
															class="img-fluid blur-up lazyload" alt="">
                                                <span>beach</span>
                                            </div>
                                            <div class="facility-box">
                                                <img
															src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/hotel/pool.png"
															class="img-fluid blur-up lazyload" alt="">
                                                <span>swimming</span>
                                            </div>
                                        </div>
                                        <div class="price">
                                            <del>$${list.roomtype.publicprice }</del>
                                            $${list.showprice } <span>/ per night</span>
                                            <p class="mb-0">login & unlock a secret deal</p>
                                        </div>                                       
                                        <c:choose>
                                    		<c:when test="${not empty checkin and not empty checkout }">
                                    		 <a href="${pageContext.request.contextPath }/page/hotel/hotelbook?hotelid=${list.hotel.hotelid}&checkin=${checkin}&checkout=${checkout}&guest=${guest}&room=${room}"
                                                 class="btn btn-solid color1 book-now">select room</a> 
                                    		</c:when>
                                    		<c:when test="${empty checkin and empty checkout }">
                                    		 <a href="${pageContext.request.contextPath }/page/hotel?hotelid=${list.hotel.hotelid}"
													class="btn btn-solid color1 book-now">select room</a>                                       	
                                    		</c:when>
                                    	</c:choose>
                                        
                                    </div>
                                </div>
                            </div>
                    	</c:forEach>                            
                        </div>
                        <!-- <nav aria-label="Page navigation example"
								class="pagination-section">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link"
										href="javascript:void(0)" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <li class="page-item active"><a
										class="page-link" href="javascript:void(0)">1</a></li>
                                <li class="page-item"><a
										class="page-link" href="javascript:void(0)">2</a></li>
                                <li class="page-item"><a
										class="page-link" href="javascript:void(0)">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#"
										aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- section End -->	
	</jsp:attribute>
</mt:userTemplate>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>	
<script src='${pageContext.request.contextPath }/resources/backend/assets/myajax/hotelListpage.js'></script>






