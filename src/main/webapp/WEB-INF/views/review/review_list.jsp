﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resource/meta/meta.jsp" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>여행 리뷰 게시판</title>
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
    <link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
    	<!-- jquery -->
	<script type="text/javascript"
	  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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


    #writereview a {
        float: right;
        text-decoration: none;
        padding-top: 24px;
        padding-right: 8px;
        color: #198754ab;
    }
	.carousel-inner {
        padding: 8;
    }

    .carousel-item {
        padding: 8px;
    }
    
    #thumbNail img{
    	height: 160px;
    }
    
</style>

<body onload="javascript:document.getElementById('allList').click();">
    <!-- Navigation@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
<%@include file="/WEB-INF/views/member/header.jsp" %>
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 3rem;">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">

            <div class="row">
                <div class="col-md-4" style="height: 128px;">
                    <!-- 페이지 경로 -->
                    <div id="pagepath">
                        <span> <a href="community.do">커뮤니티</a>&gt;후기게시판
                        </span>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-4">
                    <!-- 	제목 -->
                    <div id="title">
                        <h5 class="display-6 fw-bolder text-center">Review</h5>
                    </div>
                </div>
                <div class="col-md-offset-1 col-md-2"></div>
            </div>

            <!-- 	 검색 및 게시글 작성하기 -->

           

            <!-- 게시글 슬라이더  -->
            <c:if test="${empty list }">
            	<div class="row">
            		
            	</div>
            </c:if>
            <div class="row justify-content-md-center ">
                <div class="col-md-8">
                    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://www.50plus.or.kr/upload/im/2019/01/d3c19df5-37b2-4eab-9a97-51423b7cb419.jpg"
                                    class="d-block w-100" alt="..." style="width: auto; height:500px; border-radius:8px;">
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="https://blog.kakaocdn.net/dn/bQSqGM/btrklWSBhPM/4X8XC9gwOKlgfn92FaKJX1/img.jpg"
                                    class="d-block w-100" alt="..." style="width: auto; height: 500px;border-radius:8px;">
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="https://img.insight.co.kr/static/2019/03/13/700/heh5vq635thpwz0v58i3.jpg"
                                    class="d-block w-100" alt="..." style="width: auto; height: 500px;border-radius:8px;">
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
           </div>
    </section >
	<section>
            <!--     버튼 -->
		<div class="container-sm">
            <div class="container-sm" style="margin-top: 8px; margin-bottom: 32px; text-align: center;">
                <a id="allList" class="mx-2" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true"
                    aria-controls="collapseExample">
                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                    <span class="ir_su">ALL list</span>
                </a>
            </div>
           
          <div class="collapse" id="collapseExample">
          <div id="search" class="row justify-content-md-center mb-5">
                

                <div id="writereview" class="col-md-8 col-xs-2">
                    <button class="btn btn-outline-success btn-sm" style="float: right;" onclick="location.href='reviewWrite.do'">후기작성하기</button>
                </div>
            </div>
            <!--     전체 후기 목록  -->
            <c:if test="${empty list }">
            	 <div class="collapse" id="collapseExample">
            	 	등록된 게시글이 없습니다.
            	 </div>
            </c:if>
              <c:forEach var="dto" items="${list }">
               <div class="row justify-content-md-center">
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="row g-0">
	                            <div class="col-md-4" id="thumbNail">
	                            	${dto.content }
	                            </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-9">
                                            <c:url var="contentUrl" value="reviewContent.do">
											<c:param name="review_idx">${dto.review_idx}</c:param>
											</c:url>
                                           <h5 class="card-title mb-5" ><a href="${contentUrl }" style="text-decoration: none;" >${dto.subject }</a></h5>
                                            <p class="card-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 400px;">${dto.prologue }</p>
                                            </div>
                                            <div class="col-md-3">
                                                <p class="card-text">
                                                    <small class="text-muted" style="font-size: x-small;">${dto.nickname }</small>
                                                </p>
                                                <p class="card-text">
                                                    <small class="text-muted" style="font-size: x-small;">${dto.writedate }</small>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div class="row justify-content-md-center text-center mb-5">
                	<div class="col-md-4">
                		<div class="col-md-8" style="margin:0px auto;">
	                		<ul class="pagination justify-content-center">
	                			${pageStr }
	                		</ul>
                		</div>
                	</div>
                </div>
            </div>
        </div>
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
<%@include file="/WEB-INF/views/member/faq.jsp" %>
<%@include file="/WEB-INF/views/member/footer.jsp" %>
<script>

/**생성된 리스트 이미지 넓이 100%로 채우는 쿼리*/
$(function() {
	$(document).ready(function(){
		var length = ${fn:length(list) };
		for(var i=0; i<length; i++){
			$('#img'+i).css('width','100%');
		}
       
     });
});
</script>
</body>

</html>