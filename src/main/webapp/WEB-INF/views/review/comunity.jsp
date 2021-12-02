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
    <link href="resource/css/styles.css" rel="stylesheet" />
    <link href="resource/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
</head>
<style>
    #pagepath span {
        font-size: x-small;
    }
    #title label {
        font-size: xx-large;
        font-weight: lighter;
        padding-left: 88px;
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
                    <li class="nav-item"><a class="nav-link" href="comunity.do">Community</a></li>
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

                <!--     페이지경로 -->

                <div id="pagepath" class="col-md-4" style="height: 128px;">
                    <span> 커뮤니티 </span>
                </div>
                <!--         제목 -->

                <div id="title" class="col-md-4">
                    <label>커뮤니티</label>
                </div>
                <div class="col-md-4"></div>
            </div>
            <!--     일정공유게시판 컨텐츠 이동  -->

            <div class="row">
                <div class="col-xs-12" style="height: 32px;"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class=" col-md-10">
                    <div class="card bg-dark text-white" style="border: ghostwhite 0.5px solid;">
                        <img src="https://t1.daumcdn.net/cfile/blog/244C94505523281305" class="card-img" alt="..."
                            style="width: auto; height:360px;">
                        <div class="card-img-overlay">
                            <h5 class="card-title">일정 공유게시판</h5>
                            <p class="card-text">다른 사람들과 함께 여행 일정을 공유하세요.</p>
                            <p class="card-text " style="margin-top: -64px; margin-left: 800px; "><a href="share.do" style="color:whitesmoke; text-decoration: none;">이동하기</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <!--     후기게시판 컨텐츠 이동  -->
            <div class="row">
                <div class="col-xs-12" style="height:32px;">&nbsp;&nbsp;&nbsp;</div>
            </div>
            <div class="row">
                <div class="col-md-10">
                    <div class="card bg-dark text-white" style="border: ghostwhite 0.5px solid;">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoO8SWIR4rq_qHOOplxFU7R5tU3k42XdEqkw&usqp=CAU"
                            class="card-img" alt="..." style="width: auto; height: 360px;">
                        <div class="card-img-overlay">
                            <h5 class="card-title">여행 후기게시판</h5>
                            <p class="card-text">멋진 경험들과 여행의 즐거움을 다른사람들과 함께 나누세요.</p>
                            <p class="card-text " style="margin-top: -64px; margin-left: 800px; "><a href="reivew.do" style="color:whitesmoke; text-decoration: none;">이동하기</a></p>
                        </div>
                    </div>
                </div>
            </div>



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