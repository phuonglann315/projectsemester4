<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:accountTemplate>
	<jsp:attribute name="content">
	

	<div class="login-main" style="width: 650px">
	 <s:form class="theme-form" modelAttribute="account"
			action="${pageContext.request.contextPath }/account/register"
			method="post">
                                <h4>Create your account</h4>
                                <p>Enter your personal details to create account</p>
                                
                                <div class="form-group">
                                    <label
					class="col-form-label form-label-title  pt-0"
					style="font-size: 18px">Username</label>
                                    <div class="row g-2">
                                        <div class="col-12">
                                              <s:errors path="username"
							cssStyle="color:red;"></s:errors>                                          
                                        </div>
                                        <div class="col-12">
                                            <s:input path="username"
							class="form-control" type="text" required="required"
							placeholder="Username" maxlength="50" />
                                           
                                        </div>
                                       
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label
					class="col-form-label form-label-title  pt-0"
					style="font-size: 18px">Full Name</label>
                                    
                                    <div class="row g-2">
                                       <div class="col-12">
                                              <s:errors
							path="accountname" cssStyle="color:red;"></s:errors>                                          
                                        </div>
                                        <div class="col-12">
                                            <s:input path="accountname"
							class="form-control" type="text" placeholder="Full name" />
                                            
                                        </div>
                                        
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label
					class="col-form-label form-label-title " style="font-size: 18px">Email</label>
                                    <div class="row g-2">
                                       <div class="col-12">
                                             <s:errors path="email"
							cssStyle="color:red;"></s:errors>                                       
                                        </div>
                                        <div class="col-12">
                                        <s:input path="email"
							class="form-control"  required="required"
							placeholder="Email" maxlength="100" />
                                            
                                        </div>
                                        
                                    </div>
                                   
                                    
                                </div>
                              
                                   <div class="form-group">
                                    <label
					class="col-form-label form-label-title " style="font-size: 18px">Phone</label>
                                     <div class="row g-2">
                                       <div class="col-12">
                                               <s:errors path="phone"
							cssStyle="color:red;"></s:errors>                                  
                                        </div>
                                        <div class="col-12">
                                       <s:input path="phone"
							class="form-control" type="text" required="required"
							placeholder="Phone" />
                                            
                                        </div>
                                        
                                    </div>
                                   
                                    
                                </div>
                              
                                <div class="form-group">
                                    <label
					class="col-form-label form-label-title " style="font-size: 18px">Password</label>
                                     <div class="row g-2">
                                       <div class="col-12">
                                             <s:errors path="password"
							cssStyle="color:red;"></s:errors>                           
                                        </div>
                                        <div
						class="form-input position-relative">
                                        <s:input path="password"
							class="form-control" type="password" name="login[password]"
							required="required" placeholder="*********" id="showPass" />
                                        <div class="show-hide">
							<span class="show" onclick="toggle('showPass')"></span>
						</div>
                                    </div>
                                        
                                    </div>
                                    
                                    
                                    
                                </div>
                               
                                <div class="form-group">
                                
                                    <label
					class="col-form-label form-label-title " style="font-size: 18px">Confirm Password</label>
                                    <div class="row g-2">
                                       <div class="col-12">
                                              <span name="error"
							style="height: 50px; color: red">${errorConfirm } </span>                      
                                        </div>
                                       <div
						class="form-input position-relative">
                                        <input id="showConfirmPass"
							class="form-control" type="password" name="confirmPass"
							required="required" placeholder="*********" />
                                        <div class="show-hide">
							<span class="show" onclick="toggle2('showConfirmPass')"></span>
						</div>
                                        
                                    </div>
                                    </div>
                                        
                                    </div>

                                <div class="form-group mb-0">
                                    <div class="checkbox p-0">
                                      
                                    </div>
                                   <div id="showbutton"><button class="btn btn-primary btn-block w-100" type="submit">Create Account</button> </div>
					
                                       
                                </div>
                                <h6 class="text-muted mt-4 or">Or signup with</h6>
                                <div class="social mt-4">
                                    <div class="btn-showcase">
					<a class="btn btn-light" href="https://www.linkedin.com/login"
						target="_blank"><i class="txt-linkedin"
						data-feather="linkedin"></i> LinkedIn </a><a class="btn btn-light"
						href="https://twitter.com/login?lang=en" target="_blank"><i
						class="txt-twitter" data-feather="twitter"></i>twitter</a><a
						class="btn btn-light" href="https://www.facebook.com/"
						target="_blank"><i class="txt-fb" data-feather="facebook"></i>facebook</a>
				</div>
                                </div>
                                <p class="mt-4 mb-0">Already have an account?<a
					class="ms-2"
					href="${pageContext.request.contextPath }/account/login">Sign
                                        in</a>
			</p>
                            </s:form>
                       
                          </div>
          
          
	                             <script type="text/javascript">
																															var state = false;
																															function toggle(
																																	id) {
																																if (state) {
																																	document
																																			.getElementById(
																																					'showPass')
																																			.setAttribute(
																																					"type",
																																					"password");
																																	state = false;
																																} else {
																																	document
																																			.getElementById(
																																					'showPass')
																																			.setAttribute(
																																					"type",
																																					"text");
																																	state = true;
																																}
																															}
																															var state2 = false;
																															function toggle2(
																																	id) {
																																if (state2) {
																																	document
																																			.getElementById(
																																					'showConfirmPass')
																																			.setAttribute(
																																					"type",
																																					"password");
																																	state2 = false;
																																} else {
																																	document
																																			.getElementById(
																																					'showConfirmPass')
																																			.setAttribute(
																																					"type",
																																					"text");
																																	state2 = true;
																																}
																															}
																														</script>

                                
		</jsp:attribute>
</mt:accountTemplate>