<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Grayscale - Start Bootstrap Theme</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/gooppl/resource/css/styles.css" rel="stylesheet" />
<link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- login js -->
<script type="text/javascript" src="/gooppl/resource/js/login.js"></script>
<!-- jquery -->
<script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <!-- join form -->
 <style>
        /* .help-block 을 일단 보이지 않게 설정 */
        #join .help-block{
            display: none;
        }
        /* glyphicon 을 일단 보이지 않게 설정 */
        #join .glyphicon{
            display: none;
        }
    </style>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="index.do">GooPPl</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#">Plan</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Community</a></li>

					<c:choose>
						<c:when test="${!empty sessionNickname}">
							<li class="nav-item dropdown dropend">
								  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								    <label class="bg-primary text-center"
								    	style="
                                        width: 30px;
                                        border-radius: 50%;
                                        color: #fff;
                                        font-weight: 600;
                                        font-size: 1.2rem;">${profileNick}</label>
								  </a>
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
	<!-- Masthead-->
	<header class="masthead">
		<div
			class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
			<div class="d-flex justify-content-center">
				<div class="text-center">
					<p class="lead text-white-50 mb-4">
						여행 일자, 숙소, 가고 싶은 장소를 선택하세요!<br>쉽고 빠른 여행 일정을 만들어보세요!
					</p>
					<h1 class="display-5 fw-bolder text-white mb-2">나의 여행 플래너</h1>
					<a class="btn btn-primary btn-lg" href="#about">일정만들기</a>
				</div>
			</div>
		</div>
	</header>
	<!-- Signup-->
	<section class="signup-section" id="signup">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5">
				<div class="col-md-10 col-lg-8 mx-auto text-center">
					<i class="fas fa-map-marked-alt fa-2x mb-2 text-black-50"></i>
					<h2 class="text-black-50 mb-5">어디로 갈까?</h2>
					<h6 class="text-black-50 mb-5">추천하는 여행지 카드를 선택하여 일정을 만들어보세요.</h6>
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form class="form-signup" id="contactForm"
						data-sb-form-api-token="API_TOKEN">
						<!-- Email address input-->
						<div class="row input-group-newsletter">
							<div class="col">
								<input class="form-control" id="area" type="text"
									placeholder="여행할 지역을 검색해주세요" />
							</div>
							<div class="col-auto">
								<input class="btn btn-primary" type="button" value="검색">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="container px-5 my-5">
			<div class="row row-cols-1 row-cols-md-4 g-4">
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/gooppl/resource/img/jeju.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">JEJU</h5>
								<p class="card-text">대한민국 제주도</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/gooppl/resource/img/daejeon.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">DAEJEON</h5>
								<p class="card-text">대한민국 대전</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/andong.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">ANDONG</h5>
								<p class="card-text">대한민국 안동</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/busan.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">BUSAN</h5>
								<p class="card-text">대한민국 부산</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/chuncheon.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">CHUNCHEON</h5>
								<p class="card-text">대한민국 춘천</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/gangneung.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">GANGNEUNG</h5>
								<p class="card-text">대한민국 강릉</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/gapyeong.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">GAPYEONG</h5>
								<p class="card-text">대한민국 가평</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/gunsan.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">GUNSAN</h5>
								<p class="card-text">대한민국 군산</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/incheon.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">INCHEON</h5>
								<p class="card-text">대한민국 인천</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/jecheon.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">JECHEON</h5>
								<p class="card-text">대한민국 제천</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/jeonju.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">JEONJU</h5>
								<p class="card-text">대한민국 전주</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/mokpo.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">MOKPO</h5>
								<p class="card-text">대한민국 목포</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/seoul.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">SEOUL</h5>
								<p class="card-text">대한민국 서울</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/suwon.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">SUWON</h5>
								<p class="card-text">대한민국 수원</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/ulleung.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">ULLEUNG</h5>
								<p class="card-text">대한민국 울릉도</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/yeongwol.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">YEONGWOL</h5>
								<p class="card-text">대한민국 영월</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/yeosu.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">YEOSU</h5>
								<p class="card-text">대한민국 여수</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/jeju.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">JEJU</h5>
								<p class="card-text">대한민국 제주도</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/busan.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">BUSAN</h5>
								<p class="card-text">대한민국 부산</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop"> <img
							src="/finalpj/resource/img/gapyeong.jpg" class="card-img-top"
							alt="...">
							<div class="card-body">
								<h5 class="card-title">GAPYEONG</h5>
								<p class="card-text">대한민국 가평</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact-->
	<section class="contact-section bg-primary align-items-center">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-md-center">
				<div class="col-md-3 mb-3 mb-md-0" style="padding: 0px 10px">
					<div class="card py-1 h-100">
						<div class="card-body text-center">
							<i class="fas fa-map-marked-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Address</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">은평구 동서로 101-2</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-3 mb-md-0" style="padding: 0px 10px">
					<div class="card py-1 h-100">
						<div class="card-body text-center">
							<i class="fas fa-envelope text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Email</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">
								<a href="#">hello@yourdomain.com</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-3 mb-md-0" style="padding: 0px 10px">
					<div class="card py-1 h-100">
						<div class="card-body text-center">
							<i class="fas fa-mobile-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">FAQ</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">
								<a href="#">문의하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="social d-flex justify-content-center">
				<a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a> <a
					class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a> <a
					class="mx-2" href="#!"><i class="fab fa-github"></i></a>
			</div>
		</div>
	</section>
	<!--추전지역 모달-->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body p-0 pt-0">
					<div class="card mb-1" style="max-width: 800px;">
						<div class="row g-0 ">
							<div class="col-md-4">
								<img src="/finalpj/resource/img/gangneung.jpg"
									class="img-fluid rounded-start" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">
										<strong>GANGNEUNG</strong>
									</h5>
									<h6 class="card-title">대한민국 강릉</h6>
									<p class="card-text" style="font-size: 13px;">은은한 커피향이 남다른
										강원도 강릉시. 그중에도 카페거리로 유명한 안목해변은 발이 닿는 어디든 향긋한 커피 한 잔에 지평선 끝까지
										펼쳐지는 바다 풍경은 덤으로 얻을 수 있다. 일출 명소로 유명한 정동진과 야경이 아름다운 경포대는 대표 여행
										코스! 구름도 머물다 간다는 해발 1,100m에 위치한 강릉 안반데기 마을은 전망대에 올라 드넓게 펼쳐진
										배추밭이 붉게 물드는 일출 전경이 일품이다..</p>
									<button type="button" class="btn btn-primary">일정만들기</button>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--모달 끝-->
	<!--로그인 모달-->
	<div class="modal fade" id="loginmd" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1" aria-labelledby="loginmdLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">LOG IN</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body p-1 pt-0">
					<div class="col-md-8 col-lg-8 mx-auto">
						<form name="login_fm" action="login.do" method="post"
							enctype="application/x-www-form-urlencoded">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">이메일
									주소</label> <input type="email" class="form-control" name="goo_id"
									aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">
									아직 구플 회원이 아니신가요? <a href="#" role="button"
										data-bs-toggle="modal" data-bs-target="#joinmd">회원가입</a>
								</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">비밀번호</label>
								<input type="password" class="form-control" name="pwd">
								<div id="emailHelp" class="form-text">
									<a href=#>비밀번호가 기억나지 않으신가요?</a>
								</div>
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" id="saveid"
									name="saveid"> <label class="form-check-label"
									for="exampleCheck1">ID기억하기</label>
							</div>
							<div class="d-grid gap-2">
								<input type="submit" class="btn btn-primary" value="로그인">
							</div>
						</form>
						<hr>
						<div class="mb-3 text-center">SNS 간편 로그인</div>
						<div class="mb-3 text-center">
							<!-- 아래와같이 아이디를 꼭 써준다. -->
							<div id="naver_id_login" style="text-align: center; margin-bottom:2px;">
								<a href="${naver_url}">
									<img width="90%" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
							</div>
							<div id="kakao_id_login" style="text-align: center">
							  <a href="${kakao_url}">
							  	<img width="90%" src="/gooppl/resource/img/kakaologo/kakao_login_large_narrow.png" />
							  </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <!-- join modal -->
	 <div class="modal fade" id="joinmd" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1" aria-labelledby="joinmdLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">SIGN UP</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body p-1 pt-0">
					<div class="col-md-9 col-lg-9 mx-auto">
						<form name="join" method="post" enctype="application/x-www-form-urlencoded" id="join" action="#">
							<div class="form-group has-feedback mb-2">
								<label class="form-label" style="color: #6c757d">이메일</label> <input
									type="text" class="form-control" name="goo_id" id="goo_id"
									placeholder="ex) gooppl@naver.com">
									<span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
            						<span class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback mb-2">
								<label class="form-label " style="color: #6c757d">닉네임</label> <input
									type="text" class="form-control" name="nickname" id="nickname" >
									
							</div>
							<div class="form-group has-feedback mb-2">
								<label class="form-label" style="color: #6c757d">비밀번호</label> <input
									type="password" class="form-control" name="pwd" id="pwd" 
									placeholder="영문,특수문자 혼합 12자 이상">
									      <span id="pwdRegErr" class="help-block">8글자 이상 입력하세요.</span>
            							  <span class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback mb-2">
								<label class="form-label" style="color: #6c757d">비밀번호 확인</label>
								<input type="password" class="form-control" name="pwdRe" id="pwdRe" >
								<span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
            					<span class="glyphicon glyphicon-ok form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback mb-1 form-check">
								<input type="checkbox" class="form-check-input" id="check1" >
								<label class="form-check-label" style="font-size: 0.7em;">개인정보수집에
									동의합니다</label> <a href="#"
									style="text-decoration: none; font-size: 0.7em;">보기</a>
							</div>
							<div class="form-group mb-2 form-check">
								<input type="checkbox" class="form-check-input" id="check2">
								<label class="form-check-label" style="font-size: 0.7em;">이용약관에
									동의합니다.</label> <a href="#"
									style="text-decoration: none; font-size: 0.7em;">보기</a>
							</div>
							<div class="form-group d-grid gap-2 mb-4" >
								<button class="btn btn-primary" type="button" id="joinBtn">가입하기</button>
								<button class="btn btn-dark" type="button">뒤로가기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--모달 끝-->
	<!-- Footer-->
	<footer class="footer bg-primary small text-center text-white-50">
		<div class="container px-4 px-lg-5">Copyright &copy; Your
			Website 2021</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<!-- sweetalert -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	
	<script src="/finalpj/resource/js/scripts.js"></script>
	<!-- Naver Login Js -->
	<!-- Kakao login -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
	 <script type="text/javascript">
		 //초기화 시키기. 
		 $(document).ready(function(){
			 Kakao.init('dc40fc11f37c1093d3da086af893f84f');
			 Kakao.isInitialized();
		 });
	 </script>
	 <script>
		window.onload=function(){
			var login_result = "<c:out value='${login_result}'/>";
		
			if(login_result=="yes"){
				Swal.fire({
					  position: 'center',
					  icon: 'success',
					  imageUrl: '/finalpj/resource/img/kakaologo/kakaohello.gif',
					  title:'LOGIN Success',
					  text:'환영합니다 ${sessionNickname}님!',
					  width: 500,
					  height:500,
					  showConfirmButton: false,
					  timer: 1500
					})
			      setTimeout(function(){location.href= "index.do"},1510);
			}else if(login_result=='no'){
				document.getElementById('login_bt').click();
				Swal.fire({
					  title: 'LOGIN Fail',
					  text: '아이디와 비밀번호를 확인해주세요.',
					  icon: 'warning',
					  confirmButtonText: '확인'
					})
			}else{
				
			}
		}
	 </script>
	<script type="text/javascript">
	$(function() {
		$('#joinBtn').click(function() {
			var goo_id = $('#goo_id');
			var nickname = $('#nickname');
			var pwd = $('#pwd');
			var pwdRe = $('#pwdRe');
			
			if(goo_id.val() == ''){
				Swal.fire('이메일을 입력해주세요.')
				goo_id.focus();
				return false;
			}
			if(nickname.val() == ''){
				Swal.fire('닉네임을 입력해주세요.')
				nickname.focus();
				return false;
			}
			if(pwd.val() == ''){
				Swal.fire('패스워드를 입력해주세요.')
				pwd.focus();
				return false;
			}
			if(pwdRe.val() == ''){
				Swal.fire('패스워드 확인을 입력해주세요.')
				pwdRe.focus();
				return false;
			}
			if(pwd.val() != pwdRe.val()){
				Swal.fire('패스워드를 확인해주세요.')
				pwdRe.focus();
				return false;
			}
			
		});
	});
</script>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>