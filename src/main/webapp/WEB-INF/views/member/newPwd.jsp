<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
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
<body>
    <div class="center">
      <div class="container">
      <h4 class="display-6 fw-bolder text-center mb-5">비밀번호 변경</h4>
      <div class="input-form col-md-4 col-lg-4 mx-auto">
         
         <!-- 멤버 타입 히든 -->
         <input type="hidden" name="goo_id" value="${goo_id}" id="goo_id">
         <!--  -->
            <div class="mb-3 form-group has-feedback">
                  <label for="pwd"><strong>새로운 비밀번호</strong></label>
                   <input type="password" class="form-control pwds" name="pwd" id="pwd" placeholder="" value="" required pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}">
                  <div class="valid-feedback">사용가능</div>
                            <div class="invalid-feedback" style="font-size:5px;">하나 이상의 숫자,문자,특수문자를 포함하여 8자 이상입력하셔야 합니다.</div>
            </div>
            <div class="mb-3 form-group has-feedback">
                  <label for="pwdRe"><strong>비밀번호 확인</strong></label> 
                  <input type="password" class="form-control pwds" id="pwdRe" placeholder="" value="" required pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}">
                  <div id="cPwdValid" class="valid-feedback">사용가능</div>
                   <div id="cPwdInvalid" class="valid-feedback">하나 이상의 숫자,문자,특수문자를 포함하여 8자 이상입력하셔야 합니다.</div>
            </div>
            <div class="d-grid gap-2 mb-4">
               <button class="btn btn-primary btn-lg btn-block" type="button" id="newPwdbt" disabled="true">변경하기</button>
            </div>
         
      </div>
      </div>
    </div>
  <script>
  $('#newPwdbt').click(function(){
     var pwd = $('#pwd').val();
     var goo_id = $('#goo_id').val();
     $.ajax({
          type:"POST",
          url:"pwdChange.do",
          data:{"pwd":pwd,"goo_id":goo_id},
          success:function(data){
             if(data==1){
                Swal.fire({
                 title: '비밀번호 수정완료',
                 icon: 'success',
                 confirmButtonText: '확인',
                 allowOutsideClick:false
                }).then((result) => {
                   if (result.isConfirmed) {
                      window.self.close();
                   }
                })
             }else{
                Swal.fire({
                 title: '비밀번호 변경실패',
                 icon: 'error',
                 confirmButtonText: '확인',
                 allowOutsideClick:false
               })
             }
          }        
      });
     
  });
  
  </script>
  <script>
   $('#pwd, #pwdRe').on('keyup', function () {
         var pwdRe=$('#pwdRe').val();
         var pwd=$("#pwd").val();
        
         if ($('#pwd').val() == $('#pwdRe').val()) {
            //pwd의 밸류가 빈문자열이 아니면서 pwdre의 밸류가 빈문자열이 아니면서 pwd의 밸류가 pwdre의 밸류와 같다면 
          $("#newPwdbt").attr("disabled",false);
           $('#cPwdValid').show();
           $('#cPwdInvalid').hide();
           $('#cPwdValid').html('사용가능').css('color', 'green');
           $('.pwds').removeClass('is-invalid')
         } else {
              $("#newPwdbt").attr("disabled",true);
              $('#cPwdValid').hide();
              $('#cPwdInvalid').show();
              $('#cPwdInvalid').html('일치하지 않음').css('color', 'red');
              $('.pwds').addClass('is-invalid')
         }
   });
</script>    
</body>
</html>