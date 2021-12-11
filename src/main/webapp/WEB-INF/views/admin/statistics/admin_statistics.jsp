<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div id="aside">
		<h5><b>통계/분석</b></h5>
		<dl>
			<dt>통계/분석</dt>
			<dd>
				- <a href='member_statistics.do' style="color: white !important;"
				>회원통계</a><br />
			</dd>
		</dl>
	</div>
	<div id="contents">
		<h6><b>통계/분석</b></h6>
			<ul class='helpbox'>
				<li>사이트에 관련된 일반적인 통계를 분석합니다.</li>
			</ul>
		<div class="section_head">
			<h4>회원 통계</h4>
		</div>
		<dl class="menu_list">
			<dt>
				<a href="member_statistics.do" style="color: white !important;"
				>회원 통계
				</a>
			</dt>
			<dd>
				<a href="member_statistics.do"
				>회원가입 통계 페이지로 그래프 및 데이터로 확인 가능합니다.
				</a>
			</dd>
		</dl>
	</div>
</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>