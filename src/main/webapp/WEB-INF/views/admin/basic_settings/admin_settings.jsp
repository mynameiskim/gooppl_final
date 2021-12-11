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

function search_adress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

function addAdmin(){
	open('admin_insert.do','admin_insert','width=800px,height=800px,top=200,left=100');
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

function admin_update(){
	
	var pwd = document.getElementById("pwd");
	var repwd = document.getElementById("repwd");
	var nickname = document.getElementById("nickname");
	var admin_phone = document.getElementById("admin_phone");
	var admin_tel = document.getElementById("admin_tel");
	var admin_detail_addr = document.getElementById("sample6_detailAddress");
	var admin_addr = document.getElementById("sample6_address");
	var sample6_postcode = document.getElementById("sample6_postcode");

	//비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	
	if (!pwdCheck.test(pwd.value)) {
		Swal.fire({
		    title: "비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("pwd").style.outline = "3px solid #CC0000";
	   				pwd.focus();
	   				return false;
		 	    }
		 	  })
	 }
	 
	 if (repwd.value !== pwd.value) {
	 	Swal.fire({
		    title: "비밀번호가 일치하지 않습니다.",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("repwd").style.outline = "3px solid #CC0000";
	   				repwd.focus();
	   				return false;
		 	    }
		 	  })
	 }
	 
	
	
	if (nickname.value == "") {
		Swal.fire({
		    title: "이름을 입력하세요.",
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
	 
	var reg =	/^[가-힣a-zA-Z]+$/  //한글,영어만 입력
	 
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
	 
	var reg = /^[0-9]{11}/gi; //숫자만 입력하는 정규식
	
	if (!reg.test(admin_phone.value)) {
		Swal.fire({
		    title: "핸드폰 번호는 숫자만 입력할 수 있습니다.",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("admin_phone").style.outline = "3px solid #CC0000";
					admin_phone.focus();
					return false;
		 	    }
		 	  })
	}else{
		document.getElementById("admin_phone").style.outline = "none";
	}
	
	var reg = /^[0-9]{9,12}/gi; //숫자만 입력하는 정규식
	
	if (!reg.test(admin_tel.value)) {
		Swal.fire({
		    title: "전화번호는 숫자만 입력할 수 있습니다.",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("admin_tel").style.outline = "3px solid #CC0000";
	  				admin_tel.focus();
	  				return false;
		 	    }
		 	  })
	}else{
		document.getElementById("admin_tel").style.outline = "none";
	}
	
	if (sample6_postcode.value == "") {
		Swal.fire({
		    title: "주소를 입력해 주세요",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("sample6_postcode").style.outline = "3px solid #CC0000";
	   				sample6_postcode.focus();
	   				return false;
		 	    }
		 	  })
	 }else{
	 	document.getElementById("sample6_postcode").style.outline = "none";
	 }
	 
	 if (sample6_postcode.value == "") {
		Swal.fire({
		    title: "주소를 입력해 주세요",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("sample6_postcode").style.outline = "3px solid #CC0000";
	  				sample6_postcode.focus();
	  				return false;
		 	    }
		 	  })
	 }else{
	 	document.getElementById("sample6_postcode").style.outline = "none";
	 }
	 
	 if (admin_addr.value == "") {
		Swal.fire({
		    title: "상세주소를 입력해 주세요",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("sample6_address").style.outline = "3px solid #CC0000";
	   				admin_addr.focus();
	   				return false;
		 	    }
		 	  })
	 }else{
	 	document.getElementById("sample6_address").style.outline = "none";
	 }
	 
	 if (admin_detail_addr.value == "") {
		Swal.fire({
		    title: "상세주소를 입력해 주세요",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("sample6_detailAddress").style.outline = "3px solid #CC0000";
	  				admin_detail_addr.focus();
	  				return false;
		 	    }
		 	  })
	 }else{
	 	document.getElementById("sample6_detailAddress").style.outline = "none";
	 }
	
	 var reg = /[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/; //특수문자 입력불가
	 
	 if (!reg.test(admin_detail_addr.value)) {
		Swal.fire({
		    title: "특수문자는 입력할 수 없습니다.",
		    icon:'warning',
		    confirmButtonText: '확인',
		    confirmButtonColor: '#d33',
		    showLoaderOnConfirm: true,
		    allowOutsideClick:false
		  }).then((result) => {
		    	if (result.isConfirmed) {
		 			document.getElementById("sample6_detailAddress").style.outline = "3px solid #CC0000";
					admin_detail_addr.focus();
					return false;
		 	    }
		 	  })
	}else{
		document.getElementById("sample6_detailAddress").style.outline = "none";
	}
	
	$.ajax({
		type: "POST",
		data : $("#admin_update").serialize(),
		url: 'admin_update.do',
		dataType: "json",
		error: function(result){
			
		},
		success: function(result){
			if(result.code==1){
				Swal.fire({
			      title: result.msg,
			      icon:'success',
			      confirmButtonText: '확인',
			      confirmButtonColor: '#d33',
			      showLoaderOnConfirm: true,
			      allowOutsideClick:false
			    }).then((result) => {
			    	if (result.isConfirmed) {
			 			location.reload();
			    	}
			    })
			}else if(result.code==0){
				Swal.fire({
			      title: result.msg,
			      icon:'warning',
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

function keyUpCheck(){
	var pwd = document.getElementById("pwd");
	var repwd = document.getElementById("repwd");
	var pwdLabelNode = document.getElementById("pwdSpan");
	//비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
 	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	var pwdLabelNode = document.getElementById("pwdLabel");
	var repwdSpanNode = document.getElementById("repwdSpan")
	if (!pwdCheck.test(pwd.value)) {
	   	document.getElementById("pwd").style.outline = "3px solid red";
	   	document.getElementById("pwdLabel").style.color = "black";
	   	pwdLabelNode.innerHTML = '&nbsp;비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.';
	   	
	   	if(repwd.value !== pwd.value) {
		   document.getElementById("repwd").style.outline = "3px solid #CC0000";
		   document.getElementById("repwdSpan").style.color = "red";
		   repwdSpanNode.innerHTML = "비밀번호 불일치";
		   
		}else if(repwd.value == pwd.value){
			repwdSpanNode.innerHTML = "";
			document.getElementById("repwd").style.outline = "none";
			
		}else if(( (48<=pwd.keyCode) && (pwd.keyCode<=57) ) || (pwd.keyCode==8)){
			pwdLabelNode.innerHTML = '&nbsp;비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.';
			document.getElementById("pwd").style.outline = "none";
			
		}else if(pwd.value == '' && repwd.value == ''){
			repwdSpanNode.innerHTML = '';
			document.getElementById("repwd").style.outline = "none";
			
		}
	   
	   return false;
	}else if(pwdCheck.test(pwd.value)){
		document.getElementById("pwd").style.outline = "green";
		document.getElementById("pwdLabel").style.color = "green";
		pwdLabelNode.innerHTML = "입력하신 비밀번호는 사용가능한 비밀번호입니다.(영문자+숫자+특수문자)"
		
		if (repwd.value !== pwd.value) {
		   document.getElementById("repwd").style.outline = "3px solid #CC0000";
		   document.getElementById("repwdSpan").style.color = "red";
		   repwdSpanNode.innerHTML = "비밀번호 불일치";
		   
		}else if(repwd.value == pwd.value){
			repwdSpanNode.innerHTML = "비밀번호 일치";
			document.getElementById("repwd").style.outline = "none";
			document.getElementById("repwdSpan").style.color = "green";
			
		}else if(( (48<=pwd.keyCode) && (pwd.keyCode<=57) ) || (pwd.keyCode==8)){
			pwdLabelNode.innerHTML = '&nbsp;비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.';
			document.getElementById("pwd").style.outline = "none";
			
		}else if(pwd.value == '' && repwd.value == ''){
			repwdSpanNode.innerHTML = '';
			document.getElementById("repwd").style.outline = "none";
			
		}
		return false;
	}
}

function keyUpCheck2(){
	var pwd = document.getElementById("pwd");
	var repwd = document.getElementById("repwd");
	var repwdSpanNode = document.getElementById("repwdSpan");
	if (( (48<=repwd.keyCode) && (repwd.keyCode<=57) ) || (repwd.keyCode==8) ){
           event.returnValue=true;
    }
	if (repwd.value !== pwd.value) {
	   document.getElementById("repwd").style.outline = "3px solid #CC0000";
	   document.getElementById("repwdSpan").style.color = "red";
	   repwdSpanNode.innerHTML = "비밀번호 불일치";
	   
	   if(((48<=repwd.keyCode) && (repwd.keyCode<=57) ) || (repwd.keyCode==8)){
			repwdSpanNode.innerHTML = '';
			document.getElementById("repwd").style.outline = "none";
			return false;
		}else if(pwd.value == '' && repwd.value == ''){
			repwdSpanNode.innerHTML = '';
			document.getElementById("repwd").style.outline = "none";
			return false;
		}
	   return false;
	}else if(repwd.value == pwd.value){
		repwdSpanNode.innerHTML = "비밀번호 일치";
		document.getElementById("repwd").style.outline = "none";
		document.getElementById("repwdSpan").style.color = "green";
		
		if(( (48<=repwd.keyCode) && (repwd.keyCode<=57) ) || (repwd.keyCode==8)){
			repwdSpanNode.innerHTML = '';
			document.getElementById("repwd").style.outline = "none";
			return false;
		}else if(pwd.value == '' && repwd.value == ''){
			repwdSpanNode.innerHTML = '';
			document.getElementById("repwd").style.outline = "none";
			return false;
		}
		
		return false;
	}
	
}
</script>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
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
        <fieldset style="padding: 12px 14px 10px;
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
        <div><button type="button" class="bt btn-dark" style="margin-left:5px; border-radius: 3px; margin-bottom:10px;" onclick="addAdmin()">관리자 등록</button></div>
        </fieldset>
        <div id="di"></div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>