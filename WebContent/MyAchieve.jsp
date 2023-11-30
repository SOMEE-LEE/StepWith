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
  		<div class="d-flex">
  			<div style="width:120px;">
	  		</div>
  			<h2 style=" font-size: 24px; font-weight: bold;">나의 업적/칭호(00개 달성)</h2>
  		</div>
  		<br/>
  		
  		<div class="d-flex">
	  		<div style="width:120px;">
	  		</div>
	  		<table class="table table-bordered table-sm font-no w-auto"   
		 style="text-align: center;">
		  	 <thead>  			
			  	 <tr>
	  				<th scope="col" style="background-color: #A03A29; color:#ffffff;">적용중인 칭호</th>			  	 
	  				<th scope="col"  style="background-color: #A03A29; color:#ffffff;">업적/칭호 이름</th>
	  				<th scope="col" style="background-color: #A03A29; color:#ffffff;">달성 방법</th>
	  				<th scope="col" style="background-color: #A03A29; color:#ffffff;">달성 시간</th>
	  			</tr>
		  	 </thead>
		  	 <tbody>
		  	 	<tr>
		  	 		<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use1" autocomplete="off" checked>
						<label class="btn btn-outline-dark rounded-5" for="use1"
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 발을 옮길 준비를 하는</th>
	  				<td scope="col">[로그인] 회원가입 및 첫 로그인</td>
	  				<td scope="col">[달성 시간]</td>	  				
	  			</tr>
		  	 	<tr>
		  	 		<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use2" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use2" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">발을 옮길 준비에 능숙해진</th>
	  				<td scope="col">[로그인] 30일 이상 로그인</td>
	  				<td scope="col">[달성 시간]</td>  				
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use3" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use3" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">발을 옮길 준비가 두렵지 않은</th>
	  				<td scope="col">[로그인] 100일 이상 로그인</td>
	  				<td scope="col">[달성 시간]</td>				
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use4" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use4" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">변함없이, 꿋꿋하게 발을 옮길 준비를 하는</th>
	  				<td scope="col">[로그인] 365일 이상 로그인</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use5" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use5" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">첫 걸음을 시작한</th>
	  				<td scope="col">[투두리스트 실천] 처음으로 오늘의 투두리스트 1개 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use6" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use6" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">보폭이 작아도 걸음을 계속하는</th>
	  				<td scope="col">[투두리스트 실천] 오늘의 투두리스트 1개 실천 30회 이상</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use7" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use7" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">작은 보폭으로 꾸준히 길을 찾는</th>
	  				<td scope="col">[투두리스트 실천] 오늘의 투두리스트 1개 실천 100회 이상</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use8" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use8" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">변함없는 작은 보폭으로, 나만의 길을 만드는</th>
	  				<td scope="col">[투두리스트 실천] 오늘의 투두리스트 1개 실천 365회 이상</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use9" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use9" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">보폭을 조금 늘려 걸음을 걷기 시작한</th>
	  				<td scope="col">[투두리스트 실천] 처음으로 오늘의 투두리스트 2개 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use10" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use10" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">보폭이 조금 커져도 꾸준히 걸음을 걷는</th>
	  				<td scope="col">[투두리스트 실천] 오늘의 투두리스트 2개 실천 30회 이상</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use11" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use11" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">조금 커진 보폭으로도 꾸준히 길을 찾는</th>
	  				<td scope="col">[투두리스트 실천] 오늘의 투두리스트 2개 실천 100회 이상</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use12" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use12" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">커진 보폭으로, 변함없이 나만의 길을 만드는</th>
	  				<td scope="col">[투두리스트 실천] 오늘의 투두리스트 2개 실천 365회 이상</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use13" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use13" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 충동을 다스리기 시작한</th>
	  				<td scope="col">[습관화 목표] 처음으로 습관화 목표 1번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use14" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use14" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">충동을 꾸준하게 다스리려 하는</th>
	  				<td scope="col">[습관화 목표] 습관화 목표 30번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use15" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use15" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">충동을 다스리며 멋진 내 모습을 그리는</th>
	  				<td scope="col">[습관화 목표] 습관화 목표 100번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use16" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use16" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">변함없이 충동을 다스려, 멋진 내가 되어가는</th>
	  				<td scope="col">[습관화 목표] 습관화 목표 365번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use17" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use17" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 단거리 달리기를 시작한</th>
	  				<td scope="col">[단기 목표] 처음으로 단기 목표 1번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
				<tr>
					<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use18" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use18" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">꾸준히 단거리 달리기를 지속하려 하는</th>
	  				<td scope="col">[단기 목표] 단기 목표 30번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use19" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use19" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">단거리 달리기를 지속하며 완주에 집중하는</th>
	  				<td scope="col">[단기 목표] 단기 목표 100번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use20" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use20" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">변함없이, 단거리 달리기를 모두 완주해내는</th>
	  				<td scope="col">[단기 목표] 단기 목표 365번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use21" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use21" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 마라톤을 시작한</th>
	  				<td scope="col">[장기 목표] 처음으로 장기 목표 1번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use22" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use22" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">꾸준히 마라톤 트랙을 달리는</th>
	  				<td scope="col">[장기 목표] 장기 목표 30번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use23" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use23" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">마라톤 트랙을 계속 달리며 완주에 집중하는</th>
	  				<td scope="col">[장기 목표] 장기 목표 100번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use24" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use24" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">언제나, 몇 번이라도 마라톤을 완주할</th>
	  				<td scope="col">[장기 목표] 장기 목표 365번 실천</td>
	  				<td scope="col">[달성 시간]</td>			
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use25" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use25" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 함께 걷기 시작한</th>
	  				<td scope="col">[함께하는 목표] 처음으로 함께하는 목표 1번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use26" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use26" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">꾸준히 사람들과 함께 걷는</th>
	  				<td scope="col">[함께하는 목표] 함께하는 목표 30번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use27" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use27" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">사람들과 계속 걸으며 완주에 집중하는</th>
	  				<td scope="col">[함께하는 목표] 함께하는 목표 100번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use28" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use28" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">변함없이, 사람들과 함께 걸을 수 있는</th>
	  				<td scope="col">[함께하는 목표] 함께하는 목표 365번 실천</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use29" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use29" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 나를 격려하기 시작한</th>
	  				<td scope="col">[나를 다독이기] 처음으로 다독임 1번 작성</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use30" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use30" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">꾸준히 나를 격려하고 있는</th>
	  				<td scope="col">[나를 다독이기] 다독임 30번 작성</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use31" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use31" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">나를 격려하며 앞으로 나아가는</th>
	  				<td scope="col">[나를 다독이기] 다독임 100번 작성</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use32" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use32" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">어떤 일이 생기든, 변함없이 마음이 꺾이지 않을</th>
	  				<td scope="col">[나를 다독이기] 다독임 365번 작성</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use33" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use33" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 타인을 응원하기 시작한</th>
	  				<td scope="col">[커뮤니티] 처음으로 게시물에 좋아요 1번 남기기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use34" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use34" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">꾸준히 타인을 응원하며 힘을 얻는</th>
	  				<td scope="col">[커뮤니티] 게시물에 좋아요 30번 남기기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use35" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use35" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">타인을 응원하며 나아갈 힘을 얻는</th>
	  				<td scope="col">[커뮤니티] 게시물에 좋아요 100번 남기기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use36" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use36" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">언제 어디서든, 타인의 성취에 기뻐하는 여유를 가진</th>
	  				<td scope="col">[커뮤니티] 게시물에 좋아요 365번 남기기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use37" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use37" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 새로운 사람을 맞이한</th>
	  				<td scope="col">[팔로잉] 처음으로 새로운 사람 팔로잉하기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use38" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use38" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">꾸준히 새로운 사람을 맞이할 줄 아는</th>
	  				<td scope="col">[팔로잉] 새로운 사람 30명 팔로잉하기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use39" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use39" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">새로운 사람을 만나며 그들을 이해하는</th>
	  				<td scope="col">[팔로잉] 새로운 사람 100명 팔로잉하기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use40" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use40" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">언제나, 타인을 맞이하고 이해하는 넓은 마음을 가진</th>
	  				<td scope="col">[팔로잉] 새로운 사람 365명 팔로잉하기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use41" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use41" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">처음으로 새로운 사람이 찾아온</th>
	  				<td scope="col">[팔로우] 처음으로 새로운 사람 1명에게 팔로우받기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use42" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use42" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">꾸준하게 새로운 사람들이 찾아오는</th>
	  				<td scope="col">[팔로우] 새로운 사람 30명에게 팔로우받기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use43" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use43" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">새로운 사람들이 찾아와서 응원하는</th>
	  				<td scope="col">[팔로우] 새로운 사람 100명에게 팔로우받기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
	  			<tr>
	  				<td scope="col">
	  					<input type="radio" class="btn-check" name="use" id="use44" autocomplete="off">
						<label class="btn btn-outline-dark rounded-5" for="use44" 
						style="font-size: 10px;">&nbsp;</label>
	  				</td>
	  				<th scope="col">언제나, 많은 사람들에게 응원받는 성실한 사람</th>
	  				<td scope="col">[팔로우] 새로운 사람 365명에게 팔로우받기</td>
	  				<td scope="col">[달성 시간]</td>
	  			</tr>
		  	 </tbody>
		  	 
		 </table>
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