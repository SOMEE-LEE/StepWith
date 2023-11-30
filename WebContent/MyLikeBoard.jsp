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
	<!-- header.html이 삽입될 위치 -->
	 <div>
	 	<jsp:include page="HeaderLoginLogout.jsp"/>
	 </div>
    
    <!-- main content가 삽입될 위치 -->
  	<div id = "content" style="padding:30px; ">
	  	<div class="d-flex mb-5">
	  		<div style="width:135px;">
	  		</div>
	  		<div class="font-bol" style="font-size:24px;">
	  			총 00개
	  		</div>
	  	</div>
	  	
	  	<hr style="width:1195px;" class="mx-auto my-2"/>
	  	<div class="d-flex my-2">
	  		<div style="width:135px;">
	  		</div>
	  		<div class="my-auto text-hover" onclick="location.href='UserBoardDetail.jsp'" style="cursor:pointer;">
				<div class="card-text" style="font-size:14px;">목표 분류 : 최상위목표 이름</div>
				<div class="card-title font-bol my-2" style="font-size: 16px;">[목표 분야]투두리스트(게시물 제목)</div>
				<div class="card-text" style="font-size:14px; color:#999797;">작성자 칭호 작성자&emsp;게시물 올린 시간&emsp;조회 0&emsp;좋아요 0</div>
			</div>
			<div style="width:800px; height:100px;">
			</div>
			<button type="button" class="btn-close my-auto" aria-label="Close"></button>
	  	</div>
	  	<hr style="width:1195px;" class="mx-auto my-2"/>
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