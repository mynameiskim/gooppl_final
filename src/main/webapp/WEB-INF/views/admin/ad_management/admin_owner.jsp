<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resource/js/httpRequest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
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
.tb_hover{
	--bs-table-hover-bg: #1987541f !important;
}
</style>
<script>
function owner_Details(index,size){
	var param = document.getElementById("owner_idx"+index).value;
	var detail_btn = document.getElementById("detail_btn"+index);
	
	if(detail_btn.value=='상세보기'){
		sendRequest('admin_owner_detail.do?owner_idx='+param,null,showResult,'GET');
		for(var i=0; i<size; i++){
			detail_btn = document.getElementById("detail_btn"+i);
			if(i==index){
				detail_btn.value='접기';
			}else{
				detail_btn.value='상세보기';
			}
		}
	}else if(detail_btn.value=='접기'){
		var divNode = document.all.ownerDetail;
		divNode.remove();
		for(var i=0; i<size; i++){
			detail_btn = document.getElementById('detail_btn'+i);
			detail_btn.value='상세보기';
		}
	}
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			var data=XHR.responseText;
			var divNode=document.all.ownerDiv;
			divNode.innerHTML=data;
		}
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>광고 관리</b></h5>
		<dl>
			<dt>광고주 관리</dt>
			<dd>
				- <a href='admin_ownerAppli.do'
				>광고주 신청 관리</a><br />
				- <a href='admin_allOwner.do'
				>광고주 정보 관리</a>
			</dd>
			<dt>광고 문의 관리</dt>
			<dd>
				- <a href='admin_adAppli.do'
				>광고 신청 관리</a><br />
				- <a href='admin_adRevise.do'
				>광고 수정 관리</a><br/>
				- <a href='admin_adCancel.do'
				>광고 취소 관리</a>
			</dd>
			<dt>광고 상태 관리</dt>
			<dd>
				- <a href='admin_paymentStatus.do'
				>결제 상태 관리</a><br />
				- <a href='admin_adStatus.do'
				>광고 상태 관리</a>
			</dd>
		</dl>
	</div>
	<div id="contents"><h6><b>광고주 관리</b></h6>
		<ul class='helpbox'>
			<li>승인된 광고주 정보를 확인하고 수정 및 삭제를 할 수 있는 메뉴입니다.</li>
		</ul>
        <fieldset style="border:0px solid #dde0e5; padding: 12px 14px 0px;
		margin-bottom: 5px;">
        <table class="table table-hover tb_hover">
        		<thead>
                <tr class="tr_bg">
                	<th class="f_tab_th">번호</th>
                	<th class="f_tab_th">광고주번호</th>
                	<th class="f_tab_th">사업자번호</th>
                	<th class="f_tab_th">사업자명</th>
                	<th class="f_tab_th">상호명</th>
                	<th class="f_tab_th">이메일</th>
                    <th class="f_tab_th" width="200">기능</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}">
                	<tr>
                		<td colspan="8" align="center" class="f_tab_td">
                		<b>광고주 신청이 없습니다.</b>
                		</td>
                	</tr>
                </c:if>
                <c:forEach var="list" items="${list}" varStatus="status">
                <tr>
                	<td class="f_tab_td">${(cp-1)*listSize+status.index+1}</td>
                	<td class="f_tab_td">
	                	${list.owner_idx}
	                	<input id="owner_idx${status.index}" type="hidden" value="${list.owner_idx}">
                		<input id="member_idx${status.index}" type="hidden" value="${list.member_idx}">
                	</td>
                    <td class="f_tab_td">${list.business_number}</td>
                	<td class="f_tab_td">${list.name}</td>
                    <td class="f_tab_td">${list.title}</td>
                    <td class="f_tab_td">${list.email}</td>
                    <td class="f_tab_td" width="220">
	                    <input id="detail_btn${status.index}" class="bt btn-secondary" type="button" onclick="owner_Details(${status.index},${size})" value="상세보기">
	                    <input id="delete_btn${status.index}" class="bt btn-danger" type="button" onclick="owner_Delete(${status.index})" value="삭제">
                    </td>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                	<td colspan="8" align="center" class="f_tab_td">
					${pageStr}
					</td>
                </tr>
                </tfoot>
        </table>
        </fieldset>
        <div id="ownerDiv"></div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>