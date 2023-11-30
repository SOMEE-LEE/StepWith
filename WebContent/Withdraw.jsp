<%@ page import="memberbean.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page import = "java.io.PrintWriter" %>
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
  		<h2 style="text-align:center; font-size: 24px; font-weight: bold;">회원탈퇴</h2>
  		
  		<form action="WithdrawProcess.jsp" method="post" name="withDraw"
          class="mb-5" onsubmit="return validateForm(this);">
  		<div class="login-join mx-auto my-auto">
  			<br/>
  			<p>회원탈퇴 시, 
  			<br/>스텝 위드의 모든 서비스를 이용하실 수 없습니다
  			<br/>탈퇴를 진행하시려면 비밀번호를 입력하세요.</p>
  			<br/>
  			<label class="col-form-label">비밀번호 입력</label>
  			<input type="password" name="userPw" class="form-control formall-width" required >
  		
  			<div class="my-3 mb-2">
        		<input type="submit" class="btn btn-primary formall-width col-auto" 
        		 style="width=340px; background-color:#ffffff;
        		 color: #DB6551; border-color: #DB6551;" value="스텝 위드 회원탈퇴" />
        	</div>
  		</div>
  		</form>
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