<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
<html lang="UTF-8">
<style>
* {
    margin: 0;
    padding: 0;
    outline: none;
    box-sizing: border-box;
}
body {
    height: 100vh;
    width: 100%;
    background: #fff;
}

.container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: block;
    background: #fff;
    width: 410px;
    padding: 30px;
    /* box-shadow: 0 0 8px rgba(0, 0, 0, 0.1); */
}
</style>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>GooPPl - Mypage</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- jquery -->
    <script type="text/javascript"
	  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	<script src="/gooppl/resource/js/httpRequest.js"></script>
	
</head>

<body>
    <div class="center">
      <div class="container">
		<h4 class="display-6 fw-bolder text-center mb-5">결제정보</h4>
		<form name="paymentFm">
		<div class="card" style="width: 20rem; margin:0px auto;">
		  <img src="${odto.firstimg}" class="card-img-top" >
		  <div class="card-body">
		    <h5 class="card-title">${odto.title}</h5>
		    <p class="card-text">${odto.addr}</p>
		  </div>
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item">광고기간 / ${adto.ad_period}개월</li>
		    <li class="list-group-item">결제금액 / ${(adto.ad_period)*100}원</li>
		    <li class="list-group-item"></li>
		  </ul>
		  <input type="hidden" id="name" value="${odto.name}">
		  <div class="card-body">
		  	<!-- <input type="button" name="goPayment" value="결제" id="check_module"> -->
		  	<!-- <input type="button" name="back" value="뒤로가기" id="back" onclick="location.href='mypage.do'"> -->
		    <a id="check_module" class="card-link">결제</a>
		    <a href="mypage.do" class="card-link">뒤로가기</a>
		  </div>
		</div>
		</form>
      </div>
    </div>
</body>
<script>
$("#check_module").click(function () {
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp84628581');//
	IMP.request_pay({
	pg: 'inicis', // version 1.1.0부터 지원.
	
	//pay_method: 100*4,
	
	merchant_uid: 'merchant_' + new Date().getTime(),
	
	name: '주문명:${odto.title}광고',
	//결제창에서 보여질 이름
	amount: ${(adto.ad_period)*100},
	//가격
	buyer_email: '${adto.email}',
	buyer_name: '${odto.name}',
	buyer_tel: '${odto.tel}',
	buyer_addr: '${odto.addr}'
	
	}, function (rsp) {
	console.log(rsp);
	if (rsp.success) {
	var msg = '결제가 완료되었습니다.';
	var imp_uid = rsp.imp_uid;
	var merchant_uid = rsp.merchant_uid;
	var amount = rsp.paid_amount;
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	
	var now = new Date();
	
	var param = 'imp_uid='+imp_uid+'&owner_idx='+${odto.owner_idx}+'&merchant_uid='+merchant_uid+'&amount='+amount+'&status=paid&ad_period='+${adto.ad_period};
	//alert(msg);
	sendRequest('user_payment_ok.do', param, showResult, 'GET');
	
	} else {
	var msg = rsp.error_msg;
	alert(msg);
	}
	});
});
	
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			console.log('넘어왔다..!');
			var data = XHR.responseText;
			
			
			location.href='mypage.do';
		}
	}
}
</script>
</html>