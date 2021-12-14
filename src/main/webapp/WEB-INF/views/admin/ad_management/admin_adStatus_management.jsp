<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
function adInfo(index,size){
	var param=document.getElementById("ad_idx"+index).value;
	var btn=document.getElementById("btn"+index);
	
	console.log(size);
		
	if(btn.value=='상세보기'){
		sendRequest('admin_ad_info.do?ad_idx='+param,null,showResult,'GET');
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

function adUp(index, owner_idx){
	Swal.fire({
		title: '광고를 올리시겠습니까?',
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick:false
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var param=document.getElementById("owner_idx"+index).value;
	  		
			$.ajax({
				type: "GET",
				url: 'admin_adState_up.do?owner_idx='+param,
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

function adDown(index, owner_idx){
	Swal.fire({
		title: '광고를 내리겠습니까?',
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick:false
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var param=document.getElementById("owner_idx"+index).value;
	  		
			$.ajax({
				type: "GET",
				url: 'admin_adState_down.do?owner_idx='+param,
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
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="margin-top: 27px; width: 210px; float: left; color: #24292f !important;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-left:15px;"
    ">
      <svg width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-6"><b>광고관리</b></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item" style="margin: 10px 0;">
        <a href='admin_ownerAppli.do' style="padding-left:18px; font-size: 13px; background-color: #24292f; color: white !important;" class="nav-link active" aria-current="page">
          <svg width="16" height="16"><use xlink:href='admin_ownerAppli.do'></use></svg>
          광고주 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_allOwner.do' class="nav-link text-white" style="padding-left:18px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_allOwner.do'></use></svg>
          광고주 정보 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adAppli.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adAppli.do'></use></svg>
          광고 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adCancel.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adCancel.do'></use></svg>
          환불 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_paymentStatus.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_paymentStatus.do'></use></svg>
          결제 내역 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adStatus.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adStatus.do'></use></svg>
          광고 상태 관리
        </a>
      </li>
    </ul>
    <hr>
     </div>
	<div id="contents">
    	<h6><b>광고 상태 관리</b></h6>
    	<ul class='helpbox'>
				<li>광고 리스트를 확인하고 관리할 수 있는 메뉴입니다.</li>
			</ul>
		
			<div class="row">
				<div class="col-md-12 text-left">
					<label><b>총 광고수:${totalAd}</b></label>
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
			      	<input id="ad_idx${status.index}" type="hidden" value="${list.ad_idx}">
			      	<input id="owner_idx${status.index}" type="hidden" value="${list.owner_idx}">
			      </td>
			      <td class="text-center" style="width:10%;">${list.owner_idx}</td>
			      <td class="text-center" style="width:15%;">${list.ad_startDate}</td>
			      <td class="text-center" style="width:15%;">${list.ad_endDate}</td>
			      <td class="text-center" style="width:10%;">${list.ad_state}</td>
			      <td class="text-center" style="width:20%;">
			      <input id="btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-secondary" value="상세보기" onclick="adInfo(${status.index},${size})">
			      <c:if test="${list.ad_state.equals('광고중')}">
				      <input id="adDown_btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-danger" value="광고내림" onclick="adDown(${status.index},${list.owner_idx})">
			      </c:if>
			      <c:if test="${list.ad_state.equals('광고내림')}">
			      	  <input id="adUp_btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-danger" value="광고올림" onclick="adUp(${status.index},${list.owner_idx})">
			      </c:if>
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