<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>review write form</title>
    
<!--     썸머노트 -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
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
                    <li class="nav-item"><a class="nav-link" href="#">Community</a></li>
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
        style="padding-top: 3rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">

            <!--작성 폼 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
            
            
            <form id="review_form" class="form-inline" name="updatereview" action="reviewUpdate.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="review_idx" value="${dto.review_idx }">
            <input type="hidden" name="nickname" value="${dto.nickname }">
            <div class="row">
                <div class="col-md-4" style="height: 128px;">
                    <!-- 페이지 경로 -->
                    <div id="pagepath">
                        <span> <a href="community.do">커뮤니티</a>&gt;<a href="review.do">후기게시판</a>&gt;후기작성하기
                        </span>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-4">
                    <!-- 	제목 -->
                    <div id="title">
                        <h5 class="display-6 fw-bolder text-center ">
                            <input type="text" name="subject" value="${dto.subject }" placeholder="제목을 적어주세요">
                        </h5>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-2"></div>
            </div>

                
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="col-md-10">
                    <!--프롤로그 입력-->
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">프롤로그</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="간단한 소개글을 적어주세요~"
                                    rows="3" name="prologue">${dto.prologue }</textarea>
                            </div>
                        </div>
                    </div>

                    <!-- 이미지 업로드 양식 -->

                    <div class="row img_container">
                        <div class="row ">
                        
                        <textarea id="summernote" name="content"
						rows="10" cols="100" placeholder="사진및 설명" >
							${dto.content }
						</textarea> <!-- textarea 밑에 script 작성하기 -->
								<script>
									$(document).ready(function() {
										$('#summernote').summernote();
									});
									
								</script>
                        </div>
<!--                             <div class='mb-3' style='width: 100%;'> -->
<!--                                 <label for='formFile' class='form-label'>사진을 골라주세요!</label> -->
<!--                                 <input class='form-control' type='file' name="upload" id="inputMultipleImage" multiple> -->
<!--                             </div> -->
<!--                             <div class="row justify-content-md-center" id="multipleContainer" ></div>  -->
                             
                    </div>



                    <!--에필로그 -->
                        <div class="row" style="margin-top: 32px;">
                            <div class="col-xs-12 ">
                                <div class="mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">에필로그</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="epilogue"
                                        placeholder="작성 후기 또는 느낀점">${dto.epilogue }</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 " style="text-align: center;">
                                <button type="submit" class="btn btn-success "
                                    style="font-size: medium; margin-top:32px;">작성하기</button>
                                <button type="reset" class="btn btn-light "
                                    style="font-size: medium; margin-top:32px;">다시쓰기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        
			            <!--작성 폼 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
			            
			            
        </div>

<!--         <script type="text/javascript"> -->
<!-- //             /** -->
<!-- //              * 멀티파일 업로드 -->
<!-- //              */ -->
<!-- //             function readMultipleImage(input) { -->
<!-- //                 const multipleContainer = document.getElementById('multipleContainer') -->
                
<!-- //                 if(input.files) { -->
<!-- //                     console.log(input.files) -->
            
<!-- //                     const fileArr = Array.from(input.files) -->
            
<!-- //                     const $colDiv1 = document.createElement('div') -->
<!-- //                  //    const $colDiv2 = document.createElement('div') -->
                    
<!-- //                  //   $colDiv1.classList.add('column') -->
<!-- //                  //   $colDiv2.classList.add('column') -->
                    
<!-- //                     $colDiv1.classList.add('col-md-8') -->
<!-- //                     $colDiv1.classList.add('mb-4') -->
<!-- //                  //   $colDiv2.classList.add('col-md-6') -->
            
<!-- //                     fileArr.forEach((file, index) => { -->
<!-- //                         const reader = new FileReader() -->
            
<!-- //                         const $imgDiv = document.createElement('div')    -->
<!-- //                         const $img = document.createElement('img') -->
<!-- //                         const $textarea = document.createElement('textarea') -->
<!-- //                     //    const $contentarea = document.createElement('div') -->

<!-- //                         $imgDiv.classList.add('mb-4') -->
<!-- //                     //    $contentarea.classList.add('editor') -->
<!-- //                         $img.classList.add('image') -->
<!-- //                         $img.classList.add('img-fluid') -->
<!-- //                         $img.setAttribute('width','100%') -->
<!-- //                         $textarea.classList.add('form-control') -->
<!-- //                         $textarea.setAttribute('rows','4') -->
<!-- //                         $textarea.setAttribute('name','path_content') -->
<!-- //                         $textarea.setAttribute('placeholder','사진에 대한 설명이나 그때 기억을 적어주세요~') -->
<!-- //                         $imgDiv.appendChild($img) -->
<!-- //                         $imgDiv.appendChild($textarea) -->
<!-- //                     //     $imgDiv.appendChild($contentarea) -->
<!-- //                         reader.onload = e => { -->
<!-- //                             $img.src = e.target.result -->
                            
<!-- //                            // $imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px" -->
<!-- //                            // $imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px" -->
<!-- //                         } -->
                        
<!-- //                         console.log(file.name) -->
<!-- //                         $colDiv1.appendChild($imgDiv) -->
                        
<!-- //                        /* if(index % 2 == 0) { -->
<!-- //                         } else { -->
<!-- //                             $colDiv2.appendChild($imgDiv) -->
<!-- //                         }*/ -->
                        
<!-- //                         reader.readAsDataURL(file) -->
<!-- //                     }) -->
<!-- //                     multipleContainer.appendChild($colDiv1) -->
<!-- //                   //  multipleContainer.appendChild($colDiv2) -->
<!-- //                 } -->
<!-- //             } -->
<!-- //             // 이벤트 리스너 -->
<!-- //             document.getElementById('inputMultipleImage').addEventListener('change', (e) => { -->
<!-- //                 readMultipleImage(e.target); -->

<!-- //             }) -->
<!--             </script> -->

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