<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/gooppl/resource/css/styles.css" rel="stylesheet" />
    <link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
    <style>
        #pagepath a {
            font-size: x-small;
            color: #198754fa;
            text-decoration: none;
        }

        #pagepath span {
            font-size: x-small;
        }

        #readnum span {
            font-size: x-small;
        }

        #title label {
            font-size: xx-large;
            font-weight: lighter;
            padding-left: 88px;
        }

        .replycon {
            margin-top: 24px;
        }
    </style>
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script>
    function deleteCon() {
    	
        if (confirm("게시글을 삭제하시겠습니까?")) {
            // 확인(예) 버튼 클릭 시 이벤트
            
    	//삭제할 게시글 번호가져오기
		//var review_idx=document.getElementById('reviewIdx');
          var review_idx=document.getElementById('review_idx').value;
		//컨트롤러로이동할 명령어 작성
		//alert(review_idx);
		location.href="reviewDelete.do?review_idx="+review_idx;
        }
	}
    </script>
    <script>
    function updateCon() {
		
	}
    </script>
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
							</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a id="login_bt" class="nav-link" href="#"
								role="button" onclick="placeLogin()">LogIn</a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 3rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">
        <form name="reviewContent" action="reviewUpdateForm.do?review_idx=${param.review_idx }"  method="post" enctype="multipart/form-data">
        <input type="hidden" id="review_idx" name="review_idx" value="${dto.review_idx }">
        <input type="hidden" name="subject" value='${dto.subject }' >
        <input type="hidden" name="prologue" value='${dto.prologue}' >
        <input type="hidden" name="content" value='${dto.content }' >
        <input type="hidden" name="epilogue" value='${dto.epilogue }'>
            <div class="row">
                <div class="col-md-4" style="height: 128px;">
                    <!-- 페이지 경로 -->
                    <div id="pagepath">
                        <span> <a href='community.do'>커뮤니티</a>
                            <a href='review.do'>&gt;후기게시판</a>
                            &gt;${dto.nickname}의 여행후기
                        </span>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-4">
                    <!-- 	제목 -->
                    <div id="title">
                        <h5 class="display-6 fw-bolder text-center" >${dto.subject }</h5>
                    </div>
                </div>
                <!--   작성자 조회수 게시글 번호-->
                <div class="col-md-2"></div>
                <div id="readnum" class="col-md-1">
                    <div class="row">
                        <div class="col-xs-12">
                            <span>
                                작성자 : ${dto.nickname }
                            </span>
                        </div>
                        <div class="col-xs-12">
                            <span>
                                조회수 : ${dto.readnum }
                            </span>
                        </div>
                        <div class="col-xs-12">
                        
                            <span id="reviewIdx">
                                게시글 번호 : ${dto.review_idx }
                            </span>
                        </div>
                    </div>
                </div>
            </div>

             <!--##### 본문 경계선 #####-->
             
            <div class="container" style="margin-top: 64px;">

                <!--    여행 인트로?-->
                <div class="row justify-content-md-center mb-5">
                    <h6 class="fw-bolder text-center  mb-3">
                        " intro ~ "
                    </h6>
                    <p class="fw-bold text-center">
                        ${dto.prologue }
                    </p>
                </div>


                <div class="row justify-content-md-center text-center">
                    <!--    본문내용-->
                    ${dto.content }
                </div>
                <!--    에필로그-->
                <div class="row mb-3">
                    <h6 class="fw-bolder text-center mb-3 " style="font-size: 18px;">
                        " outro .. " 
                    </h6>
                    <p class="fw-bold text-center">
                    	${dto.epilogue }
                    </p>
                </div>
	                
	                <!--#### 수정 삭제 버튼 ####-->
	                <c:choose>
	                <c:when test="${sessionMember_idx==dto.member_idx }">
	            <div class="d-grid gap-2 d-md-flex justify-content-md-center mb-4">
	                <input type="button" value="삭제하기" class="btn btn-secondary" onclick="deleteCon();"></input>
	                <button type="submit" class="btn btn-light" >수정하기</button>
	            </div>
	            	</c:when>
	            	<c:when test="${sessionMember_idx!=dto.member_idx }">
	            	</c:when>
	            	</c:choose>
	            	<!--#### 수정 삭제 버튼 ####-->
	            
	            
            </div>
            </form>  
                <!--##### 본문 경계선 #####-->

            <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  댓글 영역-->

		<!-- Comments Form -->
		<div>
		<h2>Comments</h2>
		<hr>
		</div>
		<div id="reply">
		</div>
		<div class="card my-4">
			<h5 class="card-header">Leave a Comment:</h5>
			<div class="card-body">
				<form name="comment-form" action="replyWrite.do" method="post" autocomplete="off">
					<div class="form-group">
						<input type="hidden" name="review_idx" value="${param.review_idx}" />
						<input type="hidden" name="result" value="${param.result}" />
						<input type="hidden" name="nick" value="${sessionNickname}" />
						<textarea name="content" class="form-control" rows="3"></textarea>
					</div>
					<div style="height: 5px;"></div>
					<div style="text-align: right;">
						<button id="replyWrite" class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
    </section>
    <script>
    $(function() {
    	   $(document).ready(function(){
    		   var result = $('input[name=result]').val();
    		   if(result=='fail'){
    			   alert('로그인 후 이용가능합니다.');
    			   getRelplyList();
    		   }else{
    		   	getRelplyList();
    		   }
    	     });
    	});
    
    function getRelplyList(){
    	var review_idx = $('input[name=review_idx]').val();
    	var nick = $('input[name=nick]').val();
    	$.ajax({
    		type: 'GET',
    		url: 'getRelplyList.do',
    		data: {review_idx},
    		success: function(result){
    			console.log(result);
    			for(var i=0; i<result.length; i++){
    				if(result[i].nickname==nick){
    	 				var str = "<div class=\"reply\" style=\"float: left;\">"
            				str += result[i].content+"</div></hr>"
            				str += "<div style=\"text-align: right;\"><label class=\"replyDel\" id=\""+result[i].ridx+"\" style=\"cursor: pointer;\">❌</label></div>"
            				str += "<div style=\"text-align: right; font-size: 10px;\">"+result[i].nickname+"</div>"
            				$("#reply").append(str);
    				}else{
        				var str = "<div class=\"reply\" style=\"float: left;\">"
            				str += result[i].content+"</div></hr>"
            				str += "<div style=\"text-align: right;\"><label onclick=\"#\">-</label></div>"
            				str += "<div style=\"text-align: right; font-size: 10px;\">"+result[i].nickname+"</div>"
            				$("#reply").append(str);
    				}
    			}
    		},
    		error: function(result){
    		},
    		complete: function(){
    		}
    	})
    }
    
    $(function() {
    	   $(document).on("click",".replyDel",function(){
    	        var ridx = $(this).attr('id');
    	     	$.ajax({
    	    		type: 'GET',
    	    		url: 'delRelply.do',
    	    		data: {ridx},
    	    		success: function(result){
    	    			console.log(result);
    	    			},
    	    		error: function(result){
    	    		},
    	    		complete: function(){
    	    			location.reload();
    	    		}
    	    	})
    	     });
    	});
    
    $(function() {
 	   $(document).on("click","#replyWrite",function(){
 	        
 	     	$.ajax({
 	    		type: 'GET',
 	    		url: 'replyWrite.do',
 	    		success: function(result){
 	    			console.log(result);
 	    			},
 	    		error: function(result){
 	    		},
 	    		complete: function(){
 	    			location.reload();
 	    		}
 	    	})
 	     });
 	});
    </script>
    
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