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
    <!-- Bootstrap 적용 -->	
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
 
    <%
    if (session.getAttribute("usermakeId") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %>
    
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);" class="mb-5">
        <h2 style="text-align:center; font-size: 24px; font-weight: bold;">로그인</h2>
    	
    	<div class="login-join mx-auto my-auto">
    	  	<span style="color: red; font-size: 1.2em;"> 
        		<%= request.getAttribute("LoginErrMsg") == null ?
                		"" : request.getAttribute("LoginErrMsg") %>
    		</span>
    		<br/>
    		<div class="mb-3">
    			<label class="col-form-label font-bol">아이디</label>
  				<input type="text" name="usermakeId" class="form-control formall-width"  placeholder="아이디를 입력하세요" required>
			</div>
			<div class="mb-4">
				<label class="col-form-label font-bol">비밀번호</label>
    			<input type="password" name="userPw" class="form-control formall-width" placeholder="비밀번호를 입력하세요" required>
    		</div>
  			<div class="mb-2">
        		<input type="submit" class="btn btn-primary formall-width col-auto" 
        		style="background-color: #DB6551; border: 0px;" value="스텝 위드 아이디로 로그인하기" />
        	</div>
<!--        	 	<div>
        		<a href="UserInfoFind.jsp" class="hyper-text text-end text-hover"><p>회원 정보 찾기</p></a>
        	</div> -->
        	    
        	<br/>

<!--     		<p style="text-align:center;" class="font-bol">또는</p>

    		<br/>
    		
    		<button type="button" style="background-color: #03C75A; border: 0px; height:50px;"
    		class="btn btn-primary formall-width col-auto mb-2">
    			<img src="btnG_square.png" style="width: 30px; height: 30px; vertical-align:middle">
    			<span style="vertical-align: middle;">네이버로 시작하기</span>
    		</button>
    		
    		<button type="button" style="background-color: #FEE500; border: 0px; color:#000000; height:50px;"
    		class="btn btn-primary formall-width col-auto">
    			<img src="kakao_start.png" style="height:25px; vertical-align:top">
    			<span style="vertical-align: top;">카카오로 시작하기</span>
    		</button>
    		
    		<br/>
    		<br/>
    		<p style="text-align:center;" class="font-bol">또는</p>
    		<br/> -->
    		
    		<p style="font-size:20px; font-weight:bold;">아직 회원이 아니신가요?</p>
     </form>
        	<div class="mb-2">
        		<input type="button" class="btn btn-primary formall-width col-auto" 
        		 style="width=340px; background-color:#ffffff;
        		 color: #DB6551; border-color: #DB6551;" value="스텝 위드 회원가입"
        		  onclick="location.href='JoinForm.jsp'" />
        	</div>
        	
        </div>
    	</div>


    		
     	</div>
    


    <%
    } else { // 로그인된 상태
    %>
        <%= session.getAttribute("userNickname") %> 회원님, 로그인하셨습니다.<br />
        <a href="Logout.jsp">[로그아웃]</a>
    <%
    }
    %>
    </div>

	<!-- footer.html이 삽입될 위치 -->
    <div>
    	<jsp:include page="html/footer.html" />
    </div>




</body>
</html>