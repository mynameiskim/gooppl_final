<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .tr_bg{
   --bs-table-accent-bg: #24292f; !important;
}
th{
    vertical-align: middle;
}
</style>
<script>
function siteSettingsUpdate(){
	
	$.ajax({
		type: "POST",
		data : new FormData($("#siteSettings")[0]),
		url: 'site_settings_update.do',
		enctype: 'multipart/form-data',
		processData: false,
	    contentType: false,
	    cache: false,
		dataType: "json",
		error: function(result){
			
		},
		success: function(result){
			if(result.code==1){
				Swal.fire({
			      title: result.msg,
			      icon:'success',
			      confirmButtonText: '확인',
			      confirmButtonColor: '#d33',
			      showLoaderOnConfirm: true,
			      allowOutsideClick:false
			    }).then((result) => {
			    	if (result.isConfirmed) {
			 			location.reload();
			    	}
			    })
			}else if(result.code==0){
				Swal.fire({
			      title: result.msg,
			      icon:'warning',
			      confirmButtonText: '확인',
			      confirmButtonColor: '#A4C399',
			      showLoaderOnConfirm: true,
			      allowOutsideClick:false
			    }).then((result) => {
			    	if (result.isConfirmed) {
			    		location.reload();
			    	}
			    })
			}
		}
	});
}
</script>
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
			<dt>문의 관리</dt>
			<dd>
				<b> <a href='admin_inquiry.do' style="color: white !important;"
				>-문의 관리</a></b><br />
			</dd>
		</dl>
	</div>
	<div id="contents"><h6><b>사이트 환경설정</b></h6>
		<ul class='helpbox'>
			<li>사이트 환경성정을 관리하는 곳입니다.</li>
		</ul>
		<form id="siteSettings" method="post" enctype="multipart/form-data">
        <fieldset style="border: 3px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-4 mb-1">
                    <h5>GooPPl 상단 설정</h5>
                </div>
            </div>
            <table class="table table-bordered " style="font-size: 13px;">
                <tr>
                    <th class="tr_bg" style="border: 1px solid #0000008c;"><label class="active text-white">웹브라우저 Title</label></th>
                    <td style="border: 1px solid #0000008c;">
                        <div>
                            <input id="web_browser_title" name="web_browser_title" type="text" style="width: 500px;" name="web_browser_title" value="${sessionScope.dto.web_browser_title}">
                        </div>
                        <div style="width: 100%;" >
                            <label style="padding: 3px; font-size: 10px; color: #106683;" >* 웹 브라우저 상단에 노출되는 사이트 소개 문구를 등록/관리할 수 있습니다.</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="tr_bg" style="border: 1px solid #0000008c;"><label class="active text-white">검색 엔진</label><br>
                    <label class="active text-white">키워드설정</label></th>
                    <td style="border: 1px solid #0000008c;">
                        <div>
                            <label style="padding: 1px 0px; font-weight: 800;">Description(쇼핑몰설명)</label><label style="font-size: 10px; color: #106683;">&nbsp;* 영문,한글,숫자만 입력하세요.</label>
                        </div>
                        <div>
                            <input id="description" name="description" type="text" style="width: 500px;" name="description" value="${sessionScope.dto.description}">
                        </div>
                        <div>
                            <label style="padding: 1px 0px; font-weight: 800;">Keyword</label><label style="font-size: 10px; color: #106683;">&nbsp;* 영문,한글,숫자만 입력하세요.</label>
                        </div>
                        <div>
                            <input id="keyword" name="keyword" type="text" style="width: 500px;" name="keyword" value="${sessionScope.dto.keyword}">
                        </div>
                        <div style="width: 100%;" >
                            <label style="padding: 3px; font-size: 10px; color: #106683;" >* 검색엔진에서 검색시 나타나게 할 컴색키워드를 적어주세여.</label>
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
                    <th class="tr_bg" style="border: 1px solid #0000008c;"><label class="active text-white">파비콘</label></th>
                    <td style="border: 1px solid #0000008c;"><input id="faviconFile" accept=".ico" name="faviconFile" type="file">
                    <div>
                        <label style="padding: 3px; font-size: 10px; color: #106683;" >* 사이즈 16X16의 아이콘 이미지(확장자:ico)</label>
                    </div>
                </td>
                </tr>
                <tr>
                	<td colspan="2" class="text-center"><input id="btnSubmit" type="submit" class="btn-dark" style="border-radius: 3px;" onclick="siteSettingsUpdate()" value="확인"></td>
                </tr>
            </table>
        </fieldset>
        </form>  
        </div>          
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="https://malsup.github.io/jquery.form.js"></script> 
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>