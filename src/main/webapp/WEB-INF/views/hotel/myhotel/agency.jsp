
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false"%>

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
                <div class="card-header  card-header--2">
                    <div >
                        <h5>Agency </h5>
                    </div>

                    <div class="d-inline-flex">
                        <a href="${pageContext.request.contextPath }/hotel/contractinfo/createcontract" class="btn btn-theme">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-square"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
                            Add New
                        </a>
                    </div>
                </div>
                <div class="row" style="padding-left: 30px;margin-top: 20px">
<div class="col-lg-2" style="padding: 0px"> <label class="form-label-title ">Show By year:</label></div>
					<div class="col-lg-4" style="padding: 0px">					
					<select id="roomstype" onchange="changeURL()" class="form-control">
                            <c:forEach var="item" items="${yearList}">
                                <option value="${item}" ${item==yearChoose?"selected":""} > ${item}</option>
                            </c:forEach>
                        </select>
					</div></div>
                <div class="card-body">
                    <div class=" table-responsive table-desi ">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>From date</th>
                                <th>To date</th>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Link</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${contractList}">
                                <tr>
                                    <td><span>
                                        <c:out value="${item.contractid}"/>
                                    </span></td>
                                    <td><span>
                                        <c:out value="${item.fromdate}"/>
                                    </span></td>
                                    <td><span>

                                        <c:out value="${item.todate}"/>

                                    </span></td>
                                    <td><span>

                                        <c:out value="${item.contractname}"/>

                                    </span></td>
                                    <td><span>

                                        <a href="${pageContext.request.contextPath }/hotel/contractinfo/showcontractinfodetails?contractinfoid=${item.contractid}">Detail</a>

                                    </span></td>
                                    <td id="room-type-${item.contractid}-status">
                                         <c:choose>
                                            <c:when test="${item.contractinfostt == 0}"><span class="badge badge-primary" value-data="0"> New</span></c:when>
                                            <c:when test="${item.contractinfostt == 1}"><span class="badge badge-primary" value-data="1"> Active</span></c:when>
                                            <c:when test="${item.contractinfostt == 2}"><span class="badge badge-dark" value-data="2"> Non-active</span></c:when>
                                        </c:choose>
                                    </td>

                                    <td><span>
                                        <button class="badge badge-primary" type="button" onclick="changeStatus(${item.contractid})">Change</button>
                                    </span>                                       
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Booking history  end-->
        <script>
            function changeURL(){
                var itemId =  document.getElementById("roomstype").value
                window.location = "${pageContext.request.contextPath }/hotel/contractinfo/showcontractinfo/"+itemId
            }
            function changeStatus(hotelroomstatus){
                var tagId = "room-type-"+hotelroomstatus+"-status"
                var tag = document.getElementById(tagId)
                var itemValue = tag.children[0].getAttribute("value-data")
                if(itemValue == 0){
                    var tagEdit = document.getElementById("edit-"+hotelroomstatus)
                    tagEdit.remove()
                }
                itemValue++
                if(itemValue == 3){
                    itemValue = 1
                }
                console.log(tag)
                var data = {
                    id: hotelroomstatus,
                    status: itemValue
                }
                $.ajax({
                    url: "${pageContext.request.contextPath }/hotel/contractinfo/changestatus",
                    method: "POST",
                    data: data,
                    success: function (){
                        if(itemValue==0){
                            tag.children[0].className = "badge badge-primary"
                            tag.children[0].textContent = "New"
                            tag.children[0].setAttribute("value-data",0)
                        }
                        else if(itemValue==1){
                            tag.children[0].className = "badge badge-primary"
                            tag.children[0].textContent = "Active"
                            tag.children[0].setAttribute("value-data",1)
                        }
                        else{
                            tag.children[0].className = "badge badge-dark"
                            tag.children[0].textContent = "Non-active"
                            tag.children[0].setAttribute("value-data",2)
                        }
                        //TODO: Send Notified success
                        // alert("Success")
                    },
                    error: function (error){
                        console.log(error)
                    }
                })
                console.log(itemValue)
            }
        </script>
    </div>
</div>
		</jsp:attribute>
</mt:hotelTemplate>