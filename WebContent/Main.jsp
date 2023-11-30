<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="usergoal.UserGoalDAO"%>
<%@ page import="usergoal.UserGoalDTO"%>
<%@ page import="habit.HabitDAO" %>
<%@ page import="habit.HabitDTO" %>
<%@ page import="mid.MidDAO" %>
<%@ page import="mid.MidDTO" %>
<%@ page import="middown.MidDownDAO" %>
<%@ page import="middown.MidDownDTO" %>
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
                 aria-current="page" href="Main.jsp"
                 style=" background-color:#DB6551; font-weight: bold;  color: #ffffff;">투두리스트 보기</a>
              </li>
              <li class="nav-item navWid">
                <a class="nav-link black" 
                  href="UserGoal.jsp">혼자하는 목표</a>
              </li>
              <!-- <li class="nav-item navWid">
                <a class="nav-link black" href="TogetherGoal.jsp">함께하는 목표</a>
              </li> -->
              <li class="nav-item navWid">
                <a class="nav-link black" href="UserStroke.jsp">나를 다독이기</a>
             </li>
             <li class="nav-item navWid">
                <a class="nav-link black" href="Community.jsp">커뮤니티</a>
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
    
    <!-- main content가 삽입될 위치 -->
  	<div id = "content" style="padding:30px; ">

  	<div class="d-flex">
  		<div style="width:120px;">
  		</div>  	
  		<p class="font-bol font-no">나의 목표를 위한 오늘의 할 일</p>
  			  	&nbsp;
	  	<div id="current_date" class="font-bol font-no">
		    <script>
		        date = new Date();
		        month = date.getMonth() + 1;
		        day = date.getDate();
		        document.getElementById("current_date").innerHTML = "(" + month + "월" + day + "일"+")";
		    </script>
		</div>
  	</div>
  	
  	<div class="d-flex">
  		<div style="width:120px;">
  		</div>  	
  		<p class="font-no" style="color: #555555;">혼자하는 목표를 등록하면, 메인화면에 오늘의 할 일이 자동으로 보여요!</p><br/>
  	</div>
  	<hr/>
  	  	
  	<br/>
  	
  	<div class="d-flex">
  		<div style="width:120px;">
  		</div>  	
  		<p class="font-no font-bol"><!-- 월간 달성률 00%&nbsp;&nbsp;&nbsp;&nbsp; -->주간 달성률 00%&nbsp;&nbsp;&nbsp;&nbsp;오늘의 달성률 00%</p>
	</div>

  	<br/>
  	
  	<%
  	String usermakeId = session.getAttribute("usermakeId").toString();// 세션 로그인 아이디 받기  

  	//DAO를 생성해 DB에 연결
  	UserGoalDAO gdao = new UserGoalDAO();
  	HabitDAO hdao = new HabitDAO();
  	MidDAO mdao = new MidDAO();
  	MidDownDAO midao = new MidDownDAO();

  	//사용자가 입력한 검색 조건을 Map에 저장
  	Map<String, Object> param = new HashMap<String, Object>(); 
  	String searchField = request.getParameter("searchField");
  	String searchWord = request.getParameter("searchWord");
  	if (searchWord != null) {
  		param.put("searchField", searchField);
  		param.put("searchWord", searchWord);
  	}

  	int totalCount = gdao.selectCount(param);  // 목표 수 확인
  	List<UserGoalDTO> usergoalLists = gdao.selectList(param);  // 목표 목록 받기
  	String goalId = request.getParameter("goalId");
  	List<UserGoalDTO> goalListsUserId = gdao.getDTOuserId(usermakeId);
  	List<UserGoalDTO> goalListsgoalId= gdao.getDTOId(goalId);
  	List<HabitDTO> habitLists = hdao.selectList(param);
  	List<MidDTO> midLists = mdao.selectList(param);
  	List<MidDownDTO> midDownLists = midao.selectList(param);

  	String habitId = request.getParameter("habitId");
  	String middleId = request.getParameter("middleId");
  	String midDownId = request.getParameter("midDownId");
  	HabitDTO hdto = hdao.selectView(habitId);  // 세부 목표 목록 받기
  	MidDTO mdto = mdao.selectView(middleId);
  	MidDownDTO midto = midao.selectView(midDownId);
  	%>
  	
  	<div class="d-flex">
  		<div style="width:120px;">
  		</div>  	
	  	<table class="table table-borderless font-no w-auto">
	  		<thead class="thead">
	  			<tr>
	  				<th scope="col">분류</th>
	  				<th scope="col">투두리스트(분량)</th>
	  				<th scope="col">투두리스트의 최상위목표</th>
	  				<th scope="col">상태</th>
	  				<th scope="col">실천량</th>
	  			</tr>
	  		</thead>
	  		<tbody>
	  			<tr>
	 	 			<td>습관화 목표</td>
	 	 			<td>걷기운동하기(30분)</td>
	 	 			<td>폐활량 늘리기</td>
	 	 			<td>진행 중</td>
	 	 			<td>1번째 실천 중!</td>
	 	 		</tr>
	 	 		<tr>
	 	 			<td>단기 목표</td>
	 	 			<td>단어 외우기(50개)</td>
	 	 			<td>토익 900점 맞기</td>
	 	 			<td>완료</td>
	 	 			<td>20번째 실천 중!</td>
	 	 		</tr>
	 	 		<tr>
	 	 			<td>함께하는 목표</td>
	 	 			<td>하루 명상하기(10분)</td>
	 	 			<td>성공적인 수험생활 보내기</td>
	 	 			<td>시작 안 함</td>
	 	 			<td>실천한 기록이 없어요</td>
	 	 		</tr>
	 	 		<tr>
	 	 			<td>단기 목표</td>
	 	 			<td>학교 강의 복습(30분)</td>
	 	 			<td>기말 전 과목 A등급 맞기</td>
	 	 			<td>시작 안 함</td>
	 	 			<td>실천한 기록이 없어요</td>
	 	 		</tr>
	 	 		<tr>
	 	 			<td>장기 목표</td>
	 	 			<td>시장조사 & 추측고객 설정</td>
	 	 			<td>서비스 기획 및 개발</td>
	 	 			<td>휴식</td>
	 	 			<td>오늘은 쉬는 날!</td>
	 	 		</tr>
	  		</tbody>
		</table>
	</div>
	
	<br/><br/>
	<hr/>
  	<br/>
  	
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
  	
  	<br/>
  	<div class="login-join mx-auto">
  	<div class="mx-5">
  	<input type="button" class="btn-primary rounded-1" 
    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
    onclick="location.href='Community.jsp'" 
    value="다른 사람들 목표 전체보기">
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