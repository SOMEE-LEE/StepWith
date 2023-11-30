<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="usergoal.UserGoalDAO"%>
<%@ page import="usergoal.UserGoalDTO"%>
<%@ page import="habit.HabitDAO" %>
<%@ page import="habit.HabitDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap, CSS 적용 -->	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
    crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">

</head>
<body>

<%
String usermakeId = session.getAttribute("usermakeId").toString();// 세션 로그인 아이디 받기  

//DAO를 생성해 DB에 연결
UserGoalDAO gdao = new UserGoalDAO();
HabitDAO hdao = new HabitDAO();

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

String habitId = request.getParameter("habitId");
HabitDTO hdto = hdao.selectView(habitId);  // 세부 목표 목록 받기

%>

	<div class="d-flex mb-3">
	   	<div style="width:120px;">
	  	</div>
	  	
		<button type="button" data-bs-toggle="collapse" data-bs-target=".habit" aria-expanded="true"
		class="btn-primary rounded-2"
	    aria-controls="collapseExample" style="border:0px; background-color:#DB6551; color:#ffffff; width:auto; height:absolute;">
	    	+습관화 목표 추가
	    </button>
	</div>
	
	<div class="d-flex mb-3">
	  	<div class="d-flex">
		   	<div style="width:120px;">
		  	</div>
		  	<form action="HabitGoalPro.jsp" method="post">
		  	<div class="habit collapse">
	  		<div class="card card-body">
	 
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
					          onclick="showDiv(this);" value="특정 주, 요일">
					          <label class="form-check-label" for="weekNday1">
					                   특정 주, 요일
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
						
			        	<div class="mb-2">
			        		<button type="button" class="btn btn-primary col-auto" 
			        		data-bs-toggle="collapse" data-bs-target="#detail1" aria-expanded="false" 
			        		 style="background-color:#ffffff; color: #DB6551; border-color: #DB6551;">
			        		 	+세부 계획 추가(선택)
			        		</button>

			        	</div>
			        	<div class="mb-5">
							<div class="collapse" id="detail1">
								<div class="card card-body" style="width: 300px;">
							    	<p class="font-bol font-no">세부 계획을 입력해주세요</p>
							    	
							    	<div class="mb-2 row">
								    	<label for="detailPlan1" class="col-sm-4 col-form-label">할 일</label>
								    	<div class="col-sm-8">
								      		<textarea class="form-control rounded-2" id="detailPlan1" rows="3"></textarea>
							    		</div>
							 		</div>
							 		<div class="mb-2 row">
								    	<label for="startNum1" class="col-sm-4 col-form-label">시작 수치</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="startNum1">
							    		</div>
							 		</div>
							 		<div class="mb-2 row">
								    	<label for="goalNum1" class="col-sm-4 col-form-label">목표 수치</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="goalNum1">
							    		</div>
							 		</div>
							 		<div class="mb-3 row">
								    	<label for="goalUnit1" class="col-sm-4 col-form-label">목표 단위</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="goalUnit1">
							    		</div>
							 		</div>
							 		
							 		<button type="submit"  class="btn btn-primary col-auto" 			        				
					        		 style="background-color: #DB6551; border: 0px;">
					        		 목표에 세부 계획 추가
					        		</button>

								</div>
							</div>
						</div>
			        	
			        	
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
			
			<style>

			    div.box{
			      display: none;
			    }
			
			  </style>
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
		  			<div class="d-flex">
		  			<p class="card-title font-bol"> <%= gdto.getGoalName() %></p>&emsp;
		  			<% if (gdto.getGoalType().equals("습관화 목표")) {%>
		  				<p class="card-text"><%= gdto.getStartDate() %>&nbsp;~&nbsp;∞</p>
		  			<% }else { %>
		  				<p class="card-text"><%= gdto.getStartDate() %>&nbsp;~&nbsp;<%= gdto.getEndDate() %></p>
		  			<%} %>
		  			</div>
		  			<p class="card-text"><%= gdto.getRepeatCycle() %>,&nbsp;<%= gdto.getRepeatType() %></p>
		  			<p class="card-text">목표 생성일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="<%= gdto.getCreatedAt() %>"/></p>
		  			<%= gdto.getGoalId()%>
		  			<%for (HabitDTO hadto : habitLists){%>
			  			<% if (gdto.getGoalId().equals(hadto.getGoalId())) {%>
			  			<p>할 일: <%= hadto.getTodo() %></p>
			  			<p>시작 수치: <%= hadto.getStartNum() %><%= hadto.getGoalUnit() %></p>
			  			<p>목표 수치: <%= hadto.getGoalNum() %><%= hadto.getGoalUnit() %></p>
			  			<%} %>
		  			<%} %>
		  		</div>
		  	
		  	<div class="d-flex my-2" style="height:30px;">
		  		<% if (gdto.getGoalType().equals("습관화 목표")) {%>
			  	 <input type="button" class="btn-primary rounded-0 mx-2"
			  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto;" 
			  	 value="이 목표 수정" onclick="location.href='HabitGoalEdit.jsp?goalId=<%= gdto.getGoalId() %>';"/>
			  	 <%} else {%>
			  	 <input type="button" class="btn-primary rounded-0 mx-2"
			  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto;" 
			  	 value="이 목표 수정" />
			  	 <%} %>
			  	 <input type="button" class="btn-primary rounded-0 mx-2"  
			  	 data-bs-toggle="modal" data-bs-target="#goalDelete"
			  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto;" 
			  	 value="이 목표 삭제"/>
			  	 	<div class="d-flex mb-3">

        <div class="modal fade" id="goalDelete" data-bs-backdrop="static" tabindex="-1" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">목표 삭제</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	해당 목표를 삭제하시겠어요?
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

		</div>
		  	 </div>
		  	 <div style="width:120px;">
		  		</div>
		  	</div>
		 <%}
		 }%>
		  			

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous" defer>
</script>
<script src="js/jsfile.js" defer></script>
</body>
</html>