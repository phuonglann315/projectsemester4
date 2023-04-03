<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:userTemplate>
	<jsp:attribute name="content">
	
	   <section class=" section-b-space bg-inner success-section">
        <div class="container">
            <div class="row success-detail mt-0">
            <div class="col-lg-1">
                  
                </div>
                <div class="col-lg-10">
                    <img
							src="${pageContext.request.contextPath }/resources/frontend/assets/images/icon/failure-icon.png"
							class="img-fluid blur-up lazyload" alt="">
                    <h2>404 ! that's an error</h2>
                    <p>we are sorry but the page you are looking for doesn't exist or has been removed. please check
                        back later or search again.</p>
                    <a
							href="${pageContext.request.contextPath }/hotel/dashboard"
							class="btn btn-solid color1">go to Hotel Dashboard</a>
                </div>
                 <div class="col-lg-1">
                  
                </div>
            </div>
        </div>
    </section>
          
          
	
		</jsp:attribute>
</mt:userTemplate>