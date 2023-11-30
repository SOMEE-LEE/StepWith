<%@ page import="memberbean.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//1. 한글처리 
request.setCharacterEncoding("UTF-8");

%>

<!-- 회원가입 폼으로부터 전달되는 데이터 입력(저장)) -->
<jsp:useBean id="mb" class="memberbean.MemberDTO" />
<jsp:setProperty property="*" name="mb" /> 
<jsp:setProperty name="mb" property="usermakeId" />
<jsp:setProperty name="mb" property="userPw" />	
<jsp:setProperty name="mb" property="userNickname" /> 
 <jsp:setProperty name="mb" property="phoneNumber" /> 

<%
mb.setCreatedAt(new Timestamp(System.currentTimeMillis()));
%>

<%
// MemberDAO객체생성 -> 전달받은 정보 모두 저장
MemberDAO mdao = new MemberDAO();
/* mdao.insertMember(dto); */

int result = mdao.insertMember(mb);
if (result == -1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입 성공')");
	script.println("location.href='LoginForm.jsp'");
	script.println("</script>");
} else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입 오류입니다')");
	script.println("</script>");
} 


/* //회원가입 성공 여부에 따른 처리
if (dto.getUserId() != null) {
 // 로그인 성공
 session.setAttribute("UsermakeId", dto.getUsermakeId()); 
 session.setAttribute("UserPw", dto.getUserPw());
 session.setAttribute("UserNickname", dto.getUserNickname()); 
 session.setAttribute("PhoneNumber", dto.getPhoneNumber());
 session.setAttribute("CreatedAt", dto.getCreatedAt());
 response.sendRedirect("MainLogin.jsp");
}
else {
 // 로그인 실패
 request.setAttribute("LoginErrMsg", "로그인 오류입니다."); 
 request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
} */

%>


</body>
</html>