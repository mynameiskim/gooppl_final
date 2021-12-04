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
}
.tr_bg{
	background-color: #1987541f;
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
				- <a href="admin_member_list.do"
				>회원목록</a><br />
			</dd>
			<dt>탈퇴회원목록</dt>
			<dd>
				- <a href="admin_member_out.do"
					>탈퇴회원목록</a><br />
			</dd>
			<dt>폼메일 관리</dt>
			<dd>
				- <a href="admin_formmail_settings.do?form_type=회원가입"
				>폼메일 관리</a><br />
			</dd>
		</dl>
	</div>
	<div id="contents">
    	<h6><b>탈퇴회원목록</b></h6>
    	<ul class='helpbox'>
			<li>회원이 마이페이지에서 회원탈퇴 신청한 경우 회원DB는 모두 삭제되고 탈퇴회원 목록에 나옵니다.</li>
		</ul>
		<table class="table table-bordered" style="font-size: 13px;">
			<tr>
				<th>조건 검색</th>
				<td>
					<select style="height: 22px;">
						<option>제목</option>
						<option>작성자</option>
						<option>내용</option>
					</select>
					<input type="text" style="width: 300px;">
				</td>
			</tr>
			<tr>
				<th>탈퇴일</th>
				<td><input type="date">~<input type="date"></td>
			</tr>
		</table>
			<div class="row justify-content-md-center" style="padding: 20px 0px;">
				<div class="col-md-5 text-center">
					<input type="button" class="bt btn-primary" value="검색하기" >
				</div>	
			</div>
			<div class="row">
				<h4 style="font-size: 15px;"><b>총 회원수:</b> <b>검색수:</b></h4>
			</div>
		<table class="table table-hover tb_hover">
		  <thead>
				<tr class="tr_bg">
					<th class="text-center"><input type="checkbox"></th>
                    <th class="text-center">번호</th>
					<th class="text-center">아이디</th>
					<th class="text-center">탈퇴사유</th>
					<th class="text-center">탈퇴일</th>
					<th class="text-center">삭제</th>
				</tr>
		</thead>
			<tfoot style="border-top: 0px">
		      <tr>
				<td colspan="9" class="text-center">페이징영역</td>
		     </tr>
		  </tfoot>
		  <tbody>
		  	<c:if test="${empty list}">
		  		<tr>
		  			<td colspan="6" align="center">
		  				<b>탈퇴한 회원이 없습니다.</b>
		  			</td>
		  		</tr>
		  	</c:if>
		  	<c:forEach var="list" items="${list}">
		  		<tr style="vertical-align: middle;">
		  			<td class="text-center"><input type="checkbox"></td>
		  			<td class="text-center">${list.out_no}</td>
		  			<td class="text-center">${list.id}</td>
		  			<td class="text-center">${list.out_reason}</td>
		  			<td class="text-center">${list.outdate}</td>
		  			<td class="text-center"><input type="button" class="bt btn-dark" value="삭제"></td>
		  		</tr>
		  	</c:forEach>
		  </tbody>
		</table>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>	