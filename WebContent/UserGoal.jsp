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
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<style>
	    div.box{
      display: none;
    }
	</style>

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
                 aria-current="page" href="Main.jsp">투두리스트 보기</a>
              </li>
              <li class="nav-item navWid">
                <a class="nav-link black"  style=" background-color:#DB6551; font-weight: bold;  color: #ffffff;"
                 aria-current="page" href="UserGoal.jsp">혼자하는 목표</a>
              </li>
             <!--  <li class="nav-item navWid">
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
	 </div>	
    
    <!-- main content가 삽입될 위치 -->
  	<div id = "content" style="padding:30px; ">
  	
  	<div class="d-flex">
	  	<div style="width:120px;">
	  	</div>
	  	
		<h3>
	  	<b>
		<div id="current_date">
		    <script>
		        date = new Date();
		        month = date.getMonth() + 1;
		        day = date.getDate();
		        document.getElementById("current_date").innerHTML = month + "월" + day + "일";
		    </script>
		</div>
		</b>
		</h3>
		<h3>&nbsp;기준 <%= session.getAttribute("userNickname") %>님의 전체 목표 달성도예요.</h3>
	
	</div>
	
	<br/>
	<br/>
	
	<%
String usermakeId = session.getAttribute("usermakeId").toString();// 세션 로그인 아이디 받기  

//DAO를 생성해 DB에 연결
UserGoalDAO gdao = new UserGoalDAO();
HabitDAO hdao = new HabitDAO();
MidDAO mdao = new MidDAO();
MidDownDAO midao = new MidDownDAO();
BoardDAO bdao = new BoardDAO();

//사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>(); 
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

// 검색조건인 goalId를 Map에 저장
/* Map<String, Object> byGoalId = new HashMap<String, Object>(); */
String goalId = request.getParameter("goalId");


int totalCount = gdao.selectCount(param);  // 목표 수 확인


List<UserGoalDTO> usergoalLists = gdao.selectList(param);  // 목표 목록 받기
List<UserGoalDTO> goalListsUserId = gdao.getDTOuserId(usermakeId);
List<UserGoalDTO> goalListsgoalId= gdao.getDTOId(goalId);
List<HabitDTO> habitLists = hdao.selectList(param);
List<MidDTO> midLists = mdao.selectList(param);
List<MidDownDTO> midDownLists = midao.selectList(param);
List<BoardDTO> boardLists = bdao.selectList(param);

String habitId = request.getParameter("habitId");
String middleId = request.getParameter("middleId");
String midDownId = request.getParameter("midDownId");
HabitDTO hdto = hdao.selectView(habitId);  // 세부 목표 목록 받기
MidDTO mdto = mdao.selectView(middleId); // 중간 목표 목록 받기
MidDownDTO midto = midao.selectView(midDownId);  // 중간하위목표 목록 받기


%>
	
	

  	<div class="d-flex mb-3">
	   	<div style="width:120px;">
	  	</div>
	  	
		<button type="button" data-bs-toggle="collapse" data-bs-target=".habit" aria-expanded="true"
		class="btn-primary rounded-2"
	    aria-controls="collapseExample" style="border:0px; background-color:#DB6551; color:#ffffff; width:auto; height:absolute;">
	    	+습관화 목표 추가
	    </button>
	    <button type="button" data-bs-toggle="collapse" data-bs-target=".short" aria-expanded="true"
	    class="btn-primary rounded-2 mx-3" 
	    aria-controls="collapseExample" style="border:0px; background-color:#DB6551; color:#ffffff; width:auto; height:absolute;">
	    	+단기 목표 추가
	    </button>
	    <button type="button" data-bs-toggle="collapse" data-bs-target=".long" aria-expanded="true"
	    class="btn-primary rounded-2"
	    aria-controls="collapseExample" style="border:0px; background-color:#DB6551; color:#ffffff; width:auto; height:absolute;">
	    	+장기 목표 추가
	    </button>
<!-- 	    
	  	
	  	<div style="width:625px;">
	  	</div>
	  	
	  	<input type="button" class="btn-primary rounded-0 "
	  	 style="border:0px; background-color:#C2C1C1; color:#707070; width:auto; height:absolute;" 
	  	 value="삭제한 목표 보기" onclick="location.href='UserGoalDeleted.jsp'"
	  	/> -->
 	</div>
  	
  	<div class="d-flex mb-3">
	  	<div class="d-flex">
		   	<div style="width:120px;">
		  	</div>
		  	<form action="HabitGoalPro.jsp" method="post">
		  	<div class="habit collapse">
	  		<div class="card card-body">		  	
				  		
				  		<!-- <div class="mb-4">
						<p class="font-bol font-no">목표 분야를 선택해주세요</p>
						<select class="form-select mb-3" aria-label="Multiple Large select example">
						  <option selected value="1">학업/학습</option>
						  <option value="2">신체 건강</option>
						  <option value="3">정신 건강</option>
						  <option value="4">취미/교양</option>
						  <option value="5">여행</option>
						  <option value="6">사이드 프로젝트</option>
						  <option value="7">업무</option>
						  <option value="8">대인관계/사회성</option>
						  <option value="9">디지털 디톡스</option>
						  <option value="10">돈 관리</option>
						  <option value="11">취업</option>
						  <option value="12">독서</option>
						</select>
				  		</div>
				  		 -->
				  	<div class="plan-enroll">
	    		  	  	<h2 style="text-align:center; font-size: 24px; font-weight: bold;">습관화 목표</h2>
  	
  						<br/>		  	

				  		<div class="mb-4">
				  			<label class="col-form-label font-bol">목표를 입력해주세요</label>
							<input class="form-control" name="goalName" required>
						</div>
						
						<div class="mb-4">
				  			<label class="col-form-label font-bol plan-enroll">시작 날짜를 선택해주세요</label>
				  			<input type="date" name="startDate1" id="startHabit1" class="form-control" required>
				  			<script>document.getElementById('startHabit1').value = new Date().toISOString().substring(0, 10);</script>
						</div>
						
						<div class="mb-4">
							<label class="col-form-label font-bol">반복 주기를 선택해주세요</label>
							
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat1" id="erDay1"
								value="매일" required>
				  				<label class="form-check-label">
				    	       		매일
				  		    	</label>		  		    	
							</div>
				
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat1" id="erWeek1"
								value="매주">
				  				<label class="form-check-label">
				    	       		매주
				  		    	</label>										  		    	
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat1" id="erMonth1"
								value="매월">
				  				<label class="form-check-label">
				    	       		매월
				  		    	</label>											  		    	
							</div>							
						
							<div class="form-check">
								<input class="form-check-input" type="radio" name="repeat1" id="erYear1"
								value="매년">
				  				<label class="form-check-label">
				    	       		매년
				  		    	</label>						    
							</div>	
						</div>
						
						<div class="mb-4">
							<label class="col-form-label font-bol">반복 형태를 선택해주세요</label>					
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType1" id="count1"
					          onclick="showDiv(this);" value="횟수" required>
					            <label class="form-check-label">
					                   횟수
					              </label>
					          <div id="count1Box" class="box">
					          <div class="d-flex">
					              <input class="form-control" id="count1" placeholder="숫자만 입력" name="count1">
					              <label for="count1" class="col-sm-4 col-form-label" >회</label>
					            </div>
					          </div>				  		    	
					        </div>
					  
					        <!-- <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType1" id="weekDay1"
					          onclick="showDiv(this);" value="요일">
					            <label for="weekday1" class="form-check-label">
					                   요일
					              </label>
					              
					          <div id="weekDay1Box" class="box">
					          <input type="checkbox" class="btn-check" id="monday1" autocomplete="off"
					          value="월" name="name1">
					          <label class="btn btn-outline-secondary" for="monday1">
					            월
					          </label>
					          
					          <input type="checkbox" class="btn-check" id="tuesday1" autocomplete="off"
					          value="화"  name="name1">
					          <label class="btn btn-outline-secondary" for="tuesday1">화</label>
					          
					          <input type="checkbox" class="btn-check" id="wednesday1" autocomplete="off"
					          value="수"  name="name1">
					          <label class="btn btn-outline-secondary" for="wednesday1">수</label>
					          
					              <input type="checkbox" class="btn-check" id="thursday1" autocomplete="off"
					              value="목"  name="name1">
					          <label class="btn btn-outline-secondary" for="thursday1">목</label>
					          
					          <input type="checkbox" class="btn-check" id="friday1" autocomplete="off"
					          value="금"  name="name1">
					          <label class="btn btn-outline-secondary" for="friday1">금</label>
					          
					          <input type="checkbox" class="btn-check" id="saturday1" autocomplete="off"
					          value="토"  name="name1">
					          <label class="btn btn-outline-secondary" for="saturday1">토</label>	
					          
					          <input type="checkbox" class="btn-check" id="sunday1" autocomplete="off"
					          value="일"  name="name1">
					          <label class="btn btn-outline-secondary" for="sunday1">일</label>
					          </div>											  		    	
					        </div> -->
					        
					
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType1" id="weekNday1"
					          onclick="showDiv(this);" value="특정 주 요일">
					          <label class="form-check-label" for="weekNday1">
					                   특정 주 요일
					              </label>
					              
					        <div id="weekNday1Box" class="box">
					        <div class="d-flex">
					          <select class="form-select" aria-label="Default select example" id="week1"
					          name="week1">
					            <option>특정 주</option>
					            <option value="첫째 주">첫째 주</option>
					            <option value="둘째 주">둘째 주</option>
					            <option value="셋째 주">셋째 주</option>
					            <option value="넷째 주">넷째 주</option>
					          </select>
					          
					          <select class="form-select" aria-label="Default select example" id="day1"
					          name="day1">
					            <option>요일</option>
					            <option value="월요일">월요일</option>
					            <option value="화요일">화요일</option>
					            <option value="수요일">수요일</option>
					            <option value="목요일">목요일</option>
					            <option value="금요일">금요일</option>
					            <option value="토요일">토요일</option>
					            <option value="일요일">일요일</option>
					          </select>
					        </div>									  		    	
					        </div>	
					      </div>						
					  
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType1" id="date1"
					          onclick="showDiv(this);" value="특정 날짜">
					            <label class="form-check-label">
					                     특정 날짜
					              </label>
					          <div id="date1Box" class="box">
					          <div class="d-flex ">
					          	  <input class="form-control" id="month1" placeholder="1~12 사이 숫자"
					          	  name="month1">
					          	  <label for="month1" class="col-form-label">월</label>&nbsp;
					              <input class=" form-control" id="date1" placeholder="1~28 사이 숫자"
					              name="date1">
					              <label for="date1" class="col-form-label">일</label>
					          </div>
					          </div>
					        </div>
					
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType1" id="period1"
					          onclick="showDiv(this);" value="특정 기간">
					            <label class="form-check-label">
					                     특정 기간
					              </label>
					        <div id="period1Box" class="box">
					          <div class="middle my-2">							
					              <div class="slider">
					                <div class="progress"></div>
					              </div>
					            <div class="range-input">
					              <input type="range" class="input-left"  min="1" max="28" value="8" step="1" list="tickmarks"
					              name="left1"/>
					              <input type="range" class="input-right" min="1" max="28" value="21" step="1" 
					              name="right1"/>
					            </div>
					          </div>
					                <div class="day-input d-flex">
					              <div class="field">
					                <input class="input-min form-control" value="8" name="left">
					                <span class="col-sm-4">일 에서</span>
					              </div>
					              <div class="field">
					                <input class="input-max form-control" value="21" name="right">
					                <span class="col-sm-4">일 까지</span>
					              </div>
					            </div>
					        </div>
					        </div>
					      </div>
					
					      <script>
					        function showDiv(element){
					          var tag = document.getElementsByClassName("box");
					  
					          console.log(tag);
					  
					          for(var i=0; i<tag.length; i++){
					            if (element.id+"Box" == tag[i].id)
					              tag[i].style.display="block";
					            else
					              tag[i].style.display="none";
					          }
					        }
					      </script>
						
			  			<div>
			        		<input type="submit" class="btn btn-primary col-auto plan-enroll" 
			        		style="background-color: #DB6551; border: 0px;" value="목표 등록하기" />
			        	</div>						
						
	    		
	    			</div>
	  				</div>
			</div>
	  	</form>

			<form action="ShortGoalPro.jsp" method="post">
		  	<div class="short collapse">
	  		<div class="card card-body">
	 
	    		  	<div class="plan-enroll" >
	    		  	
	    		  	  	<h2 style="text-align:center; font-size: 24px; font-weight: bold;">단기 목표</h2>
  	
  						<br/>				  		
				  		
				  		<div class="mb-4">
				  			<label class="col-form-label font-bol">목표를 입력해주세요</label>
							<input class="form-control" name="goalName2" required>
						</div>
						
						<div class="mb-4">
				  			<label class="col-form-label font-bol">진행 기간을 선택해주세요(3개월까지만 선택 가능)</label>
				  		
				  			<div class="d-flex">
				  			<input type="date" name="startDate2" id="startShort2" class="form-control" required>
				  			<script>document.getElementById('startShort2').value = new Date().toISOString().substring(0, 10);</script>
							
							<p>&nbsp;~&nbsp;</p>
							
				  			<input type="date" name="endDate2" id="endShort2"  class="form-control" required>
				  			</div>
						</div>
						
						<div class="mb-4">
							<div class="mb-4">
							<label class="col-form-label font-bol">반복 주기를 선택해주세요</label>
							
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat2" id="erDay2"
								value="매일" required>
				  				<label class="form-check-label">
				    	       		매일
				  		    	</label>		  		    	
							</div>
				
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat2" id="erWeek2"
								value="매주">
				  				<label class="form-check-label">
				    	       		매주
				  		    	</label>										  		    	
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat2" id="erMonth2"
								value="매월">
				  				<label class="form-check-label">
				    	       		매월
				  		    	</label>											  		    	
							</div>							

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat2" id="inPeriod2"
								value="기간 내">
				  				<label class="form-check-label">
				    	       			기간 내
				  		    	</label>
							</div>
							</div>
						</div>
						
						<div class="mb-4">
							<label class="col-form-label font-bol">반복 형태를 선택해주세요</label>					
					        <div class="form-check mb-2">
					        <input class="form-check-input" type="radio" name="repeatType2" id="count2"
					          onclick="showDiv(this);" value="횟수">
					            <label class="form-check-label">
					                   횟수
					              </label>
					          <div id="count2Box" class="box">
					          <div class="d-flex">
					              <input class="form-control" id="count2" placeholder="숫자만 입력" name="count2">
					              <label for="count2" class="col-sm-4 col-form-label" >회</label>
					            </div>
					          </div>				  		    	
					        </div>
					  
					        <!-- <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType2" id="weekDay2"
					          onclick="showDiv(this);">
					            <label for="weekday2" class="form-check-label">
					                   요일
					              </label>
					              
					      		<div id="weekDay2Box" class="box">
					          <input type="checkbox" class="btn-check" id="monday2" autocomplete="off"
					          value="월">
					          <label class="btn btn-outline-secondary" for="monday2">
					            월
					          </label>
					          
					          <input type="checkbox" class="btn-check" id="tuesday2" autocomplete="off"
					          value="화">
					          <label class="btn btn-outline-secondary" for="tuesday2">화</label>
					          
					          <input type="checkbox" class="btn-check" id="wednesday2" autocomplete="off"
					          value="수">
					          <label class="btn btn-outline-secondary" for="wednesday2">수</label>
					          
					              <input type="checkbox" class="btn-check" id="thursday2" autocomplete="off"
					              value="목">
					          <label class="btn btn-outline-secondary" for="thursday2">목</label>
					          
					          <input type="checkbox" class="btn-check" id="friday2" autocomplete="off"
					          value="금">
					          <label class="btn btn-outline-secondary" for="friday2">금</label>
					          
					          <input type="checkbox" class="btn-check" id="saturday2" autocomplete="off"
					          value="토">
					          <label class="btn btn-outline-secondary" for="saturday2">토</label>	
					          
					          <input type="checkbox" class="btn-check" id="sunday2" autocomplete="off"
					          value="일">
					          <label class="btn btn-outline-secondary" for="sunday2">일</label>
					          	</div>											  		    	
					        </div> -->
				        
				
				        <div class="form-check mb-2">
				          <input class="form-check-input" type="radio" name="repeatType2" id="weekNday2"
				          onclick="showDiv(this);" value="특정 주 요일">
				          <label class="form-check-label" for="weekNday2">
				                   특정 주 요일
				              </label>
				              
				        <div id="weekNday2Box" class="box">
				        <div class="d-flex">
				          <select class="form-select" aria-label="Default select example" id="week2"
				          name="week2" >
				            <option>특정 주</option>
				            <option value="첫째 주">첫째 주</option>
				            <option value="둘째 주">둘째 주</option>
				            <option value="셋째 주">셋째 주</option>
				            <option value="넷째 주">넷째 주</option>
				          </select>
				          
				          <select class="form-select" aria-label="Default select example" id="day2"
				          name="day2">
				            <option>요일</option>
				            <option value="월요일">월요일</option>
				            <option value="화요일">화요일</option>
				            <option value="수요일">수요일</option>
				            <option value="목요일">목요일</option>
				            <option value="금요일">금요일</option>
				            <option value="토요일">토요일</option>
				            <option value="일요일">일요일</option>
				          </select>
				        </div>									  		    	
				        </div>	
				      </div>						
				  
				        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType2" id="date2"
					          onclick="showDiv(this);" value="특정 날짜">
					            <label class="form-check-label">
					                     특정 날짜
					              </label>
					          <div id="date2Box" class="box">
					          <div class="d-flex ">
					          	  <input class="form-control" id="month2" placeholder="1~12 사이 숫자"
					          	  name="month2">
					          	  <label for="month2" class="col-form-label">월</label>&nbsp;
					              <input class=" form-control" id="date2" placeholder="1~28 사이 숫자"
					              name="date2">
					              <label for="date2" class="col-form-label">일</label>
					          </div>
					          </div>
					    </div>
				
				        <div class="form-check mb-2">
				          <input class="form-check-input" type="radio" name="repeatType2" id="period2"
				          onclick="showDiv(this);" value="특정 기간">
				            <label class="form-check-label">
				                     특정 기간
				              </label>
				        <div id="period2Box" class="box">
				          <div class="middle my-2">							
				              <div class="slider">
				                <div class="progress"></div>
				              </div>
				            <div class="range-input">
				              <input type="range" class="input-left"  min="1" max="28" value="8" step="1" list="tickmarks"
				              name="left1"/>
				              <input type="range" class="input-right" min="1" max="28" value="21" step="1"
				              name="right1" />
				            </div>
				          </div>
				                <div class="day-input d-flex">
				              <div class="field">
				                <input class="input-min form-control" value="8" name="left">
				                <span class="col-sm-4">일 에서</span>
				              </div>
				              <div class="field">
				                <input class="input-max form-control" value="21" name="right">
				                <span class="col-sm-4">일 까지</span>
				              </div>
				            </div>
				            </div>
				        </div>
				        </div>

						
			<!--         	<div class="mb-2">
			        		<button type="button" class="btn btn-primary col-auto" 
			        		data-bs-toggle="collapse" data-bs-target="#middle-detail2" aria-expanded="false" 
			        		 style="background-color:#ffffff; color: #DB6551; border-color: #DB6551;">
			        		 	+중간 목표 추가(선택)
			        		</button>

			        	</div>
			        	<div class="mb-5">
							<div class="collapse" id="middle-detail2">
								<div class="card card-body" style="width: 350px;">
							    	<p class="font-bol font-no">중간 목표와 세부 계획을 입력해주세요</p>
							    	
							    	<div class="mb-2 row">
										<label class="col-form-label focus-ring focus-ring-dark">중간 목표 달성 날짜</label>
										<input type="date" id="shortMiddleDate2" class="form-control mx-auto" style="width:320px;">
									</div>
							    	<div class="mb-2 row">
								    	<label for="middlePlan2" class="col-sm-4 col-form-label">중간 목표</label>
								    	<div class="col-sm-8">
								      		<textarea class="form-control rounded-2" id="detailPlan2" rows="3"></textarea>
							    		</div>
							 		</div>
							    	<div class="mb-2 row">
								    	<label for="detailPlan2" class="col-sm-4 col-form-label">할 일</label>
								    	<div class="col-sm-8">
								      		<textarea class="form-control rounded-2" id="detailPlan2" rows="3"></textarea>
							    		</div>
							 		</div>
							 		<div class="mb-2 row">
								    	<label for="startNum2" class="col-sm-4 col-form-label">시작 수치</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="startNum2">
							    		</div>
							 		</div>
							 		<div class="mb-2 row">
								    	<label for="goalNum2" class="col-sm-4 col-form-label">목표 수치</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="goalNum2">
							    		</div>
							 		</div>
							 		<div class="mb-3 row">
								    	<label for="goalUnit2" class="col-sm-4 col-form-label">목표 단위</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="goalUnit2">
							    		</div>
							 		</div>
							 		
							 		<button type="submit"  class="btn btn-primary col-auto" 			        				
					        		 style="background-color: #DB6551; border: 0px;">
					        		 목표에 중간 목표 추가
					        		</button>

								</div>
								
							</div>
						</div> -->
	    			
	    				<div>
			        		<input type="submit" class="btn btn-primary col-auto plan-enroll" 
			        		style="background-color: #DB6551; border: 0px;" value="목표 등록하기" />
			        	</div>				
	    				
	    				</div>
	  				</div>
					</div>
					</form>

	  		<form action="LongGoalPro.jsp" method="post">
  			<div class="long collapse">
	  		<div class="card card-body">
	 
	    		  	<div class="plan-enroll" >
	    		  	
	    		  	  	<h2 style="text-align:center; font-size: 24px; font-weight: bold;">장기 목표</h2>
  	
  						<br/>
				  		
				  		<div class="mb-4">
				  			<label class="col-form-label font-bol">목표를 입력해주세요</label>
							<input class="form-control" name="goalName3" required>
						</div>
						
						<div class="mb-4">
				  			<label class="col-form-label font-bol">진행 기간을 선택해주세요(3개월 이상부터 선택 가능)</label>
				  			
				  			<div class="d-flex">
				  			<input type="date" name="startDate3" id="startLong3" class="form-control plan-enroll" required>
				  			<script>document.getElementById('startLong3').value = new Date().toISOString().substring(0, 10);</script>
							
							<p>&nbsp;~&nbsp;</p>
							
				  			<input type="date" name="endDate3" id="endLong3"  class="form-control" required>
				  			</div>
				  			
						</div>
						
						<div class="mb-4">
							<label class="col-form-label font-bol">반복 주기를 선택해주세요</label>
							
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat3" id="erDay3" value="매일">
				  				<label class="form-check-label">
				    	       		매일
				  		    	</label>		  		    	
							</div>
				
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat3" id="erWeek3" 
								value="매주">
				  				<label class="form-check-label">
				    	       		매주
				  		    	</label>										  		    	
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat3" id="erMonth3"  
								value="매월">
				  				<label class="form-check-label">
				    	       		매월
				  		    	</label>											  		    	
							</div>							
						
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat3" id="inPeriod3"
								 value="기간 내">
				  				<label class="form-check-label">
				    	       			기간 내
				  		    	</label>
							</div>
						</div>
						
						<div class="mb-4">
							<label class="col-form-label font-bol">반복 형태를 선택해주세요</label>					
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType3" id="count3"
					          onclick="showDiv(this);" value="횟수">
					            <label class="form-check-label">
					                   횟수
					              </label>
					          <div id="count3Box" class="box">
					          <div class="d-flex">
					              <input class="form-control" id="count3" placeholder="숫자만 입력" name="count3">
					              <label for="count3" class="col-sm-4 col-form-label" >회</label>
					            </div>
					          </div>				  		    	
					        </div>
					  
					
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType3" id="weekNday3"
					          onclick="showDiv(this);" value="특정 주 요일">
					          <label class="form-check-label" for="weekNday3">
					                   특정 주 요일
					              </label>
					              
					        <div id="weekNday3Box" class="box">
					        <div class="d-flex">
					          <select class="form-select" aria-label="Default select example" id="week3"
					          name="week3">
					            <option>특정 주</option>
					            <option value="첫째 주">첫째 주</option>
					            <option value="둘째 주">둘째 주</option>
					            <option value="셋째 주">셋째 주</option>
					            <option value="넷째 주">넷째 주</option>
					          </select>
					          
					          <select class="form-select" aria-label="Default select example" id="day3"
					          name="day3">
					            <option>요일</option>
					            <option value="월요일">월요일</option>
					            <option value="화요일">화요일</option>
					            <option value="수요일">수요일</option>
					            <option value="목요일">목요일</option>
					            <option value="금요일">금요일</option>
					            <option value="토요일">토요일</option>
					            <option value="일요일">일요일</option>
					          </select>
					        </div>									  		    	
					        </div>	
					      </div>						
					  
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType3" id="date3"
					          onclick="showDiv(this);" value="특정 날짜">
					            <label class="form-check-label">
					                     특정 날짜
					              </label>
					          <div id="date3Box" class="box">
					          <div class="d-flex ">
					          	  <input class="form-control" id="month3" placeholder="1~12 사이 숫자"
					          	  name="month3">
					          	  <label for="month3" class="col-form-label">월</label>&nbsp;
					              <input class=" form-control" id="date3" placeholder="1~28 사이 숫자"
					              name="date3">
					              <label for="date3" class="col-form-label">일</label>
					          </div>
					          </div>
					        </div>
					
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType3" id="period3"
					          onclick="showDiv(this);" value="특정 기간">
					            <label class="form-check-label">
					                     특정 기간
					              </label>
					        <div id="period1Box" class="box">
					          <div class="middle my-2">							
					              <div class="slider">
					                <div class="progress"></div>
					              </div>
					            <div class="range-input">
					              <input type="range" class="input-left"  min="1" max="28" value="8" step="1" 
					              name="left3" list="tickmarks"/>
					              <input type="range" class="input-right" min="1" max="28" value="21" step="1" 
					              name="right3"/>
					            </div>
					          </div>
					                <div class="day-input d-flex">
					              <div class="field">
					                <input class="input-min form-control" value="8" name="left">
					                <span class="col-sm-4">일 에서</span>
					              </div>
					              <div class="field">
					                <input class="input-max form-control" value="21" name="right">
					                <span class="col-sm-4">일 까지</span>
					              </div>
					            </div>
					        </div>
					        </div>
						</div>
						
			        	<!-- <div class="mb-2">
			        		<button type="button" class="btn btn-primary col-auto" 
			        		data-bs-toggle="collapse" data-bs-target="#middle-low-detail3" aria-expanded="false" 
			        		 style="background-color:#ffffff; color: #DB6551; border-color: #DB6551;">
			        		 	+중간 목표와 하위 목표 추가(선택)
			        		</button>

			        	</div>
			        	<div class="mb-5">
							<div class="collapse" id="middle-low-detail3">
								<div class="card card-body" style="width: 350px;">
							    	<p class="font-bol font-no">중간 목표와 하위 목표를 입력해주세요</p>
							    	
							    	<div class="mb-2 row">
										<label class="col-form-label focus-ring focus-ring-dark">중간 목표 달성 날짜</label>
										<input type="date" id="shortMiddleDate3" class="form-control mx-auto" style="width:320px;">
									</div>
							    	<div class="mb-2 row">
								    	<label for="middlePlan3" class="col-sm-4 col-form-label">중간 목표</label>
								    	<div class="col-sm-8">
								      		<textarea class="form-control rounded-2" id="middlePlan3" rows="3"></textarea>
							    		</div>
							 		</div>
									<div class="mb-2 row">
								    	<label for="lowPlan3" class="col-sm-4 col-form-label">하위 목표</label>
								    	<div class="col-sm-8">
								      		<textarea class="form-control rounded-2" id="lowPlan3" rows="3"></textarea>
							    		</div>
							 		</div>
							 		<div class="mb-2 row">
								    	<label for="startNum3" class="col-sm-4 col-form-label">시작 수치</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="startNum3">
							    		</div>
							 		</div>
							 		<div class="mb-2 row">
								    	<label for="goalNum3" class="col-sm-4 col-form-label">목표 수치</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="goalNum3">
							    		</div>
							 		</div>
							 		<div class="mb-3 row">
								    	<label for="goalUnit3" class="col-sm-4 col-form-label">목표 단위</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="goalUnit3">
							    		</div>
							 		</div>
							 		
							 		<button type="submit"  class="btn btn-primary col-auto" 			        				
					        		 style="background-color: #DB6551; border: 0px;">
					        		 목표에 중간 목표 및 하위 목표 추가
					        		</button>

								</div>
							</div>
						</div>			        	 -->
			        	<div>
			        		<input type="submit" class="btn btn-primary col-auto plan-enroll" 
			        		style="background-color: #DB6551; border: 0px;" value="목표 등록하기" />
			        	</div>				
	    		
	  			</div>
			</div>
			</div>
			</form>
			</div>
		</div>

  	<br/>
  	<br/>
  	
  	
	  	<!-- 게시물 목록 테이블(표처럼) --> 
				<!-- 목록의 내용 --> 
				<%
				if (usergoalLists.isEmpty()) {
				    // 목표가 하나도 없을 때 
				%>
				            <div style="text-align:center;">
				                등록된 목표가 없습니다. 목표를 추가해보세요.
				            </div>
				<%
				}
				else {
				    // 게시물이 있을 때 
				    int virtualNum = 0;  // 화면상에서의 게시물 번호
				    
				    for (UserGoalDTO gdto : goalListsUserId)
				    {	
				        virtualNum = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소
				%>
			<div class="d-flex">
		  	   	<div style="width:120px;">
		  		</div>
		  		<input type="hidden" name="goalId" value="<%= gdto.getGoalId() %>" />
		  		<% if (gdto.getGoalType().equals("습관화 목표")) {%>
		  			<div class="my-2"><%= gdto.getGoalType() %>&ensp; &ensp; </div>
		  		<% }else { %>
		  			<div class="my-2"><%= gdto.getGoalType() %>&emsp;&emsp;&nbsp; </div>
		  		<%} %>
		  		<div class="card card-body mx-2 my-2" style="width:850px;">
		  			<div class="d-flex align-baseline">
			  			<p class="card-title font-bol"> <%= gdto.getGoalName() %></p>&emsp;
			  			<% if (gdto.getGoalType().equals("습관화 목표")) {%>
			  				<p class="card-text"><%= gdto.getStartDate() %>&nbsp;~&nbsp;∞</p>
			  			<% }else { %>
			  				<p class="card-text"><%= gdto.getStartDate() %>&nbsp;~&nbsp;<%= gdto.getEndDate() %></p>
			  			<%} %>
			  			&emsp;
			  			<div class="badge rounded-pill text"
			  			style="background-color:#A03A29; height:26px;"><p class="font-no">
							<%
							//지정 목표 실천률에 필요한 실천 일수 계산
							SimpleDateFormat tr = new SimpleDateFormat("yyyy-MM-dd");
							Date now = new Date(System.currentTimeMillis());
							Date t = tr.parse(gdto.getStartDate());
							/* int implement = now - t ;  */ 
							long diffSec = (now.getTime() - t.getTime()) / 1000; //초 차이
					        long diffMin = (now.getTime() - t.getTime()) / 60000; //분 차이
					        long diffHor = (now.getTime() - t.getTime()) / 3600000; //시 차이
					        long diffDays = diffSec / (24*60*60); //일자수 차이
							
							/* System.out.println(diffDays + "일 차이"); */
							
							// 목표별로 게시물 작성 수를 카운트하고, 실천해야 했을 일수를 카운트해서, 목표별 실천률에 반영
							// -> 작성 수 / 실천해야했을 횟수 * 100 
							String getGoalId = gdto.getGoalId();
							for (BoardDTO bodto : boardLists){
								if (gdto.getGoalId().equals(bodto.getGoalId())) {
									int idCount = bdao.selectCount(param);
									
									long percent = idCount / diffDays * 100;
									if(diffDays<0){
										System.out.println(Math.abs(percent));
									} else {
										System.out.println(percent);
									}
									System.out.println(idCount);
									System.out.println(diffDays);
									System.out.println(percent);
								}
							} return percent;
							%>
							<%= percent %>%
						</p></div>
		  			</div>
		  			<p class="card-text"><%= gdto.getRepeatCycle() %>,&nbsp;<%= gdto.getRepeatType() %></p>
		  			<p class="card-text">목표 생성일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="<%= gdto.getCreatedAt() %>"/></p>
		  			<%= gdto.getGoalId()%>
		  			<%for (HabitDTO hadto : habitLists){%>
			  			<% if (gdto.getGoalId().equals(hadto.getGoalId())) {%>
			  			<p>할 일: <%= hadto.getTodo() %></p>
			  			<p>시작 수치: <%= hadto.getStartNum() %><%= hadto.getGoalUnit() %>, 
			  			목표 수치: <%= hadto.getGoalNum() %><%= hadto.getGoalUnit() %></p>
			  			<%} %>
		  			<%} %>
		  			<%for (MidDTO middto : midLists) {%>
		  				<%if (gdto.getGoalId().equals(middto.getGoalId())) {%>
		  				<p>중간 목표: <%= middto.getMiddleGoal() %></p>
		  				<p>시작 수치: <%= middto.getStartNum() %><%= middto.getGoalUnit() %>, 
			  			목표 수치: <%= middto.getGoalNum() %><%= middto.getGoalUnit() %></p>
		  				<p>중간목표 달성 날짜: <%= middto.getMidDate() %></p>
		  				<%} %>
		  			<%} %>
		  			<%for (MidDownDTO middDto : midDownLists) {%>
		  				<%if (gdto.getGoalId().equals(middDto.getGoalId())) {%>
		  				<p>중간 목표: <%= middDto.getMiddleGoal() %></p>
		  				<p>하위 목표: <%= middDto.getDownGoal() %></p>
		  				<p>시작 수치: <%= middDto.getStartNum() %><%= middDto.getGoalUnit() %>, 
			  			목표 수치: <%= middDto.getGoalNum() %><%= middDto.getGoalUnit() %></p>
		  				<p>중간목표 달성 날짜: <%= middDto.getMidDate() %></p>
		  				<%} %>
		  			<%} %>
		  		</div>
		  	
		  	<div class="d-flex my-2" style="height:30px;">
		  		<% if (gdto.getGoalType().equals("습관화 목표")) {%>
			  	 <input type="button" class="btn-primary rounded-0 mx-2"
			  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto;" 
			  	 value="이 목표 수정" onclick="location.href='HabitGoalEdit.jsp?goalId=<%= gdto.getGoalId() %>';"/>
			  	 <%} else if (gdto.getGoalType().equals("단기 목표")){%>
			  	 <input type="button" class="btn-primary rounded-0 mx-2"
			  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto;" 
			  	 value="이 목표 수정" onclick="location.href='ShortGoalEdit.jsp?goalId=<%= gdto.getGoalId() %>';"/>
			  	 <%} else {%>
			  	 <input type="button" class="btn-primary rounded-0 mx-2"
			  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto;" 
			  	 value="이 목표 수정" onclick="location.href='LongGoalEdit.jsp?goalId=<%= gdto.getGoalId() %>';"/>
			  	 <%} %>
			  	 <!-- <input type="button" class="btn-primary rounded-0 mx-2"  
			  	 data-bs-toggle="modal" data-bs-target="#goalDelete"
			  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto;" 
			  	 value="이 목표 삭제"/> -->
			  	 	<input type="button" class="btn-primary rounded-0 mx-2"  
			  	 onclick="location.href='UserGoalDelete.jsp?goalId=<%= gdto.getGoalId() %>'"
			  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto;" 
			  	 value="이 목표 삭제"/>
			  <%-- 	 	<div class="d-flex mb-3">

         <div class="modal fade" id="goalDelete" data-bs-backdrop="static" tabindex="-1" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">목표 삭제</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	해당 목표를 삭제하시겠어요?
		      	<%= gdto.getGoalId() %>
		      </div>
		      <div class="modal-footer">	      	
		      	<button type="button" class="btn" onclick="location.href='UserGoalDelete.jsp?goalId=<%= gdto.getGoalId() %>'"
		      	 style="background-color:#DB6551; color:#ffffff;">
		      	 예</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="border:0px;">
		         아니오(삭제하지 않음)
		        </button>
			  </div>
		    </div>
		  </div>
		</div> 

		</div> --%>
		  	 </div>
		  	 <div style="width:120px;">
		  		</div>
		  	</div>
		 <%}
		 }%>
  	
 
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