<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--로그인 모달-->
	<div class="modal fade" id="loginmd" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1" aria-labelledby="loginmdLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">LOG IN</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body p-1 pt-0">
					<div class="col-md-8 col-lg-8 mx-auto">
						<form name="login_fm" action="login.do" method="post"
							enctype="application/x-www-form-urlencoded">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">이메일
									주소</label> <input type="email" class="form-control" name="goo_id"
									aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">
									아직 구플 회원이 아니신가요? <a href="#" role="button"
										data-bs-toggle="modal" data-bs-target="#joinmd">회원가입</a>
								</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">비밀번호</label>
								<input type="password" class="form-control" name="pwd">
								<div id="emailHelp" class="form-text">
									 <a href="#" role="button"
										data-bs-toggle="modal" data-bs-target="#idCheckModal">비밀번호가 기억나지 않으신가요?</a>
								</div>
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" id="saveid"
									name="saveid"> <label class="form-check-label"
									for="exampleCheck1">ID기억하기</label>
							</div>
							<div class="d-grid gap-2">
								<input type="submit" class="btn btn-primary" value="로그인">
							</div>
						</form>
						<hr>
						<div class="mb-3 text-center">SNS 간편 로그인</div>
						<div class="mb-3 text-center">
							<!-- 아래와같이 아이디를 꼭 써준다. -->
							<div id="naver_id_login"
								style="text-align: center; margin-bottom: 2px;">
								<a href="${naver_url}"> <img width="90%"
									src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
							</div>
							<div id="kakao_id_login" style="text-align: center">
								<a href="${kakao_url}"> <img width="90%"
									src="/gooppl/resource/img/kakaologo/kakao_login_large_narrow.png" />
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 모달 끝 -->
	<!-- join modal -->
	<div class="modal fade" id="joinmd" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1" aria-labelledby="joinmdLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">SIGN UP</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body p-1 pt-0">
					<div class="input-form col-md-9 col-lg-9 mx-auto">
						<form class="needs-validation" id="joinForm" name="joinForm" action="join.do" 
						method="post" enctype="application/x-www-form-urlencoded" novalidate >
						<!-- 멤버 타입 히든 -->
						<input type="hidden" name="member_type" value="M">
						<!--  -->
							<div class="row form-group has-feedback">
								<div class="col-md-12 mb-3">
									<label for="email">이메일</label> 
									<div class="input-group mb-1">
									  <input type="text" name="goo_id" id="goo_id" class="form-control" placeholder="goo@gmail.com" aria-label="goo@gmail.com" aria-describedby="idCheck" required>
									  <button class="btn btn-outline-primary" type="button" id="idCheck">ID 체크</button>
									</div>
								</div>
								<div class="col-md-10 mb-3 form-group has-feedback"  id="token_div" style="display:none;">
									 <div class="input-group mb-3">
									  <input type="text" id="mail_token"class="form-control" placeholder="인증번호를 입력하세요." aria-label="인증번호를 입력하세요" aria-describedby="Token_button" required readonly>
									  <button class="btn btn-outline-secondary" type="button" id="token_button" value="n">인증번호 발급</button>
									  <button class="btn btn-outline-secondary" type="button" id="token_check" value="n" style="display:none">인증하기</button>
									  <button class="btn btn-success" type="button" id="token_ok" value="n" style="display:none" disabled>인증완료</button>
									  <input type="hidden" id="made_token">
									  <label style="color:red; display:none;">인증번호가 올바르지 않습니다.</label>
									</div>
								</div>
							</div>
							<div class="mb-3 form-group has-feedback">
									<label for="nickname">닉네임</label>
									 <input type="text" class="form-control" name="nickname" id="nickname" placeholder="" value="" required>
							</div>
							<div class="mb-3 form-group has-feedback">
									<label for="pwd">비밀번호</label>
									 <input type="password" class="form-control pwds" name="pwd" id="pwd" placeholder="" value="" required pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}">
									<div class="valid-feedback">사용가능</div>
       								<div class="invalid-feedback">하나 이상의 숫자,문자,특수문자를 포함하여 8자 이상입력하셔야 합니다.</div>
							</div>
							<div class="mb-3 form-group has-feedback">
									<label for="pwdRe">비밀번호 확인</label> 
									<input type="password" class="form-control pwds" id="pwdRe" placeholder="" value="" required pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}">
									<div id="cPwdValid" class="valid-feedback">사용가능</div>
       								<div id="cPwdInvalid" class="valid-feedback">하나 이상의 숫자,문자,특수문자를 포함하여 8자 이상입력하셔야 합니다.</div>
       							
							</div>
							<hr class="mb-4 form-group has-feedback">
							<div class="form-check mb-3">
								<input type="checkbox" class="form-check-input" id="aggrement1" required> 
								<label class="form-check-label" for="aggrement1">개인정보 수집 및 이용에 동의합니다.</label>
								<a href="#" style="text-decoration: none; font-size: 0.7em;">보기</a>
							</div>
							<div class="form-check mb-3 mb-3">
								<input type="checkbox" class="form-check-input" id="aggrement2" required> 
								<label class="form-check-label" for="aggrement2">이용약관에 동의합니다.</label>
								<a href="#" style="text-decoration: none; font-size: 0.7em;">보기</a>
							</div>
							<div class="d-grid gap-2 mb-4">
							<button class="btn btn-primary btn-lg btn-block" type="submit" id="joinbt" disabled="true">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--조인 모달 끝-->
	<!-- 비밀번호 찾기 모달 시작 ---------------------------------------------------------------------------------------->
	<div class="modal fade" id="idCheckModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
					<h5 class="modal-title">비밀번호 찾기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
                <br>
                <div class="modal-body p-2 pt-0">
                    <div class="row justify-content-md-center mb-3">
                        <div class="col-md-10 mb-2">
                            <label for="email">이메일</label> 
							<div class="input-group mb-1">
							  <input type="text" name="goo_id_pwdfind" id="goo_id_pwdfind" class="form-control" placeholder="goo@gmail.com" aria-label="goo@gmail.com" aria-describedby="idCheck" required>
							</div>
                        </div>
                        <div class="col-md-10 mb-2">
                            <h6 style="font-size:14px;">회원가입시 등록하셨던 이메일 주소를 입력해주세요</h6> 
                        </div>
                    </div>
                    <div class="row justify-content-md-center mb-5">
                      <div class="col-md-10 text-center">
				    	<button style="width: 100%" class="btn btn-primary" type="button" id="pwdfind_bt" value="n">메일받기</button>
				      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!--  비밀번호 찾기 모달 끝------------------------------------------------------------------------------------------- -->