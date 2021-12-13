<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
<html>

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
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/modals/">

<link rel="stylesheet" type="text/css"
	href="/gooppl/resource/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/gooppl/resource/slick/slick-theme.css" />

<script type="text/javascript"
	src="/gooppl/resource/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/gooppl/resource/slick/slick.js"></script>
<link rel="stylesheet"
	href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<style>
#pagepath a {
	font-size: x-small;
	color: #198754fa;
	text-decoration: none;
}

#pagepath span {
	font-size: x-small;
}

.slider .slick-list {
	margin: 0 -20px;
}

.slick-slide {
	margin: 0 20px;
}

.slick-next:before {
	margin: 15px;
	content:
		url(https://img.icons8.com/flat-round/48/000000/circled-right-2--v1.png);
}

.slick-prev:before {
	margin: -50px;
	content:
		url(https://img.icons8.com/flat-round/48/000000/circled-left-2--v1.png);
}
</style>
</head>

<body onload="getFirstImg();">
	<!-- Navigation-->
	 <!-- Navigation@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
<%@include file="/WEB-INF/views/member/header.jsp" %>
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<section class="signup-section bg-light" id="signup"
		style="padding-top: 3rem; background: linear-gradient(to bottom, rgb(255 255 255/ 42%) 0%, rgb(207 255 203/ 28%) 75%, #f6f2f2 100%);">
		<h1 class="display-6 fw-bolder mb-5 text-center"></h1>
		<div class="container-sm mb-5">


			<div class="row" style="height: 128px;">
				<div class="col-md-4">

					<!-- 페이지 경로 -->
					<div id="pagepath">
						<span> <a href="community.do">커뮤니티</a>&gt;일정공유게시판
						</span>
					</div>
				</div>
				<div class="col-md-4">

					<!-- 	제목 -->
					<div id="title">
						<h5 class="display-6 fw-bolder text-center">SHARE</h5>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>

			
			
			<!-- 슬라이더로 표현되는 일정 목록 -->
			<div class="row">
				<div class="slider conter" style="padding-left: 40px;">
					<c:forEach var="dto" items="${list}" varStatus="status">

						<div class="col-md-5 " style="padding-left: 40px;">
							<div class="card mb-3">
								<div class="row g-0">
									<div class="col-md-9">
										<c:url var="contentUrl" value="shareContent.do">
										<c:param name="map_idx">${dto.map_idx}</c:param>
										<c:param name="member_idx">${dto.member_idx}</c:param>
										</c:url>
											<a href="${contentUrl }" >
												<img
												src="${firstImg[status.index]}"
												class="img-fluid rounded-start" alt="..."
												style="width: 100%; height: 360px;">
											</a>
									</div>
									<div class="col-md-3">
											<div class="card-body">
											
											<h5 class="card-title mb-5"><a href="${contentUrl }" style="text-decoration: none;">${dto.map_title }</a></h5>
											<c:choose>
												<c:when test="${dto.trip_type==1}">
													<p class="card-text">여행타입 : 홀로여행</p>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${dto.trip_type==2}">
													<p class="card-text">여행타입 : 우정여행</p>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${dto.trip_type==3}">
													<p class="card-text">여행타입 : 커플여행</p>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${dto.trip_type==4}">
													<p class="card-text">여행타입 : 가족여행</p>
												</c:when>
											</c:choose>
											<div >
											<p class="card-text" style="font-size: small;">
											작성자 :	${member[status.index].nickname }</p>
											<p class="card-text">
												<small class="text-muted">${dto.registdate }</small>
											</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
			<script>
				$('.slider').slick({
					centerMode : true,
					centerPadding : '0px',
					slidesToShow : 1.7,
					responsive : [ {
						breakpoint : 768,
						settings : {
							arrows : false,
							centerMode : true,
							centerPadding : '40px',
							slidesToShow : 5
						}
					}, {
						breakpoint : 480,
						settings : {
							arrows : false,
							centerMode : true,
							centerPadding : '40px',
							slidesToShow : 5
						}
					} ]
				});
			</script>




			<div class="row">


				<!--     버튼 -->

				<div class="container" style="text-align: center; margin-top: 64px;">
					<a class="mx-2" data-bs-toggle="collapse" href="#collapseExample"
						role="button" aria-expanded="false"
						aria-controls="collapseExample"> <i class="fa fa-angle-down"
						aria-hidden="true"></i> <span
						class="ir_su display-10 fw-bolder text-center">전체메뉴 보기</span>
					</a>
				</div>
				
				<!--     전체 일정 목록  -->
				
				
				<c:if test="${empty list }">
					<div class="collapse row" id="collapseExample"
						style="margin-top: 32px;">등록된 게시글이 없습니다.</div>
				</c:if>
				<div class="collapse row mb-5" id="collapseExample"
					style="margin-top: 32px;">
						
					<c:forEach var="dto" items="${list }" varStatus="status">
						<div class="col-md-3" style="margin-top: 32px;">
							<div class="card">
								<c:url var="contentUrl" value="shareContent.do">
								<c:param name="map_idx">${dto.map_idx}</c:param>
								<c:param name="member_idx">${dto.member_idx}</c:param>
								</c:url>
									<a href="${contentUrl }" >
										<img id="${dto.map_idx }"
										src="${firstImg[status.index]}"
										class="card-img-top" alt="..." style="height:160px;">
									</a>
								<div class="card-body">
                               	<h5 class="card-title mb-1"><a href="${contentUrl }" style="text-decoration: none;">${dto.map_title}</a></h5>
									<c:choose>
										<c:when test="${dto.trip_type==1}">
											<p class="card-text">여행타입 : 홀로여행</p>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${dto.trip_type==2}">
											<p class="card-text">여행타입 : 우정여행</p>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${dto.trip_type==3}">
											<p class="card-text">여행타입 : 커플여행</p>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${dto.trip_type==4}">
											<p class="card-text">여행타입 : 가족여행</p>
										</c:when>
									</c:choose>
									<p class="card-text" style="font-size: small;">
									작성자 :	${member[status.index].nickname }</p>
									<p class="card-text" style="font-size: small;">
										작성일 : ${dto.registdate }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				<div class="row justify-content-md-center text-center mb-5">
					<div class="col-md-4" style="margin-top: 50px;">
							<div class="col-md-8" style="margin: 0px auto;">
								<ul class="pagination justify-content-center">
								${sharePageStr }
		                		</ul>
	                		</div>
					</div>
				</div>
				</div>
				
				<!--목록 경계선 -->
			</div>
		</div>
	</section>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<!-- Contact-->
<%@include file="/WEB-INF/views/member/faq.jsp" %>
<%@include file="/WEB-INF/views/member/footer.jsp" %>
</body>

</html>