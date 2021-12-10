<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resource/js/httpRequest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
<script type="text/javascript" src="/gooppl/resource/js/httpRequest.js"></script>
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
		sendRequest('admin_adInquiryDel_details.do?inquiry_idx='+param,null,showResult,'GET');
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

//상세보기에서 환불 승인
function cancelPay(index){
	Swal.fire({
		title: '환불하시겠습니까?',
		text: "해당광고는 내려가게됩니다.",
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
		  var imp_uid = document.getElementById("imp_uid").value;
		  var merchant_uid = document.getElementById("merchant_uid").value;
		  var amount = document.getElementById("amount").value;
		  var reason = document.getElementById("reason").value;
		  
		  console.log('imp_uid:'+imp_uid);
		  console.log('merchant_uid:'+merchant_uid);
		  console.log('inquiry_idx: '+index);
		  
		  jQuery.ajax({
				"url": "https://cors-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel?_token=478cae913fdd742bed389727283c1c5e21395711", // 예: http://www.myservice.com/payments/cancel
			    "type": "POST",
			    "contentType": "application/json",
			    "data": JSON.stringify({
			    	"imp_uid": imp_uid,
			        "merchant_uid": merchant_uid, // 예: ORD20180131-0000011
			        "cancel_request_amount": amount, // 환불금액
			        "reason": reason // 환불사유
			    }),
			    "dataType": "json"
			}).done(function(result) { //환불 성공시 로직
				var param = 'imp_uid='+imp_uid+'&inquiry_idx='+index;
				sendRequest('admin_delInquiry_Ok.do', param, showResult2, 'GET');

			}).fail(function(error) { //환불 실패시 로직
				Swal.fire({
				      title: '환불 실패',
				      icon:'error',
				      confirmButtonText: '확인',
				      confirmButtonColor: '#d33'
				    }).then((result) => {
				    	if (result.isConfirmed) {
				    		location.reload();
				    	}
				    })
				   
			});
		}
	})
}

function showResult2(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			console.log('db넘어와따!');
			var data = XHR.responseText;
			data = eval('('+data+')');
			console.log(data);
			console.log(data.code);
			if(data.code==1){
				Swal.fire({
					title: '환불이 완료되었습니다.',
					icon:'success',
					confirmButtonText: '확인',
					confirmButtonColor: '#A4C399'
				}).then((result) => {
					if (result.isConfirmed) {
						location.reload();
				    }
				});
			}else if(data.code==2){
				Swal.fire({
				    title: 'Data ERROR',
				    text: data.msg,
				    icon:'error',
				    confirmButtonText: '확인',
				    confirmButtonColor: '#d33'
			    }).then((result) => {
			    	if (result.isConfirmed) {
			    		location.reload();
			    	}
			    });
			}
		}else if(data.code==0){
			Swal.fire({
			    title: 'ERROR',
			    icon:'error',
			    confirmButtonText: '확인',
			    confirmButtonColor: '#d33'
		    }).then((result) => {
		    	if (result.isConfirmed) {
		    		location.reload();
		    	}
		    });
		}
	}
}


//리스트의 거절
function admin_delInquiry_Delete(index){
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
				url: 'admin_delInquiry_Delete.do?inquiry_idx='+inquiry_idx,
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
function admin_delInquiryD_Delete(inquiry_idx){
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
	  		
			$.ajax({
				type: "GET",
				url: 'admin_delInquiry_Delete.do?inquiry_idx='+inquiry_idx,
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
	<div id="contents"><h6><b>환불 신청 관리</b></h6>
		<ul class='helpbox'>
			<li>신청된 환불 정보를 확인하고 승인 및 거절을 할 수 있는 메뉴입니다.</li>
		</ul>
        <fieldset style="border:0px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 5px;">
        <table class="table table-hover tb_hover">
        		<thead>
                <tr class="tr_bg active text-white text-opacity-75">
                	<th class="f_tab_th">번호</th>
                	<th class="f_tab_th">광고주번호</th>
                	<th class="f_tab_th">이메일</th>
                	<th class="f_tab_th">환불사유</th>
                	<th class="f_tab_th">작성일</th>
                    <th class="f_tab_th" width="220">기능</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}">
                	<tr>
                		<td colspan="8" align="center" class="f_tab_td">
                		<b>환불 문의가 없습니다.</b>
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
                    <td class="f_tab_td">${list.reason}</td>
                	<td class="f_tab_td">${list.writeDate}</td>
                    <td class="f_tab_td" width="220">
	                    <input id="detail_btn${status.index}" class="bt btn-secondary" type="button" onclick="inquiry_Details(${status.index},${size})" value="상세보기">
	                    <input id="delete_btn${status.index}" class="bt btn-danger" type="button" onclick="admin_delInquiry_Delete(${status.index})" value="거절">
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
</body>
</html>