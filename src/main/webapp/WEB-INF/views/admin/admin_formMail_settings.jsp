<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/myweb3//admin_css/admin_common.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.tb_hover{
	--bs-table-hover-bg: #1987541f !important;
	border-top:none !important;
}
.tr_bg{
	background-color: #1987541f !important;;
}
caption{
	display:none;
}
</style>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>회원관리</b></h5>
		<dl>
			<dt>회원목록</dt>
			<dd>
				- <a href="/final/admin_member_list.jsp"
				>회원목록</a><br />
			</dd>
			<dt>탈퇴회원목록</dt>
			<dd>
				- <a href="/final/admin_member_out.jsp"
					>탈퇴회원목록</a><br />
			</dd>
			<dt>폼메일 관리</dt>
			<dd>
				- <a href="/final/admin_email_settings.jsp"
				>폼메일 관리</a><br />
			</dd>
		</dl>
	</div>
</div>
<div id="contents">
	<h3>폼메일 관리</h3>
		<ul class='helpbox'>
			<li>여러가지 상황(회원가입축하 메일,비밀번호찾기 메일 등)에 따른 폼메일을 관리할 수 있습니다.</li>
		</ul>
<script type="text/javascript">
//<![CDATA[
function changeCode(item) {
	location.href="mail_form.do?code="+item.options[item.selectedIndex].value;
}

function openPreview() {
	var f = document.Frm;

	if (isEmpty(f.content)) {
		alert("내용을 입력해주세요.");
		return false;
	}

	openPopup("../../dummy.htm", "PreviewMailForm", 737, 600, "scrollbars=1");

	f.target = "PreviewMailForm";
	f.action = "mail_form_preview_pop.do";
	f.submit();
}

function validSubmit() {
	var f = document.Frm;

	if (confirm("위 내용으로 설정을 저장하시겠습니까?")) {
		f.target = "_self";
		f.action = "mail_form_act.do";
		f.submit();
	}
}
//]]>
</script>

<form name="Frm" method="post">
		<table class="table table-hover table-bordered tb_hover">
		<caption>메일폼 수정</caption>
		<colgroup><col width="130"><col width="*"></colgroup>
		<thead style="border-top:none !important;">
			<tr>
				<th class="text-center tr_bg">메일폼</th>
				<td>
				<select id='code' name='code'  onChange='changeCode(this);' ><option value='201'  >회원가입</option><option value='204'  >비밀번호찾기</option><option value='301'  >지원완료</option><option value='302'  >지원승인</option><option value='503'  >공급상품답글</option><option value='504'  >제안신청</option><option value='505'  >제안승인</option></select></td>
			</tr>
			<tr>
				<th class="text-center tr_bg">메일 제목</th>
				<td>
					<input name="subject" class="text_input" style="width:98%" value="입력하신 메일 제목으로 자동 입력" maxlength="100">
				</td>
			</tr>
		</thead>
		<tbody style="border-top:none !important;">
		<tr>
			<td colspan="2" style="padding:0" class="text-center">
				<textarea name="content" class="text_input" style="height:350px;width:99%;border:0">&lt;&lt;table style="border-collapse: collapse;table-layout: fixed;min-width: 320px;width: 45%;background-color: #ff6224; margin-left:30%" cellpadding="0" cellspacing="0" role="presentation"&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div role="banner"&gt;
                    &lt;div style="Margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;width: calc(28000% - 167440px);"&gt;
                        &lt;div style="border-collapse: collapse;display: table;width: 100%;"&gt;                            
                            &lt;div style="display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;width: calc(14000% - 78120px);padding: 10px 0 5px 0;color: #47805e;font-family: NanumSquare_ac;"&gt;
                            &lt;/div&gt;
                            &lt;div style="display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;width: calc(14100% - 78680px);padding: 10px 0 5px 0;text-align: right;color: #47805e;font-family: NanumSquare_ac;"&gt;
                            &lt;/div&gt;
                            
                        &lt;/div&gt;
                    &lt;/div&gt;
                    &lt;div style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);"&gt;                        
                        &lt;div style="font-size: 26px;line-height: 32px;Margin-top: 10px;Margin-bottom: 19px;color: #41637e;font-family: NanumSquare_ac;" align="center"&gt;
                            &lt;div align="left"&gt;&lt;a style="text-decoration: none;transition: opacity 0.1s ease-in;color: #41637e;" href="https://private.cmail19.com/t/y-i-ojkuttl-l-r/" rel="noopener noreferrer" target="_blank"&gt;&lt;img style="display: block;height: auto;width: 100%;border: 0;max-width: 217px;" src="http://i1.cmail19.com/ei/y/57/227/B68/181327/csfinal/logo_1.png" alt="" width="217"&gt;&lt;/a&gt;&lt;/div&gt;
                        &lt;/div&gt;                        
                    &lt;/div&gt;
                &lt;/div&gt;
                &lt;div&gt;
                    &lt;div style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;"&gt;
                        &lt;div style="border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;"&gt;                        
                            &lt;div style="text-align: left;color: #697d71;font-size: 14px;line-height: 21px;font-family: NanumSquare_ac;"&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 12px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;"&gt;
                                        &lt;h1 style="font-weight: 400;Margin-top: 35px;Margin-bottom: 35px;font-style: normal;color: #47805e;font-size: 30px;line-height: 32px;font-family: NanumSquare_ac;text-align: center;" lang="x-size-28"&gt;&lt;span&gt;&lt;span style="color:#151513"&gt;셀러매치 가입을 환영합니다!&lt;/span&gt;&lt;/span&gt;&lt;/h1&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="display: block;font-size: 2px;line-height: 2px;Margin-left: auto;Margin-right: auto;width: 100%;background-color: #000000;Margin-bottom: 20px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 10px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 5px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;"&gt;
                                        &lt;h3 style="font-weight: 400;Margin-top: 0;Margin-bottom: 0;font-style: normal;color: #d1e9dc;font-size: 18px;line-height: 24px;font-family: NanumSquare_ac;text-align: left;"&gt;&lt;span style="color:#151513"&gt;안녕하세요, &lt;/span&gt; 'AAA'&lt;span style="color:#151513"&gt;님!&lt;/span&gt;&lt;/h3&gt;
                                        &lt;h3 style="font-weight: 400;Margin-top: 12px;Margin-bottom: 12px;font-style: normal;color: #d1e9dc;font-size: 18px;line-height: 24px;font-family: NanumSquare_ac;"&gt;&lt;span style="color:#151513"&gt;셀러매치에 가입해주셔서 감사합니다.&lt;/span&gt;&lt;/h3&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 25px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;

                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;"&gt;
                                        &lt;h3 style="font-weight: 400;Margin-top: 0;Margin-bottom: 0;font-style: normal;color: #d1e9dc;font-size: 18px;line-height: 24px;font-family: NanumSquare_ac;text-align: left;"&gt;&lt;span style="color:#151513"&gt;판매자와 공급자를 잇는 공간,&lt;/span&gt;&lt;/h3&gt;
                                        &lt;h3 style="font-weight: 400;Margin-top: 12px;Margin-bottom: 12px;font-style: normal;color: #d1e9dc;font-size: 18px;line-height: 24px;font-family: NanumSquare_ac;"&gt;&lt;span style="color:#151513"&gt;셀러매치는 단순한 도매사이트가 아닙니다.&lt;/span&gt;&lt;/h3&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 25px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;"&gt;
                                        &lt;h3 style="font-weight: 400;Margin-top: 0;Margin-bottom: 0;font-style: normal;color: #d1e9dc;font-size: 18px;line-height: 24px;font-family: NanumSquare_ac;text-align: left;"&gt;&lt;span style="color:#151513"&gt;거래처 매칭 1회만 등록하면&lt;/span&gt;&lt;/h3&gt;
                                        &lt;h3 style="font-weight: 400;Margin-top: 12px;Margin-bottom: 12px;font-style: normal;color: #d1e9dc;font-size: 18px;line-height: 24px;font-family: NanumSquare_ac;"&gt;&lt;span style="color:#151513"&gt;가장 쉽고, 빠르고, 효율적인 거래를 할 수 있습니다.&lt;/span&gt;&lt;/h3&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 25px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px; margin-bottom: 30px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;"&gt;
                                        &lt;h3 style="font-weight: 400;Margin-top: 0;Margin-bottom: 12px;font-style: normal;color: #d1e9dc;font-size: 18px;line-height: 24px;font-family: NanumSquare_ac;text-align: left;"&gt;&lt;span style="color:#151513"&gt;앞으로 더욱 좋은 서비스로 보답하겠습니다.&lt;/span&gt;&lt;/h3&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 5px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;"&gt;
                                        &lt;h3 style="Margin-top: 0;Margin-bottom: 0;font-style: normal;color: #d1e9dc;font-size: 18px;line-height: 24px;font-family: NanumSquare_ac;"&gt;&lt;span style="color:#151513"&gt;- 셀러매치의 특징&lt;/span&gt;&lt;/h3&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                    &lt;div style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;"&gt;
                        &lt;div style="border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;"&gt;
                            &lt;div style="text-align: left;color: #697d71;font-size: 14px;line-height: 21px;font-family: NanumSquare_ac;max-width: 320px;min-width: 300px; width: 320px;width: calc(12300px - 2000%);Float: left;"&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 12px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 5px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="Margin-bottom: 20px;text-align: center;"&gt;
                                        &lt;a style="border-radius: 4px;display: block;font-size: 18px;font-weight: bold;line-height: 22px;padding: 10px 20px;text-align: center;text-decoration: none !important;transition: opacity 0.1s ease-in;color: #ffffff !important;background-color: #ff6224;font-family: NanumSquare_ac;" href="https://private.cmail19.com/t/y-i-ojkuttl-l-y/" rel="noopener noreferrer" target="_blank"&gt;돈되는, 팔만한 물건 찾기 OK&lt;/a&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;Margin-bottom: 12px;"&gt;
                                    &lt;div style="text-align: center;"&gt;
                                        &lt;a style="border-radius: 4px;display: block;font-size: 18px;font-weight: bold;line-height: 22px;padding: 10px 20px;text-align: center;text-decoration: none !important;transition: opacity 0.1s ease-in;color: #ffffff !important;background-color: #ff6224;font-family: NanumSquare_ac;" href="https://private.cmail19.com/t/y-i-ojkuttl-l-j/" rel="noopener noreferrer" target="_blank"&gt;조건에 맞는 공급제안 받기 OK&lt;/a&gt;

                                    &lt;/div&gt;
                                &lt;/div&gt;
                            &lt;/div&gt;
                            &lt;div style="text-align: left;color: #697d71;font-size: 14px;line-height: 21px;font-family: NanumSquare_ac;max-width: 320px;min-width: 300px; width: 320px;width: calc(12300px - 2000%);Float: left;"&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 12px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 5px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="Margin-bottom: 20px;text-align: center;"&gt;
                                        &lt;a style="border-radius: 4px;display: block;font-size: 18px;font-weight: bold;line-height: 22px;padding: 10px 20px;text-align: center;text-decoration: none !important;transition: opacity 0.1s ease-in;color: #ffffff !important;background-color: #ff6224;font-family: NanumSquare_ac;" href="https://private.cmail19.com/t/y-i-ojkuttl-l-t/" rel="noopener noreferrer" target="_blank"&gt;잘파는, 검증된 판매자 찾기 OK&lt;/a&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;Margin-bottom: 12px;"&gt;
                                    &lt;div style="text-align: center;"&gt;
                                        &lt;!--[if !mso]--&gt;&lt;a style="border-radius: 4px;display: block;font-size: 18px;font-weight: bold;line-height: 22px;padding: 10px 20px;text-align: center;text-decoration: none !important;transition: opacity 0.1s ease-in;color: #ffffff !important;background-color: #ff6224;font-family: NanumSquare_ac;" href="https://private.cmail19.com/t/y-i-ojkuttl-l-i/" rel="noopener noreferrer" target="_blank"&gt;간편한 제안서 보내기OK&lt;/a&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;
                            &lt;/div&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                    &lt;div style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;"&gt;
                        &lt;div style="border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;"&gt;
                            &lt;div style="text-align: left;color: #697d71;font-size: 14px;line-height: 21px;font-family: NanumSquare_ac;"&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 34px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;
                                &lt;div style="Margin-left: 20px;Margin-right: 20px;"&gt;
                                    &lt;div style="Margin-bottom: 20px;text-align: center;"&gt;
                                        &lt;!--[if !mso]--&gt;&lt;a style="border-radius: 4px;display: inline-block;font-size: 18px;font-weight: bold;line-height: 24px;padding: 12px 24px;text-align: center;text-decoration: none !important;transition: opacity 0.1s ease-in;color: #ffffff !important;background-color: #ff6224;font-family: NanumSquare_ac;" href="https://private.cmail19.com/t/y-i-ojkuttl-l-d/" rel="noopener noreferrer" target="_blank"&gt;셀러매치 바로가기&lt;/a&gt;
                                    &lt;/div&gt;
                                &lt;/div&gt;

                                &lt;div style="Margin-left: 20px;Margin-right: 20px;Margin-bottom: 12px;"&gt;
                                    &lt;div style="mso-line-height-rule: exactly;line-height: 5px;font-size: 1px;"&gt; &lt;/div&gt;
                                &lt;/div&gt;

                            &lt;/div&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;

                    &lt;div style="mso-line-height-rule: exactly;line-height: 20px;font-size: 20px;"&gt; &lt;/div&gt;

                &lt;/div&gt;
                &lt;div role="contentinfo"&gt;
                    &lt;div style="line-height:4px;font-size:4px;"&gt; &lt;/div&gt;
                    &lt;div style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;"&gt;
                        &lt;div style="border-collapse: collapse;display: table;width: 100%;"&gt;
                            &lt;div style="text-align: left;font-size: 12px;line-height: 19px;color: #47805e;font-family: NanumSquare_ac;display: none;"&gt;
                                &lt;div style="font-size: 26px;line-height: 32px;Margin-top: 10px;Margin-bottom: 19px;color: #7b663d;font-family: NanumSquare_ac;" align="center"&gt;
                                    &lt;div emb-flexible-footer-logo="" align="center"&gt;&lt;/div&gt;
                                &lt;/div&gt;
                            &lt;/div&gt;
                            &lt;div style="text-align: left;font-size: 12px;line-height: 19px;color: #47805e;font-family: NanumSquare_ac;display: none;"&gt;
                                &lt;div style="margin-left: 0;margin-right: 0;Margin-top: 10px;Margin-bottom: 10px;"&gt;
                                    &lt;div&gt;




                                    &lt;/div&gt;
                                &lt;/div&gt;
                            &lt;/div&gt;
                            &lt;table style="border-collapse: collapse;table-layout: fixed;display: inline-block;width: 585px;" cellpadding="0" cellspacing="0"&gt;
                                &lt;tbody&gt;
                                    &lt;tr&gt;
                                        &lt;td&gt;
                                            &lt;div style="text-align: left;font-size: 16px;line-height: 19px;color: #47805e;font-family: NanumSquare_ac;display: inline-block;width: 585px;"&gt;
                                                &lt;div style="margin-left: 0;margin-right: 0;Margin-top: 10px;Margin-bottom: 10px;"&gt;
                                                    &lt;div style="font-size: 16px;line-height: 22px;margin-bottom: 18px;margin-right: 20px;margin-top: 0px;"&gt;
                                                        &lt;div bind-to="address"&gt;
                                                            
                                                            &lt;p style="Margin-top: 0;Margin-bottom: 0;font-family: NanumSquare_ac;"&gt;&lt;span&gt;&lt;span style="color:#ffffff"&gt;위셀글로벌(주) Copyright WeSellGlobal. All Rights Reserved.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
                                                            &lt;p style="Margin-top: 0;Margin-bottom: 0;font-family: NanumSquare_ac;"&gt;&lt;span&gt;&lt;span style="color:#ffffff"&gt;서울특별시 강남구 언주로 147길 43 (호성빌딩 1층)&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
                                                            &lt;p style="Margin-top: 0;Margin-bottom: 0;font-family: NanumSquare_ac;"&gt;&lt;span&gt;&lt;span style="color:#ffffff"&gt;TEL : 02-515-0923&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
                                                            &lt;p style="Margin-top: 0;Margin-bottom: 0;font-family: NanumSquare_ac;"&gt;&lt;span&gt;&lt;span style="color:#ffffff"&gt;본 메일은 발신전용 이메일 입니다.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
                                                        &lt;/div&gt;
                                                    &lt;/div&gt;

                                                &lt;/div&gt;
                                            &lt;/div&gt;
                                        &lt;/td&gt;
                                    &lt;/tr&gt;
                                &lt;/tbody&gt;
                            &lt;/table&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                    &lt;div style="line-height:40px;font-size:40px;"&gt; &lt;/div&gt;
                &lt;/div&gt;

            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;</textarea>
			</td>
		</tr>
		</tbody>
		<tfoot style="border-top:0px;">
			<tr>
				<td colspan="2" class="text-center">
				<button class="btn btn-secondary" type="button" onClick="openPreview()">미리보기</button>
				<button class="btn btn-secondary" type="button" onClick="validSubmit()">확인</button>
				</td>
			</tr>
		</tfoot>
		</table>


</form>

<!-- 설명 -->
		<div class="mgt20"><img src="/final/img/icon_tip.gif" alt="TIP" /></div>

		<div class="replacement">
			<h2>※ 치환코드<span>(내용 중 프로그램으로 된 정보를 뿌려줄때 아래와 같이 코드를 삽입합니다.)</span></h2>
			<p>기본정보</p>
			<ul>
				<li><span>{{SITE_ID}}</span> : 쇼핑몰 부여코드<span style="color:#3191b7">(싸이트 고유코드)</span></li>
				<li><span>{{SITE_DATA}}</span> : 쇼핑몰 데이터 경로(/data/base)</li>
				<li class="m"><span>{{IMG_URL}}</span> : 이미지 URL</li>

				<li class="m"><span>{{SHOP_URL}}</span> : 쇼핑몰 URL</li>
				<li><span>{{SHOP_NAME}}</span> : 쇼핑몰 이름</li>
				<li><span>{{SHOP_MAIL}}</span> : 쇼핑몰 메일</li>

				<li class="m"><span>{{SHOP_COMPANY}}</span> : 회사명</li>
				<li><span>{{SHOP_BIZ_NO}}</span> : 사업자등록번호</li>
				<li><span>{{SHOP_TONGSIN_NO}}</span> : 통신판매업신고번호</li>
				<li><span>{{SHOP_CEO_NAME}}</span> : 대표자</li>
				<li><span>{{SHOP_SECURITY_NAME}}</span> : 개인정보담당자</li>
				<li><span>{{SHOP_SECURITY_EMAIL}}</span> : 개인정보담당자 이메일</li>
				<li><span>{{SHOP_TEL}}</span> : 회사 전화번호</li>
				<li><span>{{SHOP_FAX}}</span> : 회사 팩스</li>
				<li><span>{{SHOP_POST}}</span> : 회사 우편번호</li>
				<li><span>{{SHOP_ADDR}}</span> : 회사 주소</li>

				<li class="m"><span>{{MAKE_DATE}}</span> : 메일 작성일자</li>
				<li><span>{{MAIL_TOP}}</span> : 메일 상단 내용</li>
				<li><span>{{MAIL_FOOTER}}</span> : 메일 하단 내용</li>
			</ul>

			<p>기본메일폼</p>
			<ul>
				<li><span>{{SUBJECT}}</span> : 제목</li>
				<li><span>{{CONTENT}}</span> : 내용</li>
			</ul>

			<p>회원가입</p>
			<ul>
				<li><span>{{MEMBER_NAME}}</span> : 회원명</li>
				<li><span>{{MEMBER_ID}}</span> : 아이디</li>
				<li><span>{{MEMBER_EMAIL}}</span> : 이메일</li>
			</ul>

			<p>회원등급변경</p>
			<ul>
				<li><span>{{MEMBER_NAME}}</span> : 회원명</li>
				<li><span>{{MEMBER_ID}}</span> : 아이디</li>
				<li><span>{{LEVEL_BEFORE}}</span> : 기존등급</li>
				<li><span>{{LEVEL_NEW}}</span> : 변경등급</li>
			</ul>

			<p>아이디 찾기</p>
			<ul>
				<li><span>{{MEMBER_NAME}}</span> : 회원명</li>
				<li><span>{{MEMBER_ID}}</span> : 아이디</li>
			</ul>

			<p>비밀번호 찾기</p>
			<ul>
				<li><span>{{MEMBER_NAME}}</span> : 회원명</li>
				<li><span>{{MEMBER_ID}}</span> : 아이디</li>
				<li><span>{{MEMBER_PW}}</span> : 임시비밀번호</li>
			</ul>

			<p>회원탈퇴</p>
			<ul>
				<li><span>{{MEMBER_NAME}}</span> : 이름</li>
				<li><span>{{MEMBER_ID}}</span> : 아이디</li>
			</ul>

			<p>주문완료, 주문입금확인, 주문배송완료</p>
			<ul>
				<li><span>{{ORDER_NO}}</span> : 주문번호</li>
				<li><span>{{ORDER_YEAR}}</span> : 주문일자 년</li>
				<li><span>{{ORDER_MONTH}}</span> : 주문일자 월</li>
				<li><span>{{ORDER_DAY}}</span> : 주문일자 일</li>
				<li><span>{{ORDER_HOUR}}</span> : 주문일자 시</li>
				<li><span>{{ORDER_MINUTE}}</span> : 주문일자 분</li>
				<li><span>{{ORDER_SECOND}}</span> : 주문일자 초</li>
				<li><span>{{CONFIRM_YEAR}}</span> : 입금일자 년</li>
				<li><span>{{CONFIRM_MONTH}}</span> : 입금일자 월</li>
				<li><span>{{CONFIRM_DAY}}</span> : 입금일자 일</li>
				<li><span>{{CONFIRM_HOUR}}</span> : 입금일자 시</li>
				<li><span>{{CONFIRM_MINUTE}}</span> : 입금일자 분</li>
				<li><span>{{CONFIRM_SECOND}}</span> : 입금일자 초</li>
				<li><span>{{PAY_WAY}}</span> : 결제수단</li>
				<li><span>{{PAY_INFO}}</span> : 결제방법</li>

				<li class="m"><span>{{ORDER_PRICE}}</span> : 주문금액</li>
				<li><span>{{DELIVERY_FEE}}</span> : 배송비</li>
				<li><span>{{DISCOUNT_PRICE}}</span> : 할인금액</li>
				<li><span>{{PAYMENT}}</span> : 결제금액</li>

				<li class="m"><span>{{ORD_NAME}}</span> : 주문자명</li>
				<li><span>{{ORD_TEL}}</span> : 주문자 전화번호</li>
				<li><span>{{ORD_MOBILE}}</span> : 주문자 휴대전화번호</li>
				<li><span>{{ORD_ADDRESS}}</span> : 주문자 주소</li>
				<li><span>{{ORD_EMAIL}}</span> : 주문자 이메일</li>

				<li class="m"><span>{{RCV_NAME}}</span> : 수령인명</li>
				<li><span>{{RCV_TEL}}</span> : 수령인 전화번호</li>
				<li><span>{{RCV_MOBILE}}</span> : 수령인 휴대전화번호</li>
				<li><span>{{RCV_ADDRESS}}</span> : 수령인 주소</li>
				<li><span>{{DEMAND}}</span> : 배송요청사항</li>

				<li class="m"><span>{{@GOODS_LIST}}</span> : 주문상품 시작</li>
				<li class="child">
					<ul>
						<li><span>{{GOODS_LIST_NAME}}</span> : 상품명</li>
						<li><span>{{GOODS_LIST_URL_PAGE}}</span> : 상품상세페이지 URL</li>
						<li><span>{{GOODS_LIST_URL_IMAGE}}</span> : 상품이미지 URL</li>
						<li><span>{{GOODS_LIST_OPTION}}</span> : 주문옵션</li>
						<li><span>{{GOODS_LIST_EA}}</span> : 주문수량</li>
						<li><span>{{GOODS_LIST_PRICE}}</span> : 주문금액</li>
					</ul>
				</li>
				<li><span>{{/GOODS_LIST}}</span> : 주문내역 종료</li>
			</ul>

			<p>주문취소신청, 주문취소완료, 주문교환신청, 주문교환완료, 주문반품신청, 주문반품완료</p>
			<ul>
				<li><span>{{ORDER_NO}}</span> : 주문번호</li>
				<li><span>{{ORDER_YEAR}}</span> : 주문일자 년</li>
				<li><span>{{ORDER_MONTH}}</span> : 주문일자 월</li>
				<li><span>{{ORDER_DAY}}</span> : 주문일자 일</li>
				<li><span>{{ORDER_HOUR}}</span> : 주문일자 시</li>
				<li><span>{{ORDER_MINUTE}}</span> : 주문일자 분</li>
				<li><span>{{ORDER_SECOND}}</span> : 주문일자 초</li>

				<li class="m"><span>{{ORDER_PRICE}}</span> : 주문금액</li>
				<li><span>{{ORDER_PRICE_INFO}}</span> : 주문금액내역</li>
				<li><span>{{DISCOUNT_PRICE}}</span> : 할인금액</li>
				<li><span>{{DISCOUNT_PRICE_INFO}}</span> : 할인금액내역</li>
				<li><span>{{DELIVERY_FEE}}</span> : 배송비</li>
				<li><span>{{PAYMENT}}</span> : 결제금액</li>
				<li><span>{{PAY_WAY}}</span> : 결제수단</li>

				<li class="m"><span>{{?PAY_BANK}}</span> : 결제계좌 분기 시작</li>
				<li class="child">
					<ul>
						<li><span>{{PAY_BANK}}</span> : 결제계좌</li>
					</ul>
				</li>
				<li><span>{{/PAY_BANK}}</span> : 결제계좌 분기 종료</li>

				<li class="m"><span>{{ORD_NAME}}</span> : 주문자명</li>

				<li class="m"><span>{{RCV_NAME}}</span> : 수령인명</li>
				<li><span>{{RCV_TEL}}</span> : 수령인 전화번호</li>
				<li><span>{{RCV_MOBILE}}</span> : 수령인 휴대전화번호</li>
				<li><span>{{RCV_ADDRESS}}</span> : 수령인 주소</li>
				<li><span>{{DEMAND}}</span> : 배송요청사항</li>

				<li class="m"><span>{{?REFUND}}</span> : 환불정보 분기 시작</li>
				<li class="child">
					<ul>
						<li><span>{{REFUND_GOODS_PRICE}}</span> : 취소상품금액</li>
						<li><span>{{REFUND_DELIVERY_FEE}}</span> : 취소배송비</li>
						<li><span>{{DIFFER_COUPON_DISCOUNT_PRICE}}</span> : 쿠폰할인 변동금액</li>
						<li><span>{{DIFFER_CMONEY}}</span> : 마일리지할인 변동금액</li>
						<li><span>{{REFUND_SUM_PRICE}}</span> : 취소금액 합계</li>
						<li><span>{{EXTRA_DELIVERY_FEE}}</span> : 추가배송비</li>
						<li><span>{{EXTRA_SUM_PRICE}}</span> : 차감금액 합계</li>
						<li><span>{{REFUND_PRICE}}</span> : 환불(예정)금액</li>
					</ul>
				</li>
				<li><span>{{/REFUND}}</span> : 환불정보 분기 종료</li>

				<li class="m"><span>{{@GOODS_LIST}}</span> : 요청상품 반복 시작</li>
				<li class="child">
					<ul>
						<li><span>{{GOODS_LIST_NAME}}</span> : 상품명</li>
						<li><span>{{GOODS_LIST_URL_PAGE}}</span> : 상품상세페이지 URL</li>
						<li><span>{{GOODS_LIST_URL_IMAGE}}</span> : 상품이미지 URL</li>
						<li><span>{{GOODS_LIST_OPTION}}</span> : 주문옵션</li>
						<li><span>{{GOODS_LIST_EA}}</span> : 요청수량</li>
					</ul>
				</li>
				<li><span>{{/GOODS_LIST}}</span> : 요청상품 반복 종료</li>
			</ul>

			<p>세금계산서</p>
			<ul>
				<li><span>{{ORDER_NAME}}</span> : 주문자명</li>
				<li><span>{{ORDER_YEAR}}</span> : 주문일자 년</li>
				<li><span>{{ORDER_MONTH}}</span> : 주문일자 월</li>
				<li><span>{{ORDER_DAY}}</span> : 주문일자 일</li>
				<li><span>{{ORDER_HOUR}}</span> : 주문일자 시</li>
				<li><span>{{ORDER_MINUTE}}</span> : 주문일자 분</li>
				<li><span>{{ORDER_SECOND}}</span> : 주문일자 초</li>
				<li><span>{{TAX_URL}}</span> : 세금계산서 URL</li>
			</ul>
			
<p>입점업체 가입</p>
			<ul>
				<li><span>{{DEALER_ID}}</span> : 신청아이디</li>
				<li><span>{{DEALER_NAME}}</span> : 회사명</li>
				<li><span>{{BIZ_NO}}</span> : 사업자등록번호</li>
				<li><span>{{BIZ_CONDITION}}</span> : 업태</li>
				<li><span>{{BIZ_ITEM}}</span> : 종목</li>
				<li><span>{{REMIT_DEPOSITOR}}</span> : 정산 계좌명의</li>
				<li><span>{{REMIT_BANK}}</span> : 정산 은행</li>
				<li><span>{{REMIT_ACCOUNT}}</span> : 정산 계좌번호</li>
				<li><span>{{CHARGE_NAME}}</span> : 담당자 이름</li>
				<li><span>{{CHARGE_POSITION}}</span> : 담당자 직위</li>
				<li><span>{{TEL}}</span> : 전화번호</li>
				<li><span>{{MOBILE}}</span> : 휴대전화번호</li>
				<li><span>{{FAX}}</span> : 팩스번호</li>
				<li><span>{{EMAIL}}</span> : 이메일</li>
				<li><span>{{HOMEPAGE}}</span> : 홈페이지</li>
				<li><span>{{ADDRESS}}</span> : 주소</li>
				<li><span>{{MEMO}}</span> : 기타사항</li>
				<li><span>{{MD_NAME}}</span> : MD 이름</li>
				<li><span>{{MD_EMAIL}}</span> : MD 이메일</li>
			</ul>

			<p>입점업체 승인</p>
			<ul>
				<li><span>{{DEALER_ID}}</span> : 신청아이디</li>
				<li><span>{{DEALER_NAME}}</span> : 업체명</li>
				<li><span>{{BIZ_NO}}</span> : 사업자등록번호</li>
				<li><span>{{CHARGE_NAME}}</span> : 담당자 이름</li>
				<li><span>{{MD_NAME}}</span> : MD 이름</li>
				<li><span>{{MD_EMAIL}}</span> : MD 이메일</li>
			</ul>
<p>1:1문의답변</p>
			<ul>
				<li><span>{{MEMBER_NAME}}</span> : 회원 이름</li>
				<li><span>{{MEMBER_ID}}</span> : 회원 아이디</li>
				<li><span>{{QUESTION_SUBJECT}}</span> : 문의 제목</li>
				<li><span>{{QUESTION_CONTENT}}</span> : 문의 내용</li>
				<li><span>{{ANSWER_SUBJECT}}</span> : 답변 제목</li>
				<li><span>{{ANSWER_CONTENT}}</span> : 답변 내용</li>
			</ul>

			<p>게시판답변</p>
			<ul>
				<li><span>{{BOARD}}</span> : 게시판명</li>
				<li><span>{{BOARD_URL}}</span> : 게시물 주소</li>
				<li><span>{{QUESTION_WRITER}}</span> : 질문자</li>
				<li><span>{{QUESTION_SUBJECT}}</span> : 질문제목</li>
				<li><span>{{QUESTION_CONTENT}}</span> : 질문내용</li>
				<li><span>{{ANSWER_WRITER}}</span> : 답변자</li>
				<li><span>{{ANSWER_SUBJECT}}</span> : 답변제목</li>
				<li><span>{{ANSWER_CONTENT}}</span> : 답변내용</li>
			</ul>

			<p>메일상단내용</p>
			<ul>
				<li><span>{{LOGO_TOP}}</span> : 상단 로고</li>
			</ul>

			<p>메일하단내용</p>
			<ul>
				<li><span>{{LOGO_FOOT}}</span> : 하단 로고</li>
			</ul>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>