<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resource/js/httpRequest.js"></script>
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
		<h5><b>광고 관리</b></h5>
		<dl>
			<dt>광고주 관리</dt>
			<dd>
				<a href='admin_ownerAppli.do' style="color: white !important;"
				>-광고주 신청 관리</a><br />
				<a href='admin_allOwner.do' style="color: white !important;"
				>-광고주 정보 관리</a>
			</dd>
			<dt>광고 문의 관리</dt>
			<dd>
				<a href='admin_adAppli.do' style="color: white !important;"
				>-광고 신청 관리</a><br />
				<a href='admin_adRevise.do' style="color: white !important;"
				>-광고 수정 관리</a><br/>
				<a href='admin_adCancel.do' style="color: white !important;"
				>-광고 취소 관리</a>
			</dd>
			<dt>광고 상태 관리</dt>
			<dd>
				<a href='admin_paymentStatus.do' style="color: white !important;"
				>-결제 상태 관리</a><br />
				<a href='admin_adStatus.do' style="color: white !important;"
				>-광고 상태 관리</a>
			</dd>
		</dl>
	</div>
	<div id="contents">
    	<h6><b>광고 상태 관리</b></h6>
    	<ul class='helpbox'>
				<li>광고 리스트를 확인하고 관리할 수 있는 메뉴입니다.</li>
			</ul>
		<table class="table table-bordered" style="font-size: 13px;">
			<tr>
				<th style="border: 1px solid #0000008c;">조건 검색</th>
				<td style="border: 1px solid #0000008c;">
					<select id="condition" name="condition" style="height: 22px;">
						<option value="payState">광고상태</option>
						<option value="payImp_uid">업장타입</option>
						<option></option>
					</select>
					<input type="text" style="width: 300px;">
				</td>
			</tr>
			<tr>
				<th style="border: 1px solid #0000008c;">광고시작일</th>
				<td style="border: 1px solid #0000008c;"><input type="date">~<input type="date"></td>
			</tr>
		</table>
			<div class="row justify-content-md-center" style="padding: 20px 0px;">
				<div class="col-md-5 text-center">
					<input type="button" class="bt btn-dark" style="border-radius: 5px;" value="검색하기" >
				</div>	
			</div>
			<div class="row">
				<div class="col-md-12 text-left">
					<label><b>총 광고수:${totalAd}</b>&nbsp; <b>검색수:</b></label>
				</div>
			</div>
		<table class="table table-hover tb_hover">
		  <thead>
				<tr class="tr_bg">
					<th class="text-center active text-white text-opacity-75" style="width:4%;">번호</th>
                    <th class="text-center active text-white text-opacity-75" style="width:12%;">광고번호</th>
					<th class="text-center active text-white text-opacity-75" style="width:10%;">광고주번호</th>
					<th class="text-center active text-white text-opacity-75" style="width:15%;">광고 시작일</th>
					<th class="text-center active text-white text-opacity-75" style="width:15%;">광고 종료일</th>
					<th class="text-center active text-white text-opacity-75" style="width:10%;">상태</th>
					<th class="text-center active text-white text-opacity-75" style="width:20%;">기능</th>
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
			      <td class="text-center" style="width:4%;">${(cp-1)*listSize+status.index+1}</td>
			      <td class="text-center" style="width:12%;">${list.ad_idx}
			      	<input id="imp_uid${status.index}" type="hidden" value="${list.imp_uid}">
			      </td>
			      <td class="text-center" style="width:10%;">${list.owner_idx}</td>
			      <td class="text-center" style="width:15%;">${list.ad_startDate}</td>
			      <td class="text-center" style="width:15%;">${list.ad_endDate}</td>
			      <td class="text-center" style="width:10%;">${list.ad_state}</td>
			      <td class="text-center" style="width:20%;">
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