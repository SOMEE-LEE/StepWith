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
  	  	 <input type="button" class="btn-primary rounded-2 mx-2"
  	 	style="border:0px; background-color:#DB6551; color:#ffffff; width:auto; height:absolute;" 
  	 	value="<- 전체 목표 달성도 페이지로 돌아가기" onclick="location.href='UserGoal.jsp'"/>
	</div>
	
	<br/>
  	
  	<div class="d-flex">
		<div style="width:120px;">
	  	</div>
  	  	 <input type="button" class="btn-primary rounded-0 mx-2"
  	 	style="border:0px; background-color:#999797; color:#ffffff; width:auto; height:absolute;" 
  	 	value="선택한 목표 복원하기"/>
	  	 <input type="button" class="btn-primary rounded-0 mx-2"
	  	 style="border:0px; background-color:#999797; color:#ffffff; width:auto; height:absolute;" 
	  	 value="선택한 목표 완전히 삭제하기"/>
	</div>
	
	<br/>
	
	<div class="d-flex">
		<div style="width:120px;">
  		</div>
		 <table class="table table-bordered table-sm font-no w-auto"   
		 style="text-align: center;">
		  	 <thead>  			
			  	 <tr>
	  				<th scope="col"  style="background-color: #FFCBC2">
	  					<div class="mx-auto checkbox-blank-line"></div>
	  					<div class="form-check">
  							<input class="form-check-input" type="checkbox" id="flexCheckDefault">
						</div>
					</th>
	  				<th scope="col"  style="background-color: #FFCBC2;">목표 분류</th>
	  				<th scope="col" style="background-color: #FFCBC2;">목표 분야</th>
	  				<th scope="col" style="background-color: #FFCBC2;">최상위 목표</th>
	  				<th scope="col" style="background-color: #FFCBC2;">목표 기간</th>
	  				<th scope="col" style="background-color: #FFCBC2;">목표 수치 및 단위</th>
	  				<th scope="col" style="background-color: #FFCBC2;">반복</th>
	  			</tr>
		  	 </thead>
		  	 <tbody>
		  	 	<tr>
	  				<td scope="col">
	  					<div class="checkbox-blank-line"></div>
	  					<div class="form-check">
  							<input class="form-check-input" type="checkbox" id="flexCheckDefault">
						</div>
					</td>
	  				<td scope="col">목표 분류</td>
	  				<td scope="col">목표 분야</td>
	  				<td scope="col">최상위 목표</td>
	  				<td scope="col">목표 기간</td>
	  				<td scope="col">목표 수치 및 단위</td>
	  				<td scope="col">반복</td>
	  			</tr>
		  	 
		  	 </tbody>
		  	 
		 </table>
		</div>
		 <br/>
		 
<!--		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		    <li class="page-item active"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">4</a></li>
		    <li class="page-item"><a class="page-link" href="#">5</a></li>
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  </ul>
		</nav>-->
	  	
  	
  	</div>

	<!-- footer.html이 삽입될 위치 -->
    <div>
    	<jsp:include page="html/footer.html" />
    </div>
    


</body>
</html>