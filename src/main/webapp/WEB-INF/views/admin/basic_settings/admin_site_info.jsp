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