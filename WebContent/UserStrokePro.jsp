<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="stroke.StrokeDAO"%>
<%@ page import="stroke.StrokeDTO"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

//form으로 전달받은 항목들을 가져온다
String strokeColor = request.getParameter("strokeColor");
String strokeDate = request.getParameter("strokeDate");
String strokeMent = request.getParameter("strokeMent");
String strokeMyself = request.getParameter("strokeMyself");

//폼값을 DTO 객체에 저장
StrokeDTO sdto = new StrokeDTO();
sdto.setUsermakeId(session.getAttribute("usermakeId").toString());
sdto.setStrokeColor(strokeColor);
sdto.setStrokeDate(strokeDate);
sdto.setStrokeMent(strokeMent);
sdto.setStrokeMyself(strokeMyself);
sdto.setCreatedAt(new Timestamp(System.currentTimeMillis()));


//DAO 객체를 통해 DB에 DTO 저장
StrokeDAO sdao = new StrokeDAO();
int iResult = sdao.insertWrite(sdto);


//7. 성공 or 실패? 
if (iResult == 1) {
 response.sendRedirect("UserStroke.jsp");
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('다독임 작성 실패')");
	script.println("</script>");
}



%>


</body>
</html>