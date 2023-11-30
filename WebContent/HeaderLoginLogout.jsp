<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
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
                 aria-current="page" href="Main.jsp">투두리스트 보기</a>
              </li>
              <li class="nav-item navWid">
                <a class="nav-link black" 
                 aria-current="page" href="UserGoal.jsp">혼자하는 목표</a>
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
</body>
</html>