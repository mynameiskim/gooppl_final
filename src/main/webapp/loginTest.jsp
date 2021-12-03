<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면 샘플 - Bootstrap</title>
<!-- Bootstrap CSS -->
<link href="/gooppl/resource/css/styles.css" rel="stylesheet" />
<link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet" />
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- jquery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
 <div class="container mt-2">
     <form action="page2.php" id="myForm1" class="needs-validation" novalidate>
      <div class="form-group">
        Field1<input type="text" class="form-control" pattern="^[a-z]{2,4}$" required autofocus>
        <div class="valid-feedback">Valid</div>
        <div class="invalid-feedback">a to z only (2 to 4 long)</div>
      </div>
      <div class="form-group">
        Password<input type="text" id="pwdId" class="form-control pwds" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" required>
        <div class="valid-feedback">사용가능</div>
        <div class="invalid-feedback">하나 이상의 숫자,문자,특수문자를 혼합하여 8자이상 입력하셔야 합니다.</div>
      </div>
      <div class="form-group">
        Confirm Password<input type="text" id="cPwdId" class="form-control pwds" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" required>
        <div id="cPwdValid" class="valid-feedback">사용가능</div>
        <div id="cPwdInvalid" class="invalid-feedback">하나 이상의 숫자,문자,특수문자를 혼합하여 8자이상 입력하셔야 합니다.</div>
      </div>
      <div class="form-group">
        <button id="submitBtn" type="submit" class="btn btn-primary submit-button" disabled>Submit</button>
      </div>
 </form>
  <script>
  $('#pwdId, #cPwdId').on('keyup', function () {
      if ($('#pwdId').val() != '' && $('#cPwdId').val() != '' && $('#pwdId').val() == $('#cPwdId').val()) {
        $("#submitBtn").attr("disabled",false);
        $('#cPwdValid').show();
        $('#cPwdInvalid').hide();
        $('#cPwdValid').html('Valid').css('color', 'green');
        $('.pwds').removeClass('is-invalid')
      } else {
        $("#submitBtn").attr("disabled",true);
        $('#cPwdValid').hide();
        $('#cPwdInvalid').show();
        $('#cPwdInvalid').html('Not Matching').css('color', 'red');
        $('.pwds').addClass('is-invalid')
      }
});
    </script>
  <script type="text/javascript"
		src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>