<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
    <link href="/gooppl/resource/css/styles.css" rel="stylesheet" />
    <link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet"/>
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
                    <li class="nav-item"><a class="nav-link" href="mypage.do">MyPage</a></li>
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
                       <span><a href="community.do">커뮤니티</a>&gt;&gt;<a href="share.do">일정 공유 게시판</a>&gt;&gt;${mdto.nickname }의 일정</span> 
                    </div>
                    <!-- 제목-->
                    <div id="title" class="col-md-4">
                        <label>${gmdto.map_title }</label>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <!-- 컨텐츠 영역-->
                <div class="row"></div>
                <div class="row" style="margin-top: 32px;">
               
                
                    <!-- #### 일정 카드 영역 #### -->
                    <div class="row ">
                                <!--여행 날짜(yyyy-mm-dd-(요일))-->
                                <div class="col-xs-9 mb-3" style="font-size: medium; ">
                                   <strong>여행 기간 : ${gmdto.startdate }~${gmdto.enddate }</strong>
                                </div>
                            </div>
                   <c:forEach var="dto" items="${drlist }"  varStatus="status">
                    <div class="col-md-9 col-sm-9">
                     <div class="row" style="border: whitesmoke solid 1px; border-top-left-radius: 10px; background-color: white;" >
                        <!--여행 일차-->
                        <div class="col-md-2 col-xs-3 fw-bold" style="background-color: #78C2AD; color: whitesmoke; border-top-left-radius: 10px; text-align: center; font-size: x-large;">
                            Day${dto.day_num }
                        </div>
                        <div class="col-md-10 col-xs-9" style=" border-bottom:#78C2AD solid 0.5px;">
                            
                            <div class="row">
                                <!--여행도시-->
                                <div class="col-xs-9 fw-bold">
                                   ${arealist[status.index].areaname } 
                                </div>
                            </div>
                        </div>
                        <!--일정 순번 -->
                        <div class="col-md-2">
                            <p style="text-align: center; font-size: xx-large; padding-top: 24px;">${dto.route_num }</p>
                        </div>
                        <div class="col-md-10">
                            <div class="row">
                                <!--카드 삽입-->
                                <div class="col-xs-9" >
                                    <div class="row" style="width: auto; " >
                                        <div class="row g-0" style="border-left: solid 0.5px rgb(230, 227, 227);">
                                          <div class="col-md-3 " >
                                            <img src="${pdlist[status.index].firstimage }" class="img-fluid " alt="..." style="padding: 8px;" >
                                          </div>
                                          <div class="col-md-7" style="padding-left: 8px;" >
                                            
                                              <h5 class="fw-bold" style="padding-top: 8px;">${pdlist[status.index].title }</h5>
                                              <p class="text">${pdlist[status.index].addr }</p>
                                              <p class="text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 360px;">
                                              <small class="text-muted">자세한내용은 "i"아이콘 클릭!</small></p>
                                            
                                          </div>
                                          <div id="info" class="col-md-1" >
                                          <c:url var="contentUrl" value="goPlaceDetail.do">
											<c:param name="contentid">${pdlist[status.index].contentid}</c:param>
											<c:param name="areacode">${pdlist[status.index].areacode }</c:param>
											<c:param name="sigungucode">${pdlist[status.index].sigungucode }</c:param>
											</c:url>
                              			 	<h5 class="card-title mb-5"><a href="${contentUrl }">
                              			 	<img src="https://img.icons8.com/fluency/24/000000/information.png"/></a></h5>
                                          </div>
                                          <div class="col-md-1 col-sm-12">&nbsp;</div>
                                        </div>
                                      </div>
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
                   </c:forEach> 
                               
                    
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
