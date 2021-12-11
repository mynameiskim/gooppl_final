<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.dto.web_browser_title}</title>
<meta name="description" content="${sessionScope.dto.description}">
<meta name="keyword" content="${sessionScope.dto.keyword}">
<link rel="shortcut icon" href="${sessionScope.dto.favicon}" type="image/x-icon" />
<link rel="icon" href="${sessionScope.dto.favicon}" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resource/css/admin_common.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.mg_top{
	margin-top:30px;
}
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
th{
	vertical-align: middle;
    text-align: center;
}
input:focus {
	outline: 3px soild dark !important; 
}
.form_control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
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
window.addEventListener('load', () => {
   const forms = document.getElementsByClassName('need-validation');
   
   Array.prototype.filter.call(forms, (form) => {
      form.addEventListener('submit', function (event) {
         if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
         }
      
         form.classList.add('was-validated');
      }, false);
   });
}, false);


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
			if(result.code==2){
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
			}else if(result.code==1){
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
function admin_idCheck(){
	 var email = $("#goo_id").val();        // 입력한 이메일
	 var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	 if(email==''){
    	   Swal.fire('이메일을 입력해주세요');
   	 }else if(!reg.test(email)){
   		 Swal.fire('이메일 형식을 확인해주세요.<br>ex)gooppl@naver.com');
	 }else{
		 $.ajax({
	            method:"GET",
	            url:"idCheck.do",
	            data:{"email":email},
	            success:function(data){
	                if(data==0){//사용 가능한 아이디 라면 
	                	 Swal.fire({
							  title: '사용가능한 Email입니다.',
							  icon: 'success',
							  confirmButtonText: '확인'
							});
	                	 $('#token_div').css('display','');
	                	
	                    
	                }else{//사용 가능한 아이디가 아니라면 
	                	 Swal.fire({
							  title: '사용중인 Email입니다.',
							  icon: 'warning',
							  confirmButtonText: '확인'
							});
	                	 $('#token_div').css('display','none');
	                	$('#mail_token_pwdfind_label').css('display','none');
	                }
	            }
	     });
       } 
}

/*인증번호 체크*/
function token_check2(){
	var input_token=$('#mail_token').val();
	var made_token=$('#made_token').val();	
	if(input_token==made_token){
		Swal.fire('인증되었습니다.');
		$('#joinbt').removeAttr("disabled");
		$('#mail_token').attr('readonly','readonly');
		$('#token_check').css('display','none')
		$('#token_ok').css('display','')
	}else{
		Swal.fire({
		  title: '인증 실패',
		  text: '인증번호를 확인해주세요!',
		  icon: 'warning',
		  confirmButtonText: '확인'
		})
	}

}
	
   /* 인증번호 이메일 전송 */
function token(){
    var email = $("#goo_id").val();        // 입력한 이메일
    
    $.ajax({
           
           type:"GET",
           url:"mailCheck.do",
           data:{"email":email},
           success:function(data){
           	$('#made_token').val(data);
           }        
       });
    Swal.fire({
	  title: '입력하신 Email로 인증번호를 전송하였습니다.',
	  icon: 'success',
	  confirmButtonText: '확인'
	})
	    $('#goo_id').attr('readonly','readonly');
	    $('#token_button').css('display','none');
	    $('#token_check').css('display','');
	    $('#mail_token').removeAttr('readonly');
      
}



function sample6_execDaumPostcode() {
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
</script>
</head>
<body>
	<div class="row">
        <div class="col-md-12 mb-12 mg_top">
            <h5 class="text-center">관리자 등록</h5>
        </div>
    </div>
    <form id="admin_insert" name="admin_insert" action="admin_insert.do" method="post" class="need-validation" novalidate>
    <table class="table table-bordered mg_top" style="font-size: 13px;">
    	<tr>
            <th class="tr_bg active text-white">아이디</th>
            <td style="border: 1px solid #0000008c;">
            <input class="form_control" type="email" id="goo_id" name="goo_id" required="required" placeholder="이메일을 입력해주세요 ex) njw4803@naver.com">
            <input class="btn btn-outline-dark" type="button" id="idCheck" onclick="admin_idCheck()" value="ID체크">
            <div class="col-md-10 mb-3 form-group has-feedback"  id="token_div" style="display:none;">
				 <div class="input-group mb-3">
				  <input type="text" id="mail_token"class="form-control" placeholder="인증번호를 입력하세요." aria-label="인증번호를 입력하세요" aria-describedby="Token_button" required readonly>
				  <button class="btn btn-outline-secondary" type="button" id="token_button" onclick="token()" value="n">인증번호 발급</button>
				  <button class="btn btn-outline-secondary" type="button" id="token_check" onclick="token_check2()" value="n" style="display:none">인증하기</button>
				  <button class="btn btn-success" type="button" id="token_ok" value="n" style="display:none" disabled>인증완료</button>
				  <input type="hidden" id="made_token">
				  <label style="color:red; display:none;">인증번호가 올바르지 않습니다.</label>
				</div>
			</div>
            </td>
        </tr>
        <tr>
        	<th class="tr_bg active text-white">비밀번호</th>
            <td style="border: 1px solid #0000008c;">
            <input class="form_control" type="password" id="pwd" name="pwd" required="required" placeholder="비밀번호를 입력해주세요." onkeyup="keyUpCheck()" onkeydown="keyUpCheck()"><label id="pwdLabel"> &nbsp;비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.</label>
            </td>
        </tr>
        <tr>
        	<th class="tr_bg active text-white">비밀번호 확인</th>
            <td style="border: 1px solid #0000008c;">
            <input class="form_control" type="password" id="repwd" required="required" onkeyup="keyUpCheck2()" onkeydown="keyUpCheck2()">
            <span id="repwdSpan"></span>
            </td>
        </tr>
        <tr>
        	<th class="tr_bg active text-white">이름</th>
            <td colspan="3" style="border: 1px solid #0000008c;"><input class="form_control" id="nickname" type="text" name="nickname" required="required" ><label> &nbsp;숫자와 ,특수문자는 입력할 수 없습니다.</label></td>
        </tr>
        <tr>
            <th class="tr_bg active text-white">휴대폰</th>
            <td style="border: 1px solid #0000008c;"><input class="form_control" type="tel" id="admin_phone" name="admin_phone" required="required" maxlength="11" required="required"><label> &nbsp;-없이 숫자만 입력해주세요.</label></td>
        </tr>
        <tr>
        	<th class="tr_bg active text-white">전화번호</th>
            <td style="border: 1px solid #0000008c;"><input class="form_control" type="tel" id="admin_tel" name="admin_tel" required="required" maxlength="11"><label> &nbsp;-없이 숫자만 입력해주세요.</label></td>
        </tr>
        <tr>
       		<th class="tr_bg active text-white">우편번호</th>
            <td style="border: 1px solid #0000008c;"><input class="form_control" name="admin_postcode" type="text" id="sample6_postcode" style="display:inline-block; width: 100px;" readonly="readonly"><input class="btn btn-outline-dark" style="display:inline-block; vertical-align: baseline; width: 150px;" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 검색"></td>
        </tr>
        <tr>
            <th class="tr_bg active text-white">주소</th>
            <td style="border: 1px solid #0000008c;">
	            <input class="form_control" type="text" id="sample6_address" name="admin_addr" style="width: 600px;" required="required" readonly="readonly">
	            <input class="form_control" type="text" id="sample6_extraAddress" name="admin_extra_addr" required="required" readonly="readonly" style=" display:inline-block; width: 300px;"><input class="form_control" type="text" id="sample6_detailAddress" name="admin_detail_addr" placeholder="상세주소"  style=" display:inline-block; width: 300px;">
            </td>
        </tr>
        <tr>
            <td colspan="4" class="text-center">
                <span><input id="admin_join" class="bt btn-dark" style="border-radius: 3px;" type="submit" value="등록"></span>
            </td>
        </tr>
    </table>
    </form>
</body>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</html>