<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:hotelTemplate1>
	<jsp:attribute name="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-sm-12">
						<form modelAttribute="room"
							  action="${pageContext.request.contextPath }/hotel/rooms/createroom"
							  class="theme-form mega-form" method="POST">
							<!--Hotel detail start-->
							<div class="card">
								<div class="card-header">
									<h5>Add New Room </h5>
								</div>
								<div class="card-body">
									<div class="mb-3">
										<label class="form-label-title">Room Number</label>
										<input class="form-control" type="text" name="roomname" placeholder="Room Name"/>
									</div>
									<div class="mb-3">
										<label class="form-label-title  ">Type:</label>
										<select id="roomstype" name="roomtype" class="js-example-basic-single col-sm-12">
											<c:forEach var="item" items="${roomTypeList}">
												<option value="${item.roomstypeid}"> ${item.roomstypename}</option>
											</c:forEach>
										</select>
									</div>
									<div class="mb-3">
										<label class="form-label-title  ">Bed Type</label>
										<input class="form-control" type="text" name="roomtypecontent" placeholder="Room Type Name"/>
									</div>


									<div class="animate-chk">
										<div class="row g-2">
											<div class=" col-xl-12 col-xxl-6 ">
												<label class="form-label-title ">Extra:</label>
												<div class="row g-3">
													<div class="col">
														<label class="d-block" for="minibar">
															<input class="checkbox_animated" id="minibar" name="extrabed"
																   type="checkbox"  value="1">Extra bed
														</label>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer text-end">
									<input type="submit" class="btn btn-primary me-3" value="Submit" />
									<button class="btn btn-outline-primary">Cancel</button>
								</div>
							</div>
						</form>
					</div>
					<!--Hotel detail end-->
				</div>
			</div>
		</div>
	</div>
	</div>
	</jsp:attribute>
</mt:hotelTemplate1>