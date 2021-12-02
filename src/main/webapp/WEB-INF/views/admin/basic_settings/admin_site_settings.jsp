<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .tr_bg{
   --bs-table-accent-bg: #1987541f !important;

}
th{
    vertical-align: middle;
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
	<div id="contents"><h6><b>사이트 환경설정</b></h6>
		<ul class='helpbox'>
			<li>사이트 환경성정을 관리하는 곳입니다.</li>
		</ul>
		<form name="site_settings" action="site_settings_update.do">
        <fieldset style="border: 3px solid #dde0e5; padding: 12px 14px 10px;
		margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-4 mb-1">
                    <h5>GooPPl 상단 설정</h5>
                </div>
            </div>
            <table class="table table-bordered" style="font-size: 13px;">
                <tr>
                    <th class="tr_bg" >웹브라우저 Title</th>
                    <td>
                        <div>
                            <input type="text" style="width: 500px;" name="web_browser_title" value="${sessionScope.dto.web_browser_title}">
                        </div>
                        <div style="width: 100%;" >
                            <label style="padding: 3px; font-size: 10px; color: deepskyblue;" >* 웹 브라우저 상단에 노출되는 사이트 소개 문구를 등록/관리할 수 있습니다.</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="tr_bg">검색엔진<br>키워드설정</th>
                    <td>
                        <div>
                            <label style="padding: 1px 0px; font-weight: 800;">Description(쇼핑몰설명)</label><label style="font-size: 10px; color: deepskyblue;">&nbsp;* 영문,한글,숫자만 입력하세요.</label>
                        </div>
                        <div>
                            <input type="text" style="width: 500px;" name="description" value="${sessionScope.dto.description}">
                        </div>
                        <div>
                            <label style="padding: 1px 0px; font-weight: 800;">Keyword</label><label style="font-size: 10px; color: deepskyblue;">&nbsp;* 영문,한글,숫자만 입력하세요.</label>
                        </div>
                        <div>
                            <input type="text" style="width: 500px;" name="keyword" value="${sessionScope.dto.keyword}">
                        </div>
                        <div style="width: 100%;" >
                            <label style="padding: 3px; font-size: 10px; color: deepskyblue;" >* 검색엔진에서 검색시 나타나게 할 컴색키워드를 적어주세여.</label>
                        </div>
                        <br>
                        <div>
                            <ul>
                                <li style="list-style-type: square;">Description : 200자 이내의 문자(특수문자를 사용하시면 안됩니다.한글/영문/숫자만 입력하세요.)</li>
                                <li style="list-style-type: square;">Keyword : 70자 이내로 작성하시고,같은단어를 3회 이상 반복하시면 안됩니다.</li>
                            </ul>    
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="tr_bg">파비콘</th>
                    <td><input type="button" value="파비콘 업로드"  style="background-color: lightslategray; color: white;" name="favicon">
                    <div>
                        <label style="padding: 3px; font-size: 10px; color: deepskyblue;" >* 사이즈 16X16의 아이콘 이미지(확장자:ico)</label>
                    </div>
                </td>
                </tr>
                <tr>
                	<td colspan="2" class="text-center"><input type="submit" value="확인"></td>
                </tr>
            </table>
        </fieldset>
        </form>  
        </div>          
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>