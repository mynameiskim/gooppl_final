<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>GooPPl - Mypage</title>
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
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- jquery -->
	<script type="text/javascript"
	  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
    .faqHeader {
        font-size: 20px;
        margin: 10px;
    }
</style>
</head>
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
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 10rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
	  <div class="container">
        <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">FAQ</button>
        
        <!-- #####################################FAQ################################################## -->
        <div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-50" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
		  <div class="offcanvas-header bg-primary" style="border-bottom:1px solid lightgray;">
		    <h3 class="offcanvas-title text-center text-white-50" id="offcanvasScrollingLabel">자주하는질문 FAQ</h3>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <!-- ------------------------------------------------------------------------------ -->
		  <div class="offcanvas-body">
		    <div class="faqHeader">일정관련 FAQ</div>
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
				<div class="faqHeader">계정관련 FAQ</div>
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
</section>
<div class="custom-channel-io-button bg-primary" style="right:0;bottom:0;width:82px;height:67px;z-index:99999;position:fixed;cursor:pointer;"><label style="color:white;">문의하기</label></i></div>


</body>
</html>