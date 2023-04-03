<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="rica">
    <meta name="keywords" content="rica">
    <meta name="author" content="rica">
    <link rel="icon" href="${pageContext.request.contextPath }/resources/frontend/assets/images/dove.ico" type="image/x-icon" />
    <title>Traveloto</title>

    <!--Google font-->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/font-awesome.css">

    <!-- Animation -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/animate.css">

    <!--Slick slider css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/slick.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/slick-theme.css">

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/bootstrap.css">

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/frontend/assets/css/color2.css">

</head>

<body>


    <!-- pre-loader start -->
    <div class="loader-wrapper img-gif">
        <img src="${pageContext.request.contextPath }/resources/frontend/assets/images/loader.gif" alt="">
    </div>
    <!-- pre-loader end -->


    <!-- section start -->
    <div class="coming-soon ripple-effect">
        <img src="${pageContext.request.contextPath }/resources/logo/coming-soon.jpg" alt="" class="img-fluid blur-up lazyload bg-img">
        <div class="object">
            <div class="object-rope"></div>
            <div class="object-shape">
                Check <span class="soon">Email</span>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="offset-lg-4 col-lg-4 offset-md-3 col-md-6">
                    <div class="coming-soon-detail">
                        <div>
                            <div class="logo">
                                <a href="cab-layout.html">
                                    <img src="${pageContext.request.contextPath }/logo/logo.png" alt=""
                                        class="img-fluid blur-up lazyload">
                                </a>
                            </div>
                            <h2>
                                Please check your email and click in to verify link
                            </h2>
                          
                               
                                <div class="col-md-12">
                                    <div class="actions">
                                        <a href="${pageContext.request.contextPath }/home" class="btn btn-solid">Back To Home</a>
                                    </div>
                                </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- section end -->


    <!-- latest jquery-->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/jquery-3.5.1.min.js"></script>

    <!-- popper js-->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/popper.min.js"></script>

    <!-- ripple effect js -->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/jquery.ripples.js"></script>

    <!-- slick js-->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/slick.js"></script>

    <!-- Bootstrap js-->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/bootstrap.js"></script>

    <!-- lazyload js-->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/lazysizes.min.js"></script>

    <!-- Theme js-->
    <script src="${pageContext.request.contextPath }/resources/frontend/assets/js/script.js"></script>

    <script>
        $(document).ready(function () {
            try {
                $('.ripple-effect').ripples({
                    resolution: 256,
                    perturbance: 0.003
                });
            }
            catch (e) {
                $('.error').show().text(e);
            }
        });
    </script>


</body>

</html>
