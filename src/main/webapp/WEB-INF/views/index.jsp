﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resource/meta/meta.jsp" %>
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
<style>
a#MOVE_TOP_BTN {
		position: fixed;
		right: 10%;
		bottom: 10%;
		z-index: 999;
		background-color: white;
		opacity: .8;
		width: 50px;
		height: 50px;
		padding:10px 6px;
		border-radius: 50%;
		border: none;
		color: gray;
		font-size:18px;
		font-weight:800;
		text-decoration: none;
}
a#MOVE_TOP_BTN:hover{
		background-color:#f3969a;
		color:white;
}
</style>
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
					<li class="nav-item"><a class="nav-link" href="placeList.do">Place</a></li>
					<li class="nav-item"><a class="nav-link" href="community.do">Community</a></li>

					<c:choose>
						<c:when test="${!empty sessionNickname}">
							<li class="nav-item dropdown dropend">
							<a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"> 
								<c:if test="${sessionScope.sessionMemberType=='M'}">
								<label class="bg-primary text-center" style="width: 30px; border-radius: 50%; color: #fff; font-weight: 600; font-size: 1.2rem;">${profileNick}</label>
								</c:if>
								<c:if test="${sessionScope.sessionMemberType=='O'}">
								<label class="bg-secondary text-center" style="width: 30px; border-radius: 50%; color: #fff; font-weight: 600; font-size: 1.2rem;">${profileNick}</label>
								</c:if>	
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
            <div class="overlay" style=" position: absolute;
                                      top: 0;
                                      left: 0;
                                      height: 100%;
                                      width: 100%;
                                      background:linear-gradient(to bottom, rgb(132 170 199 / 0%) 0%, rgb(109 212 117 / 0%) 75%, #fff 100%);
                                      z-index: 2;">
              </div>
              <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop" style="position: absolute;
                                         top: 50%;
                                         left: 50%;
                                         min-width: 100%;
                                         min-height: 100%;
                                         width: auto;
                                         height: auto;
                                         z-index: 1;
                                         -ms-transform: translateX(-50%) translateY(-50%);
                                         -moz-transform: translateX(-50%) translateY(-50%);
                                         -webkit-transform: translateX(-50%) translateY(-50%);
                                         transform: translateX(-50%) translateY(-50%);">
                 <source src="/gooppl/resource/img/MainMovie.mp4" type="video/mp4">
                 <strong>Your browser does not support the video tag.</strong>
               </video>
            <div class="text-center" style="position: absolute; top: 42%; width: 100%; z-index:3 ">
               <h6 class="display-5 fw-bolder text-white mb-2" style="text-align: center; font-size: 48px; color: #ffffff;">나의 여행 플래너</h6>
               <h6 class="display-6 fw-bolder text-white mb-4" style="text-align: center; font-size: 20px; color: #ffffff;">Good Place&nbsp;&nbsp;Good Plan</h6>
               <a class="btn btn-primary btn-lg" id="creatMap" href="createMap.do" onclick="javascript:location.href='createMap.do'">일정만들기</a>
            </div>
         </div>
      </div>
   </header>
	<!-- Signup-->
	<a href="#" id="MOVE_TOP_BTN">TOP</a>
	<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 300) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 100);
            return false;
        });
    });
	</script>
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
					<div class="card h-100 cardDiv" id="card-a-div" style="box-shadow:1px 4px 1px 2px #78c2ad;">
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
										<button type="button" class="btn btn-primary btn-lg" onclick="javascript: location.href='createMap.do?areacode=${list.areacode }&sigungucode=0'">일정만들기</button>
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
								<a href="conditions.do" target="_blank" style="text-decoration: none; font-size: 0.7em;" onclick="openPopUp1();">보기</a>
								
							</div>
							<div class="form-check mb-3 mb-3">
								<input type="checkbox" class="form-check-input" id="aggrement2" required> 
								<label class="form-check-label" for="aggrement2">이용약관에 동의합니다.</label>
								<a href="conditions2.do" target="_blank" style="text-decoration: none; font-size: 0.7em;">보기</a>
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
	<%@include file="/WEB-INF/views/member/faq.jsp" %>
	<%@include file="/WEB-INF/views/member/footer.jsp" %>
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
			}else if(login_result=='need'){
				document.getElementById('login_bt').click();
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
	 		}else if(input_token != made_token){
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
	        $('#cPwdValid').show();
	        $('#cPwdInvalid').hide();
	        $('#cPwdValid').html('사용가능').css('color', 'green');
	        $('.pwds').removeClass('is-invalid')
	        if($('#mail_token').val()==null || $('#mail_token').val()=="" ){
	        	$("#joinbt").attr("disabled",true);
	        }else{
	        	$("#joinbt").attr("disabled",false);
	        }
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