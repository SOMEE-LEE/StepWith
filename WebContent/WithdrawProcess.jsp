<%@ page import="memberbean.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>    

	
	<%
	 String usermakeId = session.getAttribute("usermakeId").toString();// 세션 로그인 아이디 받기
	 String userPw = session.getAttribute("userPw").toString();    //세션 로그인 비밀번호 받기
	 String rePw = request.getParameter("userPw"); // 입력한 비밀번호 받기 
	 
	 MemberDAO dao = new MemberDAO();    //// DAO 생성
	 MemberDTO dto = dao.getMemberDTO(usermakeId, userPw);// 로그인 ID로 회원정보 가져오기 
	 %>
	 
	 <% if (rePw.equals(dto.getUserPw())) {     // 비밀번호가 일치하면 탈퇴성공%>
	 <%		int delResult = 0; %>
	 <%  	dto.setUsermakeId(usermakeId);%>
	 <% 	delResult = dao.deleteMember(dto);%>
	 	<%// 성공/실패 처리%>
	     <% if (delResult == 1) { %>
	        <% // 성공 시 세션 아이디 삭제 후 지정된 페이지로 이동%>
	        <% session.invalidate();%>
	    	<% //여기에 페이지 코드 들어가야함!!  %> 
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
			  		<h2 style="text-align:center; font-size: 24px; font-weight: bold;">회원탈퇴 완료</h2>
			  		<div class="login-join mx-auto my-auto">
			  			<br/>
			  			<p>회원 탈퇴가 성공적으로 완료되었습니다.
			  			<br/>그동안 스텝 위드를 이용해주셔서 감사합니다.</p>
			  			
			  			<div class="mb-2">
			        		<input type="button" class="btn btn-primary formall-width col-auto" 
			        		 style="width=340px; background-color:#DB6551; border:0px;
			        		 color: #ffffff; " value="스텝 위드 홈으로 이동"
			        		  onclick="location.href='Main.jsp'" />
			        	</div>
			  		</div>
			  	</div>
			
				<!-- footer.html이 삽입될 위치 -->
			    <div>
			    	<jsp:include page="html/footer.html" />
			    </div>
			    <% } else {%>
				<% 	PrintWriter script = response.getWriter();%>
				<% 	script.println("<script>");%>
				<%	script.println("alert('비밀번호가 다릅니다)");%>
				<% script.println("history.back()");%>	
				<% script.println("</script>");%>
				<% } %>
			    
			
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous" defer>
			</script>
			<script src="js/jsfile.js" defer></script>
			</body>
			</html>
	     <% } else { %>
	        <% // 실패 시 이전 페이지로 이동%>
	        <% 	PrintWriter script = response.getWriter();%>
			<% 	script.println("<script>");%>
			<%	script.println("alert('탈퇴에 실패하였습니다)");%>
			<% script.println("history.back()");%>	
			<% script.println("</script>");%>
	     <% } %>
