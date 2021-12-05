<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    <div id="ownerAppliDetail">
        <fieldset style="border: 3px solid #1987541f; padding: 12px 14px 10px;
                margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-12 mb-1">
                    <h5>광고주 신청 정보</h5>
                </div>
            </div>
                <div class="row">
                        <form name="ownerAppliForm" method="post">
                            <table class="table table-bordered" style="font-size: 13px;">
                                <tr>
                                <td rowspan="8" style="width:400px;">
                                	<img src="resource/img/gapyeong.jpg" style="width:100%; height:100%;"/>
                                </td>
                                    <th class="tr_bg">회원번호</th>
                                    <td>${dto.member_idx}
                                        <input type="hidden" value="${dto.member_idx}" name="member_idx" id="member_idx">
                                        <input type="hidden" value="${dto.owner_idx}" name="owner_idx" id="owner_idx">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">상호명</th>
                                    <td>${dto.title}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">사업자번호</th>
                                    <td>${dto.business_number}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">사업자명</th>
                                    <td>${dto.name}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">이메일</th>
                                    <td>${dto.email}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">전화번호</th>
                                    <td>${dto.tel}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">업체번호</th>
                                    <td>${dto.business_tel}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg">주소</th>
                                    <td>
                                    ${dto.addr}&nbsp;${dto.detailed_addr}
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg" colspan="3">설명</th>
                                </tr>
                                <tr>    
                                    <td colspan="3">${dto.ad_content}</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-center">
                                        <input class="bt btn-primary" type="button" onclick="appliD_Ok(${dto.owner_idx},${dto.member_idx})" value="승인">
                                        <input class="bt btn-secondary" type="button" onclick="appliD_Delete(${dto.owner_idx})" value="거절">
                                    </td>
                                </tr>
                            </table>
                        </form>
                </div>
        </fieldset>
    </div>
</body>
</html>