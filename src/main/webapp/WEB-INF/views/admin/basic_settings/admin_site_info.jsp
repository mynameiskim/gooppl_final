<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .tr_bg{
   --bs-table-accent-bg: #24292f; !important;
}
</style>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div id="aside">
		<h5><b>기본설정</b></h5>
		<dl>
			<dt>사이트 정보관리</dt>
			<dd>
				<c:url var="site_info_Url" value="admin_site_info.do">
					<c:param name="goo_id">${sessionScope.sessionId}</c:param>
				</c:url>
				<b><a href='${site_info_Url}' style="color: white !important;"
				>-사이트 기본정보</a></b><br />
				<b><a href='admin_site_settings.do' style="color: white !important;"
				>-사이트 환경설정</a></b><br />
			</dd>
			<dt>관리자 설정</dt>
			<dd>
				<b><a href='admin_settings.do' style="color: white !important;"
					>-관리자 설정</a></b><br />
			</dd>
			<dt>가입약관 및 개인정보보호정책</dt>
			<dd>
				<b> <a href='admin_member_config.do' style="color: white !important;"
				>-약관 및 개인정보보호정책</a></b><br />
			</dd>
		</dl>
	</div>
	<div id="contents"><h6><b>사이트 기본정보</b></h6>
		<ul class='helpbox'>
			<li>사이트 기본정보를 관리하는 곳입니다.</li>
		</ul>
        <fieldset style="border: 3px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-3 mb-1">
                    <h5>사이트명</h5>
                </div>
            </div>
            <table class="table table-bordered" style="font-size: 12px;">
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">사이트명</th>
                    <td colspan="3" style="border: 1px solid #0000008c;">GooPPl</td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">사이트 URL</th>
                    <td colspan="3" style="border: 1px solid #0000008c;">http://test.com</td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">관리자 이메일</th>
                    <td colspan="3" style="border: 1px solid #0000008c;">${sessionScope.sessionId}</td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">관리자 전화번호</th>
                    <td style="border: 1px solid #0000008c;">${dto.admin_tel}</td>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">관리자 핸드폰</th>
                    <td style="border: 1px solid #0000008c;">${dto.admin_phone}</td>
                </tr>
            </table>
        </fieldset>   
        </div>         
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>