<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resource/css/admin_header.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.tb_hover{
       --bs-table-hover-bg: lightgray !important;
}
.tr_bg{
       --bs-table-accent-bg: #24292f !important;
}
.tr_aling{
	vertical-align: middle;
}
</style>
<script>
function memberInfo(index,size){
	var param=document.getElementById("member_idx"+index).value;
	var btn=document.getElementById("btn"+index);
	
	console.log(size);
		
	if(btn.value=='상세보기'){
		sendRequest('member_info.do?member_idx='+param,null,showResult,'GET');
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

function memberDelete(index){
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
				url: 'member_delete.do?member_idx='+param,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==0){
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
		<h5><b>회원관리</b></h5>
		<dl>
			<dt>회원목록</dt>
			<dd>
				 <a href="admin_member_list.do" style="color: white !important;"
				>-회원목록</a><br />
			</dd>
			<dt>탈퇴회원목록</dt>
			<dd>
				 <a href="admin_member_out.do" style="color: white !important;"
					>-탈퇴회원목록</a><br />
			</dd>
			<dt>폼메일 관리</dt>
			<dd>
				 <a href="admin_formmail_settings.do?form_type=회원가입" style="color: white !important;"
				>-폼메일 관리</a><br />
			</dd>
		</dl>
	</div>
	<div id="contents">
    	<h6><b>회원목록</b></h6>
    	<ul class='helpbox'>
				<li>사이트에 가입한 회원목록 입니다.</li>
			</ul>
		<table class="table table-bordered" style="font-size: 13px;">
			<tr>
				<th style="border: 1px solid #0000008c;">조건 검색</th>
				<td style="border: 1px solid #0000008c;">
					<select style="height: 22px;">
						<option>제목</option>
						<option>작성자</option>
						<option>내용</option>
					</select>
					<input type="text" style="width: 300px;">
				</td>
			</tr>
			<tr>
				<th style="border: 1px solid #0000008c;">등록일</th>
				<td style="border: 1px solid #0000008c;"><input type="date">~<input type="date"></td>
			</tr>
		</table>
			<div class="row justify-content-md-center" style="padding: 20px 0px;">
				<div class="col-md-5 text-center">
					<input type="button" class="bt btn-dark" style="border-radius: 5px;" value="검색하기" >
				</div>	
			</div>
			<div class="row">
				<div class="col-md-3 text-left">
					<label><b>총 회원수:${totalMember}</b> <b>검색수:</b></label>
				</div>
				<div class="col-md-9 mb-1" style="writing-mode: vertical-rl;">
					<input type="button" class="bt btn-dark" style="border-radius: 5px;" value="엑셀파일저장"> 
				</div>
			</div>
		<table class="table table-hover tb_hover">
		  <thead>
				<tr class="tr_bg">
					<th class="text-center active text-white text-opacity-75" style="width:2%;"></th>
					<th class="text-center active text-white text-opacity-75" style="width:4%;">번호</th>
                    <th class="text-center active text-white text-opacity-75" style="width:8%;">회원번호</th>
                    <th class="text-center active text-white text-opacity-75" style="width:8%;">회원유형</th>
                    <th class="text-center active text-white text-opacity-75" style="width:6%;">닉네임</th>
					<th class="text-center active text-white text-opacity-75" style="width:12%;">구플 아이디</th>
					<th class="text-center active text-white text-opacity-75" style="width:16%;">네이버 아이디</th>
					<th class="text-center active text-white text-opacity-75" style="width:14%;">카카오 아이디</th>
					<th class="text-center active text-white text-opacity-75" style="width:13%;">회원가입일</th>
					<th class="text-center active text-white text-opacity-75" style="width:15%;">기능</th>
				</tr>
		</thead>
			<tfoot style="border-top: 0px">
		      <tr>
				<td colspan="10" class="text-center">${pageStr}</td>
		     </tr>
		  	</tfoot>
		  <tbody>
		  	<c:if test="${empty list}">
		  		<tr>
				<td colspan="10" align="center">
				<b>등록된 회원이 없습니다.</b>
				</td>
			</tr>
		  	</c:if>
		  	<c:forEach var="list" items="${list}" varStatus="status">
		  		<tr class="tr_aling">
			      <th class="text-center" style="width:2%;"><input type="checkbox"></th>
			      <td class="text-center" style="width:4%;">${(cp-1)*listSize+status.index+1}</td>
			      <td class="text-center" style="width:8%;">${list.member_idx}
			      	<input id="member_idx${status.index}" type="hidden" value="${list.member_idx}">
			      </td>
			      <td class="text-center" style="width:8%;">${list.member_type}</td>
			      <td class="text-center" style="width:6%;">${list.nickname}</td>
			      <td class="text-center" style="width:12%;">${list.goo_id}</td>
			      <td class="text-center" style="width:16%;">${list.naver_id}</td>
			      <td class="text-center" style="width:14%;">${list.kakao_id}</td>
			      <td class="text-center" style="width:13%;">${list.join_date}</td>
			      <td class="text-center" style="width:15%;">
			      <input id="btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-secondary" value="상세보기" onclick="memberInfo(${status.index},${size})">
			      <input id="delete_btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-danger" value="삭제" onclick="memberDelete(${status.index})">
			      </td>
			    </tr>
		  	</c:forEach>
		  </tbody>
		</table>
		<div id="di"></div>
       </div> 
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>