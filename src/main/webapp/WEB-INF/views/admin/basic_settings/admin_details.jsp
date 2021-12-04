<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="di2">
<fieldset style="border: 3px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-3 mb-1">
                    <h5>관리자 정보 </h5>
                </div>
            </div>
            <form name="admin_update" action="admin_update.do" method="post">
            <table class="table table-bordered" style="font-size: 13px;">
            	<tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">회원번호	</th>
                    <td style="border: 1px solid #0000008c;">${mdto.member_idx}
                    	<input type="hidden" value="${mdto.member_idx}" name="member_idx">
                    </td>
                    
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">아이디</th>
                    <td style="border: 1px solid #0000008c;">${mdto.goo_id}</td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">비밀번호</th>
                    <td style="border: 1px solid #0000008c;"><input type="password" value="${mdto.pwd}" name="pwd" required="required"></td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">이름</th>
                    <td style="border: 1px solid #0000008c;"><input type="text" value="${mdto.nickname}" name="nickname" required="required"></td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">휴대폰</th>
                    <td style="border: 1px solid #0000008c;"><input type="tel" value="${adto.admin_phone}" name="admin_phone" required="required"></td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">전화번호</th>
                    <td style="border: 1px solid #0000008c;"><input type="tel" value="${adto.admin_tel}" name="admin_tel" required="required"></td>
                </tr>
                <tr>
               		<th class="tr_bg active text-white" style="border: 1px solid #0000008c;">우편번호</th>
                    <td colspan="4" style="border: 1px solid #0000008c;"><input type="text" style="width: 50px;"> <input type="button" value="우편번호검색"></td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">주소</th>
                    <td colspan="4" style="border: 1px solid #0000008c;">
                        <div>
                            <input type="text" style="width: 300px;" value="${adto.admin_addr}" name="admin_addr" required="required">
                        </div>
                        <div>
                            <input type="text" style="width: 300px;" required="required">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="text-center" style="border: 1px solid #0000008c;">
                        <input class="bt btn-dark" style="border-radius: 3px;" type="submit" value="관리자정보 수정">
                    </td>
                </tr>
            </table>
            </form>
        </fieldset>
</div>
</body>
</html>