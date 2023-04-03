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
								action="${pageContext.request.contextPath }/hotel/roomtype/editroomtype1/${roomtype.roomstypeid}"
								class="theme-form mega-form" method="POST"
								enctype="multipart/form-data">
                            <!--Hotel detail start-->
                            <div class="card">
                                <div class="card-header">
                                    <h5>Edit Images Room Type</h5>
                                </div>
                                <div class="card-body">
                                    <input type="hidden"
											name="roomstypeid" value="${roomtype.roomstypeid}">
                                   
                                    
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