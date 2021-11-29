<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/myweb3//admin_css/admin_common.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
td{
	padding: 10px;
    border: 1px solid #e3e3e3 !important;
}
.tb_hover{
	--bs-table-hover-bg: #1987541f !important;
}
.tr_bg{
	--bs-table-accent-bg: #1987541f !important;
}
</style>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>통계/분석</b></h5>
		<dl>
			<dt>통계/분석</dt>
			<dd>
				- <a href='/nmanager/setup/config_manager.do'
				>접속자분석</a><br />
				- <a href='/nmanager/setup/config_manager.do'
				>회원통계</a><br />
				- <a href='/nmanager/setup/config_m6anager.do'
				>게시판통계 </a>
			</dd>
		</dl>
	</div>
</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>