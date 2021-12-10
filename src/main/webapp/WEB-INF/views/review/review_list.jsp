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
   <link href="/gooppl/resource/css/styles.css" rel="stylesheet" />
    <link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet" />
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
    <!-- Navigation@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.do">GooPPl</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="createMap.do">Plan</a></li>
                    <li class="nav-item"><a class="nav-link" href="community.do">Community</a></li>
                    <c:choose>
						<c:when test="${!empty sessionNickname}">
							<li class="nav-item dropdown dropend">
								  <c:if test="${sessionScope.sessionMemberType=='M' }">
								  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								    <label class="bg-primary text-center"
								    	style="
                                        width: 30px;
                                        border-radius: 50%;
                                        color: #fff;
                                        font-weight: 600;
                                        font-size: 1.2rem;">${profileNick}</label>
								  </a>
								  </c:if>
								  <c:if test="${sessionScope.sessionMemberType=='O' }">
									  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
									    <label class="bg-secondary text-center"
									    	style="
	                                        width: 30px;
	                                        border-radius: 50%;
	                                        color: #fff;
	                                        font-weight: 600;
	                                        font-size: 1.2rem;">${profileNick}</label>
									  </a>
								  </c:if>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item" href="mypage.do">myPage</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="logout.do">Logout</a></li>
							</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a id="login_bt" class="nav-link" href="#"
								role="button" data-bs-toggle="modal" data-bs-target="#loginmd">LogIn</a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 3rem;">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">

            <div class="row">
                <div class="col-md-4" style="height: 128px;">
                    <!-- 페이지 경로 -->
                    <div id="pagepath">
                        <span> <a href="community.do">커뮤니티</a>&gt;후기게시판
                        </span>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-4">
                    <!-- 	제목 -->
                    <div id="title">
                        <h5 class="display-6 fw-bolder text-center">Review</h5>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-2"></div>
            </div>

            <!-- 	 검색 및 게시글 작성하기 -->

           

            <!-- 게시글 슬라이더  -->
            <c:if test="${empty list }">
            	<div class="row">
            		
            	</div>
            </c:if>
            <div class="row justify-content-md-center mb-5">
                <div class="col-md-8">
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
                                <img src="https://www.50plus.or.kr/upload/im/2019/01/d3c19df5-37b2-4eab-9a97-51423b7cb419.jpg"
                                    class="d-block w-100" alt="..." style="width: auto; height:500px; border-radius:8px;">
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="https://blog.kakaocdn.net/dn/bQSqGM/btrklWSBhPM/4X8XC9gwOKlgfn92FaKJX1/img.jpg"
                                    class="d-block w-100" alt="..." style="width: auto; height: 500px;border-radius:8px;">
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="https://img.insight.co.kr/static/2019/03/13/700/heh5vq635thpwz0v58i3.jpg"
                                    class="d-block w-100" alt="..." style="width: auto; height: 500px;border-radius:8px;">
                                <div class="carousel-caption d-none d-md-block">
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
            </div>
    </section class="projects-section bg-light">
	<section>
            <!--     버튼 -->
		<div class="container-sm">
            <div class="container-sm" style="margin-top: 8px; margin-bottom: 32px; text-align: center;">
                <a class="mx-2" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
                    aria-controls="collapseExample">
                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                    <span class="ir_su">ALL list</span>
                </a>
            </div>
            
          <div class="collapse" id="collapseExample">
          <div id="search" class="row justify-content-md-center mb-5">
                <div class="col-md-6" style="float: right">
                    <div class="container-fluid">
                        <form class="d-flex" name="reivew_search" action="reviewFind.do">
                            <input class="form-control me-2" type="search" name="keywards" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>

                <div id="writereview" class="col-md-2 col-xs-2">
                    <button class="btn btn-outline-success btn-sm" style="float: right;" onclick="location.href='reviewWrite.do'">후기작성하기</button>
                </div>
            </div>
            <!--     전체 후기 목록  -->
            <c:if test="${empty list }">
            	 <div class="collapse" id="collapseExample">
            	 	등록된 게시글이 없습니다.
            	 </div>
            </c:if>
              <c:forEach var="dto" items="${list }">
               <div class="row justify-content-md-center">
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="http://www.outdoornews.co.kr/news/photo/201707/24502_76816_822.jpg"
                                        class="img-fluid rounded-start" alt="썸네일" style="width: 100%;">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-9">
                                             <c:url var="contentUrl" value="reviewContent.do">
											<c:param name="review_idx">${dto.review_idx}</c:param>
											</c:url>
                                           	<a href="${contentUrl }"><h5 class="card-title mb-5">${dto.subject }</h5></a>
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
                <div class="row justify-content-md-center text-center mb-5">
                	<div class="col-md-4">
                		<div class="col-md-8" style="margin:0px auto;">
                			${pageStr }
                		</div>
                	</div>
                </div>
            </div>
        </div>
	</section>

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