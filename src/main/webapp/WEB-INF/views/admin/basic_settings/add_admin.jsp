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
   --bs-table-accent-bg: #24292f !important;
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
<script>
window.addEventListener('load', () => {
	const forms = document.getElementsByClassName('need-validation');
	
	Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function (event) {
			if (form.checkValidity() === false) {
				event.preventDefault();
				event.stopPropagation();
			}
		
			form.classList.add('was-validated');
		}, false);
	});
}, false);
</script>
</head>
<body>
	<div class="row">
        <div class="col-md-12 mb-12 mg_top">
            <h5 class="text-center">관리자 등록</h5>
        </div>
    </div>
    <form name="admin_insert" action="admin_insert.do" method="post" class="need-validation" novalidate>
    <table class="table table-bordered mg_top" style="font-size: 13px;">
    	<tr>
            <th class="tr_bg active text-white">아이디</th>
            <td style="border: 1px solid #0000008c;"><input class="form-control" type="text" name="goo_id" required="required"></td>
        </tr>
        <tr>
        	<th class="tr_bg active text-white">비밀번호</th>
            <td style="border: 1px solid #0000008c;"><input class="form-control" type="password" name="pwd" required="required"></td>
        </tr>
        <tr>
        	<th class="tr_bg active text-white">이름</th>
            <td colspan="3" style="border: 1px solid #0000008c;"><input class="form-control" type="text" name="nickname" required="required"></td>
        </tr>
        <tr>
            <th class="tr_bg active text-white">휴대폰</th>
            <td style="border: 1px solid #0000008c;"><input class="form-control" type="tel" name="admin_phone" required="required" required="required"></td>
        </tr>
        <tr>
        	<th class="tr_bg active text-white">전화번호</th>
            <td style="border: 1px solid #0000008c;"><input class="form-control" type="tel" name="admin_tel" required="required"></td>
        </tr>
        <tr>
       		<th class="tr_bg active text-white">우편번호</th>
            <td style="border: 1px solid #0000008c;"><input class="form-control"  type="text"  style="width: 50px;" required="required"> <input type="button" value="우편번호검색"></td>
        </tr>
        <tr>
            <th class="tr_bg active text-white">주소</th>
            <td style="border: 1px solid #0000008c;">
                <div>
                    <input class="form-control" type="text" style="width: 300px;" name="admin_addr" required="required">
                </div>
                <div>
                    <input class="form-control" type="text"  style="width: 300px;" required="required">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="text-center">
                <input id="sub" class="bt btn-dark" style="border-radius: 3px;" type="submit" value="등록">
                <input class="bt btn-secondary"  style="border-radius: 3px;" type="reset" value="다시작성">
            </td>
        </tr>
    </table>
    </form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>