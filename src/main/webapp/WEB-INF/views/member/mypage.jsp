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
<style>
.tb_hover{
       --bs-table-hover-bg: lightgray !important;
}
.tr_bg{
       --bs-table-accent-bg: #78c2ad !important;
}
.tr_aling{
	vertical-align: middle;
}
</style>
<script>
//이미 신청한 광고주
function ckOwerAppli(member_idx){
		$.ajax({
			type: "GET",
			url: 'ckOwnerAppli.do?member_idx='+member_idx,
			dataType: "json",
			error: function(result){
				
			},
			success: function(result){
				if(result.code==0){
					Swal.fire(
						'관리자 승인 대기 중입니다.',
						'관리자 승인이 날 때까지 기다려주세요',
						'info'
					);
				return;
			}else{
				location.href='adInfo.do';
			}
		}
	});
}

//
</script>
<body>
   	<%@include file="/WEB-INF/views/member/header.jsp" %>
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 10rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">
            <div class="row justify-content-md-center">
                <div class="col col-lg-2 mb-4">
                <c:if test="${sessionScope.sessionMemberType=='O' }">
                 <div style="display: flex;
                                justify-content: center;
                                align-items: center;
                                width: 50px;
                                height: 50px;
                                border-radius: 50%;
                                background-color: #f3969a;
                                color: #fff;
                                margin: 0px auto;
                                font-size:25px;
                                font-weight: 700;">${profileNick}
                    </div>
                </c:if>
                <c:if test="${sessionScope.sessionMemberType=='M' }">
                    <div style="display: flex;
                                justify-content: center;
                                align-items: center;
                                width: 50px;
                                height: 50px;
                                border-radius: 50%;
                                background-color: #66a593;
                                color: #fff;
                                margin: 0px auto;
                                font-size:25px;
                                font-weight: 700;">${profileNick}
                    </div>
                </c:if>
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
                    	<button class="btn btn-secondary" onclick="ckOwerAppli(${sessionScope.sessionMember_idx})">광고주 신청</button>
                    	
                    </c:if>
                </div>
            </div>
			
            <div class="row justify-content-md-center">
            	
                <div class="col-md-2 text-center">
                    <h5 class="fw-bolder mb-3 text-center">나의 일정</h5>
                    <h4 class="fw-bolder mb-3 text-center"><button onclick="showMyPlan()" class="btn btn-primary btn-lg" style="font-size:30px;" id="showMyPlan_bt">${mapDTO.size()}</button></h4>
                </div>
                <script>
                function showMyPlan(index){
                	$('#myPlanArea').css("display","");
                	$('#myReviewArea').css("display","none");
                	$('#myStoreArea').css("display","none");
					document.getElementById("myPlanArea").scrollIntoView();
					$('#myInquiryArea').css("display","none");
                }
                </script>
                
                <div class="col-md-2 text-center">
                    <h5 class="fw-bolder mb-3 text-center">나의 후기</h5>
                    <h4 class="fw-bolder mb-3 text-center"><button  class="btn btn-primary btn-lg" onclick="showMyReview()" style="font-size:30px;" id="showMyReview_bt">${reviewDTO.size()}</button></h4>
                </div>
                
                <script>
                function showMyReview(){
                	$('#myPlanArea').css("display","none");
                	$('#myReviewArea').css("display","");
                	$('#myStoreArea').css("display","none");
                	document.getElementById("myReviewArea").scrollIntoView();
                	$('#myInquiryArea').css("display","none");
                }
                </script>
                
                <div class="col-md-2 text-center">
                    <h5 class="fw-bolder mb-3 text-center">나의 문의</h5>
                    <h4 class="fw-bolder mb-3 text-center"><button  class="btn btn-primary btn-lg" onclick="showMyInquiry()" style="font-size:30px;" id="showMyInquiry_bt">${list.size()}</button></h4>
                </div>
                
                <script>
                function showMyInquiry(){
                	$('#myInquiryArea').css("display","");
                	$('#myPlanArea').css("display","none");
                	$('#myReviewArea').css("display","none");
                	$('#myStoreArea').css("display","none");
                	document.getElementById("myInquiryArea").scrollIntoView();
                }
                </script>
                
                <c:if test="${sessionScope.sessionMemberType=='O'}">
                	<div class="col-md-2 text-center">
                    <h5 class="fw-bolder mb-3 text-center">나의 업장</h5>
                    <h4 class="fw-bolder mb-3 text-center"><button  class="btn btn-primary btn-lg" onclick="showMyStore()" style="font-size:30px;">1</button></h4>
                </div>
                <script>
                function showMyStore(){
                	$('#myStoreArea').css("display","");
                	document.getElementById("myStoreArea").scrollIntoView();
                	$('#myPlanArea').css("display","none");
                	$('#myReviewArea').css("display","none");
                	$('#myInquiryArea').css("display","none");
                }
                </script>
                </c:if>
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
        <!--업장 영역-->
        <c:if test="${sessionScope.sessionMemberType=='O'}">
        	<div class="container-sm mb-5" style="padding:3rem 0; display:none" id="myStoreArea">
        		<div class="row justify-content-md-center mb-4">
        			<div class="row mb-4">
        				<div class="col-md-2 text-center">
        					<h5 class="fw-bolder mb-2 text-center">나의 업장</h5>
        				</div>
        			</div>
        		</div>
	        	<div class="row justify-content-md-center">
	                <div class="card mb-3" style="max-width: 1024px;">
	                    <div class="row align-items-center ">
	                        <div class="col-md-6">
	                            <img src="${odto.firstimg}" class="img-fluid rounded-start rounded-end" alt="...">
	                        </div>
	                        <div class="col-md-6">
	                            <div class="card-body">
	                                <h5 class="card-title fw-bolder" style="font-size:40px;">${odto.title}</h5>
	                                <h6 class="card-text mb-4" style="font-size:20px;">${odto.business_tel}</h6>
	                                <p class="card-text mb-1">${odto.addr}</p>
	                                <p class="card-text mb-5">${odto.detailed_addr}</p>
	                                <button class="btn btn-info btn-lg" type="button" onclick="location.href='ad_inquiry.do'">문의</button>
	                                <button class="btn btn-info btn-lg" type="button" onclick="location.href='go_updateOwnerInfo.do'">수정</button>
	                                <c:if test="${ad_inquiry_state=='광고승인'}">
	                                	<button class="btn btn-info btn-lg" type="button" onclick="location.href='user_payment.do'">결제</button>
	                                </c:if>
	                                <hr class="mb-3">
	                                <p class="card-text fw-bolder" >${odto.ad_content}</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
        	</div>
        </c:if>
        <!-- 일정영역 -->
        <div class="container-sm mb-5" style="padding: 5rem 0; display:none;" id="myPlanArea">
            <div class="row justify-content-md-center mb-5">
                <div class="row">
                    <div class="col-md-2 text-center">
                        <h4 class="fw-bolder mb-2 text-center" id="myPlanList">나의 일정</h4>
                    </div>
                </div>
            </div>
            <c:if test="${empty mapDTO}">
            	<div class="row justify-content-md-center mb-5">
            		<div class="col-md-6">
            		  <div class="img-wrapper" style="position: relative; text-align:center; margin:0px auto;">
            			<a href="createMap.do"><img class="rounded img-responsive" alt="..." src ="/gooppl/resource/img/마이페이지일정만들기.png"></a>
					  </div>    
            		</div>
            	</div>
            </c:if>
            <c:forEach var="mapdto" items="${mapDTO}" varStatus="status">
            <div class="row row-cols-1 row-cols-md-1 justify-content-md-center mb-4" id="planList${status.index}">
                <div class="card" style="max-width: 1024px; padding-left:0px;padding-right:0px;">
                    <div class="row align-items-center">
                        <div class="col-md-5">
                        	<img src="${firstImg[status.index]}" class="img-responsive rounded-start" alt="..." style="width:100%; height:100%;">
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
                                            	<c:when test="${mapdto.trip_type==2}">우정여행$</c:when>
                                            	<c:when test="${mapdto.trip_type==3}">커플여행</c:when>
                                            	<c:when test="${mapdto.trip_type==4}">가족여행</c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 fw-bolder mb-3">
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
                                            	<button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;" onclick="javascript:location.href='shareContent.do?map_idx=${mapdto.map_idx}&member_idx=${mapdto.member_idx}'">보기</button>
                                        	</div>
	                                        <div class="col-md-3 col-sm-3">
	                                            <c:if test="${mapdto.share_ok=='n'}">
	                                            	<button id="planShare_bt${status.index}" type="button" class="btn btn-primary btn-sm planShare_bt" style="padding: 0.5rem 2.5em;" onclick="planShare(${mapdto.map_idx},${status.index});">공유</button>
	                                            	<button id="planShare_cbt${status.index}" type="button" class="btn btn-primary btn-sm planShare_cbt" style="padding: 0.5rem 2.5em; display:none;" onclick="planShareCancel(${mapdto.map_idx},${status.index});">취소</button>
	                                            </c:if>
	                                            <c:if test="${mapdto.share_ok=='y' }">
													<button id="planShare_bt${status.index}" type="button" class="btn btn-primary btn-sm planShare_bt" style="padding: 0.5rem 2.5em; display:none;" onclick="planShare(${mapdto.map_idx},${status.index});">공유</button>
	                                            	<button id="planShare_cbt${status.index}" type="button" class="btn btn-primary btn-sm planShare_cbt" style="padding: 0.5rem 2.5em;" onclick="planShareCancel(${mapdto.map_idx},${status.index});">취소</button>	
	                                            </c:if>
	                                        </div>
                                        <script>
                                        	function planShare(map_idx,index){
	                                       		$.ajax({
	                                 	              type:"GET",
	                                 	              url:"planShare.do",
	                                 	              data:{"map_idx":map_idx},
	                                 	              success:function(data){
	                                 	            	  if(data==1){
	                                 		            	  Swal.fire({
	                                 							  title: '공유되었습니다!',
	                                 							  icon: 'success',
	                                 							  allowOutsideClick:false
	                                 		            	  }).then((result) => {
	                                 						    	if (result.isConfirmed) {
	                                 						    		$('#planShare_bt'+index).css("display","none");
	                                 						    		$('#planShare_cbt'+index).css("display","");
	                                 						    	}
	                                 						    })
	                                 	            	  }else{
	                                 	            		  Swal.fire({
	                                 							  title: '공유실패!',
	                                 							  icon: 'warning',
	                                 							  confirmButtonText: '확인'
	                                 							})  
	                                 	            	  }
	                                 	              }        
	                                 	          });
	                   						    	
	                                     	}	
	                                     	
	                                     	function planShareCancel(map_idx,index){
	                                       		$.ajax({
	                                 	              type:"GET",
	                                 	              url:"planShareCancel.do",
	                                 	              data:{"map_idx":map_idx},
	                                 	              success:function(data){
	                                 	            	  if(data==1){
	                                 		            	  Swal.fire({
	                                 							  title: '공유취소되었습니다!',
	                                 							  icon: 'success',
	                                 							  allowOutsideClick:false
	                                 		            	  }).then((result) => {
	                                 						    	if (result.isConfirmed) {
	                                 						    		$('#planShare_bt'+index).css("display","");
	                                 						    		$('#planShare_cbt'+index).css("display","none");
	                                 						    	}
	                                 						    })
	                                 	            	  }else{
	                                 	            		  Swal.fire({
	                                 							  title: '공유취소실패!',
	                                 							  icon: 'warning',
	                                 							  confirmButtonText: '확인'
	                                 							})  
	                                 	            	  }
	                                 	              }        
	                                 	          });
	                   						    	
	                                     	}	
                                        	
                                        </script>
                                        <div class="col-md-3 col-sm-3">
                                            <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;" onclick='javascript:location.href="existMap.do?map_idx=${mapdto.map_idx}&day_num=1"'>수정</button>
                                        </div>
                                        <div class="col-md-3 col-sm-3">
                                            <button id="planDelete_bt${status.index}" type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 2.5em;" onclick="planDelete(${mapdto.map_idx},${status.index})">삭제</button>
                                        </div>
                                        <script>
                                        	function planDelete(map_idx,index){
                                        		Swal.fire({
                                        			title: '정말로 삭제하시겠습니까?',
                                        			text: "삭제된 일정은 복구가 불가능합니다.",
                                        			icon: 'warning',
                                        			showCancelButton: true,
                                        			confirmButtonColor: '#d33',
                                        			cancelButtonColor: '#000000',
                                        			confirmButtonText: '삭제',
                                        			cancelButtonText: '취소',
                                        			showLoaderOnConfirm: true,
                                        			allowOutsideClick:false
                                        		}).then((result) => {
                      						    	if (result.isConfirmed) {
		                                        		$.ajax({
		                                  	              type:"GET",
		                                  	              url:"planDelete.do",
		                                  	              data:{"map_idx":map_idx},
		                                  	              success:function(data){
		                                  	            	  if(data==1){
		                                  		            	  Swal.fire({
		                                  							  title: '삭제되었습니다!.',
		                                  							  icon: 'success',
		                                  							  allowOutsideClick:false
		                                  		            	  }).then((result) => {
		                                  						    	if (result.isConfirmed) {
		                                  						    		sessionStorage.setItem("planDel",1);
		                                  						    		location.reload();
		                                  						    	}
		                                  						    })
		                                  	            	  }else{
		                                  	            		  Swal.fire({
		                                  							  title: '삭제 실패!',
		                                  							  icon: 'warning',
		                                  							  confirmButtonText: '확인'
		                                  							})  
		                                  	            	  }
		                                  	              }        
		                                  	          });
                      						    	}
                                        		});	
                                        	}
                                        </script>
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
        <div class="container-sm mb-5" style="padding: 5rem 0; display:none; " id="myReviewArea">
            <div class="row justify-content-md-center mb-5">
                <div class="row">
                    <div class="col-md-2 text-center">
                        <h4 class="fw-bolder mb-2 text-center" id="myReviewList">나의 리뷰</h4>
                    </div>
                </div>
            </div>
            <c:if test="${empty reviewDTO}">
            	<div class="row justify-content-md-center mb-5">
            		<div class="col-md-6">
            		  <div class="img-wrapper" style="position: relative; text-align:center; margin:0px auto;">
            			<a href="reviewWrite.do"><img class="rounded img-responsive" alt="..." src ="/gooppl/resource/img/마이페이지리뷰쓰기.png"></a>
					  </div>    
            		</div>
            	</div>
            </c:if>
            <div class="row justify-content-md-center">
            <div class="col-md-10">
	           	<div class="row row-cols-1 row-cols-md-2 g-4 mb-4">
				  <c:forEach var="reviewdto" items="${reviewDTO}" varStatus="status">
					  <div class="col">
						  <div class="card h-100" style="max-width: 500px;">
						      <div class="card-body">
						        <h5 class="card-title mb-2">
						        	<label class="bg-warning text-center" style=" width: 40px;color: #fff;font-weight: 600;font-size: 1.2rem;">${status.index+1}</label>
						        </h5>
						        <p class="card-text">
						        	&quot;${reviewdto.subject}&quot;
						        </p>
						      </div>
						      <div class="card-footer">
						       <p class="fs-5 fw-bold">
						       <label class="text-muted">${reviewdto.writedate }</label>
						       <img src="/gooppl/resource/img/search.png" style="width:25px;height:25px;margin:0px 5px;border-radius:5px;">${reviewdto.readnum}
						       <img src="/gooppl/resource/img/댓글아이콘.png" style="width:25px;height:25px;margin:0px 5px;border-radius:5px;">${rp_count[status.index]}
						       </p>
								<button class="btn btn-primary" type="button" onclick="javascript:location.href='reviewContent.do?review_idx=${reviewdto.review_idx}'">보기</button>
								<button class="btn btn-primary" type="button" onclick="javascript:location.href='reviewUpdateForm.do?review_idx=${reviewdto.review_idx}'">수정</button>
								<button class="btn btn-primary" id="reviewDelete${status.index}" type="button" onclick="reviewDelete(${reviewdto.review_idx});">삭제</button>
						      </div>
							   </div>
					  </div>
				  </c:forEach>
				</div>
			</div>
			</div>
        </div>
        <script>
          	function reviewDelete(review_idx){
          		Swal.fire({
          			title: '정말로 삭제하시겠습니까?',
          			text: "삭제된 리뷰는 복구가 불가능합니다.",
          			icon: 'warning',
          			showCancelButton: true,
          			confirmButtonColor: '#d33',
          			cancelButtonColor: '#000000',
          			confirmButtonText: '삭제',
          			cancelButtonText: '취소',
          			showLoaderOnConfirm: true,
          			allowOutsideClick:false
          		}).then((result) => {
				  	if (result.isConfirmed) {
	            		$.ajax({
	      	              type:"POST",
	      	              url:"reviewDel.do",
	      	              data:{"review_idx":review_idx},
	      	              success:function(data){
	      	            	  if(data==1){
	      		            	  Swal.fire({
	      							  title: '삭제되었습니다!.',
	      							  icon: 'success',
	      							  allowOutsideClick:false
	      		            	  }).then((result) => {
	      						    	if (result.isConfirmed) {
	      						    		sessionStorage.setItem("reviewDel",1);
	      						    		location.reload();
	      						    	}
	      						    })
	      	            	  }else{
	      	            		  Swal.fire({
	      							  title: '삭제 실패!',
	      							  icon: 'warning',
	      							  confirmButtonText: '확인'
	      							})  
	      	            	  }
	      	              }        
	      	          });
				  	}
          		});	
          	}
          </script>
        <!-- 후기 영역 끝 -->
        <!-- 문의 영역 시작 -->
        	<div class="container-sm mb-5" style="padding: 5rem 0; display:none;" id="myInquiryArea">
            <div class="row justify-content-md-center mb-5">
                <div class="row">
                    <div class="col-md-2 text-center">
                        <h4 class="fw-bolder mb-2 text-center" id="myReviewList">나의 문의</h4>
                    </div>
                </div>
            </div>
            <div class="row justify-content-md-center">
            	<table class="table table-hover tb_hover">
			  <thead>
					<tr class="tr_bg">
						<th class="text-center active text-white text-opacity-75" style="width:2%;">#</th>
						<th class="text-center active text-white text-opacity-75" style="width:20%;">작성일</th>
						<th class="text-center active text-white text-opacity-75" style="width:50%;">문의제목</th>
						<th class="text-center active text-white text-opacity-75" style="width:20%;">답변현황</th>
					</tr>
			</thead>
			  <tbody>
			  	<c:if test="${empty list}">
			  		<tr>
					<td colspan="10" align="center">
					<b>문의한 내역이 없습니다.</b>
					</td>
				</tr>
			  	</c:if>
			  	<c:forEach var="list" items="${list}" varStatus="status">
			  		<c:if test="${list.inquiry_status=='y'}">
			  		<tr class="tr_aling" id="iq_list${status.index}" onclick="showAnswer(${status.index})">
			  		</c:if>
			  		<c:if test="${list.inquiry_status=='n'}">
			  		<tr class="tr_aling" id="iq_list${status.index}" onclick="showContent(${status.index})">
			  		</c:if>
				      <td class="text-center list${status.index}" style="width:2%;">${list.inquiry_idx}</td>
				      <td class="text-center list${status.index}" style="width:20%;">${list.inquiry_writedate}</td>
				      <!--<td class="text-center" style="width:4%;">${(cp-1)*listSize+status.index+1}<input id="member_idx${status.index}" type="hidden" value="${list.member_idx}"></td> -->
				      <td class="text-center list${status.index}" style="width:50%;">${list.inquiry_subject}</td>
					      <c:if test="${list.inquiry_status=='y'}">
	    				    <td class="text-center list${status.index}" style="width:20%;color:green;"><label>답변완료</label></td>
					      </c:if>
					      <c:if test="${list.inquiry_status=='n'}">
					      	<td class="text-center list${status.index}" style="width:20%;color:red;">답변대기</td>
					      </c:if>
			       </tr>
			       <tr class="tr_aling" id="content${status.index}" style="display:none">
			       	 <td class="contentArea${status.index}"></td>
				     <td colspan="1"class="text-end contentArea${status.index}" style="font-weight:600; font-size:15px;">문의내용:</td>
					 <td colspan="1" class="text-start contentArea${status.index}" style="font-weight:600; font-size:15px;">${list.inquiry_content}</td>
					 <td class="text-center contentArea${status.index}"><button style="display:none;" class="btn btn-secondary" id="contentClosebt${status.index}" onclick="closeContentbt(${status.index})">닫기</button></td>
				   </tr>
			       <tr class="tr_aling" id="answerArea${status.index}" style="display:none">
			       	 <td class="answerArea${status.index}"></td>
			         <td class="text-end answerArea${status.index}"><img src="/gooppl/resource/img/re화살표.png" style="width:40px; height:40px"></td>
			    	 <td class="text-start answerArea${status.index}" colspan="1" style="font-weight:600; font-size:15px;">${list.inquiry_answer}</td>
			    	 <td class="text-center answerArea${status.index}"><button class="btn btn-secondary" id="closebt${status.index}" onclick="closeAnswer(${status.index})">닫기</button></td>
				   </tr>
			  	</c:forEach>
			  </tbody>
			</table>
			</div>
        </div>
        <!-- 문의 영역 끝 -->
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
							  title: '로그인이 필요합니다..',
							  icon: 'warning',
							  confirmButtonText: '확인',
							  allowOutsideClick:false
							}).then((result) => {
						    	if (result.isConfirmed) {
						    		location.href="lndex.do?login_result=need";
						    	}
						    }) 
	            	  }
	              }        
	          });
	       }		    
    }); 
    </script>
    <script>
    window.onload=function(){
    	var planDel = sessionStorage.getItem("planDel");	
    	if(planDel==1){
    		$('#showMyPlan_bt').click();
    		sessionStorage.setItem("planDel",0)
    	}
    	var reviewDel = sessionStorage.getItem("reviewDel");
    	if(reviewDel==1){
    		$('#showMyReview_bt').click();
    		sessionStorage.setItem("reviewDel",0)
    	}
    }
    </script>
    <script>
   		function showAnswer(index){
   			$('#content'+index).css("display","");
   			$('#answerArea'+index).css("display","");
   			$('.answerArea'+index).css("border-bottom","3px solid #56cc9d")
   			$('#iq_list'+index).css("font-size","20px");
   			$('#iq_list'+index).css("font-weight","800");
   		}
   		function closeAnswer(index){
   			$('#content'+index).css("display","none");
   			$('#answerArea'+index).css("display","none");
   			$('#iq_list'+index).css("font-size","");
   			$('#iq_list'+index).css("font-weight","");
   		}
   		function showContent(index){
   			$('#content'+index).css("display","");
   			$('#contentClosebt'+index).css("display","");
   			$('.contentArea'+index).css("border-bottom","3px solid #ffce67")
   			$('#iq_list'+index).css("font-size","20px");
   			$('#iq_list'+index).css("font-weight","800");
   		}
   		function closeContentbt(index){
   			$('#content'+index).css("display","none");
   			$('#iq_list'+index).css("font-size","");
   			$('#iq_list'+index).css("font-weight","");
   		}
   	</script>
    <%@include file="/WEB-INF/views/member/faq.jsp" %>
	<%@include file="/WEB-INF/views/member/footer.jsp" %>
      <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
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