<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function memberUpdate(member_idx,nickname){
	Swal.fire({
		title: '수정하시겠습니까?',
		text: "",
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
	  		
			$.ajax({
				type: "GET",
				url: 'member_update.do?member_idx='+member_idx+'&nickname='+nickname,
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
<div id="di2">
<fieldset style="border: 3px solid #1987541f; padding: 12px 14px 10px;
		margin-bottom: 20px;">
	<div class="row">
	    <div class="col-md-3 mb-1">
	        <h5>회원정보</h5>
	    </div>
	</div>
	<form name="member_update" action="member_update.do">
	<table class="table table-bordered" style="font-size: 13px;">
	    <tr>
	        <th class="tr_bg">회원번호</th>
	        <td>${mdto.member_idx}
	        <input type="hidden" name="member_idx" value="${mdto.member_idx}">
	        </td>
	        <th class="tr_bg">회원유형</th>
	        <td>${mdto.member_type}</td>
	    </tr>
	    <tr>
	    	<th class="tr_bg">구플 아이디</th>
	        <td>${mdto.goo_id}</td>
	        <th class="tr_bg">네이버 아이디</th>
	        <td>${mdto.naver_id}</td>
	    </tr>
	    <tr>
	    	<th class="tr_bg">카카오 아이디</th>
	        <td>${mdto.kakao_id}</td>
	    	<th class="tr_bg">닉네임</th>
	        <td><input type="text" value="${mdto.nickname}" name="nickname" required="required"></td>
	        
	    </tr>
	    <tr>
	        <th class="tr_bg">회원가입일</th>
	        <td colspan="3">${mdto.join_date}</td>
	    </tr>
	    <tr>
        	<td colspan="4" style="text-align: center;">
                <input class="bt btn-dark" type="submit" value="회원정보 수정" >
            </td>
        </tr>
    </table>
    </form>
</fieldset>
</div>
</body>
</html>