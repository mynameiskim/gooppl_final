<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="margin-top: 27px; width: 210px; float: left; color: #24292f !important;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-left:15px;"
    ">
      <svg width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-6"><b>기본설정</b></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item" style="margin: 10px 0;">
        <a href='admin_site_info.do?goo_id=${sessionScope.sessionId}' style="padding-left:20px; font-size: 13px; background-color: #24292f; color: white !important;" class="nav-link active" aria-current="page">
          <svg width="16" height="16"><use xlink:href='admin_site_info.do?goo_id=${sessionScope.sessionId}'></use></svg>
          사이트 기본정보
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_site_settings.do' class="nav-link text-white" style="padding-left:20px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_site_settings.do'></use></svg>
          사이트 환경설정
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_settings.do' class="nav-link text-white" style="padding-left:30px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_settings.do'></use></svg>
          관리자 설정
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_member_config.do' class="nav-link text-white" style="font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_member_config.do'></use></svg>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;약관 및 <br>&nbsp;&nbsp;&nbsp;&nbsp;개인정보보호정책
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_inquiry.do' class="nav-link text-white" style="padding-left:40px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_inquiry.do'></use></svg>
          문의 관리
        </a>
      </li>
    </ul>
    <hr>
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
			<c:url var="site_info_Url" value="admin_site_info.do">
				<c:param name="goo_id">${sessionScope.sessionId}</c:param>
			</c:url>
			<dt><a href="${site_info_Url}" style="color: white !important;"
				>사이트 기본정보</a>
			</dt>
			<dd>
				<a href='${site_info_Url}'
				>사이트 운영에 필요한 가장 기초적인 정보를 관리하는 메뉴 입니다.<br>
				관리자 이메일,관리자 휴대폰,관리자 전화번호는 사이트 운영에 영향이 미치는 값으로 정확히 입력해야합니다.
				</a>
			</dd>
		</dl>
		<dl class="menu_list">
			<dt>
				<a href='admin_site_settings.do' style="color: white !important;"
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
				<a href='admin_settings.do' style="color: white !important;"
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
				<a href='admin_member_config.do' style="color: white !important;"
					>약관 및 개인정보보호정책
				</a></dt>
			<dd>
				<a href='admin_member_config.do'
					>회원가입시 약관동의 페이지에 나오는 가입약관과 개인정보 보호정책 내용을 관리 합니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>문의 관리</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href='admin_inquiry.do' style="color: white !important;"
					>문의 관리
				</a></dt>
			<dd>
				<a href='admin_inquiry.do'
					>사용자의 문의사항에 답변을 해주는 곳입니다.
				</a>
			</dd>
		</dl>
		</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>