<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.tb_hover{
       --bs-table-hover-bg: lightgray !important;
}
.tr_bg{
       --bs-table-accent-bg: #24292f !important;
}
.tr_align{
	vertical-align: middle;
}
.form_control {
    display: block;
    width: 190px;
    padding: -0.625rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
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
	  		var param2=document.getElementById("id"+index).value;
	  		
			$.ajax({
				type: "GET",
				url: 'member_out_delete.do?out_no='+param+'&id='+param2,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==0  || result.code ==2){
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

function searchStart(){
	var param1 = $('#search_type').val();
	var param2 = $('#search').val();
	var param3 = $('#start_date').val();
	var param4 = $('#end_date').val();
	
	console.log(param1);
	console.log(param2);
	
	location.href = 'admin_member_out.do?search_type='+param1+'&search='+param2+'&start_date='+param3+'&end_date='+param4;
	
	
}
</script>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
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
		<form name="search">
		<table class="table table-bordered" style="font-size: 13px;">
			<tr>
				<th style="width:20%; vertical-align: middle; text-align: center;">조건 검색</th>
				<td style="width:80%;">
					<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="display:inline-block; width:100px;" id="search_type">
						<option value="id" ${id_selected}>아이디</option>
						<option value="out_reason" ${out_reason_selected}>탈퇴사유</option>
					</select>
					<input id="search" type="text" class="form_control" id="search" type="text" style="display:inline-block;" value="${search}">
				</td>
			</tr>
			<tr>
				<th style="width:20%; vertical-align: middle; text-align: center;">탈퇴일</th>
				<td style="width:80%;"><input id="start_date" value="${start_date}" type="date">~<input id="end_date" value="${end_date}" type="date"><label style="color:red;">&nbsp;&nbsp;${msg}</label></td>
			</tr>
		</table>
			<div class="row justify-content-md-center" style="padding: 20px 0px;">
				<div class="col-md-5 text-center">
					<input type="button" class="bt btn-dark" style="border-radius: 3px;" value="검색하기" onclick="searchStart()">
				</div>	
			</div>
		</form>
		<fieldset style="padding: 12px 14px 10px;
		margin-bottom: 5px; ${display}">
			<div class="col-md-12 text-left">
				<label><b>총 회원수:${totalMemberOut}</b></label>
				<c:if test="${search_num!=0}">
					<label><b>검색수: ${search_num}</b></label>
				</c:if>
			</div>
		<table class="table table-hover tb_hover" >
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
		  				<c:if test="${empty search}">
		  					<b>탈퇴회원 목록이 없습니다.</b>
		  				</c:if>
		  				<c:if test="${!empty search}">
		  					<b>검색 결과가 없습니다.</b>
		  				</c:if>
		  			</td>
		  		</tr>
		  	</c:if>
		  	<c:forEach var="list" items="${list}" varStatus="status">
		  		<tr style="vertical-align: middle;">
		  			<td class="text-center"  style="width:5%;"><input type="checkbox"></td>
		  			<td class="text-center"  style="width:10%;">${(cp-1)*listSize+status.index+1}
		  				<input id="out_no${status.index}" type="hidden" value="${list.out_no}">
		  			</td>
		  			<td class="text-center"  style="width:25%;">${list.id}
		  				<input id="id${status.index}" type="hidden" value="${list.id}">
		  			</td>
		  			<td class="text-center"  style="width:25%;">${list.out_reason}</td>
		  			<td class="text-center"  style="width:25%;">${list.outdate}</td>
		  			<td class="text-center"  style="width:10%;"><input type="button" style="border-radius: 3px;" class="bt btn-danger" value="삭제" onclick="memberOutDelete(${status.index})"></td>
		  		</tr>
		  	</c:forEach>
		  </tbody>
		</table>
		</fieldset>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>