<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:hotelTemplate1>
	<jsp:attribute name="content">

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-sm-12">
						<form modelAttribute="roomtype"
								action="${pageContext.request.contextPath }/hotel/roomtype/createroomtype"
								class="theme-form mega-form" method="POST"
								enctype="multipart/form-data">
						<!--Hotel detail start-->
						<div class="card">
							<div class="card-header">
								<h5>Add New Room Type</h5><br>
						
								<h6 style="color: #ef3f3e" id="showerr">Input all value and choose file image. Net price should be less than or equal to public price and  Number people default should be less than or equal to Number people maximum</h6>
					
							</div>
							<div class="card-body">
									<div class="mb-3">
										<label class="form-label-title">Room Type Name</label>
										<input class="form-control" type="text" id="roomstypename"
												name="roomstypename" placeholder="Room Type Name" />
									</div>
									<div class="mb-3">
										<label class="form-label-title  ">Views</label>
										<input type="text" placeholder="View" class="form-control"
												name="views" id="views" />
									</div>
									<div class="mb-3">
										<label class="form-label-title  ">Description</label>

										<textarea cols="30" rows="10" id="editor1" name="editor1"></textarea>
									</div>
								<div class="mb-3">
									<label class="form-label-title  ">Room Size</label>
									<input type="number" placeholder="Size" class="form-control"
												name="roomsize" id="roomsize" />
								</div>
									<div class="row">
										
										<div class="col-6">
										<label class="form-label-title "> Number people default</label>
											<input class="form-control" type="number" id="numcusdefault"
													placeholder="Default Number" name="numcusdefault" min=1>
										</div>
										<div class="col-6">
										<label class="form-label-title "> Number people maximum</label>
											<input class="form-control" type="number" id="maxcus"
													placeholder="Max Number" name="maxcus" min=1>
										</div>
									</div>

								<div class="animate-chk">
									<div class="row g-2">
										<div class=" col-xl-12 col-xxl-6 ">
											<label class="form-label-title ">Room Inclusion</label>
											<div class="row g-3">
												<div class="col">
													<label class="d-block" for="minibar">
														<!-- Toan Code -->
														<input class="checkbox_animated" id="minibar"
																name="minibar" type="checkbox" value="1">Minibar
													</label>
												</div>
												<div class="col">
													<label class="d-block" for="smoking">
														<input class="checkbox_animated" id="smoking"
																name="smoking" type="checkbox" value="1">Smoking
													</label>

												</div>
												<div class="col">
													<label class="d-block" for="breakfast">
														<input class="checkbox_animated" id="breakfast"
																name="breakfast" type="checkbox" value="1">Breakfast
													</label>
												</div>
												<div class="col">
													<label class="d-block" for="shower">
														<input class="checkbox_animated" id="shower" name="shower"
																type="checkbox" value="1">Shower
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<label class="form-label-title "> Price</label>
									<div class="col-6">
										<label class="form-label-title" for="netprice">Net Price</label>
										<input class="form-control" type="number" id="netprice"
													placeholder="Net Price" name="netprice" min=1>
									</div>
									<div class="col-6">
										<label class="form-label-title" for="publicprice">Public Price</label>
										<input class="form-control" type="number" id="publicprice"
													placeholder="Public Price" name="publicprice" min=1>
									</div>
								</div>
								<div class="mb-3">
									<label class="form-label-title mt-4">Upload Images</label>


								<input type="file" name="photos" id="file" multiple="multiple"
												accept="image/gif, image/jpeg, image/png" />
								</div>
							</div>
							<div class="card-footer text-end" id="showbutton"
										style="display: none">
								<input type="submit" class="btn btn-primary me-3" value="Submit" />
							</div>
							
						</div>
						</form>
						</div>
						<!--Hotel detail end-->
					</div>
				</div>
			</div>
		</div>
	
		</jsp:attribute>
</mt:hotelTemplate1>