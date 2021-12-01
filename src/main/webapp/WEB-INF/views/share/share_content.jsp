<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Grayscale - Start Bootstrap Theme</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
    
</head>
<style>
    #pagepath a {
        font-size: x-small;
        color: #198754fa;
        text-decoration: none;
    }
    
    #pagepath span {
        font-size: x-small;
    }
    
    #title label {
        font-size: xx-large;
        font-weight: lighter;
        padding-left: 88px;
    }
    .float{
        float: left;
    }
    .clear{
        clear: both;
    }
    #info{
        text-align:center; 
        padding-top: 64px;
        
    }
    </style>
<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#page-top">GooPPl</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Plan</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Community</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">MyPage</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">LogIn</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 3rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">

            
                <div class="row">
                    <!-- 페이지경로 -->
                    <div id="pagepath" class="col-md-4">
                       <span><a href="">커뮤니티</a>&gt;&gt;<a href="">일정 공유 게시판</a>&gt;&gt;~의 일정or일정 제목</span> 
                    </div>
                    <!-- 제목-->
                    <div id="title" class="col-md-4">
                        <label>~의 일정or일정 제목</label>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <!-- 컨텐츠 영역-->
                <div class="row"></div>
                <div class="row" style="margin-top: 32px;">
                    <div class="col-md-9 col-sm-9">
                    <div class="row" style="border: whitesmoke solid 1px; border-top-left-radius: 10px; background-color: white;" >
                        <!--여행 일차-->
                        <div class="col-md-2 col-xs-3 fw-bold" style="background-color: #78C2AD; color: whitesmoke; border-top-left-radius: 10px; text-align: center; font-size: x-large;">
                            Day1
                        </div>
                        <div class="col-md-10 col-xs-9" style=" border-bottom:#78C2AD solid 0.5px;">
                            <div class="row">
                                <!--여행 날짜(yyyy-mm-dd-(요일))-->
                                <div class="col-xs-9" style="font-size: xx-small; ">
                                    2021-11-22-(화)
                                </div>
                            </div>
                            <div class="row">
                                <!--여행도시-->
                                <div class="col-xs-9 fw-bold">
                                    서울
                                </div>
                            </div>
                        </div>
                        <!--일정 순번 -->
                        <div class="col-md-2">
                            <p style="text-align: center; font-size: xx-large; padding-top: 24px;">1</p>
                        </div>
                        <div class="col-md-10">
                            <div class="row">
                                <!--카드 삽입-->
                                <div class="col-xs-9" >
                                    <div class="row" style="width: auto; " >
                                        <div class="row g-0" style="border-left: solid 0.5px rgb(230, 227, 227);">
                                          <div class="col-md-3 " >
                                            <img src="https://ww.namu.la/s/957178fa99b1b9ecf53065b2aa8be8b3c82d4a801e3b1a340364a3babf1547477bdae6bae6045d338f63e0ae4ef8d03d0f38545ed5236774026e6dd1f22a5fbc6e95db146d8da9111bb86dc71ad3d7bae0b12cf1313ae4f4fb9e5c0563e34381" class="img-fluid " alt="..." style="padding: 8px;" >
                                          </div>
                                          <div class="col-md-7" style="padding-left: 8px;" >
                                            
                                              <h5 class="fw-bold" style="padding-top: 8px;">롯데월드 타워</h5>
                                              <p class="text">태그 + 평가 +소감?</p>
                                              <p class="text"><small class="text-muted">안적은사람도있음 예)공항/롯데월드타워 도착 오후9시</small></p>
                                            
                                          </div>
                                          <div id="info" class="col-md-1" >
                                            <a href=""><img src="https://img.icons8.com/fluency/24/000000/information.png"/></a> 
                                          </div>
                                          <div class="col-md-1 col-sm-12">&nbsp;</div>
                                        </div>
                                      </div>
                                </div>
                                <!-- 관광지 정보 + -->
                                <div class="col-xs-3">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-md-center">
                        <div class="col-md-12" style="text-align: center;">
                        <img src="https://img.icons8.com/color/36/26e07f/menu-2.png"/>
                        </div>
                    </div>
                    </div>
                    <!-- 되면 들어갈 지도영역-->
                    <div class="col-md-3"></div>
                </div>
                    <!-- 추가 컨텐츠영역-->
                <div class="row"></div>
            



        </div>
    </section>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <!-- Contact-->
    <section class="contact-section bg-primary align-items-center">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-md-center">
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-map-marked-alt text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">Address</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50">은평구 동서로 101-2</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-envelope text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">1:1상담</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50"><a href="#">문의하기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-mobile-alt text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">FAQ</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50"><a href="#">자주하는 질문</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer bg-primary small text-center text-white-50" style="padding: 2.3rem 0;">
        <div class="container px-4 px-lg-5">Copyright &copy; Ezen Academy & Team3 2021</div>
    </footer>
</body>

</html>
</body>
