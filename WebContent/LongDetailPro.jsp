<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="usergoal.UserGoalDAO"%>
<%@ page import="usergoal.UserGoalDTO"%>
<%@ page import="middown.MidDownDTO" %>
<%@ page import="middown.MidDownDAO" %>
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
String usermakeId = session.getAttribute("usermakeId").toString();// 세션 로그인 아이디 받기 
String goalId = request.getParameter("goalId");
String middleGoal = request.getParameter("middleGoal3");
String downGoal = request.getParameter("downGoal3");
String startNum = request.getParameter("startNum3");
String goalNum = request.getParameter("goalNum3");
String goalUnit = request.getParameter("goalUnit3");
String midDate = request.getParameter("midDate3");

System.out.println(goalId);
System.out.println(middleGoal);
System.out.println(downGoal);
System.out.println(startNum);
System.out.println(goalNum);
System.out.println(goalUnit);
System.out.println(midDate);

// 폼값을 DTO 객체에 저장
MidDownDTO dto = new MidDownDTO();
dto.setGoalId(goalId);
dto.setMiddleGoal(middleGoal);
dto.setDownGoal(downGoal);
dto.setStartNum(startNum);
dto.setGoalNum(goalNum);
dto.setGoalUnit(goalUnit);
dto.setMidDate(midDate);
dto.setCreatedAt(new Timestamp(System.currentTimeMillis()));

// DAO 객체를 통해 DB에 DTO 저장 (dao)
MidDownDAO dao = new MidDownDAO();
int iResult = dao.insertWrite(dto);
 
// 성공 or 실패? 
if (iResult == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('중간하위목표 추가 성공')");

	script.println("location.href='UserGoal.jsp'");
/* 	script.println("history.back()"); */
	script.println("</script>");
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('중간하위목표 추가 실패')");
	script.println("</script>");
}
%>
<input type="hidden" name="goalId" value="<%= dto.getGoalId() %>" />
</body>
</html>