<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .tr_bg{
   --bs-table-accent-bg: #1987541f !important;
}
</style>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>기본설정</b></h5>
		<dl>
			<dt>사이트 정보관리</dt>
			<dd>
				<c:url var="site_info_Url" value="admin_site_info.do">
					<c:param name="goo_id">${sessionScope.sessionId}</c:param>
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
	<div id="contents"><h6><b>사이트 기본정보</b></h6>
		<ul class='helpbox'>
			<li>사이트 기본정보를 관리하는 곳입니다.</li>
		</ul>
        <fieldset style="border: 3px solid #dde0e5; padding: 12px 14px 10px;
		margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-3 mb-1">
                    <h5>사이트명</h5>
                </div>
            </div>
            <table class="table table-bordered" style="font-size: 12px;">
                <tr>
                    <th class="tr_bg">사이트명</th>
                    <td colspan="3">GooPPl</td>
                </tr>
                <tr>
                    <th class="tr_bg">사이트 URL</th>
                    <td colspan="3">http://test.com</td>
                </tr>
                <tr>
                    <th class="tr_bg">관리자 이메일</th>
                    <td colspan="3">${sessionScope.sessionId}</td>
                </tr>
                <tr>
                    <th class="tr_bg">관리자 전화번호</th>
                    <td>${dto.admin_tel}</td>
                    <th class="tr_bg">관리자 핸드폰</th>
                    <td>${dto.admin_phone}</td>
                </tr>
            </table>
        </fieldset>   
        </div>         
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>