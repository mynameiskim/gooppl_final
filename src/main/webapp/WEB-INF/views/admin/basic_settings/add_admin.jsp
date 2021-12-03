<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.mg_top{
	margin-top:30px;
}
.tr_bg{
   --bs-table-accent-bg: #1987541f !important;
}
.f_tab_th{
    text-align: center;
}
.f_tab_td{
    text-align: center;
}
tr{
    border:1px solid lightgray;
}
</style>
</head>
<body>
	<div class="row">
        <div class="col-md-12 mb-12 mg_top">
            <h5 class="text-center">관리자 등록</h5>
        </div>
    </div>
    <form name="admin_insert" action="admin_insert.do" method="post">
    <table class="table table-bordered mg_top" style="font-size: 13px;">
        <tr>
            <th class="tr_bg">아이디</th>
            <td><input type="text" name="goo_id"></td>
        </tr>
        <tr>
        	<th class="tr_bg">비밀번호</th>
            <td><input type="password" name="pwd"></td>
        </tr>
        <tr>
        	<th class="tr_bg">이름</th>
            <td colspan="3"><input type="text" name="nickname"></td>
        </tr>
        <tr>
            <th class="tr_bg">휴대폰</th>
            <td><input type="tel" name="admin_phone" required="required"></td>
        </tr>
        <tr>
        	<th class="tr_bg">전화번호</th>
            <td><input type="tel" name="admin_tel" required="required"></td>
        </tr>
        <tr>
       		<th class="tr_bg">우편번호</th>
            <td><input type="text"  style="width: 50px;"> <input type="button" value="우편번호검색"></td>
        </tr>
        <tr>
            <th class="tr_bg">주소</th>
            <td>
                <div>
                    <input type="text" style="width: 300px;" name="admin_addr" required="required">
                </div>
                <div>
                    <input type="text"  style="width: 300px;">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="text-center">
                <input class="bt btn-secondary" type="submit" value="등록">
                <input class="bt btn-secondary" type="reset" value="다시작성">
            </td>
        </tr>
    </table>
    </form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>