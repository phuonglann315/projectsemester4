
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<mt:hotelTemplate1>
	<jsp:attribute name="content">
    <!-- Container-fluid starts-->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header  card-header--2 package-card">
                                    <div>
                                        <h5>${roomtype.roomstypename }</h5>
                                    </div>
                                    <div class="d-inline-flex">
                                    <c:if test="${roomtype.roomtypestt==0 }">
                                    <a href="${pageContext.request.contextPath }/hotel/roomtype/editroomtype/${roomtype.roomstypeid }" class="btn btn-theme">
                           Edit
                        </a>
                                    </c:if>
                        <c:if test="${roomtype.roomtypestt==1 }">
                                    <a href="${pageContext.request.contextPath }/hotel/roomtype/editroomtype1/${roomtype.roomstypeid }" class="btn btn-theme">
                           Edit Images
                        </a>
                                    </c:if>
                    </div>
                                </div>

                                <div class="card-body">
                                    <!-- section start -->
                                    <section class="single-section small-section bg-inner">

                                        <div class="row">

                                            <div class="col-12">
                                                <div class="image_section ">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="responsive arrow-dark zoom-gallery ratio2_3">
                                                            <c:forEach var="i" items="${images }">
                                                            <div>
                                                                   
                                                                        <img src="${pageContext.request.contextPath }/uploads/room/${i.roomtypeimagename}"
                                                                            class="img-fluid blur-up lazyload bg-img w-100"
                                                                            alt="">
                                                                   
                                                                </div>
                                                            </c:forEach>
                                                                
                                                               
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="description-section tab-section">
                                                    <div class="menu-top">
                                                        <ul class="nav nav-tabs" id="top-tab" role="tablist">
                                                            <li class="nav-item"><a data-bs-toggle="tab"
                                                                    class="nav-link active" href="#rooms"> facility</a>
                                                            </li>
                                                           <li class="nav-item"><a data-bs-toggle="tab"
                                                                    class="nav-link " href="#info">information</a>
                                                            </li>
                                                        </ul>
                                                        <div class="description-details tab-content">
                                                            
                                                            <div class="menu-part tab-pane fade facility show active" id="rooms">
                                                                  <div class="row  g-4">
                                                                    <div class="col-xl-3 col-sm-6">
                                                                        <h6><img src="${pageContext.request.contextPath}/resources/backend/assets/images/icon/hotel/verified.png"
                                                                                class="img-fluid blur-up lazyload"
                                                                                alt=""> basic facility</h6>
                                                                        <ul>
                                                                            <li><i class="fa fa-check"></i> Free
                                                                                Wi-Fi</li>
                                                                            <li><i class="fa fa-check"></i> Room
                                                                                Service</li>
                                                                            <li><i class="fa fa-check"></i>
                                                                                Elevator Lift</li>
                                                                            <li><i class="fa fa-check"></i> Laundry
                                                                                Service</li>
                                                                            <li><i class="fa fa-check"></i> Power
                                                                                Backup</li>
                                                                            <li><i class="fa fa-check"></i> Free
                                                                                Parking</li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="col-xl-3 col-sm-6">
                                                                        <h6><img src="${pageContext.request.contextPath}/resources/backend/assets/images/icon/hotel/credit-card.png"
                                                                                class="img-fluid blur-up lazyload"
                                                                                alt=""> payment mode</h6>
                                                                        <ul>
                                                                            <li><i class="fa fa-check"></i> visa
                                                                                card</li>
                                                                            <li><i class="fa fa-check"></i> master
                                                                                card</li>
                                                                            <li><i class="fa fa-check"></i>
                                                                                American express</li>
                                                                            <li><i class="fa fa-check"></i> debit
                                                                                card</li>
                                                                            <li><i class="fa fa-check"></i> cash
                                                                            </li>
                                                                            <li><i class="fa fa-check"></i> online
                                                                                banking</li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="col-xl-3 col-sm-6">
                                                                        <h6><img src="${pageContext.request.contextPath}/resources/backend/assets/images/icon/hotel/cctv.png"
                                                                                class="img-fluid blur-up lazyload"
                                                                                alt=""> security</h6>
                                                                        <ul>
                                                                            <li><i class="fa fa-check"></i>
                                                                                Security Guard</li>
                                                                            <li><i class="fa fa-check"></i> CCTV
                                                                            </li>
                                                                            <li><i class="fa fa-check"></i>
                                                                                emergency exit</li>
                                                                            <li><i class="fa fa-check"></i> doctor
                                                                                on call</li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="col-xl-3 col-sm-6">
                                                                        <h6><img src="${pageContext.request.contextPath}/resources/backend/assets/images/icon/hotel/tray.png"
                                                                                class="img-fluid blur-up lazyload"
                                                                                alt=""> food & drinks</h6>
                                                                        <ul>
                                                                            <li><i class="fa fa-check"></i>
                                                                                restaurant</li>
                                                                            <li><i class="fa fa-check"></i> bar
                                                                            </li>
                                                                        </ul>
                                                                        <h6 class="mt-2"><img
                                                                                src="${pageContext.request.contextPath}/resources/backend/assets/images/icon/hotel/barbell.png"
                                                                                class="img-fluid blur-up lazyload"
                                                                                alt=""> activities</h6>
                                                                        <ul>
                                                                            <li><i class="fa fa-check"></i> gym
                                                                            </li>
                                                                            <li><i class="fa fa-check"></i> game
                                                                                zone</li>
                                                                            <li><i class="fa fa-check"></i>
                                                                                swimming pool</li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>                                                      
                                                       
                                                         <div class="menu-part tab-pane fade facility" id="info">
                                                       <div class="row  g-4">
                                                                    <div class="col-xl-3 col-sm-6">
                                                                        <h6><img src="${pageContext.request.contextPath}/resources/backend/assets/images/icon/user.png"
                                                                                class="img-fluid blur-up lazyload"
                                                                                alt="">Customer</h6>
                                                                        <ul>
                                                                            <li><i class="fa fa-check"></i> Default Customer:
                                                                                ${ roomtype.numcusdefault}</li>
                                                                            <li><i class="fa fa-check"></i> Max Customer:
                                                                                ${ roomtype.maxcus}</li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="col-xl-3 col-sm-6">
                                                                        <h6><img src="${pageContext.request.contextPath}/resources/backend/assets/images/icon/hotel/pool.png"
                                                                                class="img-fluid blur-up lazyload"
                                                                                alt=""> View</h6>
                                                                        <ul>
                                                                            <li><i class="fa fa-check"></i>View  ${ roomtype.views}</li>
                                                                             <li><i class="fa fa-check"></i>Size  ${ roomtype.roomsize}</li>
                                                                              <li><i class="fa fa-check"></i>  ${ roomtype.views}</li>
                                                                        </ul>
                                                                    </div>                                                                                                                                      
                                                                </div>
                                                            </div>                                                      
                                                       
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                    </section>
                                    <!-- section end -->
                                </div>

                            </div>



                        </div>
                    </div>

                </div>
		</jsp:attribute>
</mt:hotelTemplate1>