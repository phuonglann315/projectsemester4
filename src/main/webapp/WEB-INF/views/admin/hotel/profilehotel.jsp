<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:adminTemplate>
	<jsp:attribute name="content">
	 <!-- Container-fluid starts-->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div
							class="card-header  card-header--2 package-card">

                                    <div>
                                        <h5>Hotel's Details</h5>
                                        <c:if test="${msg !=null }"><h6 style="color: #ef3f3e">${msg }</h6></c:if>
                                    </div>
                                    <form class="d-inline-flex">
                                    <c:choose>
                                    <c:when
										test="${hotel.hotelstatus == 1 }">
                                        <a
											href="${pageContext.request.contextPath}/admin/hotel/status?hotelid=${hotel.hotelid}&hotelstatus=2"
											class="btn align-items-center d-flex btn-outline"> <i
											class="fa fa-trash-o me-2"></i>Non-Active
                                        </a>
                                     </c:when>
                                     <c:when
										test="${hotel.hotelstatus == 0 }">
                                        <a
											href="${pageContext.request.contextPath}/admin/hotel/edithotel?hotelid=${hotel.hotelid}"
											class="btn align-items-center d-flex btn-outline"> <i
											class="fa fa-trash-o me-2"></i>Edit
                                        </a>
                                          <a
											href="${pageContext.request.contextPath}/admin/hotel/status?hotelid=${hotel.hotelid}&hotelstatus=1"
											class="btn align-items-center d-flex btn-outline"> <i
											class="fa fa-trash-o me-2"></i>Avtive
                                        </a>
                                     </c:when>
                                     <c:when
										test="${hotel.hotelstatus == 2 }">
                                        <a
											href="${pageContext.request.contextPath}/admin/hotel/status?hotelid=${hotel.hotelid}&hotelstatus=1"
											class="btn align-items-center btn-theme me-3"> <i
											class="fa fa-pencil-square-o me-2"></i>Active
                                        </a>
                                     </c:when>
                                     </c:choose>
                                    </form>
                                </div>

                                <div class="card-body">
                                    <!-- section start -->
                                    <section
								class="single-section small-section bg-inner">

                                        <div class="row">
                                            <div class="col-12">
                                                <div
											class="hotel_title_section">
                                                    <div
												class="hotel-name">
                                                        <div
													class="left-part" style="    width: 100%;">
                                                            <div
														class="top">
                                                                <h2>${hotel.hotelname}</h2>
                                                                 <c:choose>
                                                                  <c:when
																test="${hotel.star == 4 }">
                                                                  <div
																	class="rating">
                                                                    <i
																		class="fa fa-star"></i>
                                                                    <i
																		class="fa fa-star"></i>
                                                                    <i
																		class="fa fa-star"></i>
                                                                    <i
																		class="fa fa-star"></i>
                                                                    <i
																		class="fa fa-star-o"></i>
                                                                </div>
                                                                  </c:when>
                                                                  <c:when
																test="${hotel.star == 5 }">
                                                                  <div
																	class="rating">
                                                                    <i
																		class="fa fa-star"></i>
                                                                    <i
																		class="fa fa-star"></i>
                                                                    <i
																		class="fa fa-star"></i>
                                                                    <i
																		class="fa fa-star"></i>
                                                                    <i
																		class="fa fa-star"></i>
                                                                </div>                                                                  </c:when>
                                                                  </c:choose>
                                                            </div>
                                                            <p>${hotel.ward.wardname },${hotel.ward.city.cityname} </p>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div
											class="image_section ">
                                                    <div class="row">
                                                        <div
													class="col-12">
                                                            <div
														class="responsive arrow-dark zoom-gallery ratio2_3">
                                                            <c:forEach
															var="image" items="${hotel.hotelimages}">
                                                            <a
																href="${pageContext.request.contextPath}/resources/backend/images/hotel/${image.hotelimagename}"> 
                                                             <img
																src="${pageContext.request.contextPath }/uploads/hotel/${image.hotelimagename}"
																class="img-fluid blur-up lazyload bg-img w-100" alt="">
                                                                            </a>
                                                            </c:forEach>
                                                            </div>
                                                        </div>	

                                                    </div>
                                                </div>
                                              <!-- bat dau phia trang duoi -->
                                               <div
											class="description-section tab-section">
                                                    <div
												class="menu-top">
                                                     
                                                        <div
													class="description-details tab-content" id="top-tabContent">
                                                            <div
														class="menu-part tab-pane fade show active" id="rooms">
                                                                <table
															class="rooms-box border-0">
                                                                <c:forEach
																var="hoteltype" items="${hotel.roomtypes }">
                                                                    <tr>
                                                                        <td >
                                                                           <c:forEach
																			var="roomimages" items="${hoteltype.roomtypeimages }"
																			begin="1" end="1">
                                                                           <a
																				href="${pageContext.request.contextPath}/resources/backend/images/room/${roomimages.roomtypeimagename }}"> 
                                                                           <img
																				src="${pageContext.request.contextPath }/uploads/room/${roomimages.roomtypeimagename }"
																				class="img-fluid blur-up lazyload w-100" alt="">
                                                                            </a>
                                                                           </c:forEach>
                                                                        </td>
                                                                        <td>
                                                                            <h6
																			class="room-title">${hoteltype.roomstypename }</h6>
                                                                            <div
																			class="room-detail">
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
                                                                                                <li><i
																								class="fa fa-check"></i>non
                                                                                                    refundable</li>
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
                                                            <div
														class="about menu-part tab-pane fade" id="about">
                                                                <h6>Enjoy a luxurious experience!</h6>
                                                                <p>A luxurious hotel in Duba, Sea view is just 500
                                                                    meters away from the main center.
                                                                    Featuring palatial space, modern architecture
                                                                    and stylish interiors, this hotel
                                                                    is an ideal choice for a peaceful relaxation or
                                                                    a business
                                                                    trip.</p>
                                                                <h6>Hotel Facilities</h6>
                                                                <p>The classy hotel has a swimming pool, spa and a
                                                                    fitness centre. It also features
                                                                    a well-appointed conference hall and a spacious
                                                                    harbour banquet conference
                                                                    centre for events and for meeting business
                                                                    needs. Complimentary
                                                                    Wi-Fi is provided on-premises. Other services
                                                                    offered are travel desk, car
                                                                    parking and credit card acceptance.</p>
                                                                <h6>Dining</h6>
                                                                <p>The luxurious hotel in dubai features an in-house
                                                                    restaurant and a bar. Flame N
                                                                    Grill restaurant operates from 7.30 AM till
                                                                    midnight. It offers multi-cuisine
                                                                    menu including Continental, Chinese, Indian and
                                                                    Goan dishes.
                                                                    Pool Deck BAR is a paradise providing a range of
                                                                    beverages. Featuring a water
                                                                    fountain, it also offers a pleasant ambience to
                                                                    enjoy your drinks.</p>
                                                                <h6>Room Facilities</h6>
                                                                <p
															class="mb-0">This hotel has 150 air-conditioned
                                                                    rooms including 50 Superior
                                                                    Rooms, 30 Deluxe Rooms, 10 Super Deluxe Rooms, 2
                                                                    Classic Rooms and 5 Duplex
                                                                    Rooms. Most of the rooms have balconies offering
                                                                    spectacular views of the
                                                                    environs
                                                                    and a few offering phenomenal views of the pool.
                                                                    With contemporary furniture and
                                                                    elegant decor, all the rooms ensure utmost
                                                                    comfort for the guests. Some in-room
                                                                    amenities include LCD TV with satellite
                                                                    connection,
                                                                    minibar and an electronic safe deposit box.</p>
                                                            </div>
                                                            <div
														class="menu-part tab-pane fade facility" id="facility">
                                                                <div
															class="row  g-4">
                                                                    <div
																class="col-xl-3 col-sm-6">
                                                                        <h6>
																	<img src="../assets/images/icon/hotel/verified.png"
																		class="img-fluid blur-up lazyload" alt=""> basic facility</h6>
                                                                        <ul>
                                                                            <li><i
																		class="fa fa-check"></i> Free
                                                                                Wi-Fi</li>
                                                                            <li><i
																		class="fa fa-check"></i> Room
                                                                                Service</li>
                                                                            <li><i
																		class="fa fa-check"></i>
                                                                                Elevator Lift</li>
                                                                            <li><i
																		class="fa fa-check"></i> Laundry
                                                                                Service</li>
                                                                            <li><i
																		class="fa fa-check"></i> Power
                                                                                Backup</li>
                                                                            <li><i
																		class="fa fa-check"></i> Free
                                                                                Parking</li>
                                                                        </ul>
                                                                    </div>
                                                                    <div
																class="col-xl-3 col-sm-6">
                                                                        <h6>
																	<img src="../assets/images/icon/hotel/credit-card.png"
																		class="img-fluid blur-up lazyload" alt=""> payment mode</h6>
                                                                        <ul>
                                                                            <li><i
																		class="fa fa-check"></i> visa
                                                                                card</li>
                                                                            <li><i
																		class="fa fa-check"></i> master
                                                                                card</li>
                                                                            <li><i
																		class="fa fa-check"></i>
                                                                                American express</li>
                                                                            <li><i
																		class="fa fa-check"></i> debit
                                                                                card</li>
                                                                            <li><i
																		class="fa fa-check"></i> cash
                                                                            </li>
                                                                            <li><i
																		class="fa fa-check"></i> online
                                                                                banking</li>
                                                                        </ul>
                                                                    </div>
                                                                    <div
																class="col-xl-3 col-sm-6">
                                                                        <h6>
																	<img src="../assets/images/icon/hotel/cctv.png"
																		class="img-fluid blur-up lazyload" alt=""> security</h6>
                                                                        <ul>
                                                                            <li><i
																		class="fa fa-check"></i>
                                                                                Security Guard</li>
                                                                            <li><i
																		class="fa fa-check"></i> CCTV
                                                                            </li>
                                                                            <li><i
																		class="fa fa-check"></i>
                                                                                emergency exit</li>
                                                                            <li><i
																		class="fa fa-check"></i> doctor
                                                                                on call</li>
                                                                        </ul>
                                                                    </div>
                                                                   
                                                                </div>
                                                            </div>
                                                            <div
														class="menu-part tab-pane fade map" id="location">
                                                               <iframe
															src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62672.603978095845!2d108.275749768454!3d10.960521168670825!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31768e4c7f7c96b5%3A0x1a406b72c1020724!2zTcWpaSBOw6ksIFBoYW4gVGhpZXQsIELDrG5oIFRodeG6rW4sIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1668395851558!5m2!1sen!2s"
															style="border: 0;" allowfullscreen=""></iframe>
                                                            </div>																																
                                                            <div
														class="menu-part tab-pane fade review" id="review">
                                                                <div
															class="review-box">
                                                                	<c:forEach
																var="roomtype" items="${hotel.roomtypes }">
                                                                	<c:forEach
																	var="resevation" items="${roomtype.reservations}">
                                                                	<c:if
																		test="${not empty resevation.customercomment}">
                                                                	 <c:if
																			test="${resevation.rating < 10 }">
                                                                   <div
																				class="rating">									                                         	
										                                        <c:choose>                                       		
																					  	<c:when test="${ '0' <= review.rating <= '5'}">
																					        <i class="fa fa-star"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>                                            
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
																					    </c:when>  
																					    <c:when test="${ '5' < review.rating <= '7'}">
																					        <i class="fa fa-star"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>                                            
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
																					    </c:when> 
																					    <c:when test="${ '7' < review.rating <= '8'}">
																					        <i class="fa fa-star"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>                                            
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
																					    </c:when>  
																					    <c:when test="${ '8' < review.rating <= '9'}">
																					        <i class="fa fa-star"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>                                            
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
																					    </c:when>											
																					   <c:otherwise>
																					        <i class="fa fa-star"></i>
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>                                            
										                                            		<i
																							class="fa fa-star-o"></i>
										                                            		<i
																							class="fa fa-star-o"></i>											   
																					   </c:otherwise>
</c:choose>                                                                                      
			                                         							</div>
                                                                    <h4>${resevation.customername }</h4>
                                                                   <p>${resevation.customercomment }</p>   
                                                                   	</c:if>
                                                                	</c:if>
                                                                 
                                                                   </c:forEach>
                                                                	
                                                                	</c:forEach>
                                                                   
                                                                    </div>
                                                               </div>
                                                               <div
														class="menu-part tab-pane fade policy" id="policy">
                                                                <p>Check-in: 2.00 PM, Check-out: 12.00 PM</p>
                                                                <p>The primary guest must be at least 18 years of
                                                                    age to check into this hotel.</p>
                                                                <p>It is mandatory for guests to present valid photo
                                                                    identification at the time of
                                                                    check-in. According to government regulations, a
                                                                    valid Photo ID has to be
                                                                    carried by every person above the age of 18
                                                                    staying at the hotel.
                                                                    The identification proofs accepted are Aadhar
                                                                    Card, Driving License, Voter ID
                                                                    Card, and Passport. Without Original copy of
                                                                    valid ID the guest will not be
                                                                    allowed to check-in.
                                                                </p>
                                                                <p>Local ID proof & Pan card will not be acceptable
                                                                    as ID proof.</p>
                                                                <p>Unless mentioned, the tariff does not include
                                                                    charges for optional room services
                                                                    (such as telephone calls, room service, mini
                                                                    bar, snacks, laundry extra bed
                                                                    etc.). In case, such additional charges are
                                                                    levied by the
                                                                    hotel(s), we shall not be held responsible for
                                                                    it.</p>
                                                                <p>Personal food and beverages are strictly not
                                                                    permitted on the hotel premises.</p>
                                                                <p>The hotel shall not be responsible for any loss
                                                                    of or damage to your personal
                                                                    belongings.In case any damage is done to the
                                                                    hotel property by guests during
                                                                    their stay, it will be the sole accountability
                                                                    of the guest.</p>
                                                                <p>No charge for children below 6 years and the
                                                                    extra cost will be applicable for
                                                                    availing an extra bed in a double occupancy
                                                                    room. </p>
                                                                <p>Should any action by a guest be deemed
                                                                    inappropriate by the hotel, or if any
                                                                    inappropriate behaviour is brought to the
                                                                    attention of the hotel, the hotel
                                                                    reserves the right, after the allegations have
                                                                    been investigated,
                                                                    to take action against the guest.</p>
                                                                <p>We would love to host you but in case your plans
                                                                    change, our simple cancellation
                                                                    process makes sure you receive a quick
                                                                    confirmation and fast refunds. Our
                                                                    standard check-in time is 12 noon and you can
                                                                    check-in any time
                                                                    after that till your reservation is valid.</p>
                                                                <p>Pets are not allowed in the hotel premises.</p>
                                                            </div>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                              <!-- ket thuc tab ben duoi -->
                                            </div>
</section>
                                        </div>
                                        </div>
                                        </div></div></div>

                                    
	

	</jsp:attribute>
</mt:adminTemplate>