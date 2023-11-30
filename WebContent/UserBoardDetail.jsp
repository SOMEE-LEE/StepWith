<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  	
	  	<%
		String boardId = request.getParameter("boardId");  // 일련번호 받기 
		
		BoardDAO bdao = new BoardDAO();  // DAO 생성 
/* 		bdao.updateVisitCount(num);                 // 조회수 증가  */
		BoardDTO bdto = bdao.selectView(boardId);        // 게시물 가져오기 
		%>
	  	
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
			<div style="width:235px;"></div>
			<!-- <img src="..." style="width:45px; height:45px; border:1px solid black;" class="rounded-circle"> -->
			<div>
<!-- 				<p class="my-auto" style="color:#707070; font-size:14px;">작성자 설정 칭호</p> -->
				<p class="my-auto" style="font-size:16px;"><%= bdto.getUserNickname() %></p>
			</div>
			&emsp;&emsp;&emsp;<p class="my-auto" style="color:#999797; font-size:14px;">
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="<%= bdto.getCreatedAt() %>"/></p>
			&emsp;&emsp;&emsp;<p class="my-auto" style="color:#999797; font-size:14px;">좋아요 수 0</p>
		</div>
		
		<hr class="my-2 mx-auto" style="height:0.5px; width:1010px;">
		
		<%
		String saveFolder="Uploads";
		String requestFolder=request.getContextPath()+"/"+saveFolder;
		String fname = bdto.getPhoto();
		String fullpath = requestFolder+"/"+fname;
		%>
		
		<div class="d-flex">
			<div style="width:230px;"></div>
			<img src="<%= fullpath %>" style="width:50%; height:50%; border:1px solid black;">
		</div>
		
		<div class="d-flex">
			<div style="width:230px;"></div>
			<p style="font-size:16px;" class="my-2">돌아보기:<%= bdto.getDetail() %></p>
		</div>
		<!-- <div class="d-flex">
			<div style="width:230px;"></div>
			<p style="font-size:14px; color:#E8904A;" class="my-auto">0번째 실천 중!</p>
		</div> -->
		
<!-- 		<button type="button" class="btn-primary rounded-1 d-flex mx-auto" 
    		style="border:1px solid black; background-color:#ffffff;">
    		<img src="heart-line.png" style="width:25px; height:25px;" class="my-auto">
    		<div class="my-auto">좋아요 0</div>
		</button> -->
		<br/>
		<br/>
		
		<div class="d-flex">
			<div style="width:230px;"></div>
			<!-- <button type="button" class="btn-primary rounded-1"
			 style="border:0px; background-color:#707070; color:white;" onclick="location.href='Community.jsp'">목록</button> -->
			<div style="width:845px;"></div>
			<!-- <button type="button" class="btn-primary rounded-1 mx-2"
			 style="border:0px; background-color:#707070; color:white;">수정</button> -->
			<div style="width:100px;"></div>
			<button type="button" class="btn-primary rounded-1"
			 style="border:0px; background-color:#707070; color:white;" onclick="location.href='Community.jsp'">목록</button>
		</div>

	  	<!-- <div class="d-flex my-5">
	  		<div style="width:230px;">
	  		</div>
	  		<div style="width:1200px; height:50px;" class="d-flex">	  				
	  			<input type="radio" name="goal-list" class="btn-check" id="goal-all" autocomplete="off" checked>
				<label class="btn btn-outline-secondary my-auto mx-1" for="goal-all">전체</label>							
								
				<input type="radio" name="goal-list" class="btn-check" id="hall-of-fame" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="hall-of-fame">명예의 전당</label>
								
				<input type="radio" name="goal-list" class="btn-check" id="to-habit" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="to-habit">습관화</label>
								
				<input type="radio" name="goal-list" class="btn-check" id="short-goal" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="short-goal">단기 목표</label>
								
				<input type="radio" name="goal-list" class="btn-check" id="long-goal" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="long-goal">장기 목표</label>	
					
				<input type="radio" name="goal-list" class="btn-check" id="together-goal" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="together-goal">함께하는 목표</label>													  			
	  		</div>
	  	</div>

		  	<div style="width:1000px; height:360px;" class="d-flex mx-auto">		  		
		  		<div class="card mx-2" style="width:250px; height:350px; border:0px;">
		  			<img src="" style="width:250px; height:250px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:250px; height:350px; border:0px;">
		  			<img src="..." style="width:250px; height:250px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:250px; height:350px; border:0px;">
		  			<img src="..." style="width:250px; height:250px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:250px; height:350px; border:0px;">
		  			<img src="..." style="width:250px; height:250px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  	</div>
		  	
	  	  	<div style="width:1000px; height:360px;" class="d-flex mx-auto">
		  		<div class="card mx-2" style="width:250px; height:350px; border:0px;">
		  			<img src="Potato.jpeg" style="width:250px; height:250px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:250px; height:350px; border:0px;">
		  			<img src="..." style="width:250px; height:250px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:250px; height:350px; border:0px;">
		  			<img src="..." style="width:250px; height:250px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:250px; height:350px; border:0px;">
		  			<img src="..." style="width:250px; height:250px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
	  		</div>
  	
  		<nav aria-label="Page navigation">
		  <ul class="pagination justify-content-center">
		    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  </ul>
		</nav> -->
		
  	</div>

	<!-- footer.html이 삽입될 위치 -->
    <div>
    	<jsp:include page="html/footer.html" />
    </div>
    

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
</script>
</body>
</html>