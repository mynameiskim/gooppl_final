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
    <link rel="icon" type="image/x-icon" href="/resource/assets/favicon.ico" />
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <!-- jquery -->
	<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
	<script>
	//광고주 정보 수정
    function updateOwnerInfo(){
    	$.ajax({
				type: "POST",
				data: new FormData($("#adForm")[0]),
				url: 'updateOwnerInfo2.do',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				dataType: "json",
				error: function(result){
				},
				success: function(result){
					if(result.code==1){
						Swal.fire({
					      title: result.msg,
					      icon:'success',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#A4C399',
					      showLoaderOnConfirm: true,
					      allowOutsideClick: false
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.href='/gooppl/mypage.do';
					    	}
					    })
					}else {
						Swal.fire({
					      title: result.msg,
					      icon:'error',
					      confirmButtonText: '확인',
					      confirmButtonColor: '#d33',
					      showLoaderOnConfirm: true,
					      allowOutsideClick: false
					    }).then((result) => {
					    	if (result.isConfirmed) {
					    		location.href='/gooppl/mypage.do';
					    	}
					    })
					}
				}
			
		});
    }
	</script>
    

</head>

<body id="page-top">
    <!-- Navigation@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.do">GooPPl</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="createMap.do">Plan</a></li>
                    <li class="nav-item"><a class="nav-link" href="placeList.do">Place</a></li>
                    <li class="nav-item"><a class="nav-link" href="community.do">Community</a></li>
                    <c:choose>
						<c:when test="${!empty sessionNickname}">
							<li class="nav-item dropdown dropend">
								  <c:if test="${sessionScope.sessionMemberType=='M' }">
								  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								    <label class="bg-primary text-center"
								    	style="
                                        width: 30px;
                                        border-radius: 50%;
                                        color: #fff;
                                        font-weight: 600;
                                        font-size: 1.2rem;">${profileNick}</label>
								  </a>
								  </c:if>
								  <c:if test="${sessionScope.sessionMemberType=='O' }">
									  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
									    <label class="bg-secondary text-center"
									    	style="
	                                        width: 30px;
	                                        border-radius: 50%;
	                                        color: #fff;
	                                        font-weight: 600;
	                                        font-size: 1.2rem;">${profileNick}</label>
									  </a>
								  </c:if>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item" href="mypage.do">myPage</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="logout.do">Logout</a></li>
							</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a id="login_bt" class="nav-link" href="#"
								role="button" data-bs-toggle="modal" data-bs-target="#loginmd">LogIn</a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <section class="signup-section" id="sigup">
        <form class="form-inline needs-validation" id="adForm" name="adForm" action="updateOwnerInfo.do" method="post" enctype="multipart/form-data">
            <div class="container" style="width:60%">
                <div class="row">
                    <div class="col-md-7">
                        <h3>광고 수정</h3>
                    </div>
                    <div class="col-md-5">
                       <div class="row">
                          <div class="col-md-6">
                           <select class="form-select" id="areacode" name="areacode" onchange="changeAreacode()" required>
                               <c:forEach var="areadto" items="${arealist}">
		                       		<option value="${areadto.areacode}" data-value="${areadto.latitude },${areadto.longitude}">${areadto.areaname }</option>
		                       </c:forEach>
                           </select>  
                          </div>
                          <div class="col-md-6">
                           <select class="form-select" name="sigungucode" id="sigungucode" required>
                         <option value="0">==전체==</option>
                        <c:forEach var="sigungudto" items="${sigungulist}">
                           <option value="${sigungudto.sigungucode }" class="${sigungudto.areacode }" style="display:none;">${sigungudto.sigungu_name }</option>
                        </c:forEach>
                     </select>                    
                          </div>
                       </div>
                    </div>
                </div>
		    <script>
		    console.log('odto.member_idx: '+${odto.member_idx});
		    	var setAreacode = ${odto.areacode};
		    	var setSigungucode=${odto.sigungucode};
		    	console.log(setSigungucode);
		    	setArea(setAreacode, setSigungucode);
		    	console.log('${odto.title}');
		    	
		    	function setArea(areacode, sigungucode){
		    	    var areaSelector=document.getElementById('areacode');
		    	    var optionNodes=areaSelector.getElementsByTagName('option');
		    	    for(var i=0;i<optionNodes.length;i++){
		    	        var optionarea=optionNodes[i].value;
		    	        if(areacode==optionarea){
		    	            optionNodes[i].setAttribute('selected', 'seleted');
		    	            var mapxy=optionNodes[i].getAttribute('data-value');
		    	            var mapxys=mapxy.split(',');
		    	            setMapx=mapxys[1];
		    	            setMapy=mapxys[0];
		    	      }
		    	   }
		    	   var sigunguSelector=document.getElementById('sigungucode');
		    	   var sioptionNodes=sigunguSelector.getElementsByClassName(areacode);
		    	   for(var i=0;i<sioptionNodes.length;i++){
		    	      var sioptionNode=sioptionNodes[i];
		    	      var temp=sioptionNode.value;
		    	      if(temp==sigungucode){
		    	         sioptionNode.style.display='block';
		    	         sioptionNode.setAttribute('selected', 'seleted');
		    	      }else{
		    	         sioptionNode.style.display='block';
		    	      }
		    	   }
		    	}
		    	
		    	//특별, 광역시, 도 단위 지역 이동시 처리할 함수
		    	function changeAreacode(){
		    	   var sigunguSelector=document.getElementById('sigungucode');
		    	   var optionNodes=sigunguSelector.getElementsByTagName('option');
		    	   for(var i=0;i<optionNodes.length;i++){
		    	      var optionNode=optionNodes[i];
		    	      optionNode.style.display='none';
		    	   }
		    	   sigunguSelector.value='';
		    	   var areaSelector=document.getElementById('areacode');
		    	   var areacodeVal=areaSelector.options[areaSelector.selectedIndex].value;
		    	   var areacodeText=areaSelector.options[areaSelector.selectedIndex].text;
		    	   var sigunguList = document.getElementsByClassName(areacodeVal);
		    	   for(var i=0;i<sigunguList.length;i++){
		    	      var sigungu=sigunguList[i];
		    	      sigungu.style.display='block';
		    	   }
		    	}
		       
		    </script>
                <hr><br>
                <div class="row">
                    <div class="col-md-5">
                    
               <div id="map" style="width:100%;height:350px;margin-top:10px;"></div>
               
               <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
               <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=454cf995c30c224dddca3632f6bb1f65&libraries=services"></script>
                         <script>
                   var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                       mapOption = {
                           center: new daum.maps.LatLng(${odto.mapy}, ${odto.mapx}), // 지도의 중심좌표
                           level: 3 // 지도의 확대 레벨
                       };
               
                   //지도를 미리 생성
                   var map = new daum.maps.Map(mapContainer, mapOption);
                   
                   
                   
                   
                   //주소-좌표 변환 객체를 생성
                   var geocoder = new daum.maps.services.Geocoder();
                   
                   var markers = [];
                   var infos = [];
                   
                   //마커를 미리 생성
                   var marker = new daum.maps.Marker({
                       position: new daum.maps.LatLng(${odto.mapy}, ${odto.mapx}),
                       map: map
                   });
               
               
                   function foundAddr() {
                       new daum.Postcode({
                           oncomplete: function(data) {
                               var addr = data.address; // 최종 주소 변수
               
                               // 주소 정보를 해당 필드에 넣는다.
                               document.getElementById("addr").value = addr;
                               // 주소로 상세 정보를 검색
                               geocoder.addressSearch(data.address, function(results, status) {
                                   // 정상적으로 검색이 완료됐으면
                                   if (status === daum.maps.services.Status.OK) {
               
                                      if(markers.length != 0){
                                         markers[0].setMap(null);;
                                         markers.splice(0,1);
                                      }
                                      if(infos.length != 0){
                                         infos[0].setMap(null);
                                         infos.splice(0,1);
                                      }
                                      
                                      
                                       var result = results[0]; //첫번째 결과의 값을 활용
               
                                       var x = document.getElementById('mapx');
                                       var y = document.getElementById('mapy');
                                       
                                       x.value=result.x;
                                       y.value=result.y;
                                       
                                       
                                       
                                      /*  document.adForm.mapx.value=result.y;
                                       document.adForm.mapy.value=result.x; */
                                       console.log('x의 값:'+x.value);
                                       console.log('y의 값:'+y.value);
                                       
                                       var real_y = parseFloat(result.y)+0.0001;
                                       
                                       
                                       // 해당 주소에 대한 좌표를 받아서
                                       var coords = new daum.maps.LatLng(result.y, result.x);
                                       var coords2 = new daum.maps.LatLng(real_y, result.x);
                                       
                                       //결과값으로 받은 위치를 마커로 표시한다.
                                       var marker = new kakao.maps.Marker({
                                          map: map,
                                          position: coords
                                       });
                                       
                                       markers.push(marker);
                                       
                                       var infowindow = new kakao.maps.InfoWindow({
                                          map: map,
                                          position: coords,
                                          content: '<div style="padding:5px;">여기가 맞나요? <br><a href="https://map.kakao.com/link/map/'+addr+','+result.y+','+result.x+'" style="color:blue" target="_blank">큰지도보기</a></div>'
                                       });
                                       
                                       infos.push(infowindow);
                                       infowindow.open(map, marker);
                                       
                                       
                                       // 지도를 보여준다.
                                       mapContainer.style.display = "block";
                                       map.relayout();
                                       // 지도 중심을 변경한다.
                                       map.setCenter(coords);
                                       // 마커를 결과값으로 받은 위치로 옮긴다.
                                       //marker.setPosition(coords);
                                       infowindow.setPosition(coords2);
                                       infowindow.setContent('<div style="padding:5px;">여기가 맞나요? <br><a href="https://map.kakao.com/link/map/'+addr+','+realy+','+realx+'" style="color:blue" target="_blank">큰지도보기</a></div>')
                                   }
                               });
                           }
                       }).open();
                   }
                   
                   
                   
               </script>
                       <!-- <div class="img-fluid rounded-start"  id="map" style="width:350px; height:350px;"></div> -->
                    </div>
                    <input type="hidden" id="mapx" name="mapx" value="${odto.mapx}">
                    <input type="hidden" id="mapy" name="mapy" value="${odto.mapy}">
                    <input type="hidden" id="member_idx" name="member_idx" value="${odto.member_idx}">
                    
                    
                    <div class="col-md-7">
                        <!-- <form name="form" class="row g-3"> -->
                        <div class="row">
                            <div class="col-md-4 form-group">
                                <label for="title" class="form-label">상호명</label>
                                <input type="text" class="form-control mb-2" id="title" name="title" value="${odto.title}" required="required">
                                
                            </div>
                            <div class="col-md-5 form-group">
	                                <label for="business_number" class="form-label">사업자번호</label>
                                <div class="input-group mb-3">
	                                <input type="text" class="form-control" id="business_number" name="business_number" placeholder="ex)123-45-67890" pattern="^\d{3}-\d{2}-\d{5}$" value="${odto.business_number}" readonly required>
	                            	<!-- <button class="btn btn-outline-primary" id="ckBusinessNum" name="ckBusinessNum">중복체크</button> -->
								</div>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="contenttype" class="form-label">타입</label>

                                <select class="form-select mb-2" id="contenttype" name="contenttype" required = "required">
                                    <option value="${odto.contenttype}" selected>타입</option>
                                    <option value="14">문화시설</option>
                                    <option value="32">숙박</option>
                                    <option value="39">음식점</option>
                                    <option value="39">카페</option>
                                    <option value="38">쇼핑</option>
                                </select>
                            </div>
                            <div class="col-md-8 form-group">
                                <label for="email" class="form-label">이메일</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control mb-2" id="email" name="email" value="${odto.email}"
                                        aria-describedby="inputGroupPrepend" pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" required>
                                </div>
                            </div>

                            <div class="col-md-4 form-group">
                                <label for="business_tel" class="form-label">업체 전화번호</label>
                                <input type="text" class="form-control mb-2" id="business_tel" name="business_tel" value="${odto.business_tel}" placeholder="ex)02-123-4567" pattern="^0\d{1,2}-\d{3,4}-\d{4}$" required>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="name" class="form-label">이름</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control mb-2" id="name" name="name" value="${odto.name}" aria-describedby="inputGroupPrepend" required>
                                </div>
                            </div>
                            <div class="col-md-4 form-group">
                                <label for="tel" class="form-label">번호</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control mb-2" id="tel" name="tel"
                                        aria-describedby="inputGroupPrepend" pattern="^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$" value="${odto.tel}" required>
                                </div>
                            </div>
                            <div class="col-md-5 form-group">
                                <label for="registration_date" class="form-label">대표사진</label>
                                <div class="input-group has-validation">
                                    <input type="file" class="form-control form-control-sm mb-2" name="upload" accept=".jpg, .jpeg, .png, .JPG, .JPEG">
                                </div>
                            </div>
                            <div class="col-md-9 form-group">
                                <label for="addr" class="form-label">주소</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" id="addr" name="addr"
                                        aria-describedby="inputGroupPrepend" value="${odto.addr}" readonly required>
                                </div>
                            </div>
                            <div class="col-md-3 mb-2 form-group">
                                <label for="addrBtn" class="form-label">&nbsp;</label>
                                <div class="input-group has-validation">
                                    <input type="button" value="주소검색" onclick="foundAddr()" class="form-control" id="addrBtn"
                                        aria-describedby="inputGroupPrepend">
                                </div>
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" value="${odto.detailed_addr}" id="detailed_addr" name="detailed_addr"
                                        placeholder="상세주소" aria-describedby="inputGroupPrepend">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                       <div class="row">
                           <div class="col-md-12 form-group">
                           <div class="row">
                              <div class="col-md-7">
                                 <label for="ad_content" class="form-label" style="margin-top:10px;">업체설명</label>
                              </div>
                              <div class="col-md-5 mb-3">
                                 
                              </div>
                           </div>
                               
                               <div class="input-group has-validation">
                                   <textarea class="form-control" name="ad_content" rows="5" required>${odto.ad_content}</textarea>
                               </div>
                           </div>
                           <div class="col-12">
                               <button class="btn btn-primary" id="ownerUpdateBtn" type="button" onclick="updateOwnerInfo()">광고 정보 수정</button>
                           </div>
                       </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
<script>
/*사업자 번호체크*/
$("#ckBusinessNum").click(function(){
	 var business_number = $("#business_number").val();        // 입력한 사업자 번호
	 var reg=/^\d{3}-\d{2}-\d{5}$/;
	 if(business_number==''){
   	   Swal.fire('사업자번호를 입력해주세요');
	 }else if(!reg.test(business_number)){
		 Swal.fire('사업자번호 형식을 확인해주세요.<br>ex)123-12-12345');
	 }else{
		 $.ajax({
	            method:"GET",
	            url:"ckBusinessNum.do",
	            data:{"business_number":business_number},
	            success:function(data){
	                if(data==0){//사용 가능한 아이디 라면 
	                	 Swal.fire({
							  title: '이용가능한 사업자번호입니다.',
							  icon: 'success',
							  confirmButtonText: '확인'
							});
	                }else{//중복된 사업자번호라면
	                	 Swal.fire({
							  title: '중복된 사업자번호입니다.',
							  icon: 'warning',
							  confirmButtonText: '확인'
							});
	                	 business_number = '';
	                }
	            }
	     });
      } 
});

</script>

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
    <script src="resource/js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>

</html>