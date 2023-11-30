<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberbean.MemberDTO"%>
<%@ page import="membership.MemberDAO"%> 
<%@ page import="usergoal.UserGoalDTO" %>  
<%@ page import="usergoal.UserGoalDAO" %> 
<%@ page import="java.util.List"%>
<%@ page import="board.BoardDTO" %> 
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
<% 	
String usermakeId = session.getAttribute("usermakeId").toString();// 세션 로그인 아이디 받기 
MemberDAO dao = new MemberDAO();    //// DAO 생성
MemberDTO dto = dao.selectMember(usermakeId);// 로그인 ID로 회원정보 가져오기 

UserGoalDAO gdao = new UserGoalDAO();

List<UserGoalDTO> goalListsUserId= gdao.getDTOuserId(usermakeId);

%>
	<!-- header.html이 삽입될 위치 -->
	 <div>
    	<jsp:include page="HeaderLoginLogout.jsp"/>	 
	 </div>
    
    <!-- main content가 삽입될 위치 -->
  	<div id = "content" style="padding:30px; ">
  	<form action="UserBoardCreatePro.jsp" method="post" name="boardCreate" class="mb-5"
  	 encType = "multipart/form-data" >
  		<div class="d-flex">
  			<div style="width:230px;"></div>
  			<h2 style="font-size: 24px; font-weight: bold;">목표 분류(게시판이름)</h2>
		</div>
		
		<hr class="my-2 mx-auto border border-black border-3 opacity-75" style="width:1010px;">
		
  		<div class="d-flex">
  			<div style="width:230px;"></div>
  				<span style="font-size: 20px;" class="my-auto">투두리스트(목표 분량)
  				&emsp;<span style="font-size: 14px; color:#555555;" class="align-text-bottom">목표 분류 : 최상위목표</span>
			</span>
		</div>
		
		<hr class="my-2 mx-auto" style="height:0.5px; width:1010px;">
		
		<div class="d-flex">
			<div style="width:230px;"></div>
<!-- 			<img src="..." style="width:45px; height:45px; border:1px solid black;" class="rounded-circle"> -->
			<div class="my-auto">
				<p class="my-auto" style="font-size:16px;" name="userNickname"><%= dto.getUserNickname() %></p>
			</div>
		</div>
		
		<hr class="my-2 mx-auto" style="height:0.5px; width:1010px;">
		
		<div class="my-3  mx-auto"  style="width:995px">
			<label class="col-form-label font-bol">투두리스트 인증사진을 선택해주세요</label>
			<input class="form-control" type="file" name="photo" required>
		</div>
		
		<div class="my-3 mx-auto" style="width:995px;">
			<label class="col-form-label font-bol">투두리스트를 완료하기까지의 과정을 간단하게 돌아봐요</label>
		  	<input type="text" class="form-control" name="detail" required/>
		</div>
		<br/>
		
		<div class="d-flex mb-3">
		<div style="width:940px;"></div>
		<button type="button" class="btn mx-2" data-bs-toggle="modal" data-bs-target="#goBackToMain"
		    style="background-color:#ffffff; color: #DB6551; border-color: #DB6551;">
        	뒤로 가기		 
        </button>
        <div class="modal fade" id="goBackToMain" data-bs-backdrop="static" tabindex="-1" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">투두리스트 완료 취소</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	해당 투두리스트 완료를 취소하고<br/>메인 페이지로 이동하시겠어요?
		      </div>
		      <div class="modal-footer">	      	
		      	<button type="button" class="btn" onclick="location.href='MainLogin.jsp'"
		      	 style="background-color:#DB6551; color:#ffffff;">
		      	 예</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="border:0px;">
		         아니오(게시물 계속 작성)
		        </button>
			  </div>
		    </div>
		  </div>
		</div>
		<button type="submit" class="btn" style="background-color:#DB6551; color: #ffffff; border:0px;">
			투두리스트 완료하기
		</button>
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