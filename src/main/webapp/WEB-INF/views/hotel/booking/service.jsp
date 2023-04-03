<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:hotelTemplate>
	<jsp:attribute name="content">
	
<div class="container-fluid">
   <div class="row">
     <div class="col-sm-12">      
        <div class="card">       
         <div class="row">
         <div class="col-sm-12" style="margin-top: 30px; margin-left: 30px;"> 
								
     
             <form class="form-inline search-full col " action="#"
									method="get">
                    <div class="form-group w-100">
                        <div class="Typeahead Typeahead--twitterUsers">
                            <div class="u-posRelative" style="padding-right: 50px;">
												<c:if test="${msg !=null }"><label class="form-label-title" style="color: #ef3f3e">${msg }</label></c:if>
                                <input class=" form-control" type="text"
													placeholder="Search room .." name="searchrooms"
													style="text-transform: capitalize; border: none; border-bottom: 1px solid #ced4da; height: 48px; color: #495057; width: 100%; padding: 0px 12px; border-radius: 0.25rem; font-size: 17px;">
                                </div>
                            </div>
                        </div>
                         </form>
                    </div>
         </div>
             
               

         <c:forEach var="rt" items="${roomtypes }">
         <div class="card-header  card-header--2">        
             
              <h5>
              ${rt.roomstypename }
              </h5>
              
            </div> 
             <div class="row">
              <c:forEach var="rs" items="${reservationroomdetails }">
              <c:if
										test="${rs.rooms.roomtype.roomstypeid==rt.roomstypeid }">
              <div class="col-lg-3"
											style="padding: 0px; width: 25%; height: 130px; margin-bottom: 15px;">
             <a
												href="${pageContext.request.contextPath }/hotel/reservationroom/showreservationroom?reservationroomdetailsid=${rs.reservationroomdetailsid }"
												style="display: flex;align-items: center;justify-content: center;
             background-image: url(${pageContext.request.contextPath }/resources/logo/rooms.png);
             background-repeat: no-repeat; background-position: top;width: 100%;background-size: revert;height: 100%; ">
			
													<Strong
														style="color: ##dc3545; font-size: 50px; padding-top: 10px;">${ rs.rooms.roomname }</Strong>
												   </a>
                            
              </div>                                                  
			</c:if>			
			 </c:forEach>
             </div>
           </c:forEach>
                
              
            


                
                  
                  
                  
                    
                
 				  
             </div>   
        </div>  
    </div>      
</div>	
		
	</jsp:attribute>
</mt:hotelTemplate>