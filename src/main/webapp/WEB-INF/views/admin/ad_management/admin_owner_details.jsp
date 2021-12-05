<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="ownerDetail">
        <fieldset style="border: 3px solid #1987541f; padding: 12px 14px 10px;
                margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-12 mb-1">
                    <h5>광고주 정보</h5>
                </div>
            </div>
                <div class="row">
                        <form name="ownerAppliForm" method="post">
                            <table class="table table-bordered" style="font-size: 13px;">
                                <tr>
                                <td rowspan="8" style="width:400px;">
                                	<img src="resource/img/gapyeong.jpg" style="width:100%; height:100%;"/>
                                </td>
                                    <th class="tr_bg">광고주번호 / 회원번호</th>
                                    <td>${dto.owner_idx} / ${dto.member_idx}
                                        <input type="hidden" value="${dto.member_idx}" name="member_idx" id="member_idx">
                                        <input type="hidden" value="${dto.owner_idx}" name="owner_idx" id="owner_idx">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">사업자번호</th>
                                    <td><input type="text" id="business_number" name="business_number" value="${dto.business_number}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">상호명</th>
                                    <td>
                                    	<input type="text" id="title" name="title" value="${dto.title}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">사업자명</th>
                                    <td><input type="text" id="name" name="name" value="${dto.name}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">이메일</th>
                                    <td><input type="text" id="email" name="email" value="${dto.email}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">전화번호</th>
                                    <td><input type="text" id="tel" name="tel" value="${dto.tel}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">업체번호</th>
                                    <td><input type="text" id="business_tel" name="business_tel" value="${dto.business_tel}" required></td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">주소</th>
                                    <td>
                                    <input type="text" id="addr" name="addr" value="${dto.addr}" required><br>
                                    <input type="text" id="detailed_addr" name="detailed_addr" value="${dto.detailed_addr}">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg" colspan="3">설명</th>
                                </tr>
                                <tr>    
                                    <td colspan="3">
                                    <textarea id="ad_content" name="ad_content" rows="6" style="width:100%;" >
	                                    ${dto.ad_content}
                                    </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-center">
                                        <input class="bt btn-secondary" type="button" onclick="ownerD_Update${dto.owner_idx})" value="수정">
                                        <input class="bt btn-danger" type="button" onclick="ownerD_Delete(${dto.owner_idx})" value="삭제">
                                    </td>
                                </tr>
                            </table>
                        </form>
                </div>
        </fieldset>
    </div>
</body>
</html>