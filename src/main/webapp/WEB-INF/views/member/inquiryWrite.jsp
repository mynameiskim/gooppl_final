<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
<html lang="UTF-8">
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
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resource/css/styles.css" rel="stylesheet" />
    <link href="resource/css/bootstrap.min.css" rel="stylesheet" />
    <script src="resource/js/httpRequest.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <!-- jquery -->
	<script type="text/javascript"
	  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<body id="page-top">
    <%@include file="/WEB-INF/views/member/header.jsp" %>
    <section class="signup-section" id="sigup">
    	<div class="container-sm px-5 my-5"">
    	<form name="inquiryForm" action="inquiryWrite.do" method="post">
            <div class="row justify-content-md-center mb-3">
              <div class="col-md-8">
                  <h2>1:1 문의</h2>
                  <input type="hidden" id="hd_member_idx" name="member_idx" value="${member_idx}">
			        <hr>
              </div>
            </div>
            <div class="row justify-content-md-center mb-3">
              <div class="col-md-8">
                  <label class="form-label" style="color:#6c757d">제목</label>
                  <input type="email" id="inquiry_subject" class="form-control" name="inquiry_subject" required>
              </div>
            </div>
            <div class="row justify-content-md-center mb-3">
             <div class="col-md-8">
                 <label class="form-label" style="color:#6c757d">문의내용</label>
                 <textarea id="inquiry_content" class="form-control" name="inquiry_content" rows="10" required></textarea>
             </div>
            </div>
            <div class="row justify-content-md-center mb-3">
              <div class="col-md-8">
                  <input id="inquiry_bt" type="button" class="btn btn-primary" value="문의하기" style="width:100%;">
              </div>
            </div>
    	</form>
    	</div>
    	<script>
    	$('#inquiry_bt').click(function(){
    		var inquiry_subject = $('#inquiry_subject').val();
    		var inquiry_content = $('#inquiry_content').val();
    		$.ajax({
	              type:"POST",
	              url:"inquiryWrite.do",
	              data:{"inquiry_subject":inquiry_subject,"inquiry_content":inquiry_content},
	              success:function(data){
	            	  if(data==1){
	            	  Swal.fire({
						  title: '문의 등록 완료!',
						  icon: 'success',
						  allowOutsideClick:false
	            	  }).then((result) => {
					    	if (result.isConfirmed) {
					    		sessionStorage.setItem("inquiry_ok",1);
					    		location.href="mypage.do";
					    	}
					    })
	            	  }else{
	            		  Swal.fire({
							  title: '문의 등록 실패!',
							  icon: 'error',
							  confirmButtonText: '확인'
							})  
	            	  }
	              }        
	          });
    	});
    	</script>
    </section>
    <%@include file="/WEB-INF/views/member/footer.jsp" %>
    <%@include file="/WEB-INF/views/member/faq.jsp" %>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>

</html>