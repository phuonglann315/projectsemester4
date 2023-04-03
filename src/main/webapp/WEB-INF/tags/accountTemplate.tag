<%@ tag language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" uri="http://mytags.com"%>
<%@ attribute name="content" fragment="true"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Cuba admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Cuba admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="pixelstrap">
<link rel="icon"
	href="${pageContext.request.contextPath }/resources/logo/dove.ico"
	type="image/x-icon">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/logo/dove.ico"
	type="image/x-icon">
<title>Traveloto</title>
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/font-awesome.css">
<!-- Themify icon-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/themify.css">
<!-- Feather icon-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/feather-icon.css">
<!-- Plugins css start-->
<!-- Plugins css Ends-->
<!-- Bootstrap css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/vendors/bootstrap.css">
<!-- App css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/style.css">

<!-- Responsive css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/backend/assets/css/responsive.css">
</head>

<body>
	<!-- login page start-->
	<div class="container-fluid p-0">
		<div class="row m-0">
			<div class="col-12 p-0">
		

				<div class="login-card">
					<div>
						<div>
							<a class="logo"
								href="${pageContext.request.contextPath }/home/index"> <img
								class="img-fluid for-light" style="max-width: 30%;"
								src="${pageContext.request.contextPath }/resources/logo/logo.png"
								alt="looginpage"><img class="img-fluid for-dark"
								style="max-width: 30%;"
								src="${pageContext.request.contextPath }/resources/logo/logo.png"
								alt="looginpage">
							</a>
						</div>
						
								<jsp:invoke fragment="content"></jsp:invoke>
						
					</div>
				</div>
			</div>
		</div>
		<!-- latest jquery-->
		<script
			src="${pageContext.request.contextPath }/resources/backend/assets/js/jquery-3.5.1.min.js"></script>
		<!-- Bootstrap js-->
		<script
			src="${pageContext.request.contextPath }/resources/backend/assets/js/bootstrap/bootstrap.bundle.min.js"></script>
		<!-- feather icon js-->
		<script
			src="${pageContext.request.contextPath }/resources/backend/assets/js/icons/feather-icon/feather.min.js"></script>
		<script
			src="${pageContext.request.contextPath }/resources/backend/assets/js/icons/feather-icon/feather-icon.js"></script>
		<!-- scrollbar js-->
		<!-- Sidebar jquery-->
		<script
			src="${pageContext.request.contextPath }/resources/backend/assets/js/config.js"></script>
		<!-- Plugins JS start-->
		<!-- Plugins JS Ends-->
		<!-- Theme js-->
		<script
			src="${pageContext.request.contextPath }/resources/backend/assets/js/script.js"></script>
	
			
		<!-- login js-->
		<!-- Plugin used-->
	</div>
</body>

</html>