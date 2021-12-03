<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>여행 리뷰 게시판</title>
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


    #writereview a {
        float: right;
        text-decoration: none;
        padding-top: 24px;
        padding-right: 8px;
        color: #198754ab;
    }

    .carousel-inner {
        padding: 8;
    }

    .carousel-item {
        padding: 8px;
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
                <div class="col-md-4" style="height: 128px;">
                    <!-- 페이지 경로 -->
                    <div id="pagepath">
                        <span> <a href="comunity.do">커뮤니티</a>&gt;후기게시판
                        </span>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-4">
                    <!-- 	제목 -->
                    <div id="title">
                        <h5 class="display-6 fw-bolder text-center"> 여행 후기 게시판</h5>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-2"></div>
            </div>

            <!-- 	 검색 및 게시글 작성하기 -->

            <div id="search" class="row">
                <div class="col-md-1"></div>
                <div class="col-md-4" style="float: right">
                    <div class="container-fluid">
                        <form class="d-flex" name="reivew_search" action="#">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>


                <div id="writereview" class="col-md-6 col-xs-12">
                    <button class="btn btn-outline-success btn-sm" style="float: right;" onclick="location.href='reviewWrite.do'">후기작성하기</button>
                </div>
                <div class="col-md-1"></div>
            </div>

            <!-- 게시글 슬라이더  -->
            <c:if test="${empty list }">
            	<div class="row">
            		
            	</div>
            </c:if>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://www.50plus.or.kr/upload/im/2019/01/57a058c2-087d-4443-a8be-bb94253ebfa5.jpg"
                                    class="d-block w-100" alt="..." style="width: auto; height: 400px;">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>여행지 들어갈 자리</h5>
                                    <p>제목 들어갈 자리</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="data:image/jpeg;base64,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"
                                    class="d-block w-100" alt="..." style="width: auto; height: 400px;">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>여행지 들어갈 자리</h5>
                                    <p>제목 들어갈 자리</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="data:image/jpeg;base64,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"
                                    class="d-block w-100" alt="..." style="width: 960px; height: 400px;">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>여행지 들어갈 자리</h5>
                                    <p>제목 들어갈 자리</p>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>

            <!--     버튼 -->

            <div class="container" style="margin-top: 8px; margin-bottom: 32px; text-align: center;">
                <a class="mx-2" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
                    aria-controls="collapseExample">
                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                    <span class="ir_su">전체메뉴 보기</span>
                </a>
            </div>

            <!--     전체 후기 목록  -->
            <c:if test="${empty list }">
            	 <div class="collapse" id="collapseExample">
            	 	등록된 게시글이 없습니다.
            	 </div>
            </c:if>
            <div class="collapse" id="collapseExample">
                <c:forEach var="dto" items="${list }">
                <div class="row justify-content-md-center">
                    <div class="col-md-10">
                        <div class="card mb-3">
                            <div class="row g-0">
                                <div class="col-md-3">
                                    <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2020/01/09/99135906.5.jpg"
                                        class="img-fluid rounded-start" alt="썸네일" style="width: 205px; height: 128px">
                                </div>
                                <div class="col-md-9">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-9">
                                            <h5 class="card-title mb-5">${dto.subject }</h5>
                                            <p class="card-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 400px;">${dto.prologue }</p>
                                            </div>
                                            <div class="col-md-3">
                                                <p class="card-text">
                                                    <small class="text-muted" style="font-size: x-small;">${dto.nickname }</small>
                                                </p>
                                                <p class="card-text">
                                                    <small class="text-muted" style="font-size: x-small;">${dto.writedate }</small>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div >
                	${pageStr }
                </div>
            </div>






        </div>
    </section class="projects-section bg-light">


    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="resource/js/scripts.js"></script>
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