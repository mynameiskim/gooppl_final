<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="resource/js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<fieldset style="padding: 12px 14px 10px;
		margin-bottom: 5px;">
			<div>
				<div class="col-md-12 text-left">
					<span id="s1"><b>&nbsp;${year}년 월별 가입자 수 통계입니다.</b></span>
				</div>
			</div>
		<table class="table table-bordered">
	  		<tr class="tr_align">
  				<th colspan="2" class="text-center active text-white tr_bg">&nbsp;&nbsp;가입자 수</th>
			</tr>
			<c:forEach begin="0" end="11" step="1" varStatus="status">
				<tr class="tr_align">
				<th style="width:10%; text-align: center;">&nbsp;${status.count}월 </th>
				<td style="width:90%;">&nbsp;
				<c:forEach begin="0" end="${joinNum[status.index]}" step="1"><img src="${pageContext.request.contextPath}/resource/img/1.gif"><img src="${pageContext.request.contextPath}/resource/img/1.gif"></c:forEach>&nbsp;${joinNum[status.index]}
				</td>
			</tr>
			</c:forEach>
		</table>
</fieldset>
</body>
</html>