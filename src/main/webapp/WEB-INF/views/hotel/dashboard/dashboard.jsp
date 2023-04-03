<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:hotelTemplate>
	<jsp:attribute name="content">
	
	      <div class="container-fluid">
                    <div class="row">
                        <!-- chart caard section start -->
                        
                        <div class="col-sm-6 col-xxl-3 col-lg-6">
                            <div
						class="b-b-danger border-5  border-0 card o-hidden">
                                <div
							class=" custome-2-bg  b-r-4 card-body">
                                    <div class="media static-top-widget">

                                        <div class="media-body p-0">
									<span class="m-0">Total Booking Check-in Today</span>
                                            <h4 class="mb-0 counter">${totalbookingcheckintoday }</h4>
                                                
                                            

                                        </div>
                                        <div
									class="align-self-center text-center">
									<i data-feather="briefcase"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xxl-3 col-lg-6">
                            <div
						class="b-b-danger border-5  border-0 card o-hidden">
                                <div
							class=" custome-2-bg  b-r-4 card-body">
                                    <div class="media static-top-widget">

                                        <div class="media-body p-0">
									<span class="m-0">Total Booking Check-out Today</span>
                                            <h4 class="mb-0 counter">${totalbookingcheckouttoday }</h4>
                                                
                                            

                                        </div>
                                        <div
									class="align-self-center text-center">
									<i data-feather="grid"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xxl-3 col-lg-6">
                            <div
						class="b-b-success border-5 border-0 card o-hidden">
                                <div
							class=" custome-4-bg b-r-4 card-body">
                                    <div class="media static-top-widget">

                                        <div class="media-body p-0">
									<span class="m-0">Total Customers Are Staying</span>
                                            <h4 class="mb-0 counter">${totalcusstayingbydate }</h4>
                                                
                                            

                                        </div>
                                        <div
									class="align-self-center text-center">
									<i data-feather="user"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-sm-6 col-xxl-3 col-lg-6">
                            <div
						class="b-b-success border-5 border-0 card o-hidden">
                                <div
							class=" custome-4-bg b-r-4 card-body">
                                    <div class="media static-top-widget">

                                        <div class="media-body p-0">
									<span class="m-0">Total Customer Check-out Today</span>
                                            <h4 class="mb-0 counter">${totalcuscheckouttoday }</h4>
                                                
                                            

                                        </div>
                                        <div
									class="align-self-center text-center">
									<i data-feather="user-plus"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- chart caard section start -->
                        <!-- visitors chart  start-->
                        <div class="col-xl-12">
                            <div class="h-100">
                                <div class="card o-hidden  ">
                                    <div class="card-header">
                                        <div
									class="d-flex align-items-center justify-content-between">									
                                            <divclass="card-header-title">										
                                                <h4>Hotel Information </h4>
                                            
								</div>   
                                    </div>
                                    <div class="card-body ">
                                        <div class="row">
                                            <div class="col-12">
                                                <div
											class="hotel_title_section">
                                                    <div
												class="hotel-name">
                                                        <div
													class="left-part">
                                                            <div
														class="top">
                                                                <h2>${hotel.hotelname }</h2>
                                                            </div>
                                                            <p>${hotel.street } ${hotel.ward.wardname } ${hotel.ward.city.cityname } ${hotel.ward.city.province.provincename }</p>
															 <div class="description-section tab-section" style="margin-top: 20px;">
                                                    <div
															class="menu-top">
															 <div class="description-details tab-content">
                                                    
                                                            <div
																	class="menu-part tab-pane fade show active" id="rooms">
                                                                <table
																		class="rooms-box border-0">
                                                                     <c:forEach
																var="hoteltype" items="${roomtypes }">
                                                                    <tr>
                                                                        <td style="width: 40%">
                                                                           <c:forEach
																			var="roomimages" items="${hoteltype.roomtypeimages }"
																			begin="1" end="1">
                                                                           
                                                                           <img
																				src="${pageContext.request.contextPath }/uploads/room/${roomimages.roomtypeimagename }"
																				class="img-fluid blur-up lazyload w-100" alt="">
                                                                            
                                                                           </c:forEach>
                                                                        </td>
                                                                        <td>
                                                                            <h6
																			class="room-title">${hoteltype.roomstypename }</h6>
                                                                            <div
																			class="room-detail"    style="padding-left: 20px;" >
                                                                                <div
																				class="row g-2 ">
                                                                                    <div
																					class="col-sm-6 col-md-4 p-0">
                                                                                        <h6>Amenities</h6>
                                                                                        <div
																						class="facility-detail">
                                                                                            <ul>
                                                                                           
                                                                                               <c:if
																								test="${hoteltype.minibar == 1 }">
                                                                                                <li>
                                                                                                <img
																									src="${pageContext.request.contextPath}/resources/frontend/assets/images/icon/hotel/beer.png"
																									class="img-fluid blur-up lazyload " alt=""> Minibar
                                                                                                </li>
                                                                                                </c:if>
                                                                                                <c:if
																								test="${hoteltype.breakfast == 1 }">
                                                                                                <li>
                                                                                                <img
																									src="${pageContext.request.contextPath}/resources/frontend/assets/images/icon/hotel/meal.png"
																									class="img-fluid blur-up lazyload " alt=""> Breakfast
                                                                                                </li>
                                                                                                </c:if>
                                                                                                 <c:if
																								test="${hoteltype.smoking == 1 }">
                                                                                                <li>
                                                                                                <img
																									src="${pageContext.request.contextPath}/resources/frontend/assets/images/icon/hotel/smoking.png"
																									class="img-fluid blur-up lazyload " alt=""> Smoking
                                                                                                </li>
                                                                                                </c:if>
                                                                                                <c:if
																								test="${hoteltype.shower == 1 }">
                                                                                                <li>
                                                                                                <img
																									src="${pageContext.request.contextPath}/resources/frontend/assets/images/icon/hotel/shower.png"
																									class="img-fluid blur-up lazyload " alt=""> Shower
                                                                                                </li>
                                                                                                </c:if>
                                                                                                 <c:if
																								test="${hoteltype.views == 'Garden' }">
                                                                                                <li>
                                                                                                <img
																									src="${pageContext.request.contextPath}/resources/frontend/assets/images/icon/hotel/park.png"
																									class="img-fluid blur-up lazyload " alt=""> Garden
                                                                                                </li>
                                                                                                </c:if>
                                                                                                <c:if
																								test="${hoteltype.views == 'Ocean' }">
                                                                                                <li>
                                                                                                <img
																									src="${pageContext.request.contextPath}/resources/frontend/assets/images/icon/hotel/ocean.png"
																									class="img-fluid blur-up lazyload " alt=""> Ocean
                                                                                                </li>
                                                                                                </c:if>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div
																					class="col-sm-6 col-md-4 p-0">
                                                                                        <h6>Guest Service</h6>
                                                                                        <div
																						class="facility-detail">
                                                                                            <ul>
                                                                                                <li><i
																								class="fa fa-check"></i>
                                                                                                    24-Hour room service
                                                                                                </li>
                                                                                                <li><i
																								class="fa fa-check"></i>
                                                                                                    Tour & excursions
                                                                                                </li>
                                                                                                <li><i
																								class="fa fa-check"></i>Meeting
                                                                                                    Facilities</li>
                                                                                                <li><i
																								class="fa fa-check"></i>Babysitting
                                                                                                    on reques</li>

                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div
																					class="col-sm-6 col-md-4 p-0">
                                                                                        <h6>inclusion</h6>
                                                                                        <div
																						class="facility-detail">
                                                                                            <ul>
                                                                                                <li><i
																								class="fa fa-check"></i>
                                                                                                    Wi-Fi</li>
                                                                                                <li><i
																								class="fa fa-check"></i>
                                                                                                    Breakfast</li>
                                                                                             
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </td>

                                                                    </tr>
                                                                  </c:forEach>
                                                                    
                                                                </table>
                                                            </div>
                                                              </div>
                                                        </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- visitors chart  end-->
       
  



                        </div>
                    </div>
                </div>
                <!-- Container-fluid Ends-->

            
          
          
	
		</jsp:attribute>
</mt:hotelTemplate>