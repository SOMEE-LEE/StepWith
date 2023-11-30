<%@ page import="memberbean.MemberDTO"%>
<%@ page import="membership.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 확인</title>
</head>
<body>
<h2>닉네임 중복체크</h2>
<%//1. 한글처리 & 받아온 파라미터 변수화
request.setCharacterEncoding("UTF-8");
String userNickname = request.getParameter("userNickname");

//2. MemberDAO객체생성 -> 전달받은 정보 모두 저장
MemberDAO mdao = new MemberDAO();

//3. 닉네임체크 메서드
int result = mdao.joinNicknameCheck(userNickname);
if (result == 1){
	out.print("사용가능한 닉네임입니다");
	//5. 아이디사용하기버튼추가 => 동기방식사용 but 요즘은 비동기방식을 더 많이사용한다
	%>
	<!--  <input type="button" value="아이디 사용하기" onclick="result();"> -->
	<%
	
}else if(result == 0){
	out.print("중복된 닉네임입니다");
}else{
	out.print("에러 발생!!!(-1)"); 
}

%>
<!-- 4.팝업창구현  -->
<fieldset>
	<!-- <form action="" method="post">
	action속성에 값이 없으면 기본적으로 자기자신을 불러오지만 중복확인 버튼을 클릭했을때 변경되지않는다.-->	
	<form action="joinNicknameCheck.jsp" method="post" name="wfr">
		ID : <input type="text" name="user_nickname" value="<%=userNickname%>">
<!-- 		<input type="submit" value="중복 확인"> -->	 
	</form>
</fieldset>


</body>
</html>