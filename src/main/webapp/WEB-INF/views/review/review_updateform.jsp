<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>review write form</title>
    
<!--     썸머노트 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!--     썸머노트 -->
    
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
    <script type="text/javascript" src="resource/js/jquery-3.6.0.min.js"></script>
    <script>
    	var jb = jQuery.noConflict();
    </script>
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

        img {
            border-top-left-radius: 10px;
            margin-bottom: 8px;
        }

       .column{
           text-align: center;
       }
       .column div{
           margin: 8px;
       }

        
    </style>
    <script>
    //새로고침 방지
        var checkUnload = true;
        
        $(window).on('beforeunload',function(){
            if(checkUnload)return "변경사항이 저장되지 않습니다.";            
        });
        //submit 시에만 발생 x
        $(document).on("submit", "form", function(event){
            checkUnload = false;
        });
    </script>
    
</head >
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
    <section class="signup-section" id="signup"
        style="padding-top: 6rem; background: white">
       <div class="container-sm mb-5">
            <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
			<form id="review_form" class="form-inline" name="updatereview" action="reviewUpdate.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="member_idx" value="${sessionScope.sessionMember_idx }">
            <input type="hidden" name="nickname" value="${sessionScope.sessionNickname}">
            <input type="hidden" name="review_idx" value="${param.review_idx}">
        
            <div class="row">
                <div class="col-md-4" style="height: 128px;">
                    <!-- 페이지 경로 -->
                    <div id="pagepath">
                        <span> <a href="community.do">커뮤니티</a>&gt;<a href="review.do">후기게시판</a>&gt;후기작성하기</span>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-4">
                    <!-- 	제목 -->
                    <div id="title">
                        <h5 class="display-6 fw-bolder text-center ">
                        	Review 수정
                        </h5>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-2"></div>
            </div>
          
         <div class="container-sm">
    		 <!--########################## 작성폼 ####################### -->
             <div class="row justify-content-md-center">
               <div class="col-md-8">
		           		 <!--프롤로그 입력-->
			             <div class="row mb-2">
			                 <div class="col-xs-12">
		                   		 <input class="form-control" type="text" id="subject" name="subject" value="${dto.subject }" placeholder="제목을 입력해주세요.">
			                 </div>
			                  
			                 <div class="col-xs-12">
			                 </div>
			                 <div class="col-xs-12">
		                         <textarea class="form-control" id="exampleFormControlTextarea1"  placeholder="간단한 소개글을 적어주세요~" rows="3" name="prologue">${dto.prologue }</textarea>
			                 </div>
			                  
				         </div>    
		                 <!-- 이미지 업로드 양식 -->
			             <div class="row img_container">
			                 <div class="col-xs-12 ">
			                   <textarea class="form-control" id="summernote" name="content" rows="20" cols="100">
			                   ${dto.content }</textarea> 
			                   <!-- textarea 밑에 script 작성하기 -->
								<!-- #### 섬머노트 세팅 #### -->

									
								<script>
								$(document).ready(function() {
									$('#summernote').summernote({
										  height: 588,                 // 에디터 높이
										  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
										  lang: "ko-KR",					// 한글 설정
										  placeholder: '내용',
								          disableResizeEditor: true,	// 크기 조절 기능 삭제
								          toolbar: [
								            ['fontname', ['fontname']],
								            ['fontsize', ['fontsize']],
								            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
								            ['color', ['forecolor','color']],
								            ['table', ['table']],
								            ['para', ['ul', 'ol', 'paragraph']],
								            ['height', ['height']],
								            ['insert',['picture','link','video']],
								            ['view', ['fullscreen', 'help']]
								          ],
								        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
								        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
								        callback:{
								        	onImageUpload: function(files, editor, welEditable) {
								        		for(var i = files.length -1; i>=0; i--) {
								        			uploadSummernoteImageFile(files[i], this);
								        		}
								        	}
								        }
								        
									});
								});
									
/**
* 이미지 파일 업로드
*/
				
function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
								</script>
							 </div>
					     </div>
		            	  <!--에필로그--> 
		                  <div class="row">
		                      <div class="col-xs-12 ">
		                          <div class="mb-3">
		                              <textarea class="form-control" id="exampleFormControlTextarea2" rows="3" name="epilogue"
		                                  placeholder="작성 후기 또는 느낀점">${dto.epilogue }</textarea>
		                          </div>
		                      </div>
		                  </div>
		                  
		                 
		                  <div class="row">
		                      <div class="col-xs-12 " style="text-align: center;">
		                          <button type="submit" id="writebutton" class="btn btn-success "
		                              style="font-size: medium; margin-top:32px;">작성하기</button>
		                          <button type="reset" class="btn btn-light "
		                              style="font-size: medium; margin-top:32px;">다시쓰기</button>
		                      </div>
		                  </div>
		                  
		                  
	             	</div>
	         	</div>
     		</div> 
       	
	    </form>
    </div>
        
   
    
           <!--##### 유효성 검사 #####-->
    <script>
    var subject;
    var prologue;
    var content;
    var epilogue;
    
    $( document ).ready(function(){
    function checkForm(){
    	alert('tetetet');
    	$(#review_form).addEventListener("click",function(){
    		var subject = $(#subject).val();
    		var prologue = $(#exampleFormControlTextarea1).val();
    		var content = $(#summernote).val();
    		var epilogue = $(#exampleFormControlTextarea2).val();
    		
    		if(subject==""){
    			alert('제목을 입력해주세요');
    			$(#subject).focus();
    		}else if(prologue==""){
    			alert('소개를 입력해주세요');
    			$(#exampleFormControlTextarea1).focus();
    		}else if(content==""){
    			alert('내용을 입력해주세요');
    			$(#summernote).focus();
    		}else if(epilogue==""){
    			alert('후기를 입력해주세요');
    			$(#exampleFormControlTextarea2).focus();
    		}
    		document.getElementById("postForm").submit();
    		})
    	}
    }
    </script>       
           



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