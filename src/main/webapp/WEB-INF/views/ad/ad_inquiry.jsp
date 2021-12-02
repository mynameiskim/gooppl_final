<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Grayscale - Start Bootstrap Theme</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resource/css/styles.css" rel="stylesheet" />
    <link href="resource/css/bootstrap.min.css" rel="stylesheet" />
    <script>
    	function changeInquiryType(){
    		var changeTypeNode = document.getElementById('changeType');
    		var inquiry_typeValue = document.getElementById('inquiry_type').value;
    		
    		console.log(inquiry_typeValue);
    		
    		var noticeNode = document.getElementById('notice');
    		var delNoticeTextNode = noticeNode.firstChild;
    		console.log(noticeNode);
    		var delNode = noticeNode.nextSibling;
    		
    		var periodInputNode = document.createElement('input');
    		var reasonSelectNode = document.createElement('select');
    		
    		noticeNode.setAttribute('class','form-label');
    		
    		if(inquiry_typeValue==='광고신청'){
    			var noticeTextNode = createTextNode
    			if(changeTypeNode.childNodes.length>0){
    				changeTypeNode.removeChild('noticeNode');
    				changeTypeNode.removeChild('delNode');
    			}
    			
    			changeTypeNode.appendChild(noticeNode);
    			noticeTextNode = document.createTextNode(inquiry_typeValue);
    			noticeNode.appendChild(noticeTextNode);
	    		
    			periodInputNode.setAttribute('type', 'number');
    			periodInputNode.setAttribute('name', 'ad_period');
    			periodInputNode.setAttribute('requerid' , true);
    			changeTypeNode.appendChild(periodInputNode);
    		}else if(inquiry_typeValue==='광고취소'){
    			if(changeTypeNode.childNodes.length>0){
    				//noticeNode.removeChild('delNoticeTextNode');
    				changeTypeNode.removeChild(documentElementById('notice'));
    				changeTypeNode.removeChild('delNode');
    			}
    		}else if(inquiry_typeValue==='광고수정'){
    			if(changeTypeNode.childNodes.length>0){
    				//noticeNode.removeChild('delNoticeTextNode');
    				changeTypeNode.removeChild('noticeNode');
    				changeTypeNode.removeChild('delNode');
    			}
    		}
    		
    	}
        function ckTermsOfUse(){
            var inquiryForm = document.inquiryForm;
            var ck = document.inquiryForm.check1;
            if(!ck){
                window.alert('약관에 동의해주세요');
    		    return false;
    	    }
            inquiryForm.submit();
        }
    </script>
</head>

<body id="page-top">
   <!-- Navigation-->
   <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#page-top">GooPPl</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">Plan</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Community</a></li>
                <li class="nav-item"><a class="nav-link" href="#">MyPage</a></li>
                <li class="nav-item"><a class="nav-link" href="#">LogIn</a></li>
            </ul>
        </div>
    </div>
</nav>
    
    <section class="signup-section" id="sigup">
    	<div class="container px-5 my-5" style="width:55%">
    	<form name="inquiryForm" action="#">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h2>광고 문의</h2>
                    </div>
                    <div class="col-md-4">
                        <select class="form-select" id="inquiry_type" name="inquiry_type" onchange="changeInquiryType()" required>
                            <option value="광고신청" selected>광고 신청</option>
                            <option value="광고수정">광고 수정</option>
                            <option value="광고취소">광고 취소</option>
                        </select>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row gx-5 gx-lg-6">
                    <div class="mb-4">
                        <div class="row">
                            <div class="col-4 mb-4">
                                <label class="form-label" style="color:#6c757d">상호명</label>
                                <input type="text" class="form-control" id="title" name="title" value="${title}" readonly>
                            </div>
                            <div class="col-4 mb-4">
                                <label class="form-label" style="color:#6c757d">사업자번호</label>
                                <input type="text" class="form-control" id="business_number" name="business_number" value="${business_number}" readonly>
                            </div>
<div class="col-4 mb-4" id="changeType"><label class="form-label" style="color:#6c757d" id="notice">광고기간</label><input type="number" class="form-control" id="ad_period" name="ad_period"></div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label" style="color:#6c757d">이메일</label>
                        <input type="email" class="form-control" name="email" placeholder="ex)gooppl@gmail.com" value="${email}" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label" style="color:#6c757d">문의내용</label>
                        <textarea class="form-control" name="inquiries" rows="10" required></textarea>
                    </div>
                    <div class="mb-1 form-check">
                        <label>상담하시고자 하는 내용을 보내주세요.<br>빠른 시일내에 담당자가 연락드리겠습니다.<br></label>
                        <label class="form-check-label" style="font-size: 0.7em;">
                            수집항목: 이메일 주소 <br>
                            수집목접: 광고에 대한 처리 및 결과 회신
                            보유 및 이용기간: 수집된 이메일 주소는 관련 법령에 달리 명시되어 있지 않는 한, 문의처리 후 1년간 보관<br>
                            그 밖에 사항은 <a href="#" style="color:blue">개인정보 처리방침</a>에 대하여 동의하셔야합니다.<br>
                            고객님은 동의를 거부하실 수 있으며, 거부 시 문의 등록을 하실 수 없습니다.
                        </label><br>
                        <input type="checkbox" class="form-check-input" id="check1" required>
                        <label class="form-check-label">개인정보 수집·이용에 대하여 동의합니다.</label>
                    </div>
                    <div class="d-grid gap-2">
                        <input type="submit" class="btn btn-primary" value="확인" >
                        <!-- <button class="btn btn-primary" type="submit">확인</button> -->
                    </div>
            </div>
    	</form>
    	</div>
    </section>
    
    
    <!-- Contact-->
    <section class="contact-section bg-primary align-items-center">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-md-center">
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-map-marked-alt text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">Address</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50">은평구 동서로 101-2</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-envelope text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">Email</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50"><a href="#">hello@yourdomain.com</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-mobile-alt text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">FAQ</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50"><a href="#">문의하기</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="social d-flex justify-content-center">
                <a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                <a class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                <a class="mx-2" href="#!"><i class="fab fa-github"></i></a>
            </div>
        </div>
    </section>
    
    <!-- Footer-->
    <footer class="footer bg-primary small text-center text-white-50">
        <div class="container px-4 px-lg-5">Copyright &copy; Your Website 2021</div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>

</html>