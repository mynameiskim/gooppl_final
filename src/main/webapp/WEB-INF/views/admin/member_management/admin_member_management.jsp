<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="margin-top: 27px; width: 210px; float: left; color: #24292f !important;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-left:15px;"
    ">
      <svg width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-6"><b>회원관리</b></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item" style="margin: 10px 0;">
        <a href='admin_member_list.do' style="font-size: 13px; background-color: #24292f; padding-left: 41px; color: white !important;" class="nav-link active" aria-current="page">
          <svg width="16" height="16"><use xlink:href='admin_member_list.do'></use></svg>
          회원목록
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_member_out.do' class="nav-link text-white" style="font-size: 13px; padding-left: 28px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_member_out.do'></use></svg>
          탈퇴회원목록
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_formmail_settings.do' class="nav-link text-white" style="font-size: 13px; padding-left: 32px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_formmail_settings.do'></use></svg>
          폼메일 관리
        </a>
      </li>
    </ul>
    <hr>
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
			<dt><a href="admin_member_list.do" style="color: white !important;"
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
				<a href="admin_member_out.do" style="color: white !important;"
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
				<a href="admin_formmail_settings.do?form_type=회원가입" style="color: white !important;"
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