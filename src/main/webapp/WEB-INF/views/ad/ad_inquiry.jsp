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
    		var divNode = document.getElementById('changeType');
    		//var fstNode = divNode.firstChild.nextSibling.nodeName;
    		var labelNode = document.getElementById('notice');
    		var textNode = labelNode.lastChild;
    		
    		
    		var contentNode1 = labelNode.nextSibling;
    		var contentNode2 = labelNode.nextSibling.nextSibling;
    		console.log('태그1 이름'+contentNode1.nodeName);
    		console.log('태그2 이름'+contentNode2.nodeName);
    		console.log('라벨노드'+labelNode.nodeName);
    		
    		
    		var inquiry_typeValue = document.getElementById('inquiry_type').value;
    		
    		if(inquiry_typeValue === '광고신청'){
    			labelNode.removeChild(textNode);
    			divNode.removeChild(contentNode1);
    			divNode.removeChild(contentNode2);
    			
    			var labelTextNode = document.createTextNode('광고기간(개월)');
    			labelNode.appendChild(labelTextNode);
    			
    			var inputNode = document.createElement('input');
    			inputNode.setAttribute('type','number');
    			inputNode.setAttribute('name','ad_period');
    			inputNode.setAttribute('class','form-control');
    			inputNode.setAttribute('min',1);
    			inputNode.setAttribute('max',24);
    			inputNode.setAttribute('required', "required");
    			
    			var hiddenNode = document.createElement('input');
    			hiddenNode.setAttribute('type','hidden');
    			hiddenNode.setAttribute('name','reason');
    			hiddenNode.setAttribute('value','N');
    			
    			divNode.appendChild(inputNode);
    			divNode.appendChild(hiddenNode);
    			
    		}else if(inquiry_typeValue === '광고수정'){
    			labelNode.removeChild(textNode);
    			divNode.removeChild(contentNode1);
    			divNode.removeChild(contentNode2);
    			
    			var labelTextNode = document.createTextNode(' ');
    			labelNode.appendChild(labelTextNode);
    			
    			var inputNode = document.createElement('input');
    			inputNode.setAttribute('type','hidden');
    			inputNode.setAttribute('name','ad_period');
    			inputNode.setAttribute('value',0);
    			
    			var hiddenNode = document.createElement('input');
    			hiddenNode.setAttribute('type','hidden');
    			hiddenNode.setAttribute('name','reason');
    			hiddenNode.setAttribute('value','N');
    			
    			divNode.appendChild(inputNode);
    			divNode.appendChild(hiddenNode);
    		}else if(inquiry_typeValue === '광고취소'){
    			labelNode.removeChild(textNode);
    			divNode.removeChild(contentNode1);
    			divNode.removeChild(contentNode2);
    			
    			var labelTextNode = document.createTextNode('환불사유');
    			labelNode.appendChild(labelTextNode);
    			
    			var selectNode = document.createElement('select');
    			selectNode.setAttribute('class','form-select');
    			selectNode.setAttribute('name','reason');
    			selectNode.setAttribute('required',"required");
    			var optionNode1 = document.createElement('option');
    			var optionNode2 = document.createElement('option');
    			var optionNode3 = document.createElement('option');
    			var optionNode4 = document.createElement('option');
    			var optionNode5 = document.createElement('option');
    			var optionTextNode1 = document.createTextNode('광고효과가 없음');
    			var optionTextNode2 = document.createTextNode('금액부담');
    			var optionTextNode3 = document.createTextNode('가게사정');
    			var optionTextNode4 = document.createTextNode('폐업');
    			var optionTextNode5 = document.createTextNode('기타');
    			optionNode1.setAttribute('value','광고효과가 없음');
    			optionNode2.setAttribute('value','금액부담');
    			optionNode3.setAttribute('value','가게사정');
    			optionNode4.setAttribute('value','폐업');
    			optionNode5.setAttribute('value','기타');
    			optionNode1.appendChild(optionTextNode1);
    			optionNode2.appendChild(optionTextNode2);
    			optionNode3.appendChild(optionTextNode3);
    			optionNode4.appendChild(optionTextNode4);
    			optionNode5.appendChild(optionTextNode5);
    			selectNode.appendChild(optionNode1);
    			selectNode.appendChild(optionNode2);
    			selectNode.appendChild(optionNode3);
    			selectNode.appendChild(optionNode4);
    			selectNode.appendChild(optionNode5);
    			
    			var hiddenNode = document.createElement('input');
    			hiddenNode.setAttribute('type','hidden');
    			hiddenNode.setAttribute('name','ad_period');
    			hiddenNode.setAttribute('value',0);
    			
    			divNode.appendChild(selectNode);
    			divNode.appendChild(hiddenNode);
    		}
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
    	<form name="inquiryForm" action="adInquiry.do" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h2>광고 문의</h2>
                        <input type="hidden" name="owner_idx" value="${owner_idx}">
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
							<div class="col-4 mb-4" id="changeType"><label class="form-label" style="color:#6c757d" id="notice">광고기간(개월)</label><input type="number" class="form-control" id="ad_period" name="ad_period" required><input type="hidden" name="reason" value="n"></div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label" style="color:#6c757d">이메일</label>
                        <input type="email" class="form-control" name="email" placeholder="ex)gooppl@gmail.com" value="${email}" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label" style="color:#6c757d">문의내용</label>
                        <textarea class="form-control" name="inquiry_content" rows="10" required></textarea>
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