<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<mt:userTemplate>	
	<jsp:attribute name="content">
			  <!-- section start -->
		    <section class="bg-inner section-b-space success-section">
		        <div class="container">
		            <div class="row success-detail mt-0">
		                <div class="col">
		                    <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/booking-success.png" class="img-fluid blur-up lazyload" alt="">
		                    <h2>${content}</h2>
		                    <p>${sub}</p>
							<p>Please, payment before ${deadline }</p>
							<a href="${pageContext.request.contextPath }/user/reviewbooking/payment?reservationid=${reservationid }&reservationcode=${reservationcode }">
							<input type="button" class="btn btn-solid color1" value="PAY NOW"></a>							
		                </div>
		            </div>
		        </div>
		    </section>
    <!-- section End -->
	</jsp:attribute>
</mt:userTemplate>



