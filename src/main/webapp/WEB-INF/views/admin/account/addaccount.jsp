<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:adminTemplate>
	<jsp:attribute name="content">
		<div class="container-fluid">
			<div class="row">
  
			  <div class="col-12">
				<div class="row">
				  <div class="col-sm-12">
					<div class="card">
					  <div class="card-header">
						<h5>Add Hotel's Account</h5>
					  </div>
					  <div class="card-body">
						<form class="theme-form" 
			            action="${pageContext.request.contextPath }/admin/account/addaccount"
			            method="post">
			             <div class="mb-3">
							<label class="form-label-title ">Username</label>
							<input class="form-control" type="text" placeholder=" Username" name="username">
						  </div>
						  <div class="mb-3">
							<label class="form-label-title "> Account Name</label>
							<input class="form-control" type="text" placeholder=" Account Name" name="name">
						  </div>
						  <div class="mb-3">
							<label class="form-label-title ">Email Address</label>
							<input class="form-control" type="email" placeholder="Email " name="email">
						  </div>
						  <div class="mb-3">
							<label class="form-label-title ">Phone</label>
							<input class="form-control"  placeholder="Phone" name="phone">
						  </div>
  
						  <div class="mb-3">
							<label class="form-label-title ">Hotel</label>
							<select  class="form-control" name="hotelid">
							<c:forEach var="c" items="${ listhotel}">
								<option value="${c.hotelid }">${c.hotelname }</option>
							</c:forEach>							
						</select>
						  </div>
						  <div class="card-footer text-end">
						<button class="btn btn-primary me-3" type="submit">Submit</button>
						<button class="btn btn-outline-primary">Cancel</button>
					  </div>
						</form>
					  </div>
					</div>
				  </div>
  
				</div>
			  </div>
			</div>
		  </div>
		  <!-- Container-fluid Ends-->
		  <div class="container-fluid">
			<!-- footer start-->
			<footer class="footer">
			</footer>
	</div>
		</jsp:attribute>
</mt:adminTemplate>