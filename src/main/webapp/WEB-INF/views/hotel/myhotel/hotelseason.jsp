
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:hotelTemplate1>
	<jsp:attribute name="content">
<div class="container-fluid">
    <div class="row">
        <!-- Earning chart  end-->
        <!-- Booking history  start-->
        <div class="col-xxl-12">
            <div class="card">
                <div class="card-header  card-header--2" style="    border-bottom: none">
                    <div>
                        <h5>Hotel Season </h5>
                        <c:if test="${msg1 !=null }"><h6 style="color: #ef3f3e">${msg1 }</h6></c:if>
                        <c:if test="${msg !=null }"><h6 style="color: #ef3f3e">${msg }</h6></c:if>
                    </div>
                    
                    <div class="d-inline-flex">
                        <a
									href="${pageContext.request.contextPath }/hotel/hotelseason/createhotelseason"
									class="btn btn-theme">
                            <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus-square">
										<rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
										<line x1="12" y1="8" x2="12" y2="16"></line>
										<line x1="8" y1="12" x2="16" y2="12"></line></svg>
                            Add New
                        </a>
                    </div>
                </div>
                  <div class="card-header ">
                  <h6 class="mb-0">Hotel Season By Year</h6>
                  <form
								action="${pageContext.request.contextPath }/hotel/hotelseason/showhotelseason"
								class="theme-form mega-form" method="GET">
					<div class="row">
					<div class="col-lg-9">
                  <select id="showyear" class="form-control" name="year">
												<option selected value="${thisyear }">${thisyear }</option>		
														<c:forEach var="y" items="${years }">
														<option value="${y }">${y }</option>
														</c:forEach>
													</select>
                 </div> 
                 <div class="col-lg-3 d-inline-flex" style="padding-left: 70px;">
                 <input type="submit" class="btn btn-primary me-3"
											style="height: 35px;" value="Show" />
															
                 </div> 
					</div>					
                   
                 </form>
                 </div>
     
                <div class="card-body">
                    <div class=" table-responsive table-desi ">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Season Name</th>
                                <th>Status</th>
                
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item"
											items="${hotelseasonList}">
                                <tr>
                                    <td><span>
                                        <c:out
															value="${item.hotelseasonid}" />
                                    </span></td>
                                    <td><span>
                                    <fmt:formatDate value="${item.fromdate}" pattern="dd-MM-yyyy" />
																		
                                       
                                    </span></td>
                                    <td><span>   <fmt:formatDate value="${item.todate}" pattern="dd-MM-yyyy" />
                                      
                                    </span></td>
                                    <td><span>
                                        <c:out
															value="${item.seasonname}" />
                                    </span></td>
                                    <td
													id="hotelseason-type-${item.hotelseasonid}-status">
                                         <c:choose>
                                            <c:when
															test="${item.hotelseasonstt == 0}">
															<span class="badge badge-dark" > New</span>
														</c:when>
                                            <c:when
															test="${item.hotelseasonstt == 1}">
															<span class="badge badge-primary" > Active</span>
														</c:when>
												 <c:when
															test="${item.hotelseasonstt == 2}">
															<span class="badge badge-dark" > non-Active</span>
														</c:when>		
                                         </c:choose>
                                    </td>

                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                 <div class="card-header  card-header--2">
                    <div>
                        <h5></h5>
                    </div>
                    <c:if test="${crryear < thisyear &&  stt !=null}">
                    <div class="d-inline-flex">
                        <a  data-bs-toggle="modal"
									data-bs-target="#showconffirmchangestt" href="javascript:void(0)" class="btn btn-primary me-3"
											style="height: 35px;">                 
                           Change Status Season In Year
                        </a>
                    </div>
                    </c:if>
                    
                </div>
            </div>
        </div>
        <!-- Booking history  end-->

    </div>
</div>

	<!-- Modal -->
	<div class="modal fade " id="showconffirmchangestt" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<h5 class="modal-title" id="staticBackdropLabel">Change Status</h5>
					<p>Are you sure you want to change the status for the hotel season in ${thisyear }?</p>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
					<div class="button-box">
					<c:if test="${stt !=2}">
					<a href="${pageContext.request.contextPath }/hotel/hotelseason/changestatus?year=${thisyear }&newstt=2&hotelid=${hotelid}"
							class="btn btn--no ">Delete</a>
					</c:if>
					
					<c:if test="${stt !=1}">
					<a href="${pageContext.request.contextPath }/hotel/hotelseason/changestatus?year=${thisyear }&newstt=1&hotelid=${hotelid}"
							class="btn  btn--yes btn-primary">Active</a>
					</c:if>
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="customizer-links"></div> -->
		</jsp:attribute>
</mt:hotelTemplate1>