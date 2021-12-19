<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function inquiry_Details(index,size){
	var param=document.getElementById("inquiry_idx"+index).value;
	var detail_btn=document.getElementById("detail_btn"+index);
		
	if(detail_btn.value=='상세보기'){
		sendRequest('adInquiry_details.do?inquiry_idx='+param,null,showResult,'GET');
		for(var i=0;i<size;i++){
			detail_btn=document.getElementById("detail_btn"+i);
			if(i==index){
				detail_btn.value='접기';
			}else{
				detail_btn.value='상세보기';
			}
			
		}
		
	}else if(detail_btn.value=='접기'){
		var divNode=document.all.adInquiryDetail;
		divNode.remove();
		for(var i=0;i<size;i++){
			detail_btn=document.getElementById("detail_btn"+i);
			detail_btn.value='상세보기';
		}
	}
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			var data=XHR.responseText;
			var divNode=document.all.inquiryDiv;
			divNode.innerHTML=data;
		}
	}
}

//리스트의 승인
function adInquiry_ok(index){
	Swal.fire({
		title: '승인하시겠습니까?',
		text: "결제가 완료되면 광고가 등록됩니다.",
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick: () => !Swal.isLoading()
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var param1=document.getElementById("inquiry_idx"+index).value;
	  		
			$.ajax({
				type: "GET",
				url: 'admin_adInquiry_ok.do?inquiry_idx='+param1,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399'
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
					      confirmButtonColor: '#d33'
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

//리스트의 거절
function admin_adInquiry_del(index){
	Swal.fire({
		title: '요청을 거절하시겠습니까?',
		text: "신청된 정보는 삭제됩니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#A4C399',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick: () => !Swal.isLoading()
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var inquiry_idx=document.getElementById("inquiry_idx"+index).value;
	  		
			$.ajax({
				type: "GET",
				url: 'admin_adInquiry_del.do?inquiry_idx='+inquiry_idx,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399'
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
					      confirmButtonColor: '#d33'
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

//상세보기의 승인
function admin_adInquiryD_Ok(inquiry_idx){
	Swal.fire({
		title: '승인하시겠습니까?',
		text: "결제가 완료되면 광고가 출력됩니다.",
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick: () => !Swal.isLoading()
	}).then((result) => {
	  if (result.isConfirmed) {
	  		
			$.ajax({
				type: "GET",
				url: 'admin_adInquiry_ok.do?inquiry_idx='+inquiry_idx,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399'
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
					      confirmButtonColor: '#d33'
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

//상세보기의 거절
function admin_adInquiryD_del(inquiery_idx){
	Swal.fire({
		title: '요청을 거절하시겠습니까?',
		text: "신청된 정보는 삭제됩니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#A4C399',
		cancelButtonColor: '#000000',
		confirmButtonText: '확인',
		cancelButtonText: '취소',
		showLoaderOnConfirm: true,
		allowOutsideClick: () => !Swal.isLoading()
	}).then((result) => {
	  if (result.isConfirmed) {
	  		var owner_idx=document.getElementById("owner_idx").value;
	  		
			$.ajax({
				type: "GET",
				url: 'admin_adInquiry_del.do?inquiry_idx='+inquiery_idx,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399'
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
					      confirmButtonColor: '#d33'
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
	<div id="contents"><h6><b>광고 신청 관리</b></h6>
		<ul class='helpbox'>
			<li>신청된 광고 정보를 확인하고 승인 및 거절을 할 수 있는 메뉴입니다.</li>
		</ul>
        <fieldset style="border:0px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 5px;">
        <table class="table table-hover tb_hover">
        		<thead>
                <tr class="tr_bg active text-white text-opacity-75">
                	<th class="f_tab_th">번호</th>
                	<th class="f_tab_th">광고주번호</th>
                	<th class="f_tab_th">이메일</th>
                	<th class="f_tab_th">광고기간</th>
                	<th class="f_tab_th">작성일</th>
                    <th class="f_tab_th" width="220">기능</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}">
                	<tr>
                		<td colspan="8" align="center" class="f_tab_td">
                		<b>광고 신청이 없습니다.</b>
                		</td>
                	</tr>
                </c:if>
                <c:forEach var="list" items="${list}" varStatus="status">
                <tr>
                	<td class="f_tab_td">${(cp-1)*listSize+status.index+1}</td>
                	<td class="f_tab_td">
	                	${list.owner_idx}
	                	<input id="inquiry_idx${status.index}" type="hidden" value="${list.inquiry_idx}">
	                	<input id="owner_idx${status.index}" type="hidden" value="${list.owner_idx}">
                	</td>
                    <td class="f_tab_td">${list.email}
                    </td>
                    <td class="f_tab_td">${list.ad_period}</td>
                	<td class="f_tab_td">${list.writeDate}</td>
                    <td class="f_tab_td" width="220">
	                    <input id="detail_btn${status.index}" class="bt btn-secondary" type="button" onclick="inquiry_Details(${status.index},${size})" value="상세보기">
	                    <input id="ok_btn${status.index}" class="bt btn-primary" type="button" onclick="adInquiry_ok(${status.index})" value="승인">
	                    <input id="delete_btn${status.index}" class="bt btn-danger" type="button" onclick="admin_adInquiry_del(${status.index})" value="거절">
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
        <div id="inquiryDiv"></div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>