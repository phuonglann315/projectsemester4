<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:hotelTemplate1>
	<jsp:attribute name="content">
	<div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-sm-12">
                        <form modelAttribute="roomtype"
								action="${pageContext.request.contextPath }/hotel/roomtype/editroomtype/${roomtype.roomstypeid}"
								class="theme-form mega-form" method="POST"
								enctype="multipart/form-data">
                            <!--Hotel detail start-->
                            <div class="card">
                                <div class="card-header">
                                    <h5>Add New Room Type</h5>
                                </div>
                                <div class="card-body">
                                    <input type="hidden"
											name="roomstypeid" value="${roomtype.roomstypeid}">
                                    <div class="mb-3">
                                        <label class="form-label-title">Room Type Name</label>
                                        <input class="form-control"
												type="text" name="roomstypename"
												placeholder="Room Type Name"
												value="${roomtype.roomstypename}" />
                                    </div>
                                    <div class="mb-3">
                                        <label
												class="form-label-title  ">Views</label>
                                        <input type="text"
												placeholder="View" class="form-control" name="views"
												value="${roomtype.views}" />
                                    </div>
                                    <div class="mb-3">
                                        <label
												class="form-label-title  ">Description</label>

                                        <textarea cols="30" rows="10"
												id="editor1" name="editor1">${roomtype.description}</textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label
												class="form-label-title  ">Room Size</label>
                                        <input type="text"
												placeholder="Size" class="form-control" name="roomsize"
												value="${roomtype.roomsize}" />
                                    </div>
                                    <div class="row">
                                        <label class="form-label-title"> Number people</label>
                                        <div class="col-6">
                                            <input class="form-control"
													type="number" id="numcusdefault"
													value="${roomtype.numcusdefault}"
													placeholder="Default Number" name="numcusdefault">
                                        </div>
                                        <div class="col-6">
                                            <input class="form-control"
													type="number" id="maxcus" value="${roomtype.maxcus}"
													placeholder="Max Number" name="maxcus">
                                        </div>
                                    </div>

                                    <div class="animate-chk">
                                        <div class="row g-2">
                                            <div
													class=" col-xl-12 col-xxl-6 ">
                                                <label
														class="form-label-title ">Room Inclusion</label>
                                                <div class="row g-3">
                                                    <div class="col">
                                                        <label
																class="d-block" for="minibar">
                                                            <c:choose>
                                                                <c:when
																		test="${roomtype.minibar == 1}">
                                                                    <input
																			class="checkbox_animated" id="minibar" name="minibar"
																			type="checkbox" value="0" checked /> Minibar
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input
																			class="checkbox_animated" id="minibar" name="minibar"
																			type="checkbox" value="0" /> Minibar
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </label>
                                                    </div>
                                                    <div class="col">
                                                        <label
																class="d-block" for="smoking">
                                                            <c:choose>
                                                                <c:when
																		test="${roomtype.smoking == 1}">
                                                                    <input
																			class="checkbox_animated" id="smoking" name="smoking"
																			type="checkbox" value="1" checked>Smoking
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input
																			class="checkbox_animated" id="smoking" name="smoking"
																			type="checkbox" value="1">Smoking
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </label>
                                                    </div>
                                                    <div class="col">
                                                        <label
																class="d-block" for="breakfast">
                                                            <label class="d-block" for="smoking">
																
                                                            <c:choose>
                                                                <c:when
																			test="${roomtype.breakfast == 1}">
                                                                   <input
																				class="checkbox_animated" id="breakfast"
																				name="breakfast" type="checkbox" value="1" checked>Breakfast
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input
																				class="checkbox_animated" id="breakfast"
																				name="breakfast" type="checkbox" value="1">Breakfast
                                                                </c:otherwise>
                                                            </c:choose>
                                                            </label>

                                                        </label>
                                                    </div>
                                                    <div class="col">
                                                        <label
																class="d-block" for="shower">
                                                            <c:choose>
                                                                <c:when
																		test="${roomtype.shower == 1}">
                                                                   <input
																			class="checkbox_animated" id="shower" name="shower"
																			type="checkbox" value="1" checked>Shower
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input
																			class="checkbox_animated" id="shower" name="shower"
																			type="checkbox" value="1">Shower
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="form-label-title "> Price</label>
                                        <div class="col-6">
                                            <label
													class="form-label-title" for="netprice">Net Price</label>
                                            <input class="form-control"
													type="number" id="netprice" placeholder="Net Price"
													name="netprice" value="${roomtype.netprice}">
                                        </div>
                                        <div class="col-6">
                                            <label
													class="form-label-title" for="publicprice">Public Price</label>
                                            <input class="form-control"
													type="number" id="publicprice" placeholder="Public Price"
													name="publicprice" value="${roomtype.publicprice}">
                                        </div>
                                    </div>
                                    
                                     <div class="row" style="margin-top: 20px;">

                                            <div class="col-12">
                                     <div class="image_section ">
                                                    <div class="row" >
                                                        <div
															class="col-12">
                                                            <div
																class="responsive arrow-dark zoom-gallery ratio2_3">
                                                            <c:forEach
																	var="i" items="${images }">
                                                            <div>
                                                                   
                                                                        <img
																			src="${pageContext.request.contextPath }/uploads/room/${i.roomtypeimagename}"
																			class="blur-up lazyload bg-img w-100"   id="${i.roomtypeimageid}">
																	                                                 
                                                        				<div style="background-color: white;position: absolute;top: 0px">
                                        
                                                        				<a href="${pageContext.request.contextPath }/hotel/roomtype/deleteimage?imageid=${i.roomtypeimageid}&roomtypeid=${roomtype.roomstypeid}" style="color: black;"><Strong>X</Strong></a>
																		</div>

                                                                </div>
                                                            </c:forEach>
                                                                
                                                               
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
											</div>
                                                </div>
                                    <div class="mb-3">
                                        <label
												class="form-label-title mt-4">Upload More Images </label>
                                       	<input type="file" name="photos"
												multiple="multiple"
												accept="image/gif, image/jpeg, image/png" /></i>
                                    </div>
                                </div>
                                <div class="card-footer text-end">
                                    <input type="submit"
											class="btn btn-primary me-3" value="Submit" />
                                    <button
											class="btn btn-outline-primary">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!--Hotel detail end-->
                </div>
            </div>
        </div>
    </div>

		<script>
			
		</script>
		</jsp:attribute>
</mt:hotelTemplate1>