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
List<UserGoalDTO> usergoalLists = gdao.selectList(param);
List<UserGoalDTO> goalListsUserId = gdao.getDTOuserId(usermakeId);
List<UserGoalDTO> goalListsgoalId= gdao.getDTOId(goalId);

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
  	
  	<div class="mx-auto plan-enroll">
  	<form action="ShortDetailPro.jsp">
		      			<input type="hidden" name="goalId" value="<%= gdto.getGoalId() %>" />
								<div class="mb-5">
							
								<div class="card card-body">
							    	<p class="font-bol font-no">중간 목표와 세부 계획을 입력해주세요</p>
							    	
							    	
							    	<div class="mb-2 row">
								    	<label for="middlePlan2" class="col-sm-4 col-form-label">중간 목표</label>
								    	<div class="col-sm-8">
								      		<textarea class="form-control rounded-2"  rows="3"
								      		name="middleGoal22"></textarea>
							    		</div>
							 		</div>
							 		
							 		<div class="mb-2 row">
								    	<label for="startNum2" class="col-sm-4 col-form-label">시작 수치</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="startNum2" name="startNum22">
							    		</div>
							 		</div>
							 		<div class="mb-2 row">
								    	<label for="goalNum2" class="col-sm-4 col-form-label">목표 수치</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="goalNum2" name="goalNum22">
							    		</div>
							 		</div>
							 		<div class="mb-3 row">
								    	<label for="goalUnit2" class="col-sm-4 col-form-label">목표 단위</label>
								    	<div class="col-sm-4">
								      		<input class="form-control rounded-2" id="goalUnit2" name="goalUnit22">
							    		</div>
							 		</div>
							 		
							 		<div class="mb-2 row">
										<label class="col-form-label focus-ring focus-ring-dark">중간 목표 달성 날짜</label>
										<input type="date" class="form-control mx-auto" 
										name="midDate22" style="width:320px;">
									</div>
							 		
							 		<button type="submit"  class="btn btn-primary col-auto" 			        				
					        		 style="background-color: #DB6551; border: 0px;">
					        		 목표에 중간 목표 추가
					        		</button>

								</div>
								

							</div>

			
	</form>
						
	<br/>
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