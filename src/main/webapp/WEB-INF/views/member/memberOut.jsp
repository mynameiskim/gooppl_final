<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GooPPl - memberOut</title>
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
 .container {
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   display: block;
   background: #fff;
   width: 510px;
   padding: 30px;
   /* box-shadow: 0 0 8px rgba(0, 0, 0, 0.1); */
}
</style>
</head>
<body>
<div class="container">
	<div style="width:450px; border:1px solid lightgray; border-radius:15px;">
		<div style="width:350px; margin:30px auto;">
			<h4 class="display-6 fw-bolder text-center mb-4">회원탈퇴</h4>
			<label class="mb-3" style="font-size:14px;">사용하고 계신 <strong>${sessionScope.sessionId}</strong>계정을 탈퇴할 경우 복구가
			불가능합니다. 탈퇴후 회원 정보 및 서비스 이용기록은 모두 삭제되오니 신중하게 선택하여 주시기 바랍니다.</label>
			
			<label class="mb-1" for="pwd"><strong>회원 탈퇴 사유를 선택해주세요</strong></label> 
			<select class="form-select mb-2" aria-label=".form-select-lg example" id="out_reason">
				<option value="서비스 이용의 불편함을 느낌" selected>서비스 이용의 불편함을 느낌</option>			
				<option value="서비스 불만족(아쉬움)">서비스 불만족(아쉬움)</option>			
				<option value="더 좋은 사이트를 찾음">더 좋은 사이트를 찾음</option>			
				<option value="더 이상 사이트의 필요성을 못느껴서">더 이상 사이트의 필요성을 못느껴서</option>
				<option value="5">직접입력</option>			
			</select>
			<div class="mb-3 form-group has-feedback">
				<input type="text" class="form-control" id="input_reason" style="display:none;" value="">
			</div>
			<div class="mb-3 form-group has-feedback">
				<label class="mb-1" for="pwd"><strong>회원 탈퇴를 위해 비밀번호를 입력해주세요.</strong></label> 
				<input type="password" class="form-control pwds" id="pwd" placeholder="" value="" required pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}">
			</div>
			<div class="d-grid gap-2 mb-4">
				<button class="btn btn-secondary btn-lg btn-block" type="button" id="memberOut_bt" disabled="true">회원탈퇴하기</button>
				<button class="btn btn-dark btn-lg btn-block" type="button" onclick="javascript:window.location.replace('/gooppl/mypage.do');">뒤로가기</button>
			</div>
		</div>
	</div>
</div>
<script>
$('#pwd').on('keyup', function () {
	   var pwd=$("#pwd").val();
	  
   if (pwd!='') {
	 $("#memberOut_bt").attr("disabled",false);
     $('.pwds').removeClass('is-invalid')
   } else {
     $("#memberOut_bt").attr("disabled",true);
     $('.pwds').addClass('is-invalid')
   }
   
});

$('#out_reason').on("change",function(){
	var select_reason = $('#out_reason option:selected').val();
	if(select_reason==5){
		$('#input_reason').css("display","");
	}else{
		$('#input_reason').css("display","none");
	}
});

$('#memberOut_bt').on("click",function(){
	var pwd = $('#pwd').val();
	var out_reason = $('#out_reason option:selected').val();
	if(out_reason==5){
		out_reason = $('#input_reason').val();
	}
	$.ajax({
        type:"POST",
        url:"memberOut.do",
        data:{"pwd":pwd,"out_reason":out_reason},
        success:function(data){
      	  if(data==1){
          	  Swal.fire({
					  title: '완료되었습니다.',
					  icon: 'success',
					  allowOutsideClick:false
          	  }).then((result) => {
				    	if (result.isConfirmed) {
				    		location.replace('index.do');
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
    <!-- sweetalert -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</body>
</html>