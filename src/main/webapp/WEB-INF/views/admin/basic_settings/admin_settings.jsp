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
.tb_hover{
	--bs-table-hover-bg: lightgray !important;
}
</style>
<script>

function addAdmin(){
	open('admin_insert.do','admin_insert','width=600px,height=500px,top=300,left=800');
}

function adminDetails(index,size){
	var param=document.getElementById("goo_id"+index).value;
	var btn=document.getElementById("btn"+index);
	
	console.log(size);
		
	if(btn.value=='상세보기'){
		sendRequest('admin_details.do?goo_id='+param,null,showResult,'GET');
		for(var i=0;i<size;i++){
			btn=document.getElementById("btn"+i);
			if(i==index){
				btn.value='접기';
			}else{
				btn.value='상세보기';
			}
			
		}
		
	}else if(btn.value=='접기'){
		var divNode=document.all.di2;
		divNode.remove();
		for(var i=0;i<size;i++){
			btn=document.getElementById("btn"+i);
			btn.value='상세보기';
		}
	}
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			var data=XHR.responseText;
			var divNode=document.all.di;
			divNode.innerHTML=data;
		}
	}
}

function adminDelete(index){
	Swal.fire({
		title: '정말로 삭제하시겠습니까?',
		text: "삭제된 계정은 복구가 불가능합니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#000000',
		confirmButtonText: '삭제',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick:false
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var param=document.getElementById("member_idx"+index).value;
	  		
			$.ajax({
				type: "GET",
				url: 'admin_delete.do?member_idx='+param,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==2){
						Swal.fire({
					      title: result.msg,
					      icon:'warning',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#d33',
					      showLoaderOnConfirm: true,
					      allowOutsideClick:false
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
					}else if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399',
					      showLoaderOnConfirm: true,
					      allowOutsideClick:false
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
					}else {
						Swal.fire({
					      title: result.msg,
					      icon:'error',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#d33',
					      showLoaderOnConfirm: true,
					      allowOutsideClick:false
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.reload();
					    	}
					    })
					}
				}
			});
	  }
	})
}

</script>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>기본설정</b></h5>
		<dl>
			<dt>사이트 정보관리</dt>
			<dd>
				<c:url var="site_info_Url" value="admin_site_info.do">
					<c:param name="goo_id">${sessionScope.sessionId}</c:param>
				</c:url>
				<b><a href='${site_info_Url}' style="color: white !important;"
				>-사이트 기본정보</a></b><br />
				<b><a href='admin_site_settings.do' style="color: white !important;"
				>-사이트 환경설정</a></b><br />
			</dd>
			<dt>관리자 설정</dt>
			<dd>
				<b><a href='admin_settings.do' style="color: white !important;"
					>-관리자 설정</a></b><br />
			</dd>
			<dt>가입약관 및 개인정보보호정책</dt>
			<dd>
				<b> <a href='admin_member_config.do' style="color: white !important;"
				>-약관 및 개인정보보호정책</a></b><br />
			</dd>
		</dl>
	</div>
	<div id="contents"><h6><b>관리자 설정</b></h6>
		<ul class='helpbox'>
			<li>홈페이지 관리자에 접속 할 수 있는 관리자 정보를 수정할 수 메뉴입니다.</li>
		</ul>
        <fieldset style="border:0px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 5px;">
        <table class="table table-hover tb_hover">
        		<thead>
                <tr class="tr_bg active text-white text-opacity-75">
                	<th class="f_tab_th" style="width:5%;">번호</th>
                	<th class="f_tab_th" style="width:8%;">회원유형</th>
                	<th class="f_tab_th" style="width:8%;">회원번호</th>
                	<th class="f_tab_th" style="width:8%;">이름</th>
                    <th class="f_tab_th" style="width:17%;">아이디</th>
                    <th class="f_tab_th" style="width:17%;">최근 접속일</th>
                    <th class="f_tab_th" style="width:17%;">등록일</th>
                    <th class="f_tab_th" style="width:20%;">기능</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                	<td colspan="8" align="center" class="f_tab_td">
					${pageStr}
					</td>
                </tr>
                </tfoot>
                <tbody>
                <c:if test="${empty list1}">
                	<tr>
                		<td colspan="8" align="center" class="f_tab_td">
                		<b>등록된 관리자가 없습니다.</b>
                		</td>
                	</tr>
                </c:if>
                <c:forEach var="list1" items="${list1}" varStatus="status">
                <tr>
                	<td class="f_tab_td" style="width:5%;">${(cp-1)*listSize+status.index+1}</td>
                	<td class="f_tab_td" style="width:8%;">${list1.member_type}</td>
                	<td class="f_tab_td" style="width:8%;">${list1.member_idx}
                	<input id="member_idx${status.index}" type="hidden" value="${list1.member_idx}">
                	</td>
                    <td class="f_tab_td" style="width:8%;">${list1.nickname}</td>
                    <td class="f_tab_td" style="width:17%;">${list1.goo_id}
                    <input id="goo_id${status.index}" type="hidden" value="${list1.goo_id}">
                    </td>
                    <td class="f_tab_td" style="width:17%;">${list2[status.index].last_connection_date}</td>
                    <td class="f_tab_td" style="width:17%;">${list1.join_date}</td>
                    <td class="f_tab_td" style="width:20%;">
                    <input id="btn${status.index}" class="bt btn-secondary" style="border-radius: 3px;" type="button" onclick="adminDetails(${status.index},${size})" value="상세보기">
                    <input id="delete_btn${status.index}" class="bt btn-danger" style="border-radius: 3px;" type="button" onclick="adminDelete(${status.index})" value="삭제">
                    </td>
                </tr>
                </c:forEach>
                </tbody>
        </table>
        </fieldset>
        <div><button type="button" class="bt btn-dark" style="margin-left:5px; border-radius: 3px; margin-bottom:10px;" onclick="addAdmin()">관리자 등록</button></div>
        <div id="di"></div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>