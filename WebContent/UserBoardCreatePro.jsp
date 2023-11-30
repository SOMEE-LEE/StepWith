<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String realFolder = config.getServletContext().getRealPath("Uploads");    //저장할 디렉토리
int maxSize = 5 * 1024 * 1024;    //업로드 파일 최대크기 5mg
String encType = "utf-8";    //인코딩 유형

// 1. MultipartRequest 객체 생성
MultipartRequest multi = new MultipartRequest(request, realFolder,
			maxSize, encType);
	
// 2. 새로운 파일명 생성
String fileName = multi.getFilesystemName("photo"); //현재 파일 이름
String ext = fileName.substring(fileName.lastIndexOf("."));    //파일 확장자
String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
String newFileName = now+ext;
	
// 3. 파일명 변경
File oldFile = new File(realFolder + File.separator + fileName);
File newFile = new File(realFolder + File.separator + newFileName);
oldFile.renameTo(newFile);

// 4. form으로 전달받은 나머지 항목들을 가져온다
String userNickname = multi.getParameter("userNickname");
String detail = multi.getParameter("detail");

// 5. 폼값을 DTO 객체에 저장
BoardDTO bdto = new BoardDTO();
bdto.setUserNickname(session.getAttribute("userNickname").toString());
bdto.setPhoto(newFileName);
bdto.setDetail(detail);
bdto.setCreatedAt(new Timestamp(System.currentTimeMillis()));

// 6. DAO 객체를 통해 DB에 DTO 저장 (bdao)
BoardDAO bdao = new BoardDAO();
int iResult = bdao.insertWrite(bdto);


// 7. 성공 or 실패? 
if (iResult == 1) {
    response.sendRedirect("Community.jsp");
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('게시물 작성 실패')");
	script.println("</script>");
}
%>
</body>
</html>