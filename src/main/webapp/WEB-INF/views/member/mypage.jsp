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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- jquery -->
	<script type="text/javascript"
	  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<script>

</script>
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
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">
            <div class="row justify-content-md-center">
                <div class="col col-lg-2 mb-4">
                    <div style="display: flex;
                                justify-content: center;
                                align-items: center;
                                width: 50px;
                                height: 50px;
                                border-radius: 50%;
                                background-color: #717171;
                                color: #fff;
                                margin: 0px auto;
                                font-size:25px;
                                font-weight: 700;">${profileNick}
                    </div>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col col-lg-4 mb-4">
                    <h4 class="display-6 fw-bolder text-center">${sessionScope.sessionNickname}</h1>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col col-lg-3 text-center mb-5">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop" id="profile_modal_bt">
                        프로필수정
                    </button>
                    <c:if test="${sessionScope.sessionMemberType=='M'}">
                    	<button class="btn btn-primary" onclick="location.href='ckOwnerAppli.do?member_idx=${sessionScope.sessionMember_idx}'">광고주 신청</button>
                    	
                    </c:if>
                </div>
            </div>
			
            <div class="row justify-content-md-center">
                <div class="col-md-2 text-center">
                    <h5 class="fw-bolder mb-1 text-center">나의 일정</h5>
                    <h4 class="fw-bolder mb-3 text-center"><a href="#">${mapDTO.size()}</a></h4>
                </div>
                <div class="col-md-2 text-center">
                    <h5 class="fw-bolder mb-1 text-center">나의 후기</h5>
                    <h4 class="fw-bolder mb-3 text-center"><a href="#">3</a></h4>
                </div>
            </div>
        </div>
    </section> 
    <!--프로필 수정 모달-->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header bg-primary mb-4">
                    <h5 class="modal-title" id="staticBackdropLabel">프로필 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <br>
                <div class="modal-body p-2 pt-0">
                    <div class="row justify-content-md-center mb-2">
                        <div class="col text-center">
                            <div style="display: flex;
                                        justify-content: center;
                                        align-items: center;
                                        width: 80px;
                                        height: 80px;
                                        border-radius: 50%;
                                        background-color: #717171;
                                        color: #fff;
                                        margin: 0px auto;
                                        font-weight: 700;
                                        font-size: 2.0rem;
                                        
                                        "
                                        >${profileNick}
                                        
                            </div>
                            <br>
                        </div>
                    </div>
                    <div class="row justify-content-md-center">
                        <div class="col-md-10 text-center">
                            <h6 class="fw-bolder text-center" style="font-size: 18px;">${sessionScope.sessionNickname}
                                <a class="mx-2" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"><i class="fas fa-pen"></i></a>
                            </h6>
                        </div>
                    </div>
                    <div class="collapse" id="collapseExample">
                        <div class="row justify-content-md-center mb-3">
                            <div class="col-md-6 text-center">
                                <input type="text" class="form-control" placeholder="수정할 닉네임을 입력하세요" id="update_nickname">
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-md-center mb-3">
                        <div class="col-md-8 text-center mb-4">
                        	<c:choose>
                            	<c:when test="${sessionScope.sessionJoinType=='goo'}">
                          		  <p class="mb-2"><i class="fa fa-envelope mr-2"></i> ${sessionScope.sessionId}</p>
                          		  <p>
                          		  <a href="" role="button" data-bs-toggle="modal" data-bs-target="#pwdCheckModal" style="text-decoration: none;">비밀번호변경</a>
                          		  <a href="memberOut.do" style="text-decoration: none;">회원탈퇴</a></p>
								  	
                        		</c:when>
                        		<c:when test="${sessionScope.sessionJoinType=='naver'}">
                        			 <p class="mb-2"><img width="80%" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></p>
                        		</c:when>
                        		<c:otherwise>
                        			<p class="mb-2"><img width="80%" src="/gooppl/resource/img/kakaologo/kakao_login_large_narrow.png" /></p>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="update_profile_bt">수정하기</button>
                </div>
            </div>
        </div>
    </div>
    <!--프로필 수정 모달 끝-->
    <!-- 비밀번호 확인 모달 -->
    <div class="modal fade" id="pwdCheckModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary mb-4">
                    <h5 class="modal-title" id="staticBackdropLabel">비밀번호 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <br>
                <div class="modal-body p-2 pt-0">
                    <div class="row justify-content-md-center mb-2">
                        <div class="col-md-10 mb-2 text-center">
                            <h6 class="fw-bolder text-center" style="font-size:25px;">현재 비밀번호를 입력해주세요.</h6>
                        </div>
                    </div>
                    <div class="row justify-content-md-center">
                        <form class="needs-validation" id="pwd_check" name="pwd_check" action="#" 
						method="post" enctype="application/x-www-form-urlencoded" novalidate>
	                        <div class="row justify-content-md-center mb-2">
	                        	<div class="col-md-8 text-center mb-2">
		                        	<input type="password" class="form-control pwds" name="input_pwd_check" id="input_pwd_check" placeholder="비밀번호 입력" value="" required pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}">
							    </div>
	                        </div>
	                        <div class="row justify-content-md-center mb-5">
	                        	<div class="col-md-8 text-center">
							    	<button style="width: 100%" class="btn btn-primary" type="button" id="pwd_check_bt" value="n">확인</button>
							    </div>
	                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <!-- 비밀번호 확인 모달 끝 -->
    <!-- 비밀번호 변경 모달 -->
    
    
    
    <!-- 비밀번호 변경 모달 끝 -->
    <section>
        <!--일정 영역-->
        <c:if test="${sessionScope.sessionMemberType=='O'}">
        	<div class="container-sm mb-5" style="padding:3rem 0;">
        		<div class="row justify-content-md-center mb-4">
        			<div class="row mb-4">
        				<div class="col-md-2 text-center">
        					<h5 class="fw-bolder mb-2 text-center" id="my">나의 업장</h5>
        				</div>
        			</div>
        		</div>
	        	<div class="row justify-content-md-center">
	                <div class="card mb-3" style="max-width: 700px;">
	                    <div class="row align-items-center ">
	                        <div class="col-md-6">
	                            <img src="/gooppl/resource/img/혜수네.jpg" class="img-fluid rounded-start rounded-end" alt="...">
	                        </div>
	                        <div class="col-md-6">
	                            <div class="card-body">
	                                <h5 class="card-title fw-bolder" style="font-size:30px;">연신내 싸갈s 바갈s</h5>
	                                <p class="card-text mb-4">02-9999-9999</p>
	                                <p class="card-text mb-1">서울 은평구 통일로 885</p>
	                                <p class="card-text mb-3">혜수스타디움 2층</p>
	                                <button class="btn btn-info" type="button" onclick="location.href='ad_inquiry.do'">문의</button>
	                                <button class="btn btn-info" type="button">수정</button>
	                                <c:if test="${ad_inquiry_state=='광고승인'}">
	                                	<button class="btn btn-info" type="button" onclick="location.href='user_payment.do'">결제</button>
	                                </c:if>
	                                <hr>
	                                <p class="card-text">바른생각을 가진 사람들이 만드는 요리 신선한 재료와 성실한 조리로 요리를 대접합니다 가장 바른 돈까스 프랜차이즈 쑝쑝돈까스</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
        	</div>
        </c:if>
        <div class="container-sm mb-5" style="padding: 5rem 0;">
            <div class="row justify-content-md-center mb-5">
                <div class="row">
                    <div class="col-md-2 text-center">
                        <h4 class="fw-bolder mb-2 text-center">나의 일정</h4>
                    </div>
                </div>
            </div>
            <c:forEach var="mapdto" items="${mapDTO}" varStatus="status">
            <div class="row row-cols-1 row-cols-md-1 justify-content-md-center mb-4">
                <div class="card" style="max-width: 1024px; padding-left:0px;padding-right:0px;">
                    <div class="row align-items-center">
                        <div class="col-md-5">
                        	<img src="${firstImg[status.index(0)}" class="img-responsive rounded-start" alt="..." style="width:100%; height:100%;">
                        </div>
                        <div class="col-md-7">
                            <div class="card-body align-items-center"  style="font-size:18px;">
                               
                                <div class="col-md-12 fw-bolder mb-2">
                                        <div class="row">
	                                        <div class="col-md-3" style="color: cadetblue;">
	                                            여행명
	                                        </div>
	                                        <div class="col-md-9">
	                                            ${mapdto.map_title}
	                                        </div>
	                                    </div>    
                                </div>
                                <div class="col-md-12 fw-bolder mb-2">        
                                    <div class="row">
                                        <div class="col-md-3" style="color: cadetblue;">
                                            여행일자
                                        </div>
                                        <div class="col-md-9">
                                            ${mapdto.startdate } - ${mapdto.enddate}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 fw-bolder mb-2">
                                    <div class="row">
                                        <div class="col-md-3" style="color: cadetblue;">
                                            여행인원
                                        </div>
                                        <div class="col-md-9">
                                            ${mapdto.people_num }명
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 fw-bolder mb-2">
                                    <div class="row">
                                        <div class="col-md-3" style="color: cadetblue;">
                                            여행유형
                                        </div>
                                        <div class="col-md-9">
                                            <c:choose>
                                            	<c:when test="${mapdto.trip_type==1}">홀로여행</c:when>
                                            	<c:when test="${mapdto.trip_type==2}">우정여행${mapdto.map_idx}</c:when>
                                            	<c:when test="${mapdto.trip_type==3}">커플여행</c:when>
                                            	<c:when test="${mapdto.trip_type==4}">가족여행</c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 fw-bolder mb-4">
                                    <div class="row">
                                        <div class="col-md-3" style="color: cadetblue;">
                                            방문장소
                                        </div>
                                        <div class="col-md-9">
                                            ${totalPlaceCount[status.index]}곳
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 fw-bolder">    
                                    <div class="row justify-content-md-center mb-2">
                                        <div class="col-md-3 col-sm-3">
                                            <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;">공유</button>
                                        </div>
                                        <div class="col-md-3 col-sm-3">
                                            <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;" onclick='javascript:location.href="existMap.do?map_idx=${mapdto.map_idx}&day_num=1"'>수정</button>
                                        </div>
                                        <div class="col-md-3 col-sm-3">
                                            <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;">삭제</button>
                                        </div>
                                    </div>
                                </div>    
	                            </div>    
                            </div>
                        </div>
                        
                    </div>
                </div>
                
			</c:forEach>
            </div> <!-- 컨테이너 -->
            
        </div>
        <!--후기 영역 -->
        <div class="container-sm mb-5" style="padding: 5rem 0;">
            <div class="row justify-content-md-center mb-5">
                <div class="row">
                    <div class="col-md-2 text-center">
                        <h4 class="fw-bolder mb-2 text-center">나의 리뷰</h4>
                    </div>
                </div>
            </div>
           	<div class="row row-cols-1 row-cols-md-4 g-4 justify-content-md-center mb-4">
			  <div class="col">
			    <div class="card h-100">
			      <img src="/gooppl/resource/img/suwon.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			      <div class="card-footer">
					<button class="btn btn-primary" type="button">수정</button>
					<button class="btn btn-primary" type="button">삭제</button>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="/gooppl/resource/img/yeosu.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
			      </div>
			      <div class="card-footer">
			        <button class="btn btn-primary" type="button">수정</button>
					<button class="btn btn-primary" type="button">삭제</button>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="/gooppl/resource/img/chuncheon.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
			      </div>
			      <div class="card-footer">
			        <button class="btn btn-primary" type="button">수정</button>
					<button class="btn btn-primary" type="button">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
        </div>

    </section>
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
                            <div class="small text-black-50">
								<a href="#">hello@yourdomain.com</a>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
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
            </div>
        </div>
    </section>
    <script>
    $("#update_profile_bt").click(function(){
	       var nickname = $("#update_nickname").val();//수정할 닉네임
	       if(""==nickname){
	    	   
	       }else{
	       $.ajax({
	              type:"GET",
	              url:"profileUpdate.do",
	              data:{"nickname":nickname},
	              success:function(data){
	            	  if(data==1){
	            	  Swal.fire({
						  title: '프로필 수정완료',
						  icon: 'success',
						  timer: 1500,
						  allowOutsideClick:false
	            	  }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
	            	  setTimeout(function(){location.reload()},1510);
	            	  }else{
	            		  Swal.fire({
							  title: '프로필 수정실패',
							  icon: 'error',
							  confirmButtonText: '확인'
							})  
	            	  }
	              }        
	          });
	       }		       
	    });    
    
    </script>
    <!-- 비밀번호 체크 확인  -->
    <script>
    $('#pwd_check_bt').click(function(){
    	var input_pwd_check = $('#input_pwd_check').val();
    	if(input_pwd_check==""||input_pwd_check==null){
    		Swal.fire({
				  title: '비밀번호를 입력해주세요',
				  icon: 'warning',
				  confirmButtonText: '확인'
				})  
    	}else{
    		$.ajax({
	              type:"POST",
	              url:"pwdCheck.do",
	              data:{"input_pwd_check":input_pwd_check},
	              success:function(data){
	            	  if(data==1){
		            	  Swal.fire({
							  title: '확인되었습니다.',
							  icon: 'success',
							  allowOutsideClick:false
		            	  }).then((result) => {
						    	if (result.isConfirmed) {
						    		location.reload();
						    		window.open('newPwd.do?goo_id=${sessionScope.sessionId}','_blank');
						    	}
						    })
	            	  }else{
	            		  Swal.fire({
							  title: '비밀번호가 다릅니다.',
							  icon: 'warning',
							  confirmButtonText: '확인'
							})  
	            	  }
	              }        
	          });
	       }		    
    }); 
    </script>
    <!-- 비밀번호 체크 확인 끝 -->
    <footer class="footer bg-primary small text-center text-white-50" style="padding: 2.3rem 0;">
        <div class="container px-4 px-lg-5">Copyright &copy; Ezen Academy & Team3 2021</div>
    </footer>
    <%@include file="/WEB-INF/views/member/faq.jsp" %>
      <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <!-- sweetalert -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	
	<script src="/gooppl/resource/js/scripts.js"></script>
</body>

</html>