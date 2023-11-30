<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="usergoal.UserGoalDAO"%>
<%@ page import="usergoal.UserGoalDTO"%>
<%@ page import="mid.MidDAO" %>
<%@ page import="mid.MidDTO" %>
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
String goalId = request.getParameter("goalId");
String middleId = request.getParameter("middleId");

//DAO를 생성해 DB에 연결
UserGoalDAO gdao = new UserGoalDAO();
MidDAO hdao = new MidDAO();
Map<String, Object> param = new HashMap<String, Object>(); 
List<MidDTO> habitLists = hdao.selectList(param);

// 목표아이디로 목표 목록 받기

UserGoalDTO gdto = gdao.selectGoal(goalId);// goalId로 목표 가져오기 
MidDTO hdto = hdao.selectView(middleId);


%>
	<!-- header.html이 삽입될 위치 -->
	 <div>
	 	<jsp:include page="HeaderLoginLogout.jsp"/>
	 </div>
    
    <!-- main content가 삽입될 위치 -->
  	<div id = "content" style="padding:30px; ">
  	<form method="post" name="shortEdit"
          class="mb-5" onsubmit="return validateForm(this);">
  		<h2 style="text-align:center; font-size: 24px; font-weight: bold;">단기 목표 수정</h2>
  		<br/>
  		 
  		 <div class="short">
        <div class="plan-enroll mx-auto my-auto">
        <input type="hidden" name="goalId" value="<%= gdto.getGoalId() %>" />
				  		<div class="mb-4">
				  			<label class="col-form-label font-bol">목표를 입력해주세요</label>
							<input class="form-control" name="goalName" required disabled
							value="<%= gdto.getGoalName() %>">
						</div>
						
						<div class="mb-4">
				  			<label class="col-form-label font-bol">진행 기간을 선택해주세요(3개월까지만 선택 가능)</label>
				  			
				  			<div class="d-flex">
					  			<input type="date" name="startDate22" id="startHabit22" class="form-control" 
					  			value="<%= gdto.getStartDate() %>" required disabled>
					  		
					  			<p>&nbsp;~&nbsp;</p>
					  			
					  			<input type="date" name="endDate22" id="endShort22"  class="form-control" 
					  			value="<%= gdto.getEndDate() %>" required>
				  			</div>
						</div>
					
						
						<div class="mb-4">
							<p class="font-bol" style="color:red;">
							기존 반복 주기 및 형태<br>: <%= gdto.getRepeatCycle() %>, <%= gdto.getRepeatType() %></p>
							<label class="col-form-label font-bol">반복 주기를 선택해주세요</label>
							
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat22" id="erDay22"
								value="매일" required>
				  				<label class="form-check-label">
				    	       		매일
				  		    	</label>		  		    	
							</div>
				
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat22" id="erWeek22"
								value="매주">
				  				<label class="form-check-label">
				    	       		매주
				  		    	</label>										  		    	
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat22" id="erMonth22"
								value="매월">
				  				<label class="form-check-label">
				    	       		매월
				  		    	</label>											  		    	
							</div>							
						
							<div class="form-check">
								<input class="form-check-input" type="radio" name="repeat22" id="erYear22"
								value="매년">
				  				<label class="form-check-label">
				    	       		매년
				  		    	</label>						    
							</div>	
						</div>
						
						<div class="mb-4">
						<div class="mb-2">
							<label class="col-form-label font-bol">반복 형태를 선택해주세요</label>					
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType22" id="count22"
					          onclick="showDiv(this);" value="횟수" required>
					            <label class="form-check-label">
					                   횟수
					              </label>
					          <div id="count22Box" class="box">
					          <div class="d-flex">
					              <input class="form-control" id="count22" placeholder="숫자만 입력" name="count22">
					              <label for="count22" class="col-sm-4 col-form-label" >회</label>
					            </div>
					          </div>				  		    	
					        </div>
						 </div>
						  	<div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType22" id="weekNday22"
					          onclick="showDiv(this);" value="특정 주, 요일">
					          <label class="form-check-label" for="weekNday1">
					                   특정 주 요일
					              </label>
					              
					        <div id="weekNday22Box" class="box">
					        <div class="d-flex">
					          <select class="form-select" aria-label="Default select example" id="week22"
					          name="week22">
					            <option>특정 주</option>
					            <option value="첫째 주">첫째 주</option>
					            <option value="둘째 주">둘째 주</option>
					            <option value="셋째 주">셋째 주</option>
					            <option value="넷째 주">넷째 주</option>
					          </select>
					          
					          <select class="form-select" aria-label="Default select example" id="day22"
					          name="day22">
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
					          <input class="form-check-input" type="radio" name="repeatType22" id="date22"
					          onclick="showDiv(this);" value="특정 날짜">
					            <label class="form-check-label">
					                     특정 날짜
					              </label>
					          <div id="date22Box" class="box">
					          <div class="d-flex ">
					          	  <input class="form-control" id="month22" placeholder="1~12 사이 숫자"
					          	  name="month22">
					          	  <label for="month22" class="col-form-label">월</label>&nbsp;
					              <input class=" form-control" id="date22" placeholder="1~28 사이 숫자"
					              name="date22">
					              <label for="date22" class="col-form-label">일</label>
					          </div>
					          </div>
					        </div>
					
					        <div class="form-check mb-2">
					          <input class="form-check-input" type="radio" name="repeatType22" id="period22"
					          onclick="showDiv(this);" value="">
					            <label class="form-check-label">
					                     특정 기간
					              </label>
					        <div id="period22Box" class="box">
					          <div class="middle my-2">							
					              <div class="slider">
					                <div class="progress"></div>
					              </div>
					            <div class="range-input">
					              <input type="range" class="input-left"  min="1" max="28" value="8" step="1" 
					              name="left22" list="tickmarks"/>
					              <input type="range" class="input-right" min="1" max="28" value="21" step="1" 
					              name="right22"/>
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
					
						
			        	<div class="mb-2">
			        		<button type="button" class="btn btn-primary col-auto" 
			        		onclick="location.href='ShortDetail.jsp?goalId=<%= gdto.getGoalId() %>'" 
			        		 style="background-color:#ffffff; color: #DB6551; border-color: #DB6551;">
			        		 	+중간 목표 추가(선택)
			        		</button>
			        	
			        	<%for (MidDTO hadto : habitLists){%>
			  			<% if (gdto.getGoalId().equals(hadto.getGoalId())) {%>
			  		<div class="card my-3">
			  			<p><%= hadto.getMiddleId() %></p>
			  			<p>중간목표: <%= hadto.getMiddleGoal() %></p>
			  			<p>시작 수치: <%= hadto.getStartNum() %><%= hadto.getGoalUnit() %>,  
			  			목표 수치: <%= hadto.getGoalNum() %><%= hadto.getGoalUnit() %></p>
			  			<p>중간목표 달성일: <%= hadto.getMidDate() %></p>
			  		</div>
			  			<%} %>
		  			<%} %>
			        	</div>
			        	
			        	
			  			<div>
			        		<input type="submit" class="btn btn-primary col-auto plan-enroll" 
			        		style="background-color: #DB6551; border: 0px;" value="목표 수정하기" 
			        		formaction="ShortGoalEditPro.jsp"/>
			        	</div>
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