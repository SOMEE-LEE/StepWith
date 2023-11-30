<%@ page import="memberbean.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 폼으로부터 받은 아이디와 패스워드
String usermakeId = request.getParameter("usermakeId"); 
String userPw = request.getParameter("userPw");  


// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
MemberDAO dao = new MemberDAO();
MemberDTO memberDTO = dao.getMemberDTO(usermakeId, userPw);

// 로그인 성공 여부에 따른 처리
if (memberDTO.getUsermakeId() != null) {
    // 로그인 성공
    session.setAttribute("usermakeId", memberDTO.getUsermakeId());
    session.setAttribute("userPw", memberDTO.getUserPw());
    session.setAttribute("userNickname", memberDTO.getUserNickname()); 
    session.setAttribute("phoneNumber", memberDTO.getPhoneNumber());
/*     session.setAttribute("Gender", memberDTO.getGender());
    session.setAttribute("Birth", memberDTO.getBirth()); */
/*     session.setAttribute("ProImg", memberDTO.getProImg()); */
/*     session.setAttribute("Job", memberDTO.getJob()); */
/*     session.setAttribute("FavoriteField", memberDTO.getFavoriteField());
    session.setAttribute("TermsOfUseAgree", memberDTO.getTermsOfUseAgree());
    session.setAttribute("PrivacyAgree", memberDTO.getPrivacyAgree());
    session.setAttribute("PrivacyAgreeChoice", memberDTO.getPrivacyAgreeChoice());
    session.setAttribute("BenefitsSMSAgree", memberDTO.getBenefitsSMSAgree()); */
    session.setAttribute("createdAt", memberDTO.getCreatedAt());
 /*    session.setAttribute("UpdatedAt", memberDTO.getUpdatedAt()); */
    response.sendRedirect("Main.jsp");
}
else {
    // 로그인 실패
    request.setAttribute("LoginErrMsg", "로그인 오류입니다."); 
    request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>
