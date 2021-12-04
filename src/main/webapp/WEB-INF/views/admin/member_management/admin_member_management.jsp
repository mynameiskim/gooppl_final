<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resource/css/admin_header.css" type="text/css" rel="stylesheet">
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
		<h5><b>회원관리</b></h5>
		<dl>
			<dt>회원목록</dt>
			<dd>
				 <a href="admin_member_list.do" style="color: white !important;"
				>-회원목록</a><br />
			</dd>
			<dt>탈퇴회원목록</dt>
			<dd>
				 <a href="admin_member_out.do" style="color: white !important;"
					>-탈퇴회원목록</a><br />
			</dd>
			<dt>폼메일 관리</dt>
			<dd>
				 <a href="admin_formmail_settings.do?form_type=회원가입" style="color: white !important;"
				>-폼메일 관리</a><br />
			</dd>
		</dl>
	</div>
	<div id="contents">
		<h6><b>회원관리</b></h6>
			<ul class='helpbox'>
				<li>사이트에 가입한 회원들의 정보를 보실 수 있습니다.</li>
			</ul>
		<div class="section_head">
			<h4>회원목록</h4>
		</div>					
		<dl class="menu_list">
			<dt><a href="admin_member_list.do"
				>회원목록</a>
			</dt>
			<dd>
				<a href="admin_member_list.do"
				>사이트에 가입한 회원들을 일괄 관리합니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>탈퇴회원목록</h4>
		</div>
		<dl class="menu_list">
			<dt>
				<a href="admin_member_out.do"
				>탈퇴회원목록
				</a>
			</dt>
			<dd>
				<a href="admin_member_out.do"
				>탈퇴된 회원들을 일괄 관리합니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>폼메일 관리</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href="admin_formmail_settings.do?form_type=회원가입"
				>폼메일 관리
				</a>
			</dt>
			<dd>
				<a href="admin_formmail_settings.do?form_type=회원가입"
					>여러가지 상황(회원가입축하 메일,비밀번호찾기 메일 등)에 따른 폼메일을 관리할 수 있습니다.
				</a>
			</dd>
		</dl>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>