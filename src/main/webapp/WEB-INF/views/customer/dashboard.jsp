<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">    -->
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"> 
<style>
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 16px;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}

</style>
<mt:userTemplate>	
	<jsp:attribute name="content">
	<!-- breadcrumb start -->
    <section class="breadcrumb-section pt-0">
        <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/inner-bg.jpg" class="bg-img img-fluid blur-up lazyload" alt="">
        <div class="breadcrumb-content">
            <div>
                <h2>dashboard</h2>
                <nav aria-label="breadcrumb" class="theme-breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/home">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">dashboard</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="title-breadcrumb">Traveloto</div>
    </section>
    <!-- breadcrumb end -->
	
    <!-- section start-->
    <section class="small-section dashboard-section bg-inner" data-sticky_parent>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="pro_sticky_info" data-sticky_column>
                    
                        <div class="dashboard-sidebar">
                            <div class="profile-top">
                                <div class="profile-image">
                                    <img src="${pageContext.request.contextPath }/uploads/account/${account.avatar}" class="img-fluid blur-up lazyload" alt="">
                                    <span data-toggle="modal" data-target="#edit-avatar">
                                    	<a class="profile-edit">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit">
                                            <path d="M20 14.66V20a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h5.34">
                                            </path>
                                            <polygon points="18 2 22 6 12 16 8 16 8 12 18 2"></polygon>
                                        </svg>
                                      </a>
                                    </span>
                                </div>
                                <div class="profile-detail">
                                    <h5>${account.accountname }</h5>
                                    <h6>${account.phone }</h6>
                                    <h6>${account.email }</h6>
                                    <br>
                                    <p style="color: green;font-size: 18px; font-family: sans-serif;">${msg}</p>
                                </div>
                            </div>
                            <div class="faq-tab">
                                <ul class="nav nav-tabs" id="top-tab" role="tablist">
                                    <li class="nav-item"><a data-toggle="tab" class="nav-link active"
                                            href="#dashboard">dashboard</a></li>
                                    <li class="nav-item"><a data-toggle="tab" class="nav-link"
                                            href="#profile">profile</a></li>
                                    <li class="nav-item"><a data-toggle="tab" class="nav-link"
                                            href="#bookings">bookings</a></li>
                                    <!-- <li class="nav-item"><a data-toggle="tab" class="nav-link" href="#added-card">cards
                                            & payment</a></li> -->                                       
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="product_img_scroll" data-sticky_column>
                        <div class="faq-content tab-content" id="top-tabContent">
                            <div class="tab-pane fade show active" id="dashboard">
                                <div class="dashboard-main">
                                    <div class="dashboard-intro">
                                        <h5>welcome! <span>${account.accountname }</span></h5>
                                        <p>you have completed 70% of your profile. add basic info to complete profile.
                                        </p>
                                        <div class="complete-profile">
                                            <div class="row">
                                                <div class="col-xl-4">
                                                    <div class="complete-box">
                                                        <i class="far fa-check-square"></i>
                                                        <h6>verified email ID</h6>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4">
                                                    <div class="complete-box">
                                                        <i class="far fa-check-square"></i>
                                                        <h6>verified phone number</h6>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4">
                                                    <div class="complete-box not-complete">
                                                        <i class="far fa-window-close"></i>
                                                        <h6>complete basic info</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="dashboard-box">
                                    <div class="counter-section">
                                        <div class="row">
                                            <div class="col-xl-3 col-sm-6">
                                                <div class="counter-box">
                                                    <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/hotel.png"
                                                        class="img-fluid blur-up lazyload" alt="">
                                                    <h3>${countBooked}</h3>
                                                    <h5>hotel booked</h5>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-sm-6">
                                                <div class="counter-box">
                                                    <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/check-in.png"
                                                        class="img-fluid blur-up lazyload" alt="">
                                                    <h3>${countUpcoming }</h3>
                                                    <h5>upcoming</h5>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-sm-6">
                                                <div class="counter-box">
                                                    <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/rating.png"
                                                        class="img-fluid blur-up lazyload" alt="">
                                                    <h3>${countReview }</h3>
                                                    <h5>reviews</h5>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-sm-6">
                                                <div class="counter-box">
                                                    <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/cancellation.png"
                                                        class="img-fluid blur-up lazyload" alt="">
                                                    <h3>${countCancel }</h3>
                                                    <h5>cancel</h5>
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div> 
                                   </div> 
                                     
                                    <c:if test="${not empty listUpcoming }">
                                    <div class="dashboard-box">
                                    <div class="dashboard-title">
                                        <h4>upcoming booking</h4>
                                    </div>                                                                                                           
                                    	<c:forEach var="list" items="${listUpcoming }">
                                    	 <div class="dashboard-detail">
                                    		 <div class="booking-box">
                                            <div class="date-box">
                                                <%-- <span class="day">${list.checkin.getDay() }</span> --%>
                                                <span class="date">Check in</span>
                                                <span class="month">${list.checkin }</span>
                                            </div>
                                            <div class="detail-middle">
                                                <div class="media">
                                                    <div class="icon">
                                                        <i class="fas fa-hotel"></i>
                                                    </div>
                                                    <div class="media-body">
                                                        <h6 class="media-heading">${list.roomtype.hotel.hotelname }</h6>
                                                        <p>amount paid: <span>$${list.price + list.servicefee }</span></p>
                                                    </div>
                                                    <div class="media-body">
                                                        <h6 class="media-heading">Rev code: #${list.reservationidcode }</h6>
                                                        <p>create date: <span>${list.createday }</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="detail-last">                                             
                                                <span><a href="${pageContext.request.contextPath }/user/reviewbooking?reservationid=${list.reservationid}"><i class="far fa-edit" data-toggle="tooltip"
                                                        data-placement="top" title="booking detail"></i></a></span>
                                                <span class="badge bg-info">upcoming</span>
                                            </div>
                                        </div>
                                        </div>  
                                    	</c:forEach>   
                                    	</div>                                 
                                    </c:if>                                     
                               </div>
                            </div>
                            <div class="tab-pane fade" id="profile">
                                <div class="dashboard-box">
                                    <div class="dashboard-title">
                                        <h4>profile</h4>
                                        <span data-toggle="modal" data-target="#edit-profile">edit</span>
                                    </div>
                                    <div class="dashboard-detail">
                                        <ul>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>name</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>${account.accountname }</h6>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>birthday</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>25/12/1990</h6>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>gender</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>female</h6>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>street address</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>549 Sulphur Springs Road</h6>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>city/state</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>Downers Grove, IL</h6>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>zip</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>60515</h6>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="dashboard-box">
                                    <div class="dashboard-title">
                                        <h4>login details</h4>
                                    </div>
                                    <div class="dashboard-detail">
                                        <ul>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>email address</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>${account.email }</h6>
                                                        <input type="hidden" id="accMail" value="${account.email }">
                                                        <span data-toggle="modal"
                                                            data-target="#edit-address">edit</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>phone no:</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>${account.phone }</h6>
                                                        <span data-toggle="modal" data-target="#edit-phone">edit</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>username</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>${account.username }</h6>                                                        
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="details">
                                                    <div class="left">
                                                        <h6>password</h6>
                                                    </div>
                                                    <div class="right">
                                                        <h6>&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;</h6>                                                  
                                                        <span data-toggle="modal"
                                                            data-target="#edit-password">edit</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="bookings">     
                                                                      	
                                <div class="dashboard-box">
                                    <div class="dashboard-title">
                                        <c:if test="${ empty msg1 }"><h4>List booking</h4></c:if>
                                        <c:if test="${not empty msg1 }">
                                        	<h4>${msg1 }</h4>                                       	                                       
                                        </c:if>
                                    </div>                                                                  
                               		<table id="myTable" class="styled-table">  
								        <thead>  
								          <tr>  
								          	<th>Booking ID</th>
								            <th>Booking Code</th>  								        
								            <th>Hotel</th>  
								            <!-- <th>Check In</th> 
								            <th>Check Out</th>  -->
								            <th>Booking Date</th>
								            <th>Amount Paid</th>
								            <th>Detail</th>
								            <th>Status</th>
								          </tr>  
								        </thead>  
								        <tbody>  
								          <c:forEach var="reservation" items="${reservations }">  
								          <tr>  
								          	<td>${reservation.reservationid }</td>  
								            <td>#${reservation.reservationidcode }</td>  
								            <td>${reservation.roomtype.hotel.hotelname }</td>  
								            <%-- <td><fmt:formatDate value="${reservation.checkin }" pattern="dd-MM-yyyy" /></td> 
								            <td><fmt:formatDate value="${reservation.checkout }" pattern="dd-MM-yyyy" /></td> --%>
								            <td><fmt:formatDate value="${reservation.createday }" pattern="dd-MM-yyyy" /></td> 
								            <td>$${reservation.price + reservation.servicefee }</td>
								            <td align="center"><a href="${pageContext.request.contextPath }/user/reviewbooking?reservationid=${reservation.reservationid}"><i class="far fa-edit" data-toggle="tooltip"
                                                        data-placement="top" title="booking detail"></i></a></td>
								            <td align="center">
								            	<c:choose>
                                                	<c:when test="${reservation.reservationstt == 0}">
                                                		<span class="badge badge-info">hold</span>
                                                	</c:when>
                                                	<c:when test="${reservation.reservationstt == 1}">
                                                		<span class="badge badge-info">Deposit</span>
                                                	</c:when>
                                                	<c:when test="${reservation.reservationstt == 2}">
                                                		<span class="badge badge-success">confirm</span>
                                                	</c:when>
                                                	<c:when test="${reservation.reservationstt == 3}">
                                                		<span class="badge badge-info">check in</span>
                                                	</c:when>
                                                	<c:when test="${reservation.reservationstt == 4}">
                                                		<span class="badge badge-info">check out</span>
                                                	</c:when>
                                                	<c:when test="${reservation.reservationstt == 5}">
                                                		<span class="badge badge-info">expire</span>
                                                	</c:when>
                                                	<c:when test="${reservation.reservationstt == 6}">
                                                		<span class="badge badge-warning">change date</span>
                                                	</c:when>
                                                	<c:when test="${reservation.reservationstt == 7}">
                                                		<span class="badge badge-primary">refund</span>
                                                	</c:when>
                                                	<c:when test="${reservation.reservationstt == 8}">
                                                		<span class="badge badge-danger">cancel</span>
                                                	</c:when>
                                                </c:choose> 
								            </td>
								          </tr>  
								          </c:forEach>
								        </tbody>  
								      </table> 

                                </div>                              
                            </div>
                                                                                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- section end-->
	 <!-- setting start -->
    <div class="theme-setting">
        <div class="dark">
            <input class="tgl tgl-skewed" id="dark" type="checkbox">
            <label class="tgl-btn" data-tg-off="Dark" data-tg-on="Light" for="dark"></label>
        </div>
        <div class="rtl">
            <input class="tgl tgl-skewed" id="rtl" type="checkbox">
            <label class="tgl-btn" data-tg-off="RTL" data-tg-on="LTR" for="rtl"></label>
        </div>
    </div>
    <!-- setting end -->


    <!-- edit profile modal start -->
    <div class="modal fade edit-profile-modal" id="edit-profile" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="${pageContext.request.contextPath }/account/updateName">
	                <div class="modal-body">
	                    
	                        <div class="form-row">
	                            <div class="form-group col-md-12">
	                                <label for="first">full name</label>
	                                <input type="text" class="form-control" id="fullname" placeholder="full name" value="${account.accountname }" name="accountname">
	                            	<div id="errorName"></div>
	                            </div>
	                            <input type="hidden" value="${account.username }" name="username">                          
	                        </div>                    
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                    <button type="submit" class="btn btn-solid" id="saveChangeName">Save changes</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- edit profile modal start -->


    <!-- edit address modal start -->
    <div class="modal fade edit-profile-modal" id="edit-address" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">change email address</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="${pageContext.request.contextPath }/account/updateMail">
                <div class="modal-body">
                    
                        <div class="form-row">
                            <div class="form-group col-12">
                                <label for="old">old email</label>
                                <input type="email" class="form-control" id="old" required="required">
                                <div id="errorOld"></div>
                            </div>
                            <div class="form-group col-12">
                                <label for="new">enter new email</label>
                                <input type="email" class="form-control" id="new" name="newMail" required="required">
                                <div id="errorNew"></div>
                            </div>
                            <div class="form-group col-12">
                                <label for="comfirm">confirm your email</label>
                                <input type="email" class="form-control" id="confirm" required="required">
                                <div id="errorConfirm"></div>
                            </div>
                        </div>
                   <input type="hidden" value="${account.username }" name="username">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-solid" id="saveChangeMail" >Save changes</button>
                </div>
                 </form>
            </div>
        </div>
    </div>
    <!-- edit address modal start -->


    <!-- edit phone no modal start -->
    <div class="modal fade edit-profile-modal" id="edit-phone" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">change phone no</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="${pageContext.request.contextPath }/account/updatePhone">
                <div class="modal-body">
                    
                        <div class="form-row">
                            <div class="form-group col-12">
                                <label for="ph-o">old phone no</label>
                                <input type="text" class="form-control" id="ph-o">
                                <div id="errorOldPh"></div>
                            </div>
                            <div class="form-group col-12">
                                <label for="ph-n">enter new phone no</label>
                                <input type="text" class="form-control" id="ph-n" name="newPhone">
                                <div id="errorNewPh"></div>
                            </div>
                            <div class="form-group col-12">
                                <label for="ph-c">confirm your phone no</label>
                                <input type="text" class="form-control" id="ph-c">
                                <div id="errorConPh"></div>
                            </div>
                        </div>
                    <input type="hidden" value="${account.phone }" id="accPhone">
                    <input type="hidden" value="${account.username }" name="username">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-solid" id="saveChangePhone">Save changes</button>
                    
                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- edit phone no modal start -->


    <!-- edit password modal start -->
    <div class="modal fade edit-profile-modal" id="edit-password" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">change password</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                 <form method="post" action="${pageContext.request.contextPath }/account/updatePassword">
                <div class="modal-body">                   
                        <div class="form-row">
                            <div class="form-group col-12">
                                <label for="p-o">old password</label>
                                <input type="password" class="form-control" id="p-o" required="required">
                                <div id="errorOldPass"></div>
                            </div>
                            <div class="form-group col-12">
                                <label for="p-n">enter new password</label>
                                <input type="password" class="form-control" id="p-n" name="newPass" required="required">
                                <div id="errorNewPass"></div>
                            </div>
                            <div class="form-group col-12">
                                <label for="p-c">confirm your password</label>
                                <input type="password" class="form-control" id="p-c" required="required">
                                <div id="errorConPass"></div>
                            </div>
                        </div>
                    <input type="hidden" name="username" value="${account.username }" id="usernamePass" >
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-solid" id="saveChangePass">Save changes</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- edit password modal start -->
	
	
	
	 <!-- edit avatar modal start -->
    <div class="modal fade edit-profile-modal" id="edit-avatar" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">change avatar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <!-- <div class="ml-2 col-sm-6">
				  <div id="msg"></div>
				  <form method="post" id="image-form">
				    <input type="file" name="img[]" class="file" accept="image/*">				    
				  </form>
				</div> -->
				<%-- <div class="ml-2 col-sm-6">
				  <img src="${pageContext.request.contextPath }/uploads/account/${account.avatar}" id="preview" class="img-thumbnail">
				</div> --%>
                
              <form method="post" action="${pageContext.request.contextPath }/account/updateAvatar" enctype="multipart/form-data">
                <div class="modal-body">                                  
                        <div class="form-row">
                            <div class="form-group col-12">                                
								  <label for="formFileSm" class="form-label">Seclect avatar</label>
								  <input class="form-control form-control-sm" id="formFileSm" type="file" name="avatar" accept="image/gif, image/jpeg, image/png">								
                            </div> 
                            <div class="form-group col-12" align="center">
                            	<%-- <img src="${pageContext.request.contextPath }/uploads/account/${account.avatar}" class="img-thumbnail" alt="avatar">  --%>                          
                            	 <img src="${pageContext.request.contextPath }/uploads/account/${account.avatar}" id="preview" class="img-thumbnail">
                            </div>                          
                        </div>
                    <input type="hidden" name="username" value="${account.username }" id="usernamePass" >
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-solid" id="saveChangePass">Save changes</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- edit avatar modal start -->
	
	

    <!-- edit password modal start -->
    <div class="modal fade edit-profile-modal" id="edit-card" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">edit your card</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="name">name on card</label>
                            <input type="text" class="form-control" id="name" placeholder="Mark jecno">
                        </div>
                        <div class="form-group">
                            <label for="number">card number</label>
                            <input type="text" class="form-control" id="number" placeholder="7451 2154 2115 2510">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label for="expiry">expiry date</label>
                                <input type="text" class="form-control" id="expiry" placeholder="12/23">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="cvv">cvv</label>
                                <input type="password" maxlength="3" class="form-control" id="cvv"
                                    placeholder="&#9679;&#9679;&#9679;">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-solid">update card</button>
                </div>
            </div>
        </div>
    </div>
    <!-- edit password modal start -->


    <!-- add card modal start -->
    <div class="modal fade edit-profile-modal" id="add-card" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">add new card</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="a-month">card type</label>
                            <select id="a-month" class="form-control">
                                <option selected>add new card...</option>
                                <option>credit card</option>
                                <option>debit card</option>
                                <option>debit card with ATM pin</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="a-na">name on card</label>
                            <input type="text" class="form-control" id="a-na">
                        </div>
                        <div class="form-group">
                            <label for="a-n">card number</label>
                            <input type="text" class="form-control" id="a-n">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label for="a-e">expiry date</label>
                                <input type="text" class="form-control" id="a-e">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="a-c">cvv</label>
                                <input type="password" maxlength="3" class="form-control" id="a-c">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-solid">add card</button>
                </div>
            </div>
        </div>
    </div>
    <!-- edit password modal start -->


    <!-- add card modal start -->
    <div class="modal fade edit-profile-modal" id="delete-account" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Account deletion request</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="text-dark">Before you leave, please tell us why you'd like to delete your Rica account.
                        This information will help us improve. (optional)</p>
                    <form>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-solid">delete my account</button>
                </div>
            </div>
        </div>
    </div>
    <!-- edit password modal start -->

	</jsp:attribute>
</mt:userTemplate>
  
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<!-- <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->

<script>
$(document).ready(function(){
    $('#myTable').dataTable();
});

   document.querySelector('#saveChangeMail').disabled = true;
   document.querySelector('#saveChangePhone').disabled = true;
   document.querySelector('#saveChangeName').disabled = true;
   document.querySelector('#saveChangePass').disabled = true;
	
	$("#old").keyup(function(){
		var oldMail = document.getElementById("old").value.toUpperCase();	
		var accMail = document.getElementById("accMail").value.toUpperCase();	
		 
		 if(oldMail !== accMail){
			 $('#errorOld').html('<span class="error-test" style="color: red; font-size: 16px;">Not match!</span>');  
			 document.querySelector('#saveChangeMail').disabled = true;
		 }
		 else{
	    	 $('#errorOld').html('');
	    	 document.querySelector('#saveChangeMail').disabled = false;
	     }
	});
	
	$("#new").keyup(function(){
		var newMail = document.getElementById("new").value;			
		var regExEmail = /^\w+([\.]?\w+)+@\w+([\.:]?\w+)+(\.[a-zA-Z0-9]{2,3})+$/; 
		 if(newMail.length < 5){
			 $('#errorNew').html('<span class="error-test" style="color: red; font-size: 16px;">This field is required!!</span>');  
			 document.querySelector('#saveChangeMail').disabled = true;
		 }
		 else if(!regExEmail.test(newMail)){
	         $('#errorNew').html('<span class="error-test" style="color: red; font-size: 16px;">Invalid e-mail!</span>'); 
	         document.querySelector('#saveChangeMail').disabled = true;
	     }else{
	    	 $('#errorNew').html('');
	    	 document.querySelector('#saveChangeMail').disabled = false;
	     }
	});
	
	$("#confirm").keyup(function(){
		var confirmMail = document.getElementById("confirm").value.toUpperCase();	
		var newMail = document.getElementById("new").value.toUpperCase();	
		
		 if(confirmMail !== newMail){
	         $('#errorConfirm').html('<span class="error-test" style="color: red; font-size: 16px;">Not match!</span>'); 
	         document.querySelector('#saveChangeMail').disabled = true;
	     }
		 else{
	    	 $('#errorConfirm').html('');
	    	 document.querySelector('#saveChangeMail').disabled = false;
	     }
	});
	
	
	
	$("#ph-o").keyup(function(){
	
		var oldPhone = document.getElementById("ph-o").value.toUpperCase();	
		var accPhone = document.getElementById("accPhone").value.toUpperCase();	
		 
		 if(oldPhone !== accPhone){
			 $('#errorOldPh').html('<span class="error-test" style="color: red; font-size: 16px;">Not match!</span>');  
			 document.querySelector('#saveChangePhone').disabled = true;
		 }
		 else{
	    	 $('#errorOldPh').html('');
	    	 document.querySelector('#saveChangePhone').disabled = false;
	     }
	});
	
	$("#ph-n").keyup(function(){
		var newPhone = document.getElementById("ph-n").value;			
		var regExNumber = /^[0-9]+$/ 
		 if(newPhone.length < 10){
			 $('#errorNewPh').html('<span class="error-test" style="color: red; font-size: 16px;">Must be 10 numbers!</span>');  
			 document.querySelector('#saveChangePhone').disabled = true;
		 }
		 else if(!regExNumber.test(newPhone)){
	         $('#errorNewPh').html('<span class="error-test" style="color: red; font-size: 16px;">Invalid phone!</span>'); 
	         document.querySelector('#saveChangePhone').disabled = true;
	     }
		 else{
	    	 $('#errorNewPh').html('');
	    	 document.querySelector('#saveChangePhone').disabled = false;
	     }
	});
	
	$("#ph-c").keyup(function(){
		var confirmPhone = document.getElementById("ph-c").value.toUpperCase();	
		var newPhone = document.getElementById("ph-n").value.toUpperCase();	
		
		 if(confirmPhone !== newPhone){
	         $('#errorConPh').html('<span class="error-test" style="color: red; font-size: 16px;">Not match!</span>'); 
	         document.querySelector('#saveChangePhone').disabled = true;
	     }
		 else{
	    	 $('#errorConPh').html('');
	    	 document.querySelector('#saveChangePhone').disabled = false;
	     }
	});
	
	$("#fullname").keyup(function(){
		var fullname = document.getElementById("fullname").value.toUpperCase();	
		 var regExName=/^[a-zA-Z ]*$/;
		 if(fullname.length < 2){
	         $('#errorName').html('<span class="error-test" style="color: red; font-size: 16px;">This field is required!</span>'); 
	         document.querySelector('#saveChangeName').disabled = true;
	     }
		 else if(!regExName.test(fullname)){
			 $('#errorName').html('<span class="error-test" style="color: red; font-size: 16px;">Fullname must consists of only characters and separated by spaces</span>');
			    document.querySelector('#saveChangeName').disabled = true;
		 }
		 else{
	    	 $('#errorName').html('');
	    	 document.querySelector('#saveChangeName').disabled = false;
	     }
	});
	
	
	$("#p-o").keyup(function(){
		var accPass = document.getElementById("p-o").value.toUpperCase();
		var username = document.getElementById("usernamePass").value.toUpperCase(); 		
		 //if(accPass.length < 8){	                  
	         $.ajax({
				  type:'GET',
				  url:'${pageContext.request.contextPath }/ajaxuser/ajaxCheckPassword',				  
				  data: {						
					  accPass:accPass,
					  username:username
					},					
				  dataType: 'json',
				  success: function(result){								
					  if(result == true){
						  $('#errorOldPass').html(''); 
						  document.querySelector('#saveChangePass').disabled = false;
					  }else{
						  $('#errorOldPass').html('<span class="error-test" style="color: red; font-size: 16px;">Password not match!</span>'); 
						  document.querySelector('#saveChangePass').disabled = true;
					  }											  
				  }
				  
			});
	     //}	 
		 /* else{
	    	 $('#errorOldPass').html('');
	    	 document.querySelector('#saveChangePass').disabled = false;
	     } */
	});
	
	
	
	$("#p-n").keyup(function(){
		var newPass = document.getElementById("p-n").value.toUpperCase();
		var regExPass =/(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d][A-Za-z\d!@#$%^&*()_+]{8,16}/;
		
		 if(newPass.length < 7){
	         $('#errorNewPass').html('<span class="error-test" style="color: red; font-size: 16px;">Password must be between 8-16 characters!</span>'); 
	         document.querySelector('#saveChangePass').disabled = true;	         	         
	     }else if(!regExPass.test(newPass)){
	    	 $('#errorNewPass').html('<span class="error-test" style="color: red; font-size: 16px;">Password must be at less 1 upcase letter, 1 lowcase letter, 1 digit and no whitespace</span>'); 
	         document.querySelector('#saveChangePass').disabled = true;	  
	     }	 
		 else{
	    	 $('#errorNewPass').html('');
	    	 document.querySelector('#saveChangePass').disabled = false;
	     }
	});
	
	$("#p-c").keyup(function(){
		var conPass = document.getElementById("p-c").value.toUpperCase();
		var newPass = document.getElementById("p-n").value.toUpperCase();
		
		 if(newPass !== conPass){
	         $('#errorConPass').html('<span class="error-test" style="color: red; font-size: 16px;">Password not match!</span>'); 
	         document.querySelector('#saveChangePass').disabled = true;	         	         
	     } 
		 else{
	    	 $('#errorConPass').html('');
	    	 document.querySelector('#saveChangePass').disabled = false;
	     }
	});
	
	$(document).on("click", function() {
		  var file = $(this).parents().find(".file");
		  file.trigger("click");
		});
		$('input[type="file"]').change(function(e) {
		  var fileName = e.target.files[0].name;
		  $("#file").val(fileName);

		  var reader = new FileReader();
		  reader.onload = function(e) {
		    // get loaded data and render thumbnail.
		    document.getElementById("preview").src = e.target.result;
		  };
		  // read the image file as a data URL.
		  reader.readAsDataURL(this.files[0]);
		});
	
</script>
    
    
    