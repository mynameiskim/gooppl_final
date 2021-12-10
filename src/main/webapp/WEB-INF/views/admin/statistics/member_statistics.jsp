<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
.tr_bg{
       --bs-table-accent-bg: #24292f !important;
       border: 1px solid #0000008c;
}
.tr_align{
	vertical-align: middle;
}
</style>
<script>
function month(){
	sendRequest('month_statistics.do?',null,showResult,'GET');
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			var data=XHR.responseText;
			var divNode=document.getElementById("month_join_num");
			divNode.innerHTML=data;
		}
	}
}

function dateSearchStart(){
	
	var start_date = $('#start_date').val();
	var end_date = $('#end_date').val();
	location.href = 'member_statistics.do?start_date='+start_date+'&end_date='+end_date;
}
</script>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>통계/분석</b></h5>
		<dl>
			<dt>통계/분석</dt>
			<dd>
				- <a href='member_statistics.do' style="color: white !important;"
				>회원통계</a><br />
				- <a href='/nmanager/setup/config_m6anager.do' style="color: white !important;"
				>게시판통계 </a>
			</dd>
		</dl>
	</div>
	<div id="contents">
    	<h6><b>회원 통계/분석</b></h6>
    	<ul class='helpbox'>
			<li>회원 유형별 통계 그래프를 보여줍니다.</li>
			<li>현재회원은 탈퇴회원을 제외한 모든 유형의 회원들을 의미합니다.</li>
			<li>누적회원은 현재회원에 탈퇴회원까지 모두 포함합니다. 날짜 검색 시 마지막 날 기준으로 누적회원수를 나타냅니다.</li>
			<li>월(일단위)선택은 현재년도의 1~12월까지 가입자 수를 나타냅니다.</li>
			<li>날짜 검색은 지정한 범위의 가입자 수를 나타냅니다.</li>
		</ul>
		<form name="search">
		<table class="table table-bordered" style="font-size: 13px;">
			<tr>
				<th style="width:20%;vertical-align: middle; text-align: center;">조건 선택</th>
				<td style="width:80%;"><input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" checked>
					<label class="btn btn-secondary" for="option1" onclick="month()">월(일단위)</label>
					<label class="btn btn-secondary" for="option1">요일(일단위)</label>
				</td>
			</tr>
			<tr>
				<th style="width:20%;vertical-align: middle; text-align: center;">날짜 검색</th>
				<td style="width:80%;"><input id="start_date" value="${start_date}" type="date">~<input id="end_date" value="${end_date}" type="date"></td>
			</tr>
		</table>
			<div class="row justify-content-md-center" style="padding: 20px 0px;">
				<div class="col-md-5 text-center">
					<input type="button" class="bt btn-dark" style="border-radius: 3px;" value="검색하기" onclick="dateSearchStart()">
				</div>	
			</div>
		</form>
		<div id="default">
		<fieldset style="padding: 12px 14px 10px;
		margin-bottom: 5px;">
			<div>
				<div class="col-md-12 text-left">
					<c:if test="${empty start_date && empty end_date}">
					<label><b>&nbsp;Today :&nbsp;${sessionScope.now}까지의 가입현황입니다.</b></label>
					</c:if>
					<c:if test="${!empty start_date || !empty end_date}">
						<c:if test="${start_date == end_date }">
							<label><b>&nbsp;Today :&nbsp;${end_date}까지의 가입현황입니다.</b></label>
						</c:if>
						<c:if test="${start_date != end_date }">
						<label><b>&nbsp;Today :&nbsp;${start_date}~${end_date}까지의 가입현황입니다.</b></label>
						</c:if>
					</c:if>
				</div>
			</div>
		<table class="table table-bordered">
	  		<tr class="tr_align">
  				<th colspan="2" class="text-center active text-white tr_bg">&nbsp;&nbsp;회원통계</th>
			</tr>
	  		<tr class="tr_align">
				<th style="width:10%; text-align: center;">&nbsp;누적회원</th>
				<td style="width:90%;">&nbsp;
					<c:forEach begin="1" end="${totalMemberNum}" step="1"><img src="${pageContext.request.contextPath}/resource/img/1.gif"><img src="${pageContext.request.contextPath}/resource/img/1.gif"></c:forEach>&nbsp;${totalMemberNum}
				</td>
			</tr>
			<tr class="tr_align">
					<c:if test="${empty start_date && empty end_date}">
						<th style="width:10%; text-align: center;">&nbsp;현재회원</th>
					</c:if>
					<c:if test="${!empty start_date || !empty end_date}">
						<th style="width:10%; text-align: center;">&nbsp;회원 가입수</th>
					</c:if>
				<td style="width:90%;">&nbsp;
				<c:forEach begin="1" end="${currentMemberNum}" step="1"><img src="${pageContext.request.contextPath}/resource/img/1.gif"><img src="${pageContext.request.contextPath}/resource/img/1.gif"></c:forEach>&nbsp;${currentMemberNum}
				</td>
			</tr>
	  		<tr class="tr_align">
	  			<th style="width:10%; text-align: center;">&nbsp;관리자 </th>
	  			<td style="width:90%;">&nbsp;
	  				<c:forEach begin="1" end="${adminNum}" step="1"><img src="${pageContext.request.contextPath}/resource/img/1.gif"><img src="${pageContext.request.contextPath}/resource/img/1.gif"></c:forEach>&nbsp;${adminNum}
	  			</td>
	  		</tr>
	  		<tr class="tr_align">
	  			<th style="width:10%; text-align: center;">&nbsp;광고주 </th>
	  			<td style="width:90%;">&nbsp;
	  				<c:forEach begin="1" end="${ownerNum}" step="1"><img src="${pageContext.request.contextPath}/resource/img/1.gif"><img src="${pageContext.request.contextPath}/resource/img/1.gif"></c:forEach>&nbsp;${ownerNum}
	  			</td>
	  		</tr>
	  		<tr class="tr_align">
	  			<th style="width:10%; text-align: center;">&nbsp;일반회원 </th>
	  			<td style="width:90%;">&nbsp;
	  			<c:forEach begin="1" end="${memberNum}" step="1"><img src="${pageContext.request.contextPath}/resource/img/1.gif"><img src="${pageContext.request.contextPath}/resource/img/1.gif"></c:forEach>&nbsp;${memberNum}
	  			</td>
	  		</tr>
	  		<tr class="tr_align">
				<th style="width:10%; text-align: center;">&nbsp;탈퇴회원 </th>
				<td style="width:90%;">&nbsp;
				<c:forEach begin="1" end="${memberOutNum}" step="1"><img src="${pageContext.request.contextPath}/resource/img/1.gif"><img style="background-color: black;" src="${pageContext.request.contextPath}/resource/img/1.gif"></c:forEach>&nbsp;${memberOutNum}
				</td>
			</tr>
	  </table>
	  </fieldset>
	  </div>
	  <div id="month_join_num">
	  </div>
	</div>
</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>




