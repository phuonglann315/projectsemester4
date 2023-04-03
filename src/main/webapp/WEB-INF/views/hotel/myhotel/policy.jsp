<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<mt:hotelTemplate>
	<jsp:attribute name="content">
<div class="container-fluid">
    <div class="row">
        <!-- Earning chart  end-->
        <!-- Booking history  start-->
        <div class="col-xxl-12">
            <div class="card">
                <div class="card-header  card-header--2" style="border-bottom: none">

		 <div >
                        <h5>Policies</h5>
                    </div>
					 <div class="d-inline-flex">
                        <a href="${pageContext.request.contextPath }/hotel/policies/createpolicies" class="btn btn-theme">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-square"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
                            Add New
                        </a>
                       
                    </div>
                   

                </div>
                 <div class="card-header ">
					<div class="row">
					<div class="col-lg-4">
                  <select id="showyear" onchange="changeURL()" class="form-control" name="year">
						<c:forEach var="item" items="${years}">
                                <option value="${item}" ${item==year?"selected":""} > ${item}</option>
                            </c:forEach>
                              </select>
                 </div> 
                 <div class="col-lg-4">
                 <select id="roomstype" onchange="changeURL()" class="form-control">
                            <c:forEach var="item" items="${roomTypeList}">
                                <option value="${item.roomstypeid}" ${item.roomstypeid==typeroomSelected?"selected":""} > ${item.roomstypename}</option>
                            </c:forEach>
                        </select>
                 </div> 
                 <div class="col-lg-4">
                 <select id="apply" onchange="changeURL()" class="form-control">
                            <c:forEach var="item" items="${listapply}">
                                <option value="${item}" ${item==applyfor?"selected":""} > ${item}</option>
                            </c:forEach>
                        </select>
                 </div> 
					</div>					
                 </div>
                <div class="card-body">
                    <div class=" table-responsive table-desi ">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Room Type</th>
                                <th>Apply for</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Status</th>
                                <th>Detail</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${policiesList}">
                                <tr>
                                    <td><span>
                                        <c:out value="${item.policiesid}"/>
                                    </span></td>
                                    <td><span>
                                        <c:out value="${item.roomtype.roomstypename}"/>
                                    </span></td>
                                    <td><span>

                                        <c:out value="${item.applyfor}"/>

                                    </span></td>
                                    <td><span>
                                    <fmt:formatDate value="${item.fromdate}" pattern="dd-MM-yyyy" />
                                    </span></td>
                                    <td><span> <fmt:formatDate value="${item.todate}" pattern="dd-MM-yyyy" />

                                    </span></td>
                                    <td id="policies-${item.policiesid}-status">
                                         <c:choose>
                                            <c:when test="${item.policiesstatus == 0}"><span class="badge badge-primary" value-data="0"> New</span></c:when>
                                            <c:when test="${item.policiesstatus == 1}"><span class="badge badge-primary" value-data="1"> Active</span></c:when>
                                            <c:when test="${item.policiesstatus == 2}"><span class="badge badge-dark" value-data="2"> Non-active</span></c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button type="button" style="border: none;" data-bs-toggle="modal" data-bs-target="#exampleModal${item.policiesid}">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                        </button>

                                        <div class="modal fade" id="exampleModal${item.policiesid}" tabindex="-1" aria-labelledby="exampleModalLabel${item.policiesid}" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel${item.policiesid}"> Policies for   <c:out value="${item.roomtype.roomstypename}"/> </h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>
                                                            Date:   <c:out value="${item.fromdate}"/> - <c:out value="${item.todate}"/>
                                                        </p>
                                                        <p>
                                                            Apply for: <c:out value="${item.applyfor}"/>
                                                        </p>
                                                        <p>
                                                            Descroption:
                                                        </p>
                                                        <p>
                                                            <c:out value="${item.policiescontent}"/>
                                                        </p>
                                                        <p>
                                                            Min - Max check in date: <c:out value="${item.minbeforecheckindate}"/> - <c:out value="${item.maxbeforcheckindate}"/>
                                                        </p>
                                                        <p>
                                                            Refund: <c:out value="${item.refund}"/>%
                                                        </p>
                                                        <p>
                                                            Reissue:  <c:out value="${item.reissue}"/>%
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <c:if test="${nextyear== year && stt !=null}">
                <div class="card-footer text-end">
                <a data-bs-toggle="modal" data-bs-target="#ChangeStatus" href="javascript:void(0)" class="btn  btn--yes btn-primary">Change Status</a>
									
				</div>
                </c:if>
                
            </div>
        </div>
        <!-- Booking history  end-->
        
        	<!-- Modal -->
	
	<!-- <div class="customizer-links"></div> -->
        <script>
            function changeURL(){
                var roomtypeId =  document.getElementById("roomstype").value;
                var year =  document.getElementById("showyear").value;
                var applyfor =  document.getElementById("apply").value;
                window.location = "${pageContext.request.contextPath }/hotel/policies/showpolicies/"+roomtypeId+"/"+year+"/"+applyfor;
            }
           
        </script>
    </div>
</div>
		</jsp:attribute>
</mt:hotelTemplate>