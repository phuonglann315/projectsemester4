
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:hotelTemplate1>
	<jsp:attribute name="content">
<div class="container-fluid">
    <div class="row">
        <!-- Earning chart  end-->
        <!-- Booking history  start-->
        <div class="col-xxl-12">
            <div class="card">
                <div class="card-header card-header--2" style="border-bottom: none">
                    <div>
                        <h5>Room</h5>
                    </div>
                      
                    <div class="d-inline-flex">
                        <a
									href="${pageContext.request.contextPath }/hotel/rooms/createroom"
									class="btn btn-theme">
                            <svg xmlns="http://www.w3.org/2000/svg"
										width="24" height="24" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-plus-square">
										<rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
										<line x1="12" y1="8" x2="12" y2="16"></line>
										<line x1="8" y1="12" x2="16" y2="12"></line></svg>
                            Add New
                        </a>
                    </div>

                </div>
                 <div class="card-header">
					<div class="row">
					<div class="col-lg-12">
                  <select id="roomstype" onchange="changeURL()" class="form-control"
										class="js-example-basic-single col-sm-12">
                            <c:forEach var="item"
											items="${roomTypeList}">
                                <option value="${item.roomstypeid}"
												${item.roomstypeid==typeroomSelected?"selected":""}> ${item.roomstypename}</option>
                            </c:forEach>
                            </select>
                 </div> </div></div>
                <div class="card-body">
                    <div class=" table-responsive table-desi ">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Room Name</th>
                                <th>Room Type</th>
                                <th>Room Type Content</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${roomList}">
                                <tr>
                                    <td><span>
                                        <c:out value="${item.roomid}" />
                                    </span></td>
                                    <td><span>
                                        <c:out value="${item.roomname}" />
                                    </span></td>
                                    <td><span>

                                        <c:out value="${typeRoomName}" />

                                    </span></td>
                                    <td><span>
                                        <c:out
																value="${item.roomtypecontent}" />
                                    </span></td>
                                    <td
														id="room-type-${item.roomid}-status">
                                         <c:choose>
                                            <c:when
																test="${item.hotelroomstatus == 0}">
																<span class="badge badge-primary" value-data="0"> New</span>
															</c:when>
                                            <c:when
																test="${item.hotelroomstatus == 1}">
																<span class="badge badge-primary" value-data="1"> Active</span>
															</c:when>
                                            <c:when
																test="${item.hotelroomstatus == 2}">
																<span class="badge badge-dark" value-data="2"> Non-active</span>
															</c:when>
                                        </c:choose>
                                    </td>

                                    <td><span>
                                        <button
																class="badge badge-primary" type="button"
																onclick="changeStatus(${item.roomid})">Change</button>
                                    </span>
                                        <c:if
															test="${item.hotelroomstatus==0}">
															<span>
                                             <a
																id="edit-${item.hotelroomstatus}"
																href="${pageContext.request.contextPath }/hotel/rooms/editroom/${item.roomid}"><i
																	class="fa fa-pencil-square-o" aria-hidden="true"></i> </a>
                                         </span>
														</c:if>
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
                window.location = "${pageContext.request.contextPath }/hotel/rooms/showrooms/"+itemId
            }
            function changeStatus(roomid){
                var tagId = "room-type-"+roomid+"-status"
                var tag = document.getElementById(tagId)
                var itemValue = tag.children[0].getAttribute("value-data")
                if(itemValue == 0){
                    var tagEdit = document.getElementById("edit-"+roomid)
                    tagEdit.remove()
                }
                itemValue++
                if(itemValue == 3){
                    itemValue = 1
                }
                console.log(tag)
                var data = {
                    id: roomid,
                    status: itemValue
                }
                $.ajax({
                    url: "${pageContext.request.contextPath }/hotel/rooms/changestatus",
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
		</div>
		</jsp:attribute>
</mt:hotelTemplate1>