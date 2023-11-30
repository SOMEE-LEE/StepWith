<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="usergoal.UserGoalDAO"%>
<%@ page import="usergoal.UserGoalDTO"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

//form으로 전달받은 항목들을 가져온다
String goalName = request.getParameter("goalName2");
String goalType = "단기 목표";
String startDate = request.getParameter("startDate2");
String endDate = request.getParameter("endDate2");
System.out.println(endDate);

String repeatCycle = request.getParameter("repeat2");
String repeatType2 = request.getParameter("repeatType2");
String repeatType = "";

//폼값을 DTO 객체에 저장
UserGoalDTO gdto = new UserGoalDTO();
gdto.setUsermakeId(session.getAttribute("usermakeId").toString());
gdto.setGoalType(goalType);
gdto.setGoalName(goalName);
gdto.setStartDate(startDate);
gdto.setEndDate(endDate);
gdto.setRepeatCycle(repeatCycle);


System.out.println(goalType);
System.out.println(goalName);
System.out.println(startDate);
System.out.println(repeatType2);


if (repeatType2.equals("횟수")){
	repeatType = "횟수-"+request.getParameter("count2")+"회";
	System.out.println(repeatType);
	gdto.setRepeatType(repeatType);
} else if (repeatType2.equals("요일")){
	String names[] = request.getParameterValues("name2");
	 for(String name1:names){
		// for(변수:배열) 배열에 들어있는 값들을 변수에 대입 반복문이 돌 때마다 값이 변함.
		System.out.println(name1+ " ");
		repeatType=name1+"";
	 }
	 System.out.println(names);
	System.out.println(repeatType);
	gdto.setRepeatType(repeatType);
} else if (repeatType2.equals("특정 주 요일")) {
	repeatType = "특정 주 요일-"+request.getParameter("week2")+" "+request.getParameter("day2");
	gdto.setRepeatType(repeatType);
} else if (repeatType2.equals("특정 날짜")){
	repeatType = "특정 날짜-"+request.getParameter("month2")+"월 "+request.getParameter("date2")+"일";
	gdto.setRepeatType(repeatType);
} else if (repeatType2.equals("특정 기간")){
	repeatType = "특정 기간-"+request.getParameter("left2")+"일 부터 "+request.getParameter("right2")+"일 까지";
	gdto.setRepeatType(repeatType);
	
} 




gdto.setCreatedAt(new Timestamp(System.currentTimeMillis()));


//DAO 객체를 통해 DB에 DTO 저장
UserGoalDAO gdao = new UserGoalDAO();
int iResult = gdao.insertWrite(gdto);


//7. 성공 or 실패? 
if (iResult == 1) {
response.sendRedirect("UserGoal.jsp");
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('목표 등록 실패')");
	script.println("</script>");
}
%>
</body>
</html>