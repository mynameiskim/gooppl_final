<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="inquiryDiv2">
		<fieldset>
	           <div class="row">
	             <table class="table" style="font-size: 13px;">
	                 <tr>
	                     <th class="tr_bg active text-center text-white" style="border: 1px solid #0000008c;" colspan="4">문의 & 답변</th>
	                 </tr>
	                 <tr>
	                 	<td colspan="2" class="text-center">
	                 		<label style="font-size:20px; font-weight:800">문의내용</label>
	                 	</td>
	                 	<td colspan="2" class="text-center">
							<label style="font-size:20px; font-weight:800">답변내용</label>							
						</td>                      	
	                 </tr>
	                 <tr>    
	                     <td class="text-center" colspan="2">
	                    <textarea id="inquiry_content" name="inquiry_content" rows="6" style="width:80%;" readonly="readonly">${dto.inquiry_content}</textarea>
	                     </td>
	                     <td class="text-center" colspan="2">
	                     	<textarea id="answer_content" name="answer_content" rows="6" style="width:80%;">${dto.inquiry_answer}</textarea>
	                 	  </td>
	                 </tr>
	                 <tr>
	                     <td colspan="3" class="text-center">
	                         <input class="bt btn-secondary" type="button" onclick="inquiry_update(${dto.inquiry_idx})" value="등록" style="width:200px;font-size:20px;height:50px;">
	                     </td>
	                 </tr>
	             </table>
	           </div>
        </fieldset>
    </div>
</body>
</html>