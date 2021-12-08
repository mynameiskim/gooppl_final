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
<!-- jquery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- XHM -->
<script type="text/javascript" src="/gooppl/resource/js/httpRequest.js"></script>
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
					<li class="nav-item"><a class="nav-link" href="createMap.do">Plan</a></li>
					<li class="nav-item"><a class="nav-link" href="comunity.do">Community</a></li>

					<c:choose>
						<c:when test="${!empty sessionNickname}">
							<li class="nav-item dropdown dropend"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-bs-toggle="dropdown"
								aria-expanded="false"> <label class="bg-primary text-center"
									style="width: 30px; border-radius: 50%; color: #fff; font-weight: 600; font-size: 1.2rem;">${profileNick}</label>
							</a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<li><a class="dropdown-item" href="mypage.do">myPage</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="logout.do">Logout</a></li>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a id="login_bt" class="nav-link"
								href="#" role="button" data-bs-toggle="modal"
								data-bs-target="#loginmd">LogIn</a></li>
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
					<a class="btn btn-primary btn-lg" id="createMap" href="createMap.do">일정만들기</a>
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
					<h5 class="text-black-50 mb-5">추천하는 여행지 카드를 선택하여 일정을 만들어보세요.</h6>
					</div>
				</div>
			</div>
		</div>
		<div class="container px-5 my-5">
			<div class="row row-cols-1 row-cols-md-4 g-4">
			<!-- 추천카드 jstl -->
			<c:forEach var="list" items="${dto}" varStatus="status">
				<div class="col">
					<div class="card h-100 cardDiv" id="card-a-div">
						<a class="card-a" href="#" role="button" data-bs-toggle="modal"
							data-bs-target="#card${list.start_area_idx}"> <img src="${list.start_area_img }" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${list.en_name}</h5>
								<p class="card-text">${list.kr_name}</p>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
			<!-- 추천카드 jstl -->
			</div>
		</div>
	</section>
		<!--추전지역 모달-->
	<c:forEach var="list" items="${dto}" varStatus="status">
		<div class="modal fade" id="card${list.start_area_idx}" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body p-0 pt-0">
						<div class="card mb-1" style="max-width: 1200px;">
							<div class="row g-0 ">
								<div class="col-md-4">
									<img src="${list.start_area_img }"
										class="img-fluid rounded-start" alt="..." style="width:100%; height:100%">
								</div>
								<div class="col-md-8">
									<div class="card-body" style="padding:50px 50px 10px 50px;">
										<h6 class="card-title display-7">
											<strong>${list.en_name}</strong>
										</h5>
										<h6 class="card-title">${list.kr_name}</h6>
										<p class="card-text" style="font-size: 18px;">${list.area_description }</p>
										<br>
										<button type="button" class="btn btn-primary btn-lg">일정만들기</button>
										<button type="button" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!--추천 지역 모달 끝-->
	<!-- Contact-->
	<section class="contact-section bg-light align-items-center">
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
								<a href="#" roll="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">문의하기</a>
							</div>
						</div>
					</div>
				</div>
	<!-- #####################################FAQ################################################## -->
        <div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-50" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel" style="padding-right: 0px;padding-left:0px;">
		  <div class="offcanvas-header bg-primary" style="border-bottom:1px solid lightgray;">
		    <h3 class="offcanvas-title text-center text-white-50" id="offcanvasScrollingLabel">자주하는질문 FAQ</h3>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <!-- ------------------------------------------------------------------------------ -->
		  <div class="offcanvas-body">
		    <div class="faqHeader" style="font-size: 20px; margin: 10px;">일정관련 FAQ</div>
		    	<div class="accordion accordion-flush" id="accordionPanelsStayOpenExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingOne1">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse1" aria-expanded="false" aria-controls="panelsStayOpen-collapse1">
				        - 일정 만들기란 무엇인가요?	 
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse1" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne1" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>'일정 만들기'란</strong> 나만의 여행 일정을 계획하는 기능으로, 내가 가고 싶은 명소들의 위치를 지도에서 보며 동선을 계획할 수 있습니다. 드래그 & 드롭하여 방문 순서를 정렬하면 자동으로 경로가 보여집니다. 방문 일자별로 명소들을 정렬하여 나만의 여행 일정을 손쉽게 만들 수 있습니다.</code>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingTwo2">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse2" aria-expanded="false" aria-controls="panelsStayOpen-collapse2">
				        - 완성된 일정을 수정할 수 있나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse2" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo2" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>내 일정은 언제든지 다시 수정할 수 있습니다.</strong>마이페이지의 '나의일정'에서 '수정'을 클릭하여 일정을 수정해 보세요.	 
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree3">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse3" aria-expanded="false" aria-controls="panelsStayOpen-collapse3">
				        - 일정 공유란 무엇인가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse3" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree3" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>나만의 일정을 공유할수 있습니다.</strong>나의 일정을 공유하거나 다른 회원님들의 일정을 공유받음으로써 여행자들의 일정을 보고 마음에 드는 명소를 확인하여 나만의 일정을 만들어보세요
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree4">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse4" aria-expanded="false" aria-controls="#panelsStayOpen-collapse4">
				        - 여러 도시를 한 일정에 넣을 수 있나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse4" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree4" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>가능합니다.</strong>우선 일정 만들기를 시작해 보세요. 지도에서 일정을 만드는 과정에서 다른 도시의 명소목록을 불러와 선택하여 장소들을 일정에 넣을 수 있습니다. 여러 도시의 방문 일정을 순서대로 계획하시면 됩니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree5">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse5" aria-expanded="false" aria-controls="#panelsStayOpen-collapse5">
				        - 여행지 검색 목록이란 무엇인가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse5" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree5" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>여행지 검색이란,</strong>여행지에서 명소/음식점/호텔등을 검색하여 리스트에서 선택한 장소들을 일정에 추가할수 있는 기능입니다. 
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item mb-5">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree6">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse6" aria-expanded="false" aria-controls="panelsStayOpen-collapse6">
				        - 추천 여행지는 무엇인가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse6" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree6" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>추천 여행지는</strong>국내에서 관광명소가 많고 관광객들의 발길이 끊이지 않는 여행지들을 카드화 시켜놓아서 회원님들이 여행지역을 선정할시에 도움을 드릴수 있습니다. 
				      </div>
				    </div>
				  </div>
				  
				</div>
				<div class="faqHeader" style="font-size: 20px; margin: 10px;">계정관련 FAQ</div>
		    	<div class="accordion accordion-flush" id="accordionPanelsStayOpenExample1">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingOne7">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse7" aria-expanded="false" aria-controls="panelsStayOpen-collapse7">
				        - 소셜 로그인이 되지 않습니다.	 
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse7" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne7" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        먼저 귀하의 브라우저가 각 소셜 페이지에 다른 사람의 아이디로 로그인 되어있는 지 확인해 보시기 바랍니다. 소셜 페이지에서 로그아웃을 한 후에 다시 시도해 주세요. 그래도 로그인이 되지 않으면 소셜페이지에서 아이디와 비밀번호를 확인해 보시기 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingTwo8">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse8" aria-expanded="false" aria-controls="panelsStayOpen-collapse8">
				        - 비밀번호를 잊어버렸습니다. 
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse8" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo8" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        로그인 화면에서 '비밀번호 찾기'를 클릭하고 가입시 기입한 이메일 주소를 적어주세요. 해당 이메일로 비밀번호 변경이 가능하도록 도와드립니다.	 
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree9">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse9" aria-expanded="false" aria-controls="panelsStayOpen-collapse9">
				        - GooPPl 회원을 탈퇴하고 싶어요.
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse9" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree9" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        로그인 후, 마이페이지 '설정'에서 프로필 수정 하단에 '회원탈퇴' 버튼이 있습니다. 구플 계정을 삭제하고 탈퇴를 원하시면 이 버튼을 클릭하면 됩니다. 탈퇴 시에는 귀하의 정보와 게시글,일정 등 모든 내용이 삭제됩니다. 신중히 고려하시기 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree10">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse10" aria-expanded="false" aria-controls="panelsStayOpen-collapse10">
				        - 회원 정보를 어떻게 수정하나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse10" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree10" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        마이페이지 '프로필수정'에서 회원 정보를 수정하실 수 있습니다. '프로필수정'에서는 닉네임, 비밀번호 변경, 및 회원탈퇴를 하실 수 있습니다. 이메일 주소의 변경을 원하실 경우에는 관리자에게 문의해 주시기 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree11">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse11" aria-expanded="false" aria-controls="panelsStayOpen-collapse11">
				        - 나의 개인정보가 안전한가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse11" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree11" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        GooPPl의 <a href="#" target="_blank">'개인정보 취급방침'</a> 내용을 확인하시기 바랍니다.
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		  </div>
		 <!-- #####################################################끝################################################# -->
			</div>
		</div>
	</section>
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
									 <a href="#" role="button"
										data-bs-toggle="modal" data-bs-target="#idCheckModal">비밀번호가 기억나지 않으신가요?</a>
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
							<div id="naver_id_login"
								style="text-align: center; margin-bottom: 2px;">
								<a href="${naver_url}"> <img width="90%"
									src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
							</div>
							<div id="kakao_id_login" style="text-align: center">
								<a href="${kakao_url}"> <img width="90%"
									src="/gooppl/resource/img/kakaologo/kakao_login_large_narrow.png" />
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 모달 끝 -->
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
					<div class="input-form col-md-9 col-lg-9 mx-auto">
						<form class="needs-validation" id="joinForm" name="joinForm" action="join.do" 
						method="post" enctype="application/x-www-form-urlencoded" novalidate >
						<!-- 멤버 타입 히든 -->
						<input type="hidden" name="member_type" value="M">
						<!--  -->
							<div class="row form-group has-feedback">
								<div class="col-md-12 mb-3">
									<label for="email">이메일</label> 
									<div class="input-group mb-1">
									  <input type="text" name="goo_id" id="goo_id" class="form-control" placeholder="goo@gmail.com" aria-label="goo@gmail.com" aria-describedby="idCheck" required>
									  <button class="btn btn-outline-primary" type="button" id="idCheck">ID 체크</button>
									</div>
								</div>
								<div class="col-md-10 mb-3 form-group has-feedback"  id="token_div" style="display:none;">
									 <div class="input-group mb-3">
									  <input type="text" id="mail_token"class="form-control" placeholder="인증번호를 입력하세요." aria-label="인증번호를 입력하세요" aria-describedby="Token_button" required readonly>
									  <button class="btn btn-outline-secondary" type="button" id="token_button" value="n">인증번호 발급</button>
									  <button class="btn btn-outline-secondary" type="button" id="token_check" value="n" style="display:none">인증하기</button>
									  <button class="btn btn-success" type="button" id="token_ok" value="n" style="display:none" disabled>인증완료</button>
									  <input type="hidden" id="made_token">
									  <label style="color:red; display:none;">인증번호가 올바르지 않습니다.</label>
									</div>
								</div>
							</div>
							<div class="mb-3 form-group has-feedback">
									<label for="nickname">닉네임</label>
									 <input type="text" class="form-control" name="nickname" id="nickname" placeholder="" value="" required>
							</div>
							<div class="mb-3 form-group has-feedback">
									<label for="pwd">비밀번호</label>
									 <input type="password" class="form-control pwds" name="pwd" id="pwd" placeholder="" value="" required pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}">
									<div class="valid-feedback">사용가능</div>
       								<div class="invalid-feedback">하나 이상의 숫자,문자,특수문자를 포함하여 8자 이상입력하셔야 합니다.</div>
							</div>
							<div class="mb-3 form-group has-feedback">
									<label for="pwdRe">비밀번호 확인</label> 
									<input type="password" class="form-control pwds" id="pwdRe" placeholder="" value="" required pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}">
									<div id="cPwdValid" class="valid-feedback">사용가능</div>
       								<div id="cPwdInvalid" class="valid-feedback">하나 이상의 숫자,문자,특수문자를 포함하여 8자 이상입력하셔야 합니다.</div>
       							
							</div>
							<hr class="mb-4 form-group has-feedback">
							<div class="form-check mb-3">
								<input type="checkbox" class="form-check-input" id="aggrement1" required> 
								<label class="form-check-label" for="aggrement1">개인정보 수집 및 이용에 동의합니다.</label>
								<a href="#" style="text-decoration: none; font-size: 0.7em;">보기</a>
							</div>
							<div class="form-check mb-3 mb-3">
								<input type="checkbox" class="form-check-input" id="aggrement2" required> 
								<label class="form-check-label" for="aggrement2">이용약관에 동의합니다.</label>
								<a href="#" style="text-decoration: none; font-size: 0.7em;">보기</a>
							</div>
							<div class="d-grid gap-2 mb-4">
							<button class="btn btn-primary btn-lg btn-block" type="submit" id="joinbt" disabled="true">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--조인 모달 끝-->
	<!-- 비밀번호 찾기 모달 시작 ---------------------------------------------------------------------------------------->
	<div class="modal fade" id="idCheckModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
					<h5 class="modal-title">비밀번호 찾기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
                <br>
                <div class="modal-body p-2 pt-0">
                    <div class="row justify-content-md-center mb-3">
                        <div class="col-md-10 mb-2">
                            <label for="email">이메일</label> 
							<div class="input-group mb-1">
							  <input type="text" name="goo_id_pwdfind" id="goo_id_pwdfind" class="form-control" placeholder="goo@gmail.com" aria-label="goo@gmail.com" aria-describedby="idCheck" required>
							</div>
                        </div>
                        <div class="col-md-10 mb-2">
                            <h6 style="font-size:14px;">회원가입시 등록하셨던 이메일 주소를 입력해주세요</h6> 
                        </div>
                    </div>
                    <div class="row justify-content-md-center mb-5">
                      <div class="col-md-10 text-center">
				    	<button style="width: 100%" class="btn btn-primary" type="button" id="pwdfind_bt" value="n">메일받기</button>
				      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!--  비밀번호 찾기 모달 끝------------------------------------------------------------------------------------------- -->
	<!-- Footer-->
	<footer class="footer bg-light small text-center">
		<div class="container px-4 px-lg-5">Copyright &copy; Ezen&Team1 2021</div>
	</footer>
	<!-- 이메일 인증 관련 -->

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<!-- sweetalert -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

	<script src="/gooppl/resource/js/scripts.js"></script>
	<!-- Naver Login Js -->
	<!-- Kakao login -->
	<script type="text/javascript"
		src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
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
			var join_result = "<c:out value='${join_result}'/>"
			console.log(join_result);
			
			if(join_result!=''){
					Swal.fire({
						  position: 'center',
						  icon: 'success',
						  imageUrl: '/gooppl/resource/img/welcome2.gif',
						  title:'Gooppl 회원가입 성공',
						  width: 500,
						  height:500,
						  showConfirmButton: false,
						  backdrop: `
							    rgba(0,0,0,0.7)
							  `,
						  timer: 2000
						})
					setTimeout(function(){location.href= "index.do"},2010);
			}
			if(login_result=="yes"){
					Swal.fire({
						  position: 'center',
						  icon: 'success',
						  imageUrl: '/gooppl/resource/img/kakaologo/kakaohello.gif',
						  title:'환영합니다 ${sessionNickname}님!',
						  width: 500,
						  height:500,
						  showConfirmButton: false,
						  backdrop: `
							    rgba(0,0,0,0.7)
							  `,
						  timer: 2000
						})
						setTimeout(function(){location.href= "index.do"},2010);
					
			}else if(login_result=='no'){
				document.getElementById('login_bt').click();
				Swal.fire({
					  title: 'LOGIN Fail',
					  text: '아이디와 비밀번호를 확인해주세요.',
					  icon: 'warning',
					  confirmButtonText: '확인'
					})
			}
			
			var open_login  = '${open_login}';
			if(open_login==1){
				document.getElementById('login_bt').click();
				Swal.fire({
					  title: 'WRONG ACCESS',
					  text: '로그인 후 이용가능한 서비스입니다.',
					  icon: 'warning',
					  confirmButtonText: '확인'
					})
			}
		}
	 </script>
	 <script>
	 	/*인증번호 체크*/
	 	$('#token_check').click(function(){
	 		var input_token=$('#mail_token').val();
	 		var made_token=$('#made_token').val();	
	 		if(input_token==made_token){
	 			Swal.fire('인증되었습니다.');
	 			$('#joinbt').removeAttr("disabled");
	 			$('#mail_token').attr('readonly','readonly');
	 			$('#token_check').css('display','none')
	 			$('#token_ok').css('display','')
	 		}else{
	 			Swal.fire({
					  title: '인증 실패',
					  text: '인증번호를 확인해주세요!',
					  icon: 'warning',
					  confirmButtonText: '확인'
					})
	 		}
	 	
	 	});
	 	
	    /* 인증번호 이메일 전송 */
	    $("#token_button").click(function(){
	       var email = $("#goo_id").val();        // 입력한 이메일
	       
	       $.ajax({
	              
	              type:"GET",
	              url:"mailCheck.do",
	              data:{"email":email},
	              success:function(data){
	              	$('#made_token').val(data);
	              }        
	          });
	       Swal.fire({
				  title: '입력하신 Email로 인증번호를 전송하였습니다.',
				  icon: 'success',
				  confirmButtonText: '확인'
				})
	       $('#goo_id').attr('readonly','readonly');
	       $('#token_button').css('display','none');
	       $('#token_check').css('display','');
	       $('#mail_token').removeAttr('readonly');
	       
	       
	    });
	    
	    /* 회원가입 아이디체크 */
		 $("#idCheck").click(function(){
			 var email = $("#goo_id").val();        // 입력한 이메일
			 var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			 if(email==''){
		    	   Swal.fire('이메일을 입력해주세요');
	    	 }else if(!reg.test(email)){
	    		 Swal.fire('이메일 형식을 확인해주세요.<br>ex)gooppl@naver.com');
			 }else{
				 $.ajax({
			            method:"GET",
			            url:"idCheck.do",
			            data:{"email":email},
			            success:function(data){
			                if(data==0){//사용 가능한 아이디 라면 
			                	 Swal.fire({
									  title: '사용가능한 Email입니다.',
									  icon: 'success',
									  confirmButtonText: '확인'
									});
			                	 $('#token_div').css('display','');
			                	
			                    
			                }else{//사용 가능한 아이디가 아니라면 
			                	 Swal.fire({
									  title: '사용중인 Email입니다.',
									  icon: 'warning',
									  confirmButtonText: '확인'
									});
			                	 $('#token_div').css('display','none');
			                	$('#mail_token_pwdfind_label').css('display','none');
			                }
			            }
			     });
		       } 
		 });
    </script>
    <!-- 비밀번호 찾기 스크립트===================================================-->
    <script>
    /*비밀번호 찾기*/
    $("#pwdfind_bt").click(function(){
    	var email = $("#goo_id_pwdfind").val();
    	var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		 if(email==''){
	    	   Swal.fire('이메일을 입력해주세요');
	   	 }else if(!reg.test(email)){
	   		 Swal.fire('이메일 형식을 확인해주세요.<br>ex)gooppl@naver.com');
		 }else{
			 $.ajax({
		            method:"GET",
		            url:"pwdFind.do",
		            data:{"email":email},
		            success:function(data){
		                if(data==1){//사용 가능한 아이디 라면 
		                	 Swal.fire({
								  title: '메일을 확인해주세요.',
								  icon: 'success',
								  confirmButtonText: '확인',
								  allowOutsideClick:false
								}).then((result) => {
							    	if (result.isConfirmed) {
							    		location.reload();
							    	}
							    })
		                    
		                }else{
		                	 Swal.fire({
								  title: '회원가입이 안된<br>이메일입니다.',
								  icon: 'warning',
								  confirmButtonText: '확인'
								});
		                }
		            }
		     });
	       } 
    	
    });
    
    
    
    </script>
	<script>
    window.addEventListener('load', () => {
      $('#joinbt').attr('disabled','disabled');
      const forms = document.getElementsByClassName('needs-validation');
      var pwd_s = document.getElementById('pwd');
      var pwdRe_s = document.getElementById('pwdRe');
      
      var pwdRe=$('#pwdRe').val();
      var pwd=$("#pwd").val();
      //validity로 입력폼 관리
    //validity로 입력폼 관리
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          
          }
          
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
	
  </script>
  <script>
  
   $('#pwd, #pwdRe').on('keyup', function () {
	      if ($('#pwd').val() != '' && $('#pwdRe').val() != '' && $('#pwd').val() == $('#pwdRe').val()) {
	        $("#joinbt").attr("disabled",false);
	        $('#cPwdValid').show();
	        $('#cPwdInvalid').hide();
	        $('#cPwdValid').html('사용가능').css('color', 'green');
	        $('.pwds').removeClass('is-invalid')
	      } else {
	        $("#joinbt").attr("disabled",true);
	        $('#cPwdValid').hide();
	        $('#cPwdInvalid').show();
	        $('#cPwdInvalid').html('일치하지 않음').css('color', 'red');
	        $('.pwds').addClass('is-invalid')
	      }
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