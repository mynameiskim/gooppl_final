<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="margin-top: 27px; width: 210px; float: left; color: #24292f !important;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-left:15px;"
    ">
      <svg width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-6"><b>통계/분석</b></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item" style="margin: 10px 0;">
        <a href='member_statistics.do' style="padding-left:40px; font-size: 13px; background-color: #24292f; color: white !important;" class="nav-link active" aria-current="page">
          <svg width="16" height="16"><use xlink:href='member_statistics.do'></use></svg>
          회원통계
        </a>
      </li>
    <hr>
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