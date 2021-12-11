<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
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
				 <a href="admin_formmail_settings.do" style="color: white !important;"
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