<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/myweb3/admin_css/admin_common.css" type="text/css" rel="stylesheet">
<link href="/myweb3/admin_css/admin_header.css" type="text/css" rel="stylesheet">
<link href="/myweb3/admin_css/admin_footer.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
		<h5><b>게시판관리</b></h5>
		<dl>
			<dt>게시판관리</dt>
			<dd>
				- <a href='admin_share.do'
				>공유게시판 관리</a><br />
				- <a href='admin_review.do'
				>후기게시판 관리</a><br />
				- <a href='admin_relpy.do'
				>댓글 관리 </a>
			</dd>
		</dl>
	</div>
	<div id="contents"><h6><b>후기게시판</b></h6>
		<ul class='helpbox'>
			<li>후기게시판의 게시글을 관리하는 곳입니다.</li>
		</ul>
		<table class="table table-bordered" style="font-size: 13px;">
			<tr>
				<th>등록일</th>
				<td><input type="date">~<input type="date"></td>
			</tr>
			<tr>
				<th>키워드 검색</th>
				<td>
					<select style="height: 22px;">
						<option>제목</option>
						<option>작성자</option>
						<option>내용</option>
					</select>
					<input type="text" style="width: 300px;">
				</td>
			</tr>
		</table>
		<div class="row justify-content-md-center" style="padding: 20px 0px;">
			<div class="col-md-5 text-center">
				<input type="button" class="bt btn-primary" value="검색하기" >
			</div>	
		</div>
		<div class="row">
			<h4 style="font-size: 15px;"><b>총 댓글:999</b></h4>
		</div>
		<table class="table table-hover tb_hover">
			<thead>
			<tr class="tr_bg">
				<th><input type="checkbox"></th>
				<th>번호</th>
				<th class="text-center">글제목</th>
				<th class="text-center">작성자</th>
				<th class="text-center">작성일</th>
				<th class="text-center">조회수</th>
				<th class="text-center">수정</th>
				<th class="text-center">삭제</th>
			</tr>
			</thead>
			<tfoot style="border-top: 0px;">
			<tr>
				<td colspan="8" class="text-center">페이징영역</td>
			</tr>
			</tfoot>
			<!--리스트 로직 부분-->
			<tbody>
			<tr style="vertical-align: middle;">
				<td><input type="checkbox"></td>
				<td>123213</td>
				<td>첫번째 게시글 제목입니다.ㅁㄴ암너ㅗ아ㅓㅁ노아ㅓㅁ노</td>
				<td class="text-center">이정민</td>
				<td class="text-center" style="font-size: 12px;">2021-11-26<br>16:00:00</td>
				<td class="text-center">0</td>
				<td class="text-center"><input type="button" class="bt btn-dark" value="수정"></td>
				<td class="text-center"><input type="button" class="bt btn-danger" value="삭제"></td>
			</tr>
               <tr style="vertical-align: middle;">
				<td><input type="checkbox"></td>
				<td>123213</td>
				<td>첫번째 게시글 제목입니다.ㅁㄴ암너ㅗ아ㅓㅁ노아ㅓㅁ노</td>
				<td class="text-center">이정민</td>
				<td class="text-center" style="font-size: 12px;">2021-11-26<br>16:00:00</td>
				<td class="text-center">0</td>
				<td class="text-center"><input type="button" class="bt btn-dark" value="수정"></td>
				<td class="text-center"><input type="button" class="bt btn-danger" value="삭제"></td>
			</tr>
               <tr style="vertical-align: middle;">
				<td><input type="checkbox"></td>
				<td>123213</td>
				<td>첫번째 게시글 제목입니다.ㅁㄴ암너ㅗ아ㅓㅁ노아ㅓㅁ노</td>
				<td class="text-center">이정민</td>
				<td class="text-center" style="font-size: 12px;">2021-11-26<br>16:00:00</td>
				<td class="text-center">0</td>
				<td class="text-center"><input type="button" class="bt btn-dark" value="수정"></td>
				<td class="text-center"><input type="button" class="bt btn-danger" value="삭제"></td>
			</tr>
               <tr style="vertical-align: middle;">
				<td><input type="checkbox"></td>
				<td>123213</td>
				<td>첫번째 게시글 제목입니다.ㅁㄴ암너ㅗ아ㅓㅁ노아ㅓㅁ노</td>
				<td class="text-center">이정민</td>
				<td class="text-center" style="font-size: 12px;">2021-11-26<br>16:00:00</td>
				<td class="text-center">0</td>
				<td class="text-center"><input type="button" class="bt btn-dark" value="수정"></td>
				<td class="text-center"><input type="button" class="bt btn-danger" value="삭제"></td>
			</tr>
               <tr style="vertical-align: middle;">
				<td><input type="checkbox"></td>
				<td>123213</td>
				<td>첫번째 게시글 제목입니다.ㅁㄴ암너ㅗ아ㅓㅁ노아ㅓㅁ노</td>
				<td class="text-center">이정민</td>
				<td class="text-center" style="font-size: 12px;">2021-11-26<br>16:00:00</td>
				<td class="text-center">0</td>
				<td class="text-center"><input type="button" class="bt btn-dark" value="수정"></td>
				<td class="text-center"><input type="button" class="bt btn-danger" value="삭제"></td>
			</tr>
			</tbody>
		</table>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
