<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="stroke.StrokeDAO"%>
<%@ page import="stroke.StrokeDTO"%>
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

// DAO를 생성해 DB에 연결
StrokeDAO sdao = new StrokeDAO();

//사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>(); 
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
/* int totalCount = sdao.selectCount(param);  // 게시물 수 확인 */
int idCount = sdao.idCount(usermakeId);
System.out.println(idCount + "=id카운트");
List<StrokeDTO> strokeLists = sdao.selectList(param);  // 게시물 목록 받기
List<StrokeDTO> strokeListsUserId= sdao.getStrokeDTO(usermakeId);

%>
	

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
                 href="Main.jsp">투두리스트 보기</a>
              </li>
              <li class="nav-item navWid">
                <a class="nav-link black" 
                  href="UserGoal.jsp">혼자하는 목표</a>
              </li>
              <!-- <li class="nav-item navWid">
                <a class="nav-link black" href="TogetherGoal.jsp">함께하는 목표</a>
              </li> -->
              <li class="nav-item navWid">
                <a class="nav-link black" href="UserStroke.jsp" aria-current="page" 
                style=" background-color:#DB6551; font-weight: bold;  color: #ffffff;">나를 다독이기</a>
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
  		<div class="d-flex mb-3">
	   		<div class="mx-2" style="width:225px;">
	   		</div>
	   		<button type="button" data-bs-toggle="collapse" data-bs-target=".stroke" aria-expanded="true"
				class="btn-primary rounded-2"
		    	aria-controls="stroke" style="border:0px; background-color:#DB6551; color:#ffffff; width:auto; height:absolute;">
		    	+새로운 다독임 작성
		    </button>
	  	</div>
	  	<div class="d-flex mb-5">
	  	<div class="d-flex">
		   	<div class="mx-2" style="width:225px;">
		  	</div>
		  	<form action="UserStrokePro.jsp" method="post">
		  	<div class="stroke collapse.show">
	  		<div class="card card-body">
	    		  	<div class="plan-enroll">
	    		  		<h2 style="text-align:center; font-size: 24px; font-weight: bold;">새로운 다독임</h2>
	    		  		
	    		  		<br/>
	    		  		
	    		  		<div class="mb-4">
						<label class="col-form-label font-bol">다독임 컬러를 선택해주세요</label>
							<div  required>
						  		<input type="radio" name="strokeColor" class="btn-check btn-primary" id="#D8C2BE" 
						  		autocomplete="off" required value="#D8C2BE">
								<label class="btn btnColor" for="#D8C2BE" style="background-color:#D8C2BE;"></label>
								
								<input type="radio" name="strokeColor" class="btn-check btn-primary" id="#CAB2A1" 
								autocomplete="off" value="#CAB2A1">
								<label class="btn btnColor" for="#CAB2A1" style="background-color:#CAB2A1;"></label>
								
								<input type="radio" name="strokeColor" class="btn-check btn-primary" id="#D9DAB4" 
								autocomplete="off" value="#D9DAB4">
								<label class="btn btnColor" for="#D9DAB4" style="background-color:#D9DAB4;"></label>

								<input type="radio" name="strokeColor" class="btn-check btn-primary" id="#ACCEAD" 
								autocomplete="off" value="#ACCEAD">
								<label class="btn btnColor" for="#ACCEAD" style="background-color:#ACCEAD;"></label>
								
								<input type="radio" name="strokeColor" class="btn-check btn-primary" id="#C7D1DA" 
								autocomplete="off" value="#C7D1DA">
								<label class="btn btnColor" for="#C7D1DA" style="background-color:#C7D1DA;"></label>
								
								<input type="radio" name="strokeColor" class="btn-check btn-primary" id="#C0BFD0" 
								autocomplete="off" value="#C0BFD0">
								<label class="btn btnColor" for="#C0BFD0" style="background-color:#C0BFD0;"></label>
								
								<input type="radio" name="strokeColor" class="btn-check btn-primary" id="#CFB7DB" 
								autocomplete="off" value="#CFB7DB">
								<label class="btn btnColor" for="#CFB7DB" style="background-color:#CFB7DB;"></label>								
	    		  			</div>
	    		  		</div>
	    		  		
	    		  		<div class="mb-4">
							<label class="col-form-label font-bol focus-ring focus-ring-dark">다독일 날짜를 선택해주세요</label>
							<input type="date" name="strokeDate" id="strokeDate" class="form-control" required  max="9999-12-31">
							<script>document.getElementById('strokeDate').value = new Date().toISOString().substring(0, 10);</script>
						</div>
						
						<div class="mb-4">
							<label class="col-form-label font-bol">다독임 문구를 선택해주세요</label>
							
							<div  required>
								<input type="radio" class="btn-check btn-primary my-2" name="strokeMent" id="comment1" autocomplete="off"
								required value="오늘도 목표를 위한 실천을 잘 해냈다. 한 걸음 더 성장했어!">
								<label class="btn my-2" for="comment1" style="font-size:14px; width:410px; 
								background-color:#FDD9D3;">오늘도 목표를 위한 실천을 잘 해냈다. 한 걸음 더 성장했어!</label>
								
								<input type="radio" class="btn-check btn-primary my-2" name="strokeMent" id="comment2" autocomplete="off"
								value="할 일을 다 하지 못했지만 괜찮아! 내일 계획은 느슨하게!">
								<label class="btn my-2" for="comment2" style="font-size:14px; width:410px; 
								background-color:#FDD9D3;">할 일을 다 하지 못했지만 괜찮아! 내일 계획은 느슨하게!</label>
								
								<input type="radio" class="btn-check btn-primary my-2" name="strokeMent" id="comment3" autocomplete="off"
								value="오늘은 잘 쉬었어! 가끔은 재충전할 시간도 필요한 법이야.">
								<label class="btn my-2" for="comment3" style="font-size:14px; width:410px;
								background-color:#FDD9D3;">오늘은 잘 쉬었어! 가끔은 재충전할 시간도 필요한 법이야.</label>
								
								<input type="radio" class="btn-check btn-primary my-2" name="strokeMent" id="comment4" autocomplete="off"
								value="실패하는 일은 없어. 난 하루하루 배우고 성장할 뿐이야.">
								<label class="btn my-2" for="comment4" style="font-size:14px; width:410px; 
								background-color:#FDD9D3;">실패하는 일은 없어. 난 하루하루 배우고 성장할 뿐이야.</label>
								
								<input type="radio" class="btn-check btn-primary my-2" name="strokeMent" id="comment5" autocomplete="off"
								value="규칙적인 휴식은 나의 행복, 건강, 성공에 결정적인 요소야!">
								<label class="btn my-2" for="comment5" style="font-size:14px; width:410px;
								background-color:#FDD9D3;">규칙적인 휴식은 나의 행복, 건강, 성공에 결정적인 요소야!</label>
								
								<input type="radio" class="btn-check btn-primary my-2" name="strokeMent" id="comment6" autocomplete="off"
								value="너무 자책하지 말고, 멋진 일을 하는 내 모습을 상상하자!">
								<label class="btn my-2" for="comment6" style="font-size:14px; width:410px; 
								background-color:#FDD9D3;">너무 자책하지 말고, 멋진 일을 하는 내 모습을 상상하자!</label>
							</div>
						</div>
						<div class="mb-4">
							<label class="col-form-label font-bol focus-ring focus-ring-dark">내가 나에게 더 주고 싶은 다독임(선택사항)</label>
						    <textarea type="text" class="form-control rounded-2" id="strokeMyself" name="strokeMyself" rows="3">
						    </textarea>
						</div>
<!-- 						<div class="mb-4">
							<label class="col-form-label font-bol">공개 여부를 선택해주세요</label>
							
							<div>
							<input type="radio" class="btn-check btn-primary my-2" name="isOpened" id="open" checked>
							<label class="btn my-2" for="open" style="font-size:16px;">공개</label>
							
							<input type="radio" class="btn-check btn-primary my-2" name="isOpened" id="notopen">
							<label class="btn my-2" for="notopen" style="font-size:16px;">비공개</label>
							</div>
						</div>
						 -->
						<input type="submit" class="btn btn-primary col-auto plan-enroll" 
			        		style="background-color: #DB6551; border: 0px;" value="다독임 등록하기" />
				</div>
			</div>
	  		</div>
	  		</form>
     	</div>
  		</div>
  		<div class="mb-5">
			<!-- 게시물 목록 테이블(표처럼) --> 
				<!-- 목록의 내용 --> 
				<%
				if (strokeListsUserId.isEmpty()) {
				    // 게시물이 하나도 없을 때 
				%>
				            <div style="text-align:center;">
				                등록된 다독임이 없습니다.
				            </div>
				<%
				}
				else {
				    // 게시물이 있을 때 
				    int virtualNum = 1;  // 화면상에서의 게시물 번호
				    for (StrokeDTO sdto : strokeListsUserId)
				    {
				        virtualNum = idCount++;  // 전체 게시물 수까지 1씩 증가
				        System.out.println(virtualNum);
				%>
				
						
				
							
			 					<%-- <%= virtualNum %>  <!--게시물 번호--> --%> 
			 				<% if ( virtualNum %2 == 0) { %>
			 				<div class="mx-auto d-flex" style="width:1000px;">
								<div class="card mx-2 my-2" style="background-color: <%= sdto.getStrokeColor() %>">
							  		<div class="card-body" style="width:485px;">
							   			<p class="card-title" style="font-size: 16px;"><%= sdto.getStrokeMent() %></p>
							    		<p class="card-text" style="font-size:14px;"><%= sdto.getStrokeMyself() %></p>
							    		<div class="d-flex">
							    			<p class="card-text" style="font-size:14px; color:#707070;">
							    				다독인 날: <%= sdto.getStrokeDate() %>
							    			</p> 
							    			<p class="card-text justify-content-end" style="font-size:14px; color:#707070;">
							    				&emsp;작성일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="<%= sdto.getCreatedAt() %>"/>
							    			</p>
							    		</div>
							  		</div>
								</div>
						<% } else if (virtualNum %2 == 1 || virtualNum == 1 ){ %>
								 <%-- <%= virtualNum %>  <!--게시물 번호-->  --%>
								<div class="card mx-2 my-2" style="background-color: <%= sdto.getStrokeColor() %>">
							  		<div class="card-body" style="width:485px;">
							   			<p class="card-title" style="font-size: 16px;"><%= sdto.getStrokeMent() %></p>
							    		<p class="card-text" style="font-size:14px;"><%= sdto.getStrokeMyself() %></p>
							    		<div class="d-flex">
							    			<p class="card-text" style="font-size:14px; color:#707070;">
							    				다독인 날: <%= sdto.getStrokeDate() %>
							    			</p> 
							    			<p class="card-text justify-content-end" style="font-size:14px; color:#707070;">
							    				&emsp;작성일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="<%= sdto.getCreatedAt() %>"/>
							    			</p>
							    		</div>
							  		</div>
								</div>
							</div>
				<%		}  else if (virtualNum % 2==1 && virtualNum == idCount){ %>
							
							<div class="mx-auto d-flex justify-content-end" style="width:485px;">
								<div class="card mx-2 my-2" style="background-color: <%= sdto.getStrokeColor() %>">
							  		<div class="card-body" style="width:485px;">
							   			<p class="card-title" style="font-size: 16px;"><%= sdto.getStrokeMent() %></p>
							    		<p class="card-text" style="font-size:14px;"><%= sdto.getStrokeMyself() %></p>
							    		<div class="d-flex">
							    			<p class="card-text" style="font-size:14px; color:#707070;">
							    				다독인 날: <%= sdto.getStrokeDate() %>
							    			</p> 
							    			<p class="card-text justify-content-end" style="font-size:14px; color:#707070;">
							    				&emsp;작성일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="<%= sdto.getCreatedAt() %>"/>
							    			</p>
							    		</div>
							  		</div>
								</div>
							</div>
					<%} %>
				<%    }
				}
				%>
				


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