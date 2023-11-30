<%@ page import="memberbean.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="db.RDSConnect"%>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

//수정 폼으로부터 세션 아이디, Pw, pn 얻기
String usermakeId = session.getAttribute("usermakeId").toString();// 세션 로그인 아이디 받기 
String userPw = request.getParameter("userPw"); 
String phoneNumber = request.getParameter("phoneNumber");

//DTO에 저장
MemberDTO dto = new MemberDTO();
dto.setUsermakeId(usermakeId);
dto.setUserPw(userPw);
dto.setPhoneNumber(phoneNumber);

MemberDAO dao = new MemberDAO();
/* boolean getMemberDTO = dao.getMemberDTO(dto); */

int affected = dao.updateEdit(dto);
// MemberDAO 클래스의 updateEdit() 메서드 호출해서
  // 회원 정보 수정 작업 수행
  // 파라미터 : MemberDTO 객체, isChangePass(패스워드 변경여부)
  // 리턴타입 : int
  
if(affected == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('개인정보 수정 성공')");
	script.println("location.href='MyInfoEdit.jsp'");
	script.println("</script>");
	System.out.println(affected);
}else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('개인정보 수정에 실패했습니다. 다시 시도해주세요.')");
	script.println("history.back()");
	script.println("</script>");   
	System.out.println(affected);
}


%>



