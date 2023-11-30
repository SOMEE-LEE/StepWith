<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="usergoal.UserGoalDAO"%>
<%@ page import="usergoal.UserGoalDTO"%>
<%@ page import="habit.HabitDTO" %>
<%@ page import="habit.HabitDAO" %>
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
String todo = request.getParameter("todo11");
String startNum = request.getParameter("startNum11");
String goalNum = request.getParameter("goalNum11");
String goalUnit = request.getParameter("goalUnit11");

System.out.println(goalId);

// 폼값을 DTO 객체에 저장
HabitDTO dto = new HabitDTO();
dto.setGoalId(goalId);
dto.setTodo(todo);
dto.setStartNum(startNum);
dto.setGoalNum(goalNum);
dto.setGoalUnit(goalUnit);
dto.setCreatedAt(new Timestamp(System.currentTimeMillis()));

// DAO 객체를 통해 DB에 DTO 저장 (dao)
HabitDAO dao = new HabitDAO();
int iResult = dao.insertWrite(dto);
 
// 성공 or 실패? 
if (iResult == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('세부목표 추가 성공')");

	script.println("location.href='UserGoal.jsp'");
/* 	script.println("history.back()"); */
	script.println("</script>");
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('세부목표 추가 실패')");
	script.println("</script>");
}
%>
<input type="hidden" name="goalId" value="<%= dto.getGoalId() %>" />
</body>
</html>