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
    <!-- Bootstrap 적용 -->	
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
  		<p class="font-no" style="color: #555555;">혼자하는 목표를 세우거나 함께하는 목표에 참여하면, 메인화면에 오늘의 할 일이 자동으로 보여요!</p>
	</div>
	<br/>
  	
  	<hr/>
  	
  	<br/>
  	
  	<div class="d-flex">
  		<div style="width:120px;">
  		</div>
  		<p class="font-no font-bol">월간 달성률 00%&nbsp;&nbsp;&nbsp;&nbsp;주간 달성률 00%&nbsp;&nbsp;&nbsp;&nbsp;오늘의 달성률 00%</p>
	</div>

  	<br/>
  	
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
	  				<th scope="col">진행 기간</th>
	  			</tr>
	  		</thead>
	  		<tbody>
	  			<tr>
	 	 			<td>습관화 목표</td>
	 	 			<td>걷기운동하기(30분)</td>
	 	 			<td>폐활량 늘리기</td>
	 	 			<td>진행 중</td>
	 	 			<td>1번째 실천 중!</td>
	 	 			<td>∞</td>
	 	 		</tr>
	 	 		<tr>
	 	 			<td>단기 목표</td>
	 	 			<td>단어 외우기(50개)</td>
	 	 			<td>토익 900점 맞기</td>
	 	 			<td>완료</td>
	 	 			<td>20번째 실천 중!</td>
	 	 			<td>2023.12.10</td>
	 	 		</tr>
	 	 		<tr>
	 	 			<td>함께하는 목표</td>
	 	 			<td>하루 명상하기(10분)</td>
	 	 			<td>성공적인 수험생활 보내기</td>
	 	 			<td>시작 안 함</td>
	 	 			<td>실천한 기록이 없어요</td>
	 	 			<td>2024.10.28</td>
	 	 		</tr>
	 	 		<tr>
	 	 			<td>단기 목표</td>
	 	 			<td>학교 강의 복습(30분)</td>
	 	 			<td>기말 전 과목 A등급 맞기</td>
	 	 			<td>시작 안 함</td>
	 	 			<td>실천한 기록이 없어요</td>
	 	 			<td>2023.12.01</td>
	 	 		</tr>
	 	 		<tr>

	 	 			<td>장기 목표</td>
	 	 			<td>시장조사 & 추측고객 설정</td>
	 	 			<td>서비스 기획 및 개발</td>
	 	 			<td>휴식</td>
	 	 			<td>오늘은 쉬는 날!</td>
	 	 			<td>2024.12.31</td>
	 	 		</tr>
	  		</tbody>
		</table>
	</div>
	
	<br/><br/>
	<hr/>
  	<br/>
  	
  	<div style="width:1200px; height:360px" class="d-flex mx-auto">
  		<div class="card mx-2" style="width:280px; height:350px; border:0px;">
  			<img src="" style="width:270px; height:270px;" class="card-img-top rounded-2" >
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">UI/UX 디자인하기(3페이지)</p>
    			<p class="card-text" style="font-size:14px;">감자줄기 - 장기 목표: 졸업작품 끝내기</p>
    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;&emsp;5초 전</p>
  			</div>
		</div>
  		<div class="card mx-2" style="width:280px; height:350px; border:0px;">
  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2" >
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;&emsp;게시물올린 때</p>
  			</div>
		</div>
  		<div class="card mx-2" style="width:280px; height:350px; border:0px;">
  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2" >
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
  			</div>
		</div>
  		<div class="card mx-2" style="width:280px; height:350px; border:0px;">
  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2" >
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
  			</div>
		</div>
  	</div>
  	
  	<div style="width:1200px; height:360px" class="d-flex mx-auto">
  		<div class="card mx-2" style="width:280px; height:350px; border:0px;">
  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2" >
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
  			</div>
		</div>
  		<div class="card mx-2" style="width:280px; height:350px; border:0px;">
  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2" >
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
  			</div>
		</div>
  		<div class="card mx-2" style="width:280px; height:350px; border:0px;">
  			<img src="..." style="width:270px; height:270px;" class="card-img-top rounded-2" >
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">게시물 제목(=)-[목표 분야]투두리스트)</p>
    			<p class="card-text" style="font-size:14px;">닉네임 - 목표 분류: 최상위목표</p>
    			<p class="card-text" style="font-size:14px; color:#999797;">조회 0&ensp;좋아요 0&ensp;댓글 0&emsp;게시물올린 때</p>
  			</div>
		</div>
  		<div class="card mx-2" style="width:280px; height:350px; border:0px;">
  			<img src="Potato.jpeg" style="width:270px; height:270px;" class="card-img-top rounded-2">
  			
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
    value="다른 사람들 목표 전체보기">
    </div>
    </div>
    
 <!--    <br/><br/>
	<hr/>
  	<br/> -->
  	
<!--   	<div style="width:1190px; height:220px" class="d-flex mx-auto">
  		<div class="card mx-2" style="width:130px; height:220px; border:0px;">
  			<img src="Potato.jpeg" style="width:120px; height:120px;" class="card-img rounded-circle">
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">닉네임</p>
    			<p class="card-text" style="font-size:14px;">목표 분야</p>
    			<input type="button" class="btn-primary rounded-1" 
    			style="border:0px; background-color:#DB6551; color:#ffffff;" value="+팔로우">
  			</div>
		</div>
  		<div class="card mx-2" style="width:130px; height:220px; border:0px;">
  			<img src="..." style="width:120px; height:120px;" class="card-img-top rounded-circle">
  			
  			<div class="card-body">
   				<p class="card-title font-bol " style="font-size: 16px;">닉네임</p>
    			<p class="card-text" style="font-size:14px;">목표 분야</p>
    			<input type="button" class="btn-primary rounded-1" 
    			style="border:0px; background-color:#DB6551; color:#ffffff;" value="+팔로우">
  			</div>
		</div>		
  		<div class="card mx-2" style="width:130px; height:220px; border:0px;">
  			<img src="..." style="width:135px; height:135px;" class="card-img-top rounded-circle">
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">닉네임</p>
    			<p class="card-text" style="font-size:14px;">목표 분야</p>
    			<input type="button" class="btn-primary rounded-1" 
    			style="border:0px; background-color:#DB6551; color:#ffffff;" value="+팔로우">
  			</div>
		</div>  
  		<div class="card mx-2" style="width:130px; height:220px; border:0px;">
  			<img src="..." style="width:135px; height:135px;" class="card-img-top rounded-circle">
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">닉네임</p>
    			<p class="card-text " style="font-size:14px;">목표 분야</p>
    			<input type="button" class="btn-primary rounded-2" 
    			style="border:0px; background-color:#DB6551; color:#ffffff;" value="+팔로우">
  			</div>
		</div>
  		<div class="card mx-2" style="width:130px; height:220px; border:0px;">
  			<img src="..." style="width:135px; height:135px;" class="card-img-top rounded-circle">
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">닉네임</p>
    			<p class="card-text" style="font-size:14px;">목표 분야</p>
    			<input type="button" class="btn-primary rounded-2" 
    			style="border:0px; background-color:#DB6551; color:#ffffff;" value="+팔로우">
  			</div>
		</div>
  		<div class="card mx-2" style="width:130px; height:220px; border:0px;">
  			<img src="..." style="width:135px; height:135px;" class="card-img-top rounded-circle">
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">닉네임</p>
    			<p class="card-text  mx-auto" style="font-size:14px;">목표 분야</p>
    			<input type="button" class="btn-primary rounded-1" 
    			style="border:0px; background-color:#DB6551; color:#ffffff;" value="+팔로우">
  			</div>
		</div>
  		<div class="card mx-2" style="width:130px; height:220px; border:0px;">
  			<img src="..." style="width:135px; height:135px;" class="card-img-top rounded-circle">
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">닉네임</p>
    			<p class="card-text" style="font-size:14px;">목표 분야</p>
    			<input type="button" class="btn-primary rounded-1" 
    			style="border:0px; background-color:#DB6551; color:#ffffff;" value="+팔로우">
  			</div>
		</div>
  		<div class="card mx-2" style="width:130px; height:220px; border:0px;">
  			<img src="..." style="width:135px; height:135px;" class="card-img-top rounded-circle">
  			
  			<div class="card-body">
   				<p class="card-title font-bol" style="font-size: 16px;">닉네임</p>
    			<p class="card-text" style="font-size:14px;">목표 분야</p>
    			<input type="button" class="btn-primary rounded-1" 
    			style="border:0px; background-color:#DB6551; color:#ffffff;" value="+팔로우">
  			</div>
		</div>
  	</div>
  	
  	 -->
  	
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