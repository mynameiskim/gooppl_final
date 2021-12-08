<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function movePage(){
	Swal.fire({
		  title: '${msg}',
		  showClass: {
		    popup: 'animate__animated animate__fadeInDown'
		  },
		  hideClass: {
		    popup: 'animate__animated animate__fadeOutUp'
		  }
		});
	setTimeout(function() {
		location.href='${goPage}';
	}, 1000);
}
</script>
</head>
<body onload="movePage()">

</body>
</html>