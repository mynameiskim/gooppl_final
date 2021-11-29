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
	background-color: #1987541f !important;
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
    	<h6><b>회원목록</b></h6>
    	<ul class='helpbox'>
				<li>사이트에 가입한 회원목록 입니다.</li>
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
				<th>등록일</th>
				<td><input type="date">~<input type="date"></td>
			</tr>
		</table>
			<div class="row justify-content-md-center" style="padding: 20px 0px;">
				<div class="col-md-5 text-center">
					<input type="button" class="bt btn-primary" value="검색하기" >
				</div>	
			</div>
			<div class="row">
				<div class="col-md-3 text-left">
					<label><b>총 회원수:</b> <b>검색수:</b></label>
				</div>
				<div class="col-md-9 mb-1" style="writing-mode: vertical-rl;">
					<input type="button" class="bt btn-success" value="엑셀파일저장"> 
				</div>
			</div>
		<table class="table table-hover tb_hover">
		  <thead>
				<tr class="tr_bg">
					<th class="text-center"><input type="checkbox"></th>
                    <th class="text-center">번호</th>
					<th class="text-center">이름</th>
					<th class="text-center">닉네임</th>
					<th class="text-center">아이디</th>
					<th class="text-center">가입일</th>
					<th class="text-center">보기</th>
				</tr>
		</thead>
			<tfoot style="border-top: 0px">
		      <tr>
				<td colspan="9" class="text-center">페이징영역</td>
		     </tr>
		  </tfoot>
		  <tbody>
		    <tr style="vertical-align: middle;">
		      <th class="text-center"><input type="checkbox"></th>
		      <td class="text-center">Mark</td>
		      <td class="text-center">Otto</td>
		      <td class="text-center">@mdo</td>
		      <td class="text-center">@mdo</td>
		      <td class="text-center">@mdo</td>
		      <td class="text-center">
		      <input type="button" class="bt btn-dark" value="수정">
		      <input type="button" class="bt btn-danger" value="삭제">
		      </td>
		    </tr>
		    <tr>
		      <th class="text-center"><input type="checkbox"></th>
		      <td class="text-center">Jacob</td>
		      <td class="text-center">Thornton</td>
		      <td class="text-center">@fat</td>
		      <td class="text-center">@fat</td>
		      <td class="text-center">@fat</td>
		      <td class="text-center">
			  <input type="button" class="bt btn-dark" value="수정">
		      <input type="button" class="bt btn-danger" value="삭제">
		      </td>
		    </tr>
		    <tr>
		      <th class="text-center"><input type="checkbox"></th>
		      <td class="text-center">Larry the Bird</td>
		      <td class="text-center">@twitter</td>
		      <td class="text-center">@twitter</td>
		      <td class="text-center">@twitter</td>
		      <td class="text-center">@twitter</td>
		      <td class="text-center">
			  <input type="button" class="bt btn-dark" value="수정">
		      <input type="button" class="bt btn-danger" value="삭제">
		      </td>
		    </tr>
		    <tr>
		      <th class="text-center"><input type="checkbox"></th>
		      <td class="text-center">Larry the Bird</td>
		      <td class="text-center">@twitter</td>
		      <td class="text-center">@twitter</td>
		      <td class="text-center">@twitter</td>
		      <td class="text-center">@twitter</td>
		      <td class="text-center">
			  <input type="button" class="bt btn-dark" value="수정">
		      <input type="button" class="bt btn-danger" value="삭제">
		      </td>
		    </tr>
		  </tbody>
		</table>
        <fieldset style="border: 3px solid #1987541f; padding: 12px 14px 10px;
		margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-3 mb-1">
                    <h5>회원정보</h5>
                </div>
            </div>
            <table class="table table-bordered" style="font-size: 13px;">
                <tr>
                    <th class="tr_bg">회원번호 <label style="color: red;">*</label></th>
                    <td>0</td>
                    <th class="tr_bg">이름 <label style="color: red;">*</label></th>
                    <td><input type="text" value="관리자"></td>
                </tr>
                <tr>
                    <th class="tr_bg">닉네임 <label style="color: red;">*</label></th>
                    <td><input type="text" value="관리자"></td>
                    <th class="tr_bg">아이디 <label style="color: red;">*</label></th>
                    <td><input type="text" value="test@test.com"></td>
                </tr>
                <tr>
                    <th class="tr_bg">가입일</th>
                    <td>2021-11-23 12:37:50</td>
                    <th class="tr_bg">인증여부</th>
                    <td>Y</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <input class="bt btn-primary" type="button" value="확인">
                    </td>
                </tr>
            </table>
        </fieldset>
       </div> 
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>