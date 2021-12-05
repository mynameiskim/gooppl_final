<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .tb_hover{
       --bs-table-hover-bg: lightgray !important;
    }
    .tr_bg{
       --bs-table-accent-bg: #24292f !important;
    }
    th{
        vertical-align: middle;
    }
    </style>
</head>
<body>
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
		</dl>
	</div>
	<div id="contents"><h6><b>가입약관 및 개인정보보호정책</b></h6>
		<ul class='helpbox'>
			<li>회원가입시 약관동의 페이지에 나오는 가입약관 및 개인정보 보호정책 내용을 관리합니다.</li>
		</ul>
        <table class="table table-hover tb_hover">
            <tbody style="border-top: 2px solid #0000008c;	border-bottom: 2px solid #0000008c;">
            <tr>
                <th>가입약관</th>
                <td><textarea cols="100" rows="10" style="resize: none;" readonly="readonly">임의로 작성한 서비스 이용약관

                    제 1 장 총 칙
                    제1조 목적
                    이 약관은 스투비(www.stubby.co.kr, www.stubbyplanner.com, www.stubbytour.com) 서비스(이하 "서비스"라 합니다)의 이용과 관련하여 현행 법령에 위반하지 않는 범위 내에서 회원의 기본적인 권리와 책임 및 당사와의 중요사항을 정하는 것을 목적으로 합니다.
                    
                    제2조 용어의 정의
                    이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
                    - '서비스'란 '회원'이 이용할 수 있는 스투비플래너 및 관련 제반 서비스를 의미합니다.
                    - '회원'이라 함은 '서비스'에 접속하여 이 약관에 동의하여 '서비스제공자'와 '이용계약'을 체결하고 '서비스제공자'의 '서비스'를 이용하는 자를 말합니다.
                    - '이용계약'이라 함은 이 약관에 따라 '서비스제공자'와 '회원'간에 체결하는 계약을 말합니다.
                    - '회사','서비스제공자'란 ' 주식회사 스투비플래너 혹은 주식회사 스투비플래너와 계약된 별도서비스 운영자를 뜻합니다.
                    - '아이디(ID)'라 함은 '회원'의 식별 및 '서비스'이용을 위하여 '회원'이 정하고 '서비스제공자'가 승인하는 문자와 숫자의 조합을 말합니다.
                    - '비밀번호'라 함은 '회원'의 본인 여부를 확인하고 정보보호를 위해 '회원' 자신이 선정한 문자와 숫자의 조합을 말합니다.
                    - '게시물'이라 함은 '회원'이 '서비스'를 이용함에 있어 게시한 부호,문자,화상 등의 정보형태의 여행계획,글,사진,동영상 및 각종 화일과 링크 등을 말합니다.
                    
                    제3조 약관의 효력 및 변경
                    (1) '서비스제공자'는 이 약관의 내용을 '회원'이 쉽게 알 수 있도록 '이용약관'화면 및 회원가입 절차시 게시합니다.
                    (2) 이 약관은 '서비스제공자'가 스투비플래너를 통해 공시함으로서 효력을 발생합니다.
                    (3) 이 약관에 동의하고 가입을 한 '회원'은 약관에 동의한 시점부터 약관의 적용을 받습니다.
                    (4) '서비스제공자'는 '약관의규제에관한법률', '정보통신망이용촉진및정보보호등에관한법률' 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
                    (5) '회원'은 개정약관에 동의하지 않을 경우 이용계약을 해지할 수 있습니다. 개정 시행일 이후 '회원'이 '서비스'를 이용하는 경우 개정약관에 동의한 것으로 간주합니다.
                    
                    제4조 약관 외 사항의 준칙
                    '서비스제공자'는 이 약관에서 정하지 않은 사항에 대해서는 관계법령, '서비스제공자'가 정한 '서비스'의 개별이용약관 또는 세부이용지침 등의 규정을 따르게됩니다.
                    
                    
                    제 2 장 서비스 이용계약 체결
                    제5조 이용 계약의 성립
                    '이용계약'은 '회원이 되고자 하는 자'가 약관의 내용에 동의하여 '서비스제공자'가 요청하는 양식에 정보를 입력하고 가입을 함으로써 체결됩니다.
                    
                    제6조 회원가입 및 변경
                    (1) '회원'으로 가입하여 '서비스'를 이용하기 위해서는 '서비스제공자'에서 요청하는 정보(이름, 이메일주소, 생년월일 등)을 제공하여야 합니다.
                    (2) 제1항에 따른 신청에 있어 '서비스제공자'는 '회원'의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
                    (3) '회원'가입은 반드시 본인의 정보를 통해야 하며, 타인의 명의와 개인정보를 무단으로 도용하거나 허위의 정보를 등록한 '회원'의 경우 '아이디'가 삭제되거나 관계법령에 따라 처벌을 받을 수 있습니다.
                    (4) '회원'은 언제든지 실명, 주민등록번호, 아이디를 제외한 개인의 정보를 열람하고 수정할 수 있습니다.
                    (5) '회원'의 '아이디' 및 '비밀번호'의 관리 책임은 '회원'에게 있습니다. 이를 소홀히 관리하여 발생하는 '서비스'이용상의 손해 또는 제3자에 의한 무단이용 등에 대한 책임은 '회원' 본인에게 있으므로 '서비스제공자'는 그에 대한 책임을 지지 않습니다.
                    (6) '서비스제공자'는 다음 각 호에 해당하는 신청에 대하여는 가입을 보류 또는 제한하거나 사후에 '계약'을 해지할 수 있습니다.
                    - '가입'신청자가 이 약관에 의거 이전에 '회원'자격을 상실한 적이 있는 경우,
                    단, '서비스제공자'의 재가입 승인을 얻은 경우는 예외로 합니다.
                    - 허위의 정보를 기재 혹은 실명이 아니거나 타인의 명의 또는 정보를 무단으로 이용한 경우.
                    - 14세 미만 아동이 법정대리인의 동의를 얻지 아니한 경우.
                    - 관계 법령을 위반하거나 사회적 미풍양속을 저해할 목적으로 '계약'을 신청한 경우.
                    - '회원'으로 등록하는 것이 '서비스제공자'의 기술상 지장이 있을 경우.
                    - 신청한 '아이디' 또는 '비밀번호'가 사생활침해 가능할 경우 혹은 운영자 등의 명칭과 오인될 우려가 있는 경우.
                    
                    
                    제 3 장 계약 당사자의 의무
                    제7조 '서비스제공자'의 의무
                    (1) '서비스제공자'는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 지속적이고 안정적으로 '서비스'를 제공하기 위하여 최선을 다하여 노력합니다.
                    (2) '서비스제공자'는 '회원'의 개인정보 보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.
                    (3) '서비스제공자'는 안정적인 '서비스' 제공을 위하여, 설비에 장애가 생기거나 손상된 때에는 부득이한 사유가 없는 한 지체없이 이를 수리 또는 복구합니다.
                    (4) '서비스제공자'는 회원의 신상정보를 본인의 승낙없이 외부로 유출하지 않습니다. 단, 적법한 절차를 거친 국가기관의 요구나 수사상 또는 기타 공익을 위하여 필요하다고 인정되는 경우에는 예외로 합니다.
                    (5) '서비스제공자'는 '회원'으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우, 이를 처리하여야 합니다. '회원'이 제기한 의견이나 불만사항에 대해서 '회원'에게 처리과정 및 결과를 전달합니다.
                    
                    제8조 회원의 의무
                    (1) '회원'은 다음 각 호의 행위를 하여서는 안 됩니다.
                    - 이용 신청 또는 변경 시 허위내용의 기재 및 타인의 정보도용
                    - 본 '서비스'를 '상업적 목적으로 이용하고자 할 경우 반드시 (유료)여행사 서비스를 신청하여 이용하여야 한다.
                    - 본 '서비스' 이용 중 습득한 정보를 상업적 목적으로 출판, 방송 등을 통하여 '서비스제공자'의 허락없이 제3자에게 노출시키는 행위
                    - '서비스제공자'와 제3자의 권리나 저작권 등 지적재산권에 대한 침해
                    - '서비스제공자'와 제3자의 명예를 손상시키거나 운영을 방해하는 행위
                    - 해킹, 광고를 통한 수익, 음란사이트를 이용한 상업행위, 상용소프트웨어 불법배포
                    - 기타 불법적이거나 부당한 행위
                    (2) '회원'은 관련법규, 이 약관의 규정, '서비스'와 관련한 공지사항 등을 준수하여야 하며, 기타 '서비스제공자'의 업무에 방해되는 행위를 하여서는 안됩니다.
                    
                    
                    제 4 장 서비스 이용
                    제9조 서비스의 제공
                    (1) '서비스제공자'는 '회원'의 가입이 완료된 시점부터 '서비스'를 개시합니다.
                    (2) 서비스의 이용은 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
                    (3) '서비스제공자'는 '서비스'를 일정범위로 분할하여 각 범위별로 이용가능시간을 별도로 지정할 수 있으며, 이러한 경우에는 그 내용을 사전에 공지합니다.
                    (4) '서비스제공자'는 시스템 점검, 증설 및 교체, 고장 등 운영상의 이유가 있는 경우, '서비스' 제공을 일시적으로 중단할 수 있습니다.
                    
                    제10조 서비스의 중단
                    (1)'서비스제공자'는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 "서비스"의 제공을 일시적으로 중단할 수 있습니다.
                    (2) 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 "서비스"를 제공할 수 없게 되는 경우에는 '서비스제공자'는 제22조에 정한 방법으로 이용자에게 통지합니다.
                    
                    제11조 서비스의 변경
                    (1) '서비스제공자'는 운영상 또는 기술상 필요에 따라 제공하고 있는 '서비스'를 전부 또는 일부 변경할 수 있습니다.
                    (2) '서비스'의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 사유 및 내용을 변경 전 회원에게 통지하고 변경하여 제공할 수 있습니다.
                    
                    제12조 정보의 제공
                    (1) '서비스제공자'는 '회원'이 '서비스'이용 중 필요하다고 인정되는 다양한 정보 또는 광고에 대해서 공지사항, 전자우편, 유무선매체 등의 방법으로 회원에게 제공할 수 있습니다.
                    (2) '회원'은 관련법에 따른 거래 관련 정보 및 고객문의 등에 대한 답변 등을 제외하고 언제든지 수신거절을 할 수 있습니다.
                    (3) '회원'에 대한 통지를 하는 경우에는 '회원'이 개인정보 기재를 소홀히 한 경우 중요한 통지를 받지 못할 수 있습니다.
                    
                    제13조 재화 등의 광고서비스 및 예약시스템 제공
                    (1) '서비스제공자'는 판매사업자를 대행하여 "재화 등"에 관한 광고게재의 역할을 하는 광고서비스 제공자이자 판매사업자에게 예약 시스템을 제공하는 온라인서비스 제공자로서 "사이트" 내에서 제공되는 "재화 등"에 대한 계약의 성립, 청약철회 등의 사항은 해당 "재화 등"을 제공하는 판매사업자의 규정에 따릅니다.
                    (2) '서비스 제공자'는 '회원'의 편의를 위하여 대금지급 등의 일부 서비스를 판매사업자를 대행하여 제공할 수 있습니다.
                    
                    제 14조 판매사업자에게 제공된 예약시스템 상의 예약정보에 대한 이용허가
                    '서비스 제공자'는 판매사업자에게 제공한 예약시스템상에서 '회원'이 예약한 정보를 '회원'의 '서비스'의 개선을 목적으로 이용합니다. 다만 '서비스 제공자'는 '판매사업자'의 동의아래 '판매사업자'에게 제공된 예약시스템 상에서 '회원'이 예약할때 해당 예약정보가 (스투비플래너)'서비스'에 제공됨을 명시해야합니다.
                    
                    제15조 회원의 게시물
                    (1) '게시물'이라 함은 '서비스'내에 '회원'이 올린 여행계획,글, 사진, 그림,상품리뷰 등의 정보를 의미합니다.
                    (2) '회원'이 '서비스'에 등록하는 '게시물'로 인해 '회원'에게 발생하는 손해나 기타 문제의 경우, '회원'은 이에 책임을 지게 됩니다.
                    (3) '서비스제공자'는 다음 각 호에 해당하는 '게시물'을 '회원'의 사전 동의 없이 삭제, 이동 또는 등록거부할 수 있습니다.
                    - '서비스제공자', 다른 '회원' 또는 제3자의 명예를 손상시키는 내용인 경우
                    - 공공질서 및 미풍양속에 위반되는 내용을 유포하는 경우
                    - 범죄 행위와 결부된다고 인정되는 내용인 경우
                    - '서비스제공자', 다른'회원' 또는 제3자의 저작권 등 기타권리를 침해하는 내용인 경우
                    - 승인되지 않은 광고인 경우
                    - 동일한 내용을 중복하여 다수 게시하는 경우
                    - 기타 관계 법령에 위배되거나 및 '게시물' 게시 원칙에 어긋라는 경우
                    (4) '서비스제공자'는 '게시물'등에 대하여 '정보통신망법' 및 '저작권법' 등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 '게시물'의 게시중단, 삭제 등을 요청할 수 있으며, '서비스제공자'는 관련법에 따라 조치를 취하여야 합니다.
                    (5) '게시물'이 게시중단 된 경우, '게시물'을 등록한 '회원'은 재게시를 '서비스제공자'에 요청할 수 있습니다.
                    (6) '서비스제공자'는 회원이 등록한 게시물을 검색사이트나 다른 사이트에 노출할 수 있습니다. 또한, 회사가 제공하는 서비스 내에서 회원 게시물을 복제, 전시, 전송, 배포할 수 있으며 2차적 저작물과 편집저작물로 작성 할 수 있습니다. 다만, 해당 게시물을 등록한 회원이 게시물의 삭제 또는 사용중지를 요청하면 회사는 관련 법률에 따라 보존해야 하는 사항을 제외하고 삭제 또는 사용을 중지합니다.
                    
                    제16조 게시물의 저작권
                    (1) '회원'이 '서비스'내에 게시한 '게시물'의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
                    (2) '서비스제공자'는 '서비스'의 운영, 홍보 등의 목적으로 서비스 내외부에 '게시물'을 노출할 수 있습니다. 이 경우 '게시물'의 일부 수정 및 편집이 발생할 수 있습니다.
                    단, 이 경우 '회원'은 언제든지 문의 게시판 또는 문의메일(stubbyteam@gmail.com)을 통해 해당 '게시물'대해 삭제, 비공개 등의 요청을 할 수 있습니다.
                    (3) '서비스제공자'는 제2항 이외의 방법으로 '회원'의 '게시물'을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 '회원'의 동의를 얻어야 합니다.
                    (4) '회원'이 탈퇴하거나 '회원'의 자격을 상실한 경우 해당 '회원'의 계정에 기록된 '게시물'은 삭제될 수 있습니다.
                    (5) '서비스'에 대한 저작권 및 지적재산권은 '서비스제공자'에 귀속됩니다. 단, '회원'의 '게시물' 및 제휴에 의해 제공된 저작물은 제외합니다.
                    
                    제17조 연결“회사”와 피연결“회사” 간의 관계
                    (1) 상위 “회사(또는 웹사이트 등)”과 하위 “회사(또는 웹사이트 등)”가 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “회사”이라고 하고 후자를 피연결 “회사”이라고 합니다.
                    (2) 연결“회사”는 피연결“회사”가 독자적으로 제공하는 "재화 등"에 의하여 "이용자"와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“회사”의 초기화면 또는 연결되는 시점에 명시하기로 하고 그 거래에 대한 어떤 보증 책임도 지지 않습니다.
                    
                    
                    제 5 장 계약 해지 및 이용 제한
                    제18조 계약 해지
                    (1) '회원'은 언제든지 '회원정보>회원탈퇴' 메뉴를 통해 이용계약 해지 신청을 할 수 있으며 신청즉시 회원탈퇴와 함께 이용계약이 해지됩니다.
                    (2) '서비스제공자'는 '회원'의 게시물들을 직접 삭제할 수 있는 링크를 제공합니다.
                    
                    제19조 서비스 이용제한
                    '서비스제공자'는 다음 각 호에 해당하는 경우에 '회원'의 요청 혹은 '서비스제공자'의 권한으로 '회원'의 '서비스'이용을 제한할 수 있습니다.
                    - 이 약관의 의무를 위반하거나 '서비스'의 정상적 운영을 방해한 경우.
                    - '저작권법', '컴퓨터프로그램보호법', '정보통신망법' 등의 관련법규를 위반하여 불법프로그램 배포, 운영방해, 해킹 등의 행위를 한 경우.
                    - 이 타인에게 혐오감을 주거나 미풍양속에 저해하는 행위 또는 그러한 정보를 '서비스'에 공개하는 경우.
                    - '서비스제공자'의 동의 없이 영리를 목적으로 '서비스'를 사용하는 경우.
                    - 자사의 서면 동의없이 본 싸이트의 기능을 활용해 제 3자에게 여행관련 서비스를 직/간적접으로 제공하는 경우.
                    - 기타 불법적이거나 부당한 행위로 판단되는 경우.
                    
                    
                    제 6 장 손해배상 및 기타사항
                    제 20조 손해배상
                    (1) '서비스제공자'의 과실로 인하여 '회원'에게 손해를 끼친 경우 이를 배상하여야 한다. 단 이는 유료로 제공하는 서비스의 이용에 한한다.
                    (2) '회원'이 '서비스'를 이용함에 있어 불법적 행위 또는 약관의 위반으로 인해 '서비스제공자'에 손해가 발생한 경우, 당 '회원'은 이를 배상하여야 한다.
                    (3) '회원'이 제8조를 위반해 상업적 목적으로 이용한 경우, 해당 기간동안 여행사서비스(유료) 를 이용한 금액의 10배를 위약벌로 배상하여야 한다.
                    
                    제 21조 면책사항
                    (1) '서비스제공자'는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.
                    (2) '서비스제공자'는 '회원'이 '서비스'에 게시한 정보, 자료, 사실의 신뢰도 및 정확성 등 내용에 대하여 책임을 지지 않습니다.
                    (3) '서비스제공자'는 회원이 '서비스제공자'가 제공하는 '서비스'로부터 기대되는 이익을 얻지 못하였거나 '서비스'의 이용으로 발생하는 손해에 대하여 책임을 지지 않습니다.
                    (4) '서비스제공자'는 '회원'의 귀책사유로 인한 '서비스' 이용장애에 대하여 책임을 지지 않습니다.
                    (5) '서비스제공자'는 '회원'간 또는 '회원'과 제3자 상호간에 '서비스'를 매개로 하여 거래 등을 한 경우 책임이 면제됩니다.
                    
                    제 22조 '회원'에 대한 통지
                    (1) '서비스제공자'가 '회원'에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 '회원'이 지정한 전자우편주소로 할 수 있습니다.
                    (2) '서비스제공자'는 '회원' 전체에 대한 통지의 경우 7일 이상 '서비스제공자'의 게시판에 게시함으로서 제1항의 통지에 갈음할 수 있습니다.
                    
                    제 23조 재판권 및 준거법
                    (1) '서비스제공자'와 '회원'간 제기된 소송은 대한민국법을 준거법으로 합니다.
                    (2) '서비스제공자'와 '회원'간 발생한 분쟁에 관한 소송은 '서비스제공자'의 소재지의 관활법원에 제소합니다.
                    
                    
                    부 칙
                    본 약관은 2012년 5월 1일부터 적용됩니다.
                    
                    
                    부 칙
                    본 약관은 2017년 1월 19일부터 적용됩니다.
                    
                    
                    부 칙
                    본 약관은 2018년 1월 29일 수정되었습니다.
                    수정사항은 2018년 3월 1일부터 시행됩니다.</textarea></td>
            </tr>
            <tr>
                <th>개인정보 보호정책</th>
                <td><textarea cols="100" rows="10" style="resize: none;" readonly="readonly">임의로 작성한 개인정보취급방침

                    주식회사 스투비플래너,주식회사 스투비익스피어리언스("회사" 또는 "스투비"라 함)는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법, 통신비밀보호법, 전기통신사업법, 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.
                    본 개인정보취급방침은 회사가 제공하는 스투비 및 스투비 관련 제반 서비스 (모바일 웹/앱 포함) 이용에 적용되며 다음과 같은 내용을 담고 있습니다.
                    
                    
                    개요
                    (주)스투비플래너, (주)스투비익스피어리언스(이하 ‘회사'라 함)는 정보이용자(이하 ‘이용자'라 함)가 회사에서 제공하는 웹서비스, 모바일 어플리케이션 등 제반 서비스를 이용함에 있어, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보 보호법에 따라 이용자의 개인정보를 보호하고, 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같은 처리방침을 두고 있습니다.
                    
                    
                    제1조 (수집하는 개인정보의 항목 및 수집방법)
                    1. 회사는 회원가입, 고객 상담 및 각종 서비스의 제공을 위하여 아래와 같이 개인정보를 수집하고 있습니다.
                    
                    
                    가. 이메일로 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다.
                    - 필수 정보 : 이메일 주소, 비밀번호, 닉네임, 출생년도, 성별, 프로필 사진용 이미지 등
                    
                    나. 인터넷/모바일 서비스 이용 과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.
                    - IP 주소, 쿠키, MAC 주소, 위치정보, 서비스 이용기록, 방문 기록, 불량 이용기록 등
                    
                    다. 부가 서비스, 맞춤식 서비스 이용 또는 이벤트 응모 과정에서, 이용자의 선택에 의해, 웹사이트, 온라인 양식, 서면 양식, 전화, 이메일 등을 통해 아래와 같은 정보들이 수집될 수 있습니다.
                    - 성명, 휴대폰 번호, 메신저 ID, 주소, 개인 웹사이트/블로그 주소, SNS 연동 정보(페이스북, 구글+)등
                    
                    2. 회사가 이용자들이 회사의 이용 약관 및 개인정보 처리방침의 내용에 대하여 ‘동의하기’ 등의 버튼을 클릭할 수 있는 절차를 마련하여, 이용자가 해당 버튼을 클릭한 경우 개인정보 수집 및 이용에 동의한 것으로 봅니다.
                    - 이용자가 ‘가입하기' 버튼을 클릭하여 회원으로 가입한 경우에는 개인정보 수집에 동의한 것으로 봅니다.
                    
                    
                    제 2 조(개인정보의 처리 목적)
                    
                    1. 회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
                    
                    가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
                    - 웹사이트 및 모바일 서비스 이용을 위한 컨텐츠 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심 등
                    
                    나. 회원관리
                    - 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 등
                    
                    다. 신규 서비스 개발 및 마케팅·광고에의 활용
                    - 신규 서비스 개발 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 등
                    
                    
                    제 3 조(개인정보의 처리 및 보유 기간)
                    
                    1. 회사는 법령에 따른 개인정보 보유·이용기간 또는 이용자로부터 개인정보를 수집시에 동의 받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
                    
                    2. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
                    
                    가. 홈페이지 회원가입 및 관리 : 동의일로부터 서비스 탈퇴시까지
                    - 단, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지
                    1) 관계 법령 위반에 따른 수사·조사 등이 진행 중인 경우 : 해당 수사·조사 종료시까지
                    
                    나. 마케팅 및 광고에의 활용 : 동의일로부터 6 개월까지
                    
                    
                    제 4 조(이용자의 권리, 의무 및 행사방법)
                    
                    
                    1. 이용자는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
                    
                    가. 개인정보 열람요구
                    나. 오류 등이 있을 경우 정정 요구
                    다. 삭제요구
                    라. 처리정지 요구
                    
                    2. 제 1 항에 따른 권리 행사는 회사에 대해 개인정보 보호법 시행규칙 별지 제 8 호 서식에 따라 서면 또는 전자우편을 통하여 하실 수 있으며, 회사는 이에 대해 지체 없이 조치하겠습니다.
                    
                    3. 이용자가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.
                    
                    4. 제 1 항에 따른 권리 행사는 이용자의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제 11 호 서식에 따른 위임장을 제출하셔야 합니다.
                    
                    
                    제 5 조(개인정보의 파기)
                    
                    
                    1. 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다. 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다.
                    
                    2. 이용자로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신비밀보호법 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우에는 일정 기간 동안 개인정보를 보관합니다. 이 경우 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
                    
                    가. 계약 또는 청약철회 등에 관한 기록 : 5 년
                    나. 대금결제 및 재화 등의 공급에 관한 기록 : 5 년
                    다. 소비자의 불만 또는 분쟁처리에 관한 기록 : 5 년
                    라. 웹사이트 방문 기록 : 3 개월
                    
                    3. 파기의 절차 및 방법은 다음과 같습니다.
                    가. 파기절차
                    -회사는 파기 사유가 발생한 개인정보를 선정하고, 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
                    나. 파기방법
                    - 회사는 전자적 파일 형태로 기록·저장된 개인정보는 기록을 재생할 수 없도록 파기하며, 종이 문서에 기록·저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.
                    
                    
                    제 6 조(개인정보 자동 수집장치의 설치/운영 및 거부)
                    
                    
                    1. 회사는 회사의 홈페이지 방문자에게 적정한 서비스를 제공하기 위해서 이용자들의 정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버(HTTP)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터 내 하드디스크에 저장되기도 합니다.
                    
                    가. 쿠키의 사용 목적
                    - 회사는 쿠키를 이용자들이 방문한 서비스의 웹사이트, 모바일 어플리케이션 등에 대한 방문 및 이용 행태, 인기 검색어, 이용자 규모 등을 파악하여, 이용자에게 최적화된 정보를 제공하기 위하여 사용합니다.
                    
                    나. 쿠키의 설치/운영 및 거부
                    - 이용자는 쿠키 설정에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저의 옵션을 설정함으로써, 쿠키가 저장될 때마다 확인하거나 모든 쿠키의 허용 또는 모든 쿠키의 저장을 거부할 수도 있습니다. 다만 쿠키의 저장을 거부할 경우에는 일부 서비스의 이용에 어려움이 있을 수 있습니다.
                    - 쿠키의 설정 방법은 이용하시는 브라우저에 따라 다를 수 있으며, 일반적으로 ‘도구 > 인터넷 옵션 > 개인정보’ 등의 메뉴에서 설정할 수 있습니다.
                    
                    2. 회사는 구글(Google)이 제공하는 웹 분석 서비스인 구글 애널리틱스(Google Analytics)를 이용하고 있습니다. 구글은 회사가 방문자가 사이트를 방문하여 어떻게 이용하는지 분석하는 도구를 제공함에 있어, 이용자에 대한 개인식별이 불가능한 수준의 정보(성별, 대략적인 연령대, 관심사에 관한 대략적인 정보 등)를 수집할 수 있습니다. 회사와 구글은 구글 광고 쿠키, 익명 식별자, 구글 애널리틱스 쿠키 등을 이용하여 인구통계 정보 및 관심분야에 대한 정보를 수집하며, 이용자는 구글 애널리틱스 Opt-out Browser Add-on 을 이용하여 스스로를 구글의 프로그램에서 배제(opt-out)시킬 수 있습니다. 구글 애널리틱스 Opt-out Browser Add-on 은 https://tools.google.com/dlpage/gaoptout/를 방문하여 이용하실 수 있습니다.
                    
                    
                    제7조(개인정보의 제3자 제공)
                    
                    
                    회사는 이용자의 개인정보를 본 방침 제2조에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나, 원칙적으로 이용자의 개인정보를 외부에 제공하지 않습니다. 단, 아래 각호에 해당하는 경우에는 이용자의 개인정보를 제3자에게 제공할 수 있습니다.
                    
                    가. 이용자가 사전에 공개 또는 제3자 제공에 동의한 경우
                    - 개인정보를 제공받는 자 : 주식회사 스투비익스피어리언스(635-81-01124) 및 항공/숙박/여행 상품 제공 업체
                    - 개인정보를 제공받는 자의 개인정보 이용 목적 : 청약의사의 확인, 거래이행, 고객상담 및 AS 등 불만 처리
                    - 제공하는 개인정보의 항목 :아이디, 이메일 주소, 주문 정보, 이용자가 입력한 상품 수령/구매 관련 정보(성명, 휴대전화번호, 주소) 등
                    - 개인정보 이용 및 보유 기간 :개인정보 이용목적 달성시까지 (단, 관계 법령의 규정에 의해 보존의 필요가 있는 경우 및 사전 동의를 득한 경우는 해당 기간까지)
                    
                    나. 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
                    
                    다. 통계 작성 및 학술 연구 등의 목적을 위해 필요한 경우로서, 특정 개인을 알아볼 수 없는 형태로 개인정보를 제공하는 경우
                    
                    
                    제8조(개인정보의 안전성 확보 조치)
                    
                    
                    회사는 개인정보보호법에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
                    
                    가. 관리적 조치
                    - 회사는 개인정보관련 취급 직원을 담당자에 한정시키고 이를 위한 별도의 비밀번호를 부여하고, 정기적으로 갱신하고 있습니다.
                    - 회사는 주기적으로 담당자들을 교육하고 있으며, 이용자의 개인정보 취급•관리를 강조하고 있습니다.
                    - 회사는 사내 개인정보보호 관련부서 등을 통해서 회사의 개인정보취급방침 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다.
                    
                    나. 기술적 조치
                    - 비밀번호는 암호화되어 저장 및 관리되고 있어 본인만이 알고 있으며, 개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다.
                    - 회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다.
                    - 회사는 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있습니다.
                    - 회사는 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 이외 시스템적인 보안성을 확보하기 위해 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.
                    
                    
                    제9조(개인정보 보호책임자)
                    
                    1. 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 이용자의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
                    
                    - 개인정보 보호책임자
                    성 명 : 백주흠
                    직 책 : (주)스투비플래너 대표, (주)스투비익스피어리언스 대표
                    이메일 : stubbyteam@gmail.com
                    주 소 : 서울 관악구 남부순환로 1837 샤론빌딩 4층 (주)스투비플래너
                    
                    2. 이용자께서는 회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해 구제 등에 관한 사항을 개인정보 보호책임자에게 문의하실 수 있습니다. “회사"는 이용자의 문의에 대해지체 없이 답변 및 처리해드릴 것입니다.
                    
                    제10조(권익침해 구제방법)
                    
                    1. 이용자는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.
                    
                    - 개인정보침해신고센터 (www.118.or.kr / 118)
                    - 대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000)
                    - 경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330)
                    
                    2. 이용자는 제 1 항의 열람청구 접수․처리부서 이외에, 행정안전부의 ‘개인정보보호 종합지원 포털’ 웹사이트(www.privacy.go.kr)를 통하여서도 개인정보 열람청구를 할 수 있습니다.
                    ▶ 행정안전부 개인정보보호 종합지원 포털 → 개인정보 민원 → 개인정보 열람등 요구 (본인확인을 위하여 아이핀(I-PIN)이 있어야 함)
                    
                    
                    제11조(개인정보 처리방침의 변경)
                    
                    1. 회사는 본 개인정보 처리방침을 개정하는 경우 웹사이트 공지사항을 통하여 공지할 것입니다.
                    
                    2. 이 개인정보 처리방침은 2015년 6월 30 일부터 적용됩니다.
                    3. 이 개인정보 처리방침은 2019년 1월 2 일부터 적용됩니다.</textarea></td>
            </tr>
            </tbody>
        </table>
        </div>     
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>