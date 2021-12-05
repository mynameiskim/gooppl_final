<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.tb_hover{
       --bs-table-hover-bg: lightgray !important;
}
.tr_bg{
       --bs-table-accent-bg: #24292f !important;
}
</style>
<script>
function memberOutDelete(index){
	Swal.fire({
		title: '정말로 삭제하시겠습니까?',
		text: "삭제된 탈퇴회원 정보는 복구가 불가능합니다.",
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
	  		var param=document.getElementById("out_no"+index).value;
	  		
			$.ajax({
				type: "GET",
				url: 'member_out_delete.do?out_no='+param,
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
    	<h6><b>탈퇴회원목록</b></h6>
    	<ul class='helpbox'>
			<li>회원이 마이페이지에서 회원탈퇴 신청한 경우 회원DB는 모두 삭제되고 탈퇴회원 목록에 나옵니다.</li>
		</ul>
		<table class="table table-bordered" style="font-size: 13px;">
			<tr>
				<th>조건 검색</th>
				<td>
					<select style="height: 22px;">
						<option>제목</option>
						<option>작성자</option>
						<option>내용</option>
					</select>
					<input type="text" style="width: 300px;">
				</td>
			</tr>
			<tr>
				<th>탈퇴일</th>
				<td><input type="date">~<input type="date"></td>
			</tr>
		</table>
			<div class="row justify-content-md-center" style="padding: 20px 0px;">
				<div class="col-md-5 text-center">
					<input type="button" class="bt btn-dark" style="border-radius: 3px;" value="검색하기" >
				</div>	
			</div>
			<div class="row">
				<div class="col-md-3 text-left">
					<label><b>총 회원수:${totalMemberOut}</b> <b>검색수:</b></label>
				</div>
			</div>
		<table class="table table-hover tb_hover">
		  <thead>
				<tr class="tr_bg">
					<th class="text-cente active text-white text-opacity-75r"  style="width:5%;"></th>
                    <th class="text-center active text-white text-opacity-75"  style="width:10%;">번호</th>
					<th class="text-center active text-white text-opacity-75"  style="width:25%;">아이디</th>
					<th class="text-center active text-white text-opacity-75"  style="width:25%;">탈퇴사유</th>
					<th class="text-center active text-white text-opacity-75"  style="width:25%;">탈퇴일</th>
					<th class="text-center active text-white text-opacity-75"  style="width:10%;">삭제</th>
				</tr>
		</thead>
			<tfoot style="border-top: 0px">
		      <tr>
				<td colspan="9" class="text-center">${pageStr}</td>
		     </tr>
		  	</tfoot>
		  <tbody>
		  	<c:if test="${empty list}">
		  		<tr>
		  			<td colspan="6" align="center">
		  				<b>탈퇴한 회원이 없습니다.</b>
		  			</td>
		  		</tr>
		  	</c:if>
		  	<c:forEach var="list" items="${list}" varStatus="status">
		  		<tr style="vertical-align: middle;">
		  			<td class="text-center"  style="width:5%;"><input type="checkbox"></td>
		  			<td class="text-center"  style="width:10%;">${(cp-1)*listSize+status.index+1}
		  				<input id="out_no${status.index}" type="hidden" value="${list.out_no}">
		  			</td>
		  			<td class="text-center"  style="width:25%;">${list.id}</td>
		  			<td class="text-center"  style="width:25%;">${list.out_reason}</td>
		  			<td class="text-center"  style="width:25%;">${list.outdate}</td>
		  			<td class="text-center"  style="width:10%;"><input type="button" style="border-radius: 3px;" class="bt btn-danger" value="삭제" onclick="memberOutDelete(${status.index})"></td>
		  		</tr>
		  	</c:forEach>
		  </tbody>
		</table>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>	