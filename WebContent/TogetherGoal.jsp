<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="modal fade" id="togetherDetail" tabindex="-1" aria-labelledby="togetherDetailLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5 font-bol" id="togetherDetailLabel">{목표 이름}</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">	  						
				  			<div class="mb-4">
				  				<label class="col-form-label font-bol">{목표 대표사진 꽉차게}</label>
								<img src="">
							</div>
				  						
				  			<div class="mb-4">
								<label class="col-form-label font-bol">목표 분야</label>
											
							</div>
										
							<div class="mb-4">
							  	<label class="col-form-label font-bol">목표 인증 조건</label>
								<textarea class="form-control" rows="3"></textarea>
							</div>
										
							<div class="mb-4">
								<label class="col-form-label font-bol">진행 기간(12개월까지만 선택 가능)</label>
								  		
								<div class="d-flex">
								  	<input type="date" name="startDate" id="startShort" class="form-control">
								  	<script>document.getElementById('startShort').value 
								  		= new Date().toISOString().substring(0, 10);</script>
											
									<p>&nbsp;~&nbsp;</p>
											
								  	<input type="date" name="endDate" id="endShort"  class="form-control">
								</div>
							</div>
										
							<div class="mb-4">
								<label class="col-form-label font-bol">반복 주기와 형태</label>
								<p>{사용자가 선택한 것}</p>
				
							</div>
							<div class="mb-4">
								<label class="col-form-label font-bol">세부 계획</label>
								<p>{사용자가 입력한 것-안했으면 -없음-표시}</p>
				
							</div>
						</div>
						<div class="modal-footer">
							<p>이미 참여중인 목표입니다</p>
							or
							<button type="button" class="btn btn-primary">참여하기</button>
						</div>
					</div>
				</div> 	
			</div>

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
                 aria-current="page" href="UserGoal.jsp">혼자하는 목표</a>
              </li>
              <li class="nav-item navWid">
                <a class="nav-link black" href="TogetherGoal.jsp"
                style="background-color:#DB6551; font-weight: bold;  color: #ffffff;">함께하는 목표</a>
              </li>
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
  			<p class="font-no"><%= session.getAttribute("userNickname") %>님이 참여중인 함께하는 목표 <h7 class="font-bol" style="font-size:20px;">0건 </h7></p>
  		</div>
  		
  		<div class="d-flex">
	  		<div style="width:120px;">
	  		</div>
	  		
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야
	  					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;
	  					<h7 style="color:#E8904A; font-size:14px;" class="font-bol">0일째 참여 중!</h7>
	  				</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:1px solid #DB6551; background-color:#ffffff; color:#DB6551;"
					    id="togetherDetailBtn" type="button" class="text-hover" data-bs-toggle="modal" 
 				 	 data-bs-target="#togetherDetail" 
					    value="자세히 보기">
	    			</h7>
	    			
	    			
	  			</div>	  			
	  		</div>		
  		</div>  		
  		  		
  		<br/>
  		
  		<hr/>
  		
  		<br/>

       <div class="d-flex my-3">
	   		<div style="width:1050px;">
	   		</div>
	   		<button type="button" data-bs-toggle="collapse" data-bs-target=".togetherGoal" aria-expanded="false"
				class="btn-primary rounded-2"
		    	aria-controls="togetherGoal" style="border:0px; background-color:#DB6551; color:#ffffff; width:auto; height:absolute;">
		    	함께하는 목표 직접 개설하기
		    </button>
	  	</div>
	  	<div class="d-flex mb-3">
	  	<div class="d-flex">
		   	<div style="width:820px;">
		  	</div>
		  	<div class="togetherGoal collapse">
	  		<div class="card card-body">
	    		  	<div class="plan-enroll">
	    		  		<h2 style="text-align:center; font-size: 24px; font-weight: bold;">함께하는 목표</h2>
  	
  						<br/>				  		
  						
  						<div class="mb-4">
  						  <label class="col-form-label font-bol">목표의 대표사진을 선택해주세요</label>
						  <input class="form-control  mx-auto" type="file" id="formFileMultiple" multiple
						   >
						</div>
  						
<!--   						<div class="mb-4">
						<label class="col-form-label font-bol">목표 분야를 선택해주세요</label>
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
				  		</div> -->
				  		
				  		<div class="mb-4">
				  			<label class="col-form-label font-bol">목표를 입력해주세요</label>
							<input class="form-control">
						</div>
						
						<div class="mb-4">
				  			<label class="col-form-label font-bol">목표 인증 조건을 작성해주세요</label>
							<textarea class="form-control" rows="3"></textarea>
						</div>
						
						<div class="mb-4">
				  			<label class="col-form-label font-bol">진행 기간을 선택해주세요(12개월까지만 선택 가능)</label>
				  		
				  			<div class="d-flex">
				  			<input type="date" name="startTogether" id="startTogether" class="form-control">
				  			<script>document.getElementById('startTogether').value = new Date().toISOString().substring(0, 10);</script>
							
							<p>&nbsp;~&nbsp;</p>
							
				  			<input type="date" name="endTogether" id="endTogether"  class="form-control">
				  			</div>
						</div>
						
						<div class="mb-4">
							<label class="col-form-label font-bol">반복 주기와 형태를 선택해주세요</label>
							
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat" id="erDay">
				  				<label class="form-check-label">
				    	       		매일-횟수
				  		    	</label>
								<div class="d-flex">
								    <input class="form-control" id="dayNum" placeholder="숫자만 입력">
								    <label for="dayNum" class="col-sm-4 col-form-label">회</label>
							    </div>				  		    	
							</div>
				
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat" id="erWeekDay">
				  				<label class="form-check-label">
				    	       		매주-요일
				  		    	</label>
				  		    	
				  		    	<div>
				  		    	<input type="checkbox" class="btn-check" id="monday4" autocomplete="off">
								<label class="btn btn-outline-secondary" for="monday4">
									월
								</label>
								
								<input type="checkbox" class="btn-check" id="tuesday4" autocomplete="off">
								<label class="btn btn-outline-secondary" for="tuesday4">화</label>
								
								<input type="checkbox" class="btn-check" id="wednesday4" autocomplete="off">
								<label class="btn btn-outline-secondary" for="wednesday4">수</label>
								
				  		    	<input type="checkbox" class="btn-check" id="thursday4" autocomplete="off">
								<label class="btn btn-outline-secondary" for="thursday4">목</label>
								
								<input type="checkbox" class="btn-check" id="friday4" autocomplete="off">
								<label class="btn btn-outline-secondary" for="friday4">금</label>
								
								<input type="checkbox" class="btn-check" id="saturday4" autocomplete="off">
								<label class="btn btn-outline-secondary" for="saturday4">토</label>	
								
								<input type="checkbox" class="btn-check" id="sunday4" autocomplete="off">
								<label class="btn btn-outline-secondary" for="sunday4">일</label>
								</div>											  		    	
							</div>
							
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat" id="erWeekNum">
				  				<label class="form-check-label">
				    	       		매주-횟수
				  		    	</label>
								<div class="d-flex">
								    <input class="form-control" id="weekNum" placeholder="숫자만 입력">
								    <label for="weekNum" class="col-sm-4 col-form-label">회</label>
							    </div>
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat" id="erMonthWeek">
				  				<label class="form-check-label">
				    	       		매월-특정 주, 요일
				  		    	</label>
				  		    	
				  		    	<div class="d-flex">
								<select class="form-select" aria-label="Default select example">
								  <option>특정 주</option>
								  <option value="1">첫째 주</option>
								  <option value="2">둘째 주</option>
								  <option value="3">셋째 주</option>
								  <option value="4">넷째 주</option>
								</select>
								
								<select class="form-select" aria-label="Default select example">
								  <option>요일</option>
								  <option value="1">월요일</option>
								  <option value="2">화요일</option>
								  <option value="3">수요일</option>
								  <option value="4">목요일</option>
								  <option value="5">금요일</option>
								  <option value="6">토요일</option>
								  <option value="7">일요일</option>
								</select>
								</div>
								
																		  		    	
							</div>							
				
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat" id="erMonthDate">
				  				<label class="form-check-label">
				    	       			매월-특정 날짜
				  		    	</label>
								<div class="d-flex">
								    <input class="form-control" id="monthDay" placeholder="1~28 사이 숫자만 입력">
								    <label for="monthDay" class="col-sm-4 col-form-label">일</label>
							    </div>
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat" id="erMonthPeriod">
				  				<label class="form-check-label">
				    	       			매월-특정 기간
				  		    	</label>

									<div class="middle my-2">							
									    <div class="slider">
									      <div class="progress"></div>
									    </div>
									  <div class="range-input">
									    <input type="range" class="input-left"  min="1" max="28" value="8" step="1" list="tickmarks"/>
									    <input type="range" class="input-right" min="1" max="28" value="21" step="1" />
									  </div>
									</div>
					  		    	<div class="day-input d-flex">
									  <div class="field">
									    <input class="input-min form-control" value="8">
									    <span class="col-sm-4">일 에서</span>
									  </div>
									  <div class="field">
									    <input class="input-max form-control" value="21">
									    <span class="col-sm-4">일 까지</span>
									  </div>
									</div>
							</div>

							<div class="form-check mb-2">
								<input class="form-check-input" type="radio" name="repeat" id="erMonthNum">
				  				<label class="form-check-label">
				    	       			기간 내-횟수
				  		    	</label>
								<div class="d-flex">
								    <input class="form-control" id="monthNum" placeholder="숫자만 입력">
								    <label for="monthNum" class="col-sm-4 col-form-label">회</label>
							    </div>
							</div>
											
						</div>
			        	
			        	<div class="mb-5">
							
						</div>
	    			
	    				<div>
			        		<input type="submit" class="btn btn-primary col-auto plan-enroll" 
			        		style="background-color: #DB6551; border: 0px;" value="목표 등록하기" />
			        	</div>				
	    		
	  				</div>
	    		  	</div>	
			</div>
	  		</div>
     	</div>
     	
		<div class="d-flex my-2">
	  		<div style="width:120px;">
	  		</div>
	  		
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
					    onclick="location.href=''" 
					    value="참여하기">
	    			</h7>
	  			</div>	  			
	  		</div>	
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
					    onclick="location.href=''" 
					    value="참여하기">
	    			</h7>
	  			</div>	  			
	  		</div>		
  		</div>
		<div class="d-flex my-5">
	  		<div style="width:120px;">
	  		</div>
	  		
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
					    onclick="location.href=''" 
					    value="참여하기">
	    			</h7>
	  			</div>	  			
	  		</div>	
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
					    onclick="location.href=''" 
					    value="참여하기">
	    			</h7>
	  			</div>	  			
	  		</div>		
  		</div>  		
  		<div class="d-flex my-5">
	  		<div style="width:120px;">
	  		</div>
	  		
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
					    onclick="location.href=''" 
					    value="참여하기">
	    			</h7>
	  			</div>	  			
	  		</div>	
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
					    onclick="location.href=''" 
					    value="참여하기">
	    			</h7>
	  			</div>	  			
	  		</div>		
  		</div>
  	  	<div class="d-flex my-5">
	  		<div style="width:120px;">
	  		</div>
	  		
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
					    onclick="location.href=''" 
					    value="참여하기">
	    			</h7>
	  			</div>	  			
	  		</div>	
	  		<div class="card  d-flex flex-row mb-3" style="width: 600px; height:100px; border:0px;">	  			
	  			<img src="Potato.jpeg" style="width:100px; height:100px; border:0px" 
	  				class="card-img rounded-0 mx-1 my-auto">
	  			<div class="card-body justify-content-around my-auto">
	  				<p class="card-title" style="font-size:14px;">목표 분야</p>
	   				<p class="card-title font-bol" style="font-size: 16px;">아침에 산책하기(매일 30분)</p>
	    			<h7 class="card-title d-flex" style="font-size:14px; color:#707070;">
	    				<div>시작 날짜/진행 기간</div>&emsp;&emsp;
	    				<div>ㅇㅇ명 참여 중</div>
						
	    				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    				<input type="button" class="btn-primary rounded-1" 
					    style="border:0px; background-color:#DB6551; color:#ffffff; width:absolute; height:absolute;"
					    onclick="location.href=''" 
					    value="참여하기">
	    			</h7>
	  			</div>	  			
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