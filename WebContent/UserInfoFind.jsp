<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 타임리프 문법 사용 -->
<html xmlns:th="http://www.thymeleaf.org"
    xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  <title>종합 목표 관리 플래너 Step With</title>
    <!-- Bootstrap, CSS 적용 -->	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
    crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
	<!-- header.html이 삽입될 위치 -->
	 <div>
    	<jsp:include page="HeaderLoginLogout.jsp"/>	 
	 </div>
    
    <!-- main content가 삽입될 위치 -->
  	<div id = "content" style="padding:30px; ">
  			
  			<div class="login-join mx-auto mb-4">
  			    <h2 style="text-align:center; font-size: 24px; font-weight: bold;">회원 정보 찾기</h2>
  				
  				<br/>
  			
    			<label class="col-form-label font-bol">휴대폰</label>
  				<input type="text" name="phone" class="form-control formall-width"  placeholder="숫자만 입력해주세요">
  				<input type="button" class="btn btn-primary my-1 mb-3" 
        		 style="width=340px; background-color:#ffffff;
        		 color: #DB6551; border-color: #DB6551;" value="인증번호 받기"
        		  onclick="location.href='#'" />
  				
  				<input type="text" name="certiNum" class="form-control formall-width"  placeholder="인증번호 6자리를 입력해주세요">
  				<button type="submit" id="certi-check"  class="btn btn-primary my-1" 
        		 style="width=340px; background-color:#ffffff;
        		 color: #DB6551; border-color: #DB6551;" >
        		 인증번호 확인
        		  </button>
			</div>   
					
			 		<div class="modalWrap" id="success-wrap">
					  	<div class="modalContent">
					    	<div class="modalBody mx-auto my-auto">

					     	 	<p>인증번호가 정상적으로 확인되었습니다.</p>
						 	 	<br/>
						  	 	<p>입력하신 휴대폰 번호로 아이디와 임시 비밀번호를 발급해 드렸습니다.
                          		<br/> 재로그인 후, 반드시 비밀번호를 변경해 주세요.</p>
					      
					     	 	<br/>
					    		<div class="mb-5">
			        				<input type="button" class="btn btn-primary formall-width col-auto" 
			        				style="width=340px; background-color: #DB6551; border: 0px;" value="로그인 페이지로 이동"
			        				onclick="location.href='LoginForm.jsp'" />
					   	 		</div>
						  	</div>
						</div>
  					</div>
  	</div>

	<!-- footer.html이 삽입될 위치 -->
    <div>
    	<jsp:include page="html/footer.html" />
    </div>
    

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous" defer>
</script>
<script src="js/jsfile.js" defer></script>
</body>
</html>