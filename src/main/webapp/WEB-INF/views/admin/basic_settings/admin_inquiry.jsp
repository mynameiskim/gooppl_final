<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
		
	if(detail_btn.value=='답변하기'){
		sendRequest('admin_inquiry_details.do?inquiry_idx='+param,null,showResult,'GET');
		for(var i=0;i<size;i++){
			detail_btn=document.getElementById("detail_btn"+i);
			if(i==index){
				detail_btn.value='접기';
			}else{
				detail_btn.value='답변하기';
			}
			
		}
		
	}else if(detail_btn.value=='접기'){
		var divNode=document.all.inquiryDiv2;
		divNode.remove();
		for(var i=0;i<size;i++){
			detail_btn=document.getElementById("detail_btn"+i);
			detail_btn.value='답변하기';
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

function inquiry_update(inquiry_idx){
	var inquiry_content = $('#answer_content').val();
	if(inquiry_content==null || inquiry_content==""){
		Swal.fire({
			  title: '답변 내용을 확인해주세요',
			  icon: 'warning',
			  confirmButtonText: '확인'
			}) 
	}else{
		$.ajax({
			type: "GET",
			url: 'admin_inquiry_update.do',
			data:{"inquiry_answer":inquiry_content,"inquiry_idx":inquiry_idx},
			success: function(data){
				if(data==1){
					Swal.fire({
				      title: "등록하였습니다.",
				      icon:'success',
				      allowOutsideClick:false
				    }).then((result) => {
				    	if (result.isConfirmed) {
				    		location.reload();
				    	}
				    })
				}else{
					Swal.fire({
						  title: '답변 등록 실패',
						  icon: 'error',
						  confirmButtonText: '확인'
					})  
				}
			}
		});
	}
}
</script>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="margin-top: 27px; width: 210px; float: left; color: #24292f !important;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-left:15px;"
    ">
      <svg width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-6"><b>기본설정</b></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item" style="margin: 10px 0;">
        <a href='admin_site_info.do?goo_id=${sessionScope.sessionId}' style="padding-left:20px; font-size: 13px; background-color: #24292f; color: white !important;" class="nav-link active" aria-current="page">
          <svg width="16" height="16"><use xlink:href='admin_site_info.do?goo_id=${sessionScope.sessionId}'></use></svg>
          사이트 기본정보
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_site_settings.do' class="nav-link text-white" style="padding-left:20px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_site_settings.do'></use></svg>
          사이트 환경설정
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_settings.do' class="nav-link text-white" style="padding-left:30px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_settings.do'></use></svg>
          관리자 설정
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_member_config.do' class="nav-link text-white" style="font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_member_config.do'></use></svg>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;약관 및 <br>&nbsp;&nbsp;&nbsp;&nbsp;개인정보보호정책
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_inquiry.do' class="nav-link text-white" style="padding-left:40px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_inquiry.do'></use></svg>
          문의 관리
        </a>
      </li>
    </ul>
    <hr>
     </div>
	<div id="contents"><h6><b>문의 관리</b></h6>
		<ul class='helpbox'>
			<li> 사용자들의 문의 사항에 답변을 할 수 있는 메뉴입니다.</li>
		</ul>
        <fieldset style="border:0px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 5px;">
        <table class="table table-hover tb_hover">
        		<thead>
                <tr class="tr_bg active text-white text-opacity-75">
                	<th class="f_tab_th">#</th>
                	<th class="f_tab_th">문의번호</th>
                	<th class="f_tab_th">회원번호</th>
                	<th class="f_tab_th">제목</th>
                	<th class="f_tab_th">작성일</th>
                	<th class="f_tab_th">답변상태</th>
                    <th class="f_tab_th" width="200">기능</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}">
                	<tr>
                		<td colspan="8" align="center" class="f_tab_td">
                		<b>문의 내역이 없습니다.</b>
                		</td>
                	</tr>
                </c:if>
                <c:forEach var="list" items="${list}" varStatus="status">
                <tr>
                	<td class="f_tab_td">${(cp-1)*listSize+status.index+1}</td>
                	<td class="f_tab_td">
	                	${list.inquiry_idx}
	                	<input id="inquiry_idx${status.index}" type="hidden" value="${list.inquiry_idx}">
                	</td>
                    <td class="f_tab_td">${list.member_idx}</td>
                	<td class="f_tab_td">${list.inquiry_subject}</td>
                    <td class="f_tab_td">${list.inquiry_writedate}</td>
                    <c:if test="${list.inquiry_status=='n'}">
                    <td class="f_tab_td" style="color:red;font-weight:800;">
                    	답변요청
                    </td>	
                    </c:if>
                    <c:if test="${list.inquiry_status=='y'}">
					<td class="f_tab_td" style="color:green;font-weight:800;">
                    	답변완료
                    </td>
                    </c:if>
                    <td class="f_tab_td" width="220">
	                    <input id="detail_btn${status.index}" class="btn btn-secondary" type="button" onclick="inquiry_Details(${status.index},${size})" value="답변하기">
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