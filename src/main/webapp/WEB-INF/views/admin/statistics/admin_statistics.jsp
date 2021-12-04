<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/myweb3/admin_css/admin_common.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
td{
	padding: 10px;
    border: 1px solid #e3e3e3 !important;
}
.tb_hover{
       --bs-table-hover-bg: lightgray !important;
}
.tr_bg{
       --bs-table-accent-bg: #24292f !important;
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
	<div id="contents">
		<h6><b>통계/분석</b></h6>
			<ul class='helpbox'>
				<li>사이트에 관련된 일반적인 통계를 분석합니다.</li>
			</ul>
		<div class="section_head">
			<h4>접속자분석</h4>
		</div>					
		<dl class="menu_list">
			<dt><a href="/final/admin_member_list.jsp"
				>접속자분석</a>
			</dt>
			<dd>
				<a href="/final/admin_member_list.jsp"
				>사이트 접속자를 파악하고 그래프로 분석이 가능한 메뉴 입니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>회원 통계</h4>
		</div>
		<dl class="menu_list">
			<dt>
				<a href="/final/admin_member_out.jsp"
				>회원 통계
				</a>
			</dt>
			<dd>
				<a href="/final/admin_member_out.jsp"
				>회원가입 통계 페이지로 그래프 및 데이터로 확인 가능합니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>게시판통계</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href="/final/admin_formMail_settings.jsp"
				>게시판통계
				</a>
			</dt>
			<dd>
				<a href="admin_formMail_settings.do"
					>게시물,코멘트 작성 갯수를 게시판별 / 년별 / 월별로 그래프로 확인 가능합니다.
				</a>
			</dd>
		</dl>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>