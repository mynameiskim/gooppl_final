<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/admin_css/admin_common.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>기본설정</b></h5>
		<dl>
			<dt>사이트 정보관리</dt>
			<dd>
				<c:url var="site_info_Url" value="admin_site_info.do">
					<c:param name="goo_id">${sessionScope.goo_id}</c:param>
				</c:url>
				- <a href='${site_info_Url}'
				>사이트 기본정보</a><br />
				- <a href='admin_site_settings.do'
				>사이트 환경설정</a><br />
			</dd>
			<dt>관리자 설정</dt>
			<dd>
				- <a href='admin_settings.do'
					>관리자 설정</a><br />
			</dd>
			<dt>가입약관 및 개인정보보호정책</dt>
			<dd>
				- <a href='admin_member_config.do'
				>약관 및 개인정보보호정책</a><br />
			</dd>
			<!--  <dt>팝업관리</dt>
			<dd>
				- <a href='/nmanager/setup/manager_list.do'
				>팝업관리</a><br />
			</dd> -->
		</dl>
	</div>
	<div id="contents">
		<h6><b>기본설정</b></h6>
			<ul class='helpbox'>
				<li>사이트의 기본적인 정보를 설정하는 곳입니다.</li>
				<li>관리자정보는 관리자사이트 접속시 적용됩니다. 보안을 위해 아이디와 패스워드는 자주 바꿔주시는게 좋습니다.</li>
			</ul>
		<div class="section_head">
			<h4>사이트 정보관리</h4>
		</div>					
		<dl class="menu_list">
			<dt><a href="admin_site_info.do?goo_id=${sessionScope.goo_id}"
				>사이트 기본정보</a>
			</dt>
			<dd>
				<a href='admin_site_info.do'
				>사이트 운영에 필요한 가장 기초적인 정보를 관리하는 메뉴 입니다.<br>
				관리자 이메일,관리자 휴대폰,관리자 전화번호는 사이트 운영에 영향이 미치는 값으로 정확히 입력해야합니다.
				</a>
			</dd>
		</dl>
		<dl class="menu_list">
			<dt>
				<a href='admin_site_settings.do'
				>사이트 환경설정
				</a>
			</dt>
			<dd>
				<a href='admin_site_settings.do'
				>웹 브라우저 Title,페이지 요약설명, 검색엔진키워드 설정, 파비콘 등록을 설정합니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>관리자 설정</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href='admin_settings.do'
				>관리자 설정
				</a>
			</dt>
			<dd>
				<a href='admin_settings.do'
					>홈페이지 관리자의 정보를 조회,수정할 수 있습니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>가입약관 및 개인정보보호정책</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href='admin_member_config.do'
					>약관 및 개인정보보호정책
				</a></dt>
			<dd>
				<a href='admin_member_config.do'
					>회원가입시 약관동의 페이지에 나오는 가입약관과 개인정보 보호정책 내용을 관리 합니다.
				</a>
			</dd>
		</dl>
		<!--  
		<div class="section_head">
			<h4>팝업관리</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href='/nmanager/setup/manager_list.do'
					>팝업관리
				</a>
			</dt>
			<dd>
				<a href='/nmanager/setup/manager_list.do'
					>홈페이지 공지 및 이벤트에서 활용할 수 있는 팝업창을 간단하게 제작하는 툴입니다.
					</a>
			</dd>
		</dl>
		-->
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>