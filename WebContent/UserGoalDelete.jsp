<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="usergoal.UserGoalDAO"%>
<%@ page import="usergoal.UserGoalDTO"%>
<%@ page import="habit.HabitDAO" %>
<%@ page import="habit.HabitDTO" %>
<%@ page import="java.util.List"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

//로그인된 사용자 ID 얻기
String usermakeId = session.getAttribute("usermakeId").toString(); 
String goalId = request.getParameter("goalId");  // 일련번호 얻기 

UserGoalDTO dto = new UserGoalDTO();             // DTO 객체 생성
UserGoalDAO dao = new UserGoalDAO();  // DAO 객체 생성
List<UserGoalDTO> goalListsgoalId= dao.getDTOId(goalId);// 주어진 일련번호에 해당하는 기존 목표 얻기

/* String habitId = request.getParameter("habitId");
HabitDAO hdao = new HabitDAO();
HabitDTO hdto = hdao.selectView(habitId);  // 세부 목표 목록 받기;
 */
/* int delHabit = hdao.deletePost(dto); */
int delResult = 0;

dto.setGoalId(goalId);
delResult = dao.deletePost(dto);  // 삭제!!! 

 // 성공/실패 처리
 if (delResult == 1) { 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('목표 삭제 성공')");
		script.println("location.href='UserGoal.jsp'");
		script.println("</script>");
		System.out.println(delResult);
	}else {	
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('목표 삭제에 실패했습니다. 다시 시도해주세요.')");
		script.println("history.back()");
		script.println("</script>");    	
		System.out.println(delResult);
	}


System.out.println(delResult);
%>
</body>
</html>