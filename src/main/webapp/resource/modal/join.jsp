<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
					<div class="col-md-9 col-lg-9 mx-auto">
						<form method="post">
							<div class="mb-2">
								<label class="form-label" style="color: #6c757d">이메일</label> <input
									type="email" class="form-control" name="email"
									placeholder="ex) gooppl@naver.com">
							</div>
							<div class="mb-2">
								<label class="form-label " style="color: #6c757d">성명</label> <input
									type="text" class="form-control" name="name">
							</div>
							<div class="mb-2">
								<label class="form-label" style="color: #6c757d">비밀번호</label> <input
									type="password" class="form-control" name="pwd"
									placeholder="영문,특수문자 혼합 12자 이상">
							</div>
							<div class="mb-2">
								<label class="form-label" style="color: #6c757d">비밀번호 확인</label>
								<input type="password" class="form-control" name="pwd_re">
							</div>
							<div class="mb-1 form-check">
								<input type="checkbox" class="form-check-input" id="check1">
								<label class="form-check-label" style="font-size: 0.7em;">개인정보수집에
									동의합니다</label> <a href="#"
									style="text-decoration: none; font-size: 0.7em;">보기</a>
							</div>
							<div class="mb-2 form-check">
								<input type="checkbox" class="form-check-input" id="check2">
								<label class="form-check-label" style="font-size: 0.7em;">이용약관에
									동의합니다.</label> <a href="#"
									style="text-decoration: none; font-size: 0.7em;">보기</a>
							</div>
							<div class="d-grid gap-2 mb-4">
								<button class="btn btn-primary" type="submit">가입하기</button>
								<button class="btn btn-dark" type="button">뒤로가기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</html>