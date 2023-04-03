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
                    <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/hotel/booking-failed.png" class="img-fluid blur-up lazyload" alt="">
                    <h2>${msg}</h2>
                    <p>${content}</p>
                    <%-- <button onclick="window.location.href='${pageContext.request.contextPath }/user/reviewbooking?reservationid=${reservation.getReservationid()}'" type="submit" class="btn btn-solid color1">BOOKING DETAILS</button> --%>
                	<button onclick="window.location.href='${pageContext.request.contextPath }/home" class="btn btn-solid color1">HOME</button>
                </div>
            </div>
        </div>
    </section>
    <!-- section End -->
	</jsp:attribute>
</mt:userTemplate>



