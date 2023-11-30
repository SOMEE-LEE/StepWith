<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="usergoal.UserGoalDAO"%>
<%@ page import="usergoal.UserGoalDTO"%>
<%@ page import = "java.io.PrintWriter" %>
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
request.setCharacterEncoding("utf-8");

//form으로 전달받은 항목들을 가져온다
String usermakeId = session.getAttribute("usermakeId").toString();// 세션 로그인 아이디 받기 
String goalId = request.getParameter("goalId");
String repeatCycle = request.getParameter("repeat33");
String repeatType33 = request.getParameter("repeatType33");
String repeatType = "";

//DTO에 저장
UserGoalDTO gdto = new UserGoalDTO();
gdto.setUsermakeId(usermakeId);
gdto.setGoalId(goalId);
gdto.setRepeatCycle(repeatCycle);

System.out.println(usermakeId);
System.out.println(goalId);
System.out.println(repeatCycle);
System.out.println(repeatType33);

if (repeatType33.equals("횟수")){
	repeatType = "횟수-"+request.getParameter("count33")+"회";
	System.out.println(repeatType);
	gdto.setRepeatType(repeatType);
} else if (repeatType33.equals("요일")){
	String names[] = request.getParameterValues("name33");
	 for(String name1:names){
		// for(변수:배열) 배열에 들어있는 값들을 변수에 대입 반복문이 돌 때마다 값이 변함.
		System.out.println(name1+ " ");
		repeatType=name1+"";
	 }
	 System.out.println(names);
	System.out.println(repeatType);
	gdto.setRepeatType(repeatType);
} else if (repeatType33.equals("특정 주 요일")) {
	repeatType = "특정 주 요일-"+request.getParameter("week33")+" "+request.getParameter("day33");
	gdto.setRepeatType(repeatType);
} else if (repeatType33.equals("특정 날짜")){
	repeatType = "특정 날짜-"+request.getParameter("month33")+"월 "+request.getParameter("date33")+"일";
	gdto.setRepeatType(repeatType);
} else if (repeatType33.equals("특정 기간")){
	repeatType = "특정 기간-"+request.getParameter("left33")+"일 부터 "+request.getParameter("right33")+"일 까지";
	gdto.setRepeatType(repeatType);
	
} 


UserGoalDAO gdao = new UserGoalDAO();

int affected = gdao.updateEdit(gdto);
//UserGoalDAO 클래스의 updateEdit() 메서드 호출해서
// 회원 정보 수정 작업 수행
// 파라미터 : UserGoalDTO
// 리턴타입 : int

if(affected == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('목표 수정 성공')");
	script.println("location.href='UserGoal.jsp'");
	script.println("</script>");
	System.out.println(affected);
}else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('목표 수정에 실패했습니다. 다시 시도해주세요.')");
	script.println("history.back()");
	script.println("</script>");    	
	System.out.println(affected);
}


%>
</body>
</html>