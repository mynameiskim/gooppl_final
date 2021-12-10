<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resource/css/admin_header.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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


.div_t {width:120px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }



출처: https://sub0709.tistory.com/114 [쓸데없는 코딩하기]
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
function changeCode(item) {
	var selected = item.selectedIndex;
	console.log(selected);
	
	var spanNode = document.getElementById('msg');
	
	if(selected == 1){
		spanNode.innerHTML = " 회원 = M , 광고주 = O";
	}else{
		spanNode.innerHTML = "";
}
	
		
	
}

function searchStart(){
	
	var param1 = $('#search_type').val();
	var param2 = $('#search').val();
	var param3 = $('#start_date').val();
	var param4 = $('#end_date').val();
	
	
	location.href = 'admin_member_list.do?search_type='+param1+'&search='+param2+'&start_date='+param3+'&end_date='+param4;
}

function memberUpdate(){
	
	var nickname = document.getElementById("nickname");
	var member_idx = document.getElementById("member_idx");
	
	var reg = /[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/
	
	if (!reg.test(nickname.value)) {
	 	Swal.fire({
		    title: "숫자,특수문자는 입력할 수 없습니다.",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("nickname").style.outline = "3px solid #CC0000";
	  				nickname.focus();
	  				return false;
		 	    }
		 	  })
	}else{
		document.getElementById("nickname").style.outline = "none";
	}
	
	console.log("진입시도"+nickname.value);
	
	if (nickname.value == '') {
		console.log("진입성공	"+nickname.value);
		
		Swal.fire({
		    title: "이름을 입력해주세요.",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("nickname").style.outline = "3px solid #CC0000";
	  				nickname.focus();
	  				return false;
		 	    }
		 	  })
	 }else{
	 	document.getElementById("nickname").style.outline = "none";
	 }
	
	
	if(nickname.value != '' && reg.test(nickname.value)){
	
		Swal.fire({
		title: '수정하시겠습니까?',
		text: "",
		icon: 'question',
		showCancelButton: true,
		confirmButtonColor: '#e3e3e3',
		cancelButtonColor: '#000000',
		confirmButtonText: '수정',
		cancelButtonText: '취소',
	    allowOutsideClick:false
	}).then((result) => {
	  if (result.isConfirmed) {
	  		
			$.ajax({
				type: "GET",
				url: 'member_update.do?member_idx='+member_idx.value+'&nickname='+nickname.value,
				dataType: "json",
				error: function(result){
					
				},
				success: function(result){
					if(result.code==0){
						Swal.fire({
					      title: result.msg,
					      icon:'warning',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#e3e3e3',
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
	
}

</script>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>게시판관리</b></h5>
		<dl>
			<dt>게시판관리</dt>
			<dd>
				 <a href='admin_share.do' style="color: white !important;"
				>-공유게시판 관리</a><br />
				 <a href='admin_review.do' style="color: white !important;"
				>-후기게시판 관리</a><br />
				 <a href='admin_relpy.do' style="color: white !important;"
				>-댓글 관리 </a>
			</dd>
		</dl>
	</div>
	<div id="contents"><h6><b>후기게시판</b></h6>
		<ul class='helpbox'>
			<li>후기게시판의 게시글을 관리하는 곳입니다.</li>
		</ul>
		<table class="table table-bordered" style="font-size: 13px;">
			<tr>
				<th style="width:20%;vertical-align: middle; text-align: center;">조건 검색</th>
				<td style="width:80%;">
					<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="display:inline-block; width:110px;" id="search_type" style="height: 22px;" onChange='changeCode(this);'>
						<option value="nickname" ${nickname_selected}>닉네임</option>
						<option value="member_type" ${member_type_selected}>회원유형</option>
						<option value="goo_id" ${goo_id_selected}>구플 아이디</option>
					</select>
					<input class="form_control" id="search" type="text" style="display:inline-block;" value="${search}">
					<span id="msg" style="color: black;">
						${member_type_selected == "selected"?" 회원 = M , 광고주 = O":""}
					</span>
				</td>
			</tr>
			<tr>
				<th style="width:20%;vertical-align: middle; text-align: center;">작성일</th>
				<td style="width:80%;"><input type="date" id="start_date" value="${start_date}">~<input type="date" id="end_date" value="${end_date}"></td>
			</tr>
		</table>
			<div class="row justify-content-md-center" style="padding: 20px 0px;">
				<div class="col-md-5 text-center">
					<input type="button" class="bt btn-dark" style="border-radius: 5px;" value="검색하기" onclick="searchStart()">
				</div>	
			</div>
			<fieldset style="padding: 12px 14px 10px;
		margin-bottom: 5px;">
		<div class="row">
				<div class="col-md-3 text-left">
					<label><b>총 게시글:${totalReview}</b></label>
					<c:if test="${search_num!=0}">
					<label><b>검색수: ${search_num}</b></label>
					</c:if>
				</div>
			</div>
		<table class="table table-hover tb_hover">
		  <thead>
				<tr class="tr_bg">
					<th class="text-center active text-white text-opacity-75" style="width:2%;"></th>
					<th class="text-center active text-white text-opacity-75" style="width:4%;">글번호</th>
                    <th class="text-center active text-white text-opacity-75" style="width:8%;">회원번호</th>
                    <th class="text-center active text-white text-opacity-75" style="width:8%;">닉네임</th>
                    <th class="text-center active text-white text-opacity-75" style="width:6%;">프롤로그</th>
					<th class="text-center active text-white text-opacity-75" style="width:14%;">제목</th>
					<th class="text-center active text-white text-opacity-75" style="width:13%;">에필로그</th>
					<th class="text-center active text-white text-opacity-75" style="width:15%;">작성날짜</th>
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
						<c:if test="${empty search}">
		  					<b>후기게시글이 없습니다.</b>
		  				</c:if>
		  				<c:if test="${!empty search}">
		  					<b>검색 결과가 없습니다.</b>
		  				</c:if>
					</td>
				</tr>
		  	</c:if>
		  	<c:forEach var="list" items="${list}" varStatus="status">
		  		<tr class="tr_align">
			      <th class="text-center" style="width:2%;"><input type="checkbox"></th>
			      <td class="text-center" style="width:7%;">${list.review_idx}</td>
			      <td class="text-center" style="width:8%;">${list.member_idx}</td>
			      <td class="text-center" style="width:8%;">${list.nickname}</td>
			      <td class="text-center" style="width:8%;"><div class="div_t">${list.prologue}</div></td>
			      <td class="text-center" style="width:16%;"><div class="div_t">${list.subject}</div></td>
			      <td class="text-center" style="width:10%;"><div class="div_t">${list.epilogue}</div></td>
			      <td class="text-center" style="width:8%;">${list.writedate}</td>
			      <td class="text-center" style="width:15%;">
			      <input id="btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-secondary" value="상세보기" onclick="memberInfo(${status.index},${size})">
			      <input id="delete_btn${status.index}" type="button" style="border-radius: 3px;" class="bt btn-danger" value="삭제" onclick="memberDelete(${status.index})">
			      </td>
			    </tr>
		  	</c:forEach>
		  </tbody>
		</table>
		</fieldset>
		<div id="di"></div>
       </div> 
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>