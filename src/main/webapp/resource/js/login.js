
		window.onload=function(){
			var login_result = "<c:out value='${login_result}'/>";
		
			if(login_result=="yes"){
				Swal.fire({
					  position: 'center',
					  icon: 'success',
					  imageUrl: '/finalpj/resource/img/kakaologo/kakaohello.gif',
					  title:'LOGIN Success',
					  text:'환영합니다 ${sessionNickname}님!',
					  width: 500,
					  height:500,
					  showConfirmButton: false,
					  timer: 1500
					})
			      setTimeout(function(){location.href= "index.do"},1510);
			}else if(login_result=='no'){
				document.getElementById('login_bt').click();
				Swal.fire({
					  title: 'LOGIN Fail',
					  text: '아이디와 비밀번호를 확인해주세요.',
					  icon: 'warning',
					  confirmButtonText: '확인'
					})
			}else{
				
			}
		}