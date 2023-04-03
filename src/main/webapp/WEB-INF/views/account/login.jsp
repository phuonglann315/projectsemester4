<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:accountTemplate>
	<jsp:attribute name="content">

	<div class="login-main">
	<form class="theme-form" method="post" 
								action="${pageContext.request.contextPath }/account/processlogin" >
								<h4>Sign in to account</h4>
								<p style="    margin-bottom: 0px;">Enter your email & password to login</p>
								<div class="row col-lg-12">
									<label class="col-form-label form-label-title" style="color:red">${msg }</label>
									
								</div>
								<div class="form-group">
									<label class="col-form-label form-label-title ">Username</label>
									<input Class="form-control" 
										placeholder="please input your username" name="username" />
								</div>
								<div class="form-group">
									<label class="col-form-label form-label-title ">Password</label>
									<div class="form-input position-relative">
										 <input  Class="form-control" type="password"   name="password"
											 placeholder="*********" />
										<div class="show-hide">
											<span class="show"> </span>
										</div>
									</div>
								</div>
								<div class="form-group mb-0">
									<div class="checkbox p-0">
										<input id="checkbox1" type="checkbox"> <label
											class="text-muted" for="checkbox1">Remember password</label>
									</div>
									
									<div class="text-end mt-3">
										<button class="btn btn-primary btn-block w-100" type="submit">Sign
											in</button>
									</div>
								</div>
								<h6 class="text-muted mt-4 or">Or Sign in with</h6>
								<div class="social mt-4">
									<div class="btn-showcase">
										<a class="btn btn-light" href="https://www.linkedin.com/login"
											target="_blank"><i class="txt-linkedin"
											data-feather="linkedin"></i> LinkedIn </a><a
											class="btn btn-light"
											href="https://twitter.com/login?lang=en" target="_blank"><i
											class="txt-twitter" data-feather="twitter"></i>twitter</a><a
											class="btn btn-light" href="https://www.facebook.com/"
											target="_blank"><i class="txt-fb" data-feather="facebook"></i>facebook</a>
									</div>
								</div>
								<p class="mt-4 mb-0 text-center">
									Don't have account?<a class="ms-2"
										href="${pageContext.request.contextPath }/account/register">Create
										Account</a>
								</p>
							</form>
                    	</div>      
          
          
	
		</jsp:attribute>
</mt:accountTemplate>