<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    <div id="adInquiryDetail">
        <fieldset style="border: 3px solid #0000008c; padding: 12px 14px 10px;
                margin-bottom: 20px;">
            <div class="row">
                <div class="col-md-12 mb-1">
                    <h5>광고 신청 정보</h5>
                </div>
            </div>
                <div class="row">
                	<form name="inquiryForm" method="post">
			            <table class="table table-bordered" style="font-size: 13px;">
			            	<tr>
                                <td rowspan="8" style="width:400px;">
                                	<img src="${odto.firstimg}" style="width:100%; height:100%;"/>
                                </td>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">문의번호</th>
                                    <td>${idto.inquiry_idx}
                                        <input type="hidden" value="${idto.owner_idx}" name="owner_idx" id="owner_idx">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">상호명</th>
                                    <td>${odto.title}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">사업자명</th>
                                    <td>${odto.name}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">사업자번호</th>
                                    <td>${odto.business_number}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">이메일</th>
                                    <td>${idto.email}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">전화번호</th>
                                    <td>${odto.tel}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">광고기간</th>
                                    <td>${idto.ad_period}</td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;">주소</th>
                                    <td>
                                    ${odto.addr}&nbsp;${odto.detailed_addr}
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tr_bg active text-white" style="border: 1px solid #0000008c;" colspan="3">문의내용</th>
                                </tr>
                                <tr>    
                                    <td colspan="3">${idto.inquiry_content}</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-center">
                                        <input class="bt btn-primary" type="button" onclick="admin_adInquiryD_Ok(${idto.inquiry_idx})" value="승인">
                                        <input class="bt btn-secondary" type="button" onclick="admin_adInquiryD_del(${idto.inquiry_idx})" value="거절">
                                    </td>
                                </tr>
                            </table>
                        </form>
                </div>
        </fieldset>
    </div>
</body>
</html>