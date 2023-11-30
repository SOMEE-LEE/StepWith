<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
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
	 	<!-- 로그인 여부에 따른 메뉴 변화 -->
		<% if (session.getAttribute("usermakeId") == null){ %>
	   	<div style="text-align: right; margin-right: 120px;">
    		<a href="LoginForm.jsp" class="hyper-text text-hover"><h7>로그인</h7></a>&nbsp;&nbsp;&nbsp;
    		<a href="JoinForm.jsp" class="hyper-text text-hover"><h7>회원가입</h7></a>
    	</div>
    	<% } else { %>
    	<div style="text-align: right; margin-right: 120px;">
		    	<h7><%= session.getAttribute("userNickname") %>님 환영합니다!</h7>&nbsp;&nbsp;&nbsp;
		    	<a href="MyInfoEdit.jsp" class="hyper-text text-hover"><h7>내 정보 수정</h7></a>&nbsp;&nbsp;&nbsp;
<!-- 		    	<button style="border:0px; background-color:white;" type="button"
		    		data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
		    		<h7 class="text-hover">마이페이지</h7>
		    	</button>&nbsp;&nbsp;&nbsp; -->
		    	<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" 
			        tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
			        <div class="offcanvas-header">
			          <h5 class="offcanvas-title font-bol" id="offcanvasRightLabel">&emsp;마이페이지</h5>
			          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			        </div>
			      <div class="offcanvas-body mx-auto my-auto" >   
			            <img src="Potato.jpeg" style="width:120px; height:120px; border:1px solid black; margin-right:200px;" 
			             class="card-img rounded-circle">
			            <div class="card-body" style="text-align:left;">
			              <div class="my-3 mx-2">
			                <p class="card-title align-text-bottom" style="color:hsl(0, 0%, 44%); font-size:14px;">칭호</p>
			                <p class="card-title font-bol" style="font-size:16px;"><%= session.getAttribute("user_nickname") %></p>
			              </div>
			                <%-- <p class="card-text mx-2" style="font-size:14px;">관심 분야: <%= session.getAttribute("FavoriteField") %> </p> --%>
			               <div>
			               <div><button style="background-color:#ffffff; border:0px;
			                 height:auto; width:wrap-content; font-size:18px;" 
			                type="button" class="btn my-2 text-hover" onclick="location.href='MyInfoEdit.jsp'">나의 개인 정보 수정</button></div>
			              <div><button style="background-color:#ffffff; border:0px;
			                 height:auto; width:wrap-content; font-size:18px;"
			                type="button" class="btn my-2 text-hover" onclick="location.href='MyAchieve.jsp'">나의 업적/칭호(숫자)</button></div>
			               <div><button style="background-color:#ffffff; border:0px;
			                 height:auto; width:wrap-content; font-size:18px;"
			                type="button" class="btn my-2 text-hover" onclick="location.href='MyBoard.jsp'">내가 쓴 게시물</button></div>
			               <div><button style="background-color:#ffffff; border:0px;
			                 height:auto; width:wrap-content; font-size:18px;"
			                type="button" class="btn my-2 text-hover" onclick="location.href='MyLikeBoard.jsp'">내가 좋아한 게시물</button></div>
			              <div><button style="background-color:#ffffff; border:0px;
			                 height:auto; width:wrap-content; font-size:18px;" 
			                type="button" class="btn my-2 text-hover" onclick="location.href='Withdraw.jsp'">스텝 위드 회원 탈퇴하기</button></div>
			            </div>
			          </div>
			      </div>
	    		</div>
    			
	    		
	    		<a href="Logout.jsp" class="hyper-text text-hover"><h7>로그아웃</h7></a>
	    </div>
	    <% } %>
	    
	       <header>
		<a href="Main.jsp" style="text-decoration: none; color: #DB6551;"> 
			<p class="logo my-2 p-2 text-center">Step With</p></a>
			
		    <!-- navbar: 내비게이션 메뉴 - 텍스트 가운데정렬, block 요소들을 in-line으로 바꾸어 가로로 배치-->
    <div class="d-flex justify-content-around text-center" >
      <nav class="navbar navbar-expand-lg bg-body" >
        <div class="container-fluid">
          <div class="collapse navbar-collapse" id="navbarNav" style="background-color: #ffffff;">
            <ul class="navbar-nav">
            <li class="nav-item navWid">
                <a class="nav-link black" 
                 href="Main.jsp">투두리스트 보기</a>
              </li>
              <li class="nav-item navWid">
                <a class="nav-link black" 
                 aria-current="page" href="UserGoal.jsp">혼자하는 목표</a>
              </li>
             <!--  <li class="nav-item navWid">
                <a class="nav-link black" href="TogetherGoal.jsp">함께하는 목표</a>
              </li> -->
              <li class="nav-item navWid">
                <a class="nav-link black" href="UserStroke.jsp">나를 다독이기</a>
             </li>
             <li class="nav-item navWid">
                <a class="nav-link black" href="Community.jsp" 
                style="background-color:#DB6551; font-weight: bold;  color: #ffffff;">커뮤니티</a>
             </li>
            </ul>
          </div>
          <button class="navbar-toggler" type="button" 
          data-bs-toggle="collapse" 
          data-bs-target="#navbarToggleExternalContent" 
          aria-controls="navbarToggleExternalContent" 
          aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon" ></span>
          </button>
        </div> 
      </nav>
    </div>
    <hr class="border border-black opacity-25" style="height:0.5px;">
	</header>
	 </div>		
	
    <!-- main content가 삽입될 위치 -->
  	<div id = "content" style="padding:30px; ">
  	
  	<%
	 // DAO를 생성해 DB에 연결
  	BoardDAO bdao = new BoardDAO();
  	
 	// 사용자가 입력한 검색 조건을 Map에 저장
  	Map<String, Object> param = new HashMap<String, Object>(); 
  	String searchField = request.getParameter("searchField");
  	String searchWord = request.getParameter("searchWord");
  	if (searchWord != null) {
  	    param.put("searchField", searchField);
  	    param.put("searchWord", searchWord);
  	}

  	int totalCount = bdao.selectCount(param);  // 게시물 수 확인
  	System.out.println(totalCount);
  	List<BoardDTO> boardLists = bdao.selectList(param);  // 게시물 목록 받기
  	%>
  	
  	<h2>목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="">제목</option> 
                <option value="detail">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">투두리스트 - 목표분류: 최상위목표</th>
            <th width="15%">닉네임</th>
            <th width="15%">좋아요수</th>
            <th width="10%">작성일</th>
        </tr>
        <!-- 목록의 내용 --> 
<%
if (boardLists.isEmpty()) {
    // 게시물이 하나도 없을 때 
%>
        <div style="text-align:center;">
			등록된 게시물이 없습니다. 
		</div>
<%
}
else {
    // 게시물이 있을 때 
    int virtualNum = 0;  // 화면상에서의 게시물 번호
    for (BoardDTO bdto : boardLists)
    {
        virtualNum = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소
%>
        <tr align="center">
            <td><%= virtualNum %></td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
                <a href="UserBoardDetail.jsp?boardId=<%= bdto.getBoardId() %>" >
                 <%-- <% bdto.getGoalId() %><%= bdto.getTogetherId() %> --%>글번호</a> 
            </td>
            <td align="center"><%= bdto.getUserNickname() %></td>          <!--작성자 닉네임-->
            <td align="center">좋아요수</td>    <!-- 좋아요수 -->
            <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="<%= bdto.getCreatedAt() %>"/>
            </td>  <!--작성일-->
        </tr>
<%
    }
}
%>
    </table>
  	
  	
	  	<!-- <div class="d-flex mb-5">
	  		<div style="width:135px;">
	  		</div>
	  		<div style="width:1200px; height:50px;" class="d-flex">	  				
	  			<input type="radio" name="goal-list" class="btn-check" id="goal-all" autocomplete="off" checked>
				<label class="btn btn-outline-secondary my-auto mx-1" for="goal-all">전체</label>							
								
				<input type="radio" name="goal-list" class="btn-check" id="to-habit" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="to-habit">습관화</label>
								
				<input type="radio" name="goal-list" class="btn-check" id="short-goal" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="short-goal">단기 목표</label>
								
				<input type="radio" name="goal-list" class="btn-check" id="long-goal" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="long-goal">장기 목표</label>	
					
				<input type="radio" name="goal-list" class="btn-check" id="together-goal" autocomplete="off">
				<label class="btn btn-outline-secondary my-auto mx-1" for="together-goal">함께하는 목표</label>													  			
	  		</div>
	  	</div> -->

		  	<div style="width:1190px; height:360px" class="d-flex mx-auto">
		  		<div class="card mx-2" style="width:270px; height:350px; border:0px;">
		  			<img src="" style="width:270px; height:270px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:270px; height:350px; border:0px;">
		  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:270px; height:350px; border:0px;">
		  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  		<div class="card mx-2" style="width:270px; height:350px; border:0px;">
		  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2">
		  			
		  			<div class="card-body">
		   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
		    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
		    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
		  			</div>
				</div>
		  	</div>
		  	
	  	  	<div style="width:1190px; height:360px" class="d-flex mx-auto">
	  		<div class="card mx-2" style="width:270px; height:350px; border:0px;">
	  			<img src="Potato.jpeg" style="width:270px; height:270px;" class="card-img-top rounded-2">
	  			
	  			<div class="card-body">
	   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
	    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
	    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
	  			</div>
			</div>
	  		<div class="card mx-2" style="width:270px; height:350px; border:0px;">
	  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2">
	  			
	  			<div class="card-body">
	   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
	    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
	    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
	  			</div>
			</div>
	  		<div class="card mx-2" style="width:270px; height:350px; border:0px;">
	  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2">
	  			
	  			<div class="card-body">
	   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
	    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
	    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
	  			</div>
			</div>
	  		<div class="card mx-2" style="width:270px; height:350px; border:0px;">
	  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2">
	  			
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
		</nav>
  	
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