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
            <form id="admin_update">
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
                    <td style="border: 1px solid #0000008c;"><input type="password" name="pwd" id="pwd" required="required" onkeyup="keyUpCheck()" onkeydown="keyUpCheck()">
                    <label id="pwdLabel"> &nbsp;비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.</label><br></td>
                </tr>
                <tr>
		        	<th class="tr_bg active text-white" style="border: 1px solid #0000008c;"  >비밀번호 확인</th>
		            <td style="border: 1px solid #0000008c;">
		            	<input type="password" id="repwd" onkeyup="keyUpCheck2()" required="required" onkeydown="keyUpCheck2()">
		            	<span id="repwdSpan"></span>
		            </td>
		        </tr>
		        <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">이름</th>
                    <td style="border: 1px solid #0000008c;"><input type="text" value="${mdto.nickname}"  required="required" name="nickname" id="nickname"><label> &nbsp;숫자와 ,특수문자는 입력할 수 없습니다.</label></td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">휴대폰</th>
                    <td style="border: 1px solid #0000008c;"><input type="tel" value="${adto.admin_phone}"  required="required" name="admin_phone" id="admin_phone"  maxlength="11"><label> &nbsp;-없이 숫자만 입력해주세요.</label></td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">전화번호</th>
                    <td style="border: 1px solid #0000008c;"><input type="tel" value="${adto.admin_tel}"  required="required" name="admin_tel" id="admin_tel"  maxlength="11" pattern="^[0-9]+$"><label> &nbsp;-없이 숫자만 입력해주세요.</label></td>
                </tr>
                <tr>
               		<th class="tr_bg active text-white" style="border: 1px solid #0000008c;">우편번호</th>
                    <td colspan="4" style="border: 1px solid #0000008c;"><input type="text" name="admin_postcode"  required="required" id="sample6_postcode" value="${adto.admin_postcode}" style="width: 50px;" readonly="readonly"> <input type="button" class="bt btn-dark" style="border-radius: 3px;" onclick="search_adress()" value="우편번호검색"></td>
                </tr>
                <tr>
                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;"  >주소</th>
                    <td colspan="4" style="border: 1px solid #0000008c;">
                        <div>
                            <input type="text" style="width: 300px;" value="${adto.admin_addr}" name="admin_addr"  required="required" id="sample6_address" readonly="readonly">
                        </div>
                        <div>
                            <input type="text" style="width: 150px;" value="${adto.admin_extra_addr}" required="required" readonly="readonly" name="admin_extra_addr" id="sample6_extraAddress">
                            <input type="text" style="width: 150px;" value="${adto.admin_detail_addr}" required="required" name="admin_detail_addr"  required="required" id="sample6_detailAddress" placeholder="상세주소">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="text-center" style="border: 1px solid #0000008c;" >
                        <input class="bt btn-dark" style="border-radius: 3px;" type="submit" value="관리자정보 수정" onclick="admin_update()">
                    </td>
                </tr>
            </table>
            </form>
        </fieldset>
</div>
</body>
</html>