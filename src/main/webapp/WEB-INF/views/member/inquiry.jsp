<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resource/meta/meta.jsp" %>    
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

</head>
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
                    <li class="nav-item"><a class="nav-link" href="placeList.do">Place</a></li>
                    <li class="nav-item"><a class="nav-link" href="comunity.do">Community</a></li>
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
        style="padding-top: 10rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
	<div class="container-sm mb-5">
	    	<div class="row justify-content-md-center mb-4">
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
	    	<div class="row justify-content-md-center mb-5">
               <div class="col-md-2 text-center">
                   <h5 class="fw-bolder mb-3 text-center">답변 대기중인 내역</h5>
                   <h4 class="fw-bolder mb-3 text-center"><a href="#" style="text-decoration: none;">1</a></h4>
               </div>
               <div class="col-md-2 text-center">
                   <h5 class="fw-bolder mb-3 text-center">답변 완료된 내역</h5>
                   <h4 class="fw-bolder mb-3 text-center"><a href="#" style="text-decoration: none;">3</a></h4>
               </div>
            </div>
    

			<table class="table table-hover tb_hover">
			  <thead>
					<tr class="tr_bg">
						<th class="text-center active text-white text-opacity-75" style="width:2%;">#</th>
						<th class="text-center active text-white text-opacity-75" style="width:20%;">작성일</th>
						<th class="text-center active text-white text-opacity-75" style="width:50%;">문의제목</th>
						<th class="text-center active text-white text-opacity-75" style="width:20%;">답변현황</th>
					</tr>
			</thead>
				<tfoot style="border-top: 0px">
			      <tr>
					<td colspan="10" class="text-center">1</td>
			     </tr>
			  	</tfoot>
			  <tbody>
			  	<c:if test="${empty list}">
			  		<tr>
					<td colspan="10" align="center">
					<b>문의한 내역이 없습니다.</b>
					</td>
				</tr>
			  	</c:if>
			  	<c:forEach var="list" items="${list}" varStatus="status">
			  		<tr class="tr_aling" id="iq_list${status.index}">
				      <td class="text-center list${status.index}" style="width:2%;">${list.inquiry_idx}</td>
				      <td class="text-center list${status.index}" style="width:20%;">${list.inquiry_writedate}</td>
				      <!--<td class="text-center" style="width:4%;">${(cp-1)*listSize+status.index+1}<input id="member_idx${status.index}" type="hidden" value="${list.member_idx}"></td> -->
				      <td class="text-center list${status.index}" style="width:50%;">${list.inquiry_subject}</td>
					      <c:if test="${list.inquiry_status=='y'}">
	    				    <td class="text-center list${status.index}" style="width:20%;color:green;"><label onclick="showAnswer(${status.index})">답변완료</label></td>
					      </c:if>
					      <c:if test="${list.inquiry_status=='n'}">
					      	<td class="text-center list${status.index}" style="width:20%;color:red;" onclick="showContent(${status.index})">답변대기</td>
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
			    	 <td class="text-start answerArea${status.index}" colspan="1" style="font-weight:600; font-size:15px;">아 그거는 이러쿵 저러쿵 하면 됩니다. 자세한 문의사항은 minjjal@gmail.com으로 남겨주시면 확인 후 안내드리겠습니다!</td>
			    	 <td class="text-center answerArea${status.index}"><button class="btn btn-secondary" id="closebt${status.index}" onclick="closeAnswer(${status.index})">닫기</button></td>
				   </tr>
			  	</c:forEach>
			  </tbody>
			</table>
			<div id="di"></div>
	</div>
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
<footer class="footer bg-primary small text-center text-white-50" style="padding: 2.3rem 0;">
        <div class="container px-4 px-lg-5">Copyright &copy; Ezen Academy & Team3 2021</div>
    </footer>
    <%@include file="/WEB-INF/views/member/faq.jsp" %>
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
</body>
</html>