package membership;

import java.sql.DriverManager;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import memberbean.MemberDTO;



public class MemberDAO {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
	public Connection conn;
    public Statement stmt;  
    public PreparedStatement psmt;  
    public ResultSet rs;
	
    public void RDSConnect(String driver, String jdbcUrl, String dbId, String dbPass) {
    	  try{
    		 // MySQL 드라이버 로드
     		 Class.forName(driver); 
    		 
    		 // DB에 연결
    		 conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
    		 
    		 System.out.println("RDS DB 연결 성공");
    		 
    	  }
    	  catch(Exception e){ 
    		 e.printStackTrace();
    	  }
    }

    
    // 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.(로그인메소드)
    public MemberDTO getMemberDTO(String usermakeId, String userPw) {
        MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
        String query = "SELECT * FROM user WHERE usermakeId=? AND userPw=?";  // 쿼리문 템플릿

        try {
            // 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            psmt = conn.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, usermakeId);    // 쿼리문의 첫 번째 인파라미터에 값 설정
            psmt.setString(2, userPw);  // 쿼리문의 두 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            // 결과 처리
            if (rs.next()) {
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				/* dto.setUserId(rs.getString("user_id")); */
                dto.setUsermakeId(rs.getString("usermakeId"));
                dto.setUserPw(rs.getString("userPw"));
                dto.setUserNickname(rs.getString("userNickname"));
                dto.setPhoneNumber(rs.getString("phoneNumber"));
				/* dto.setProImg(rs.getString("pro_img")); */
				/*
				 * dto.setGender(rs.getString("gender")); dto.setBirth(rs.getDate("birth"));
				 * dto.setJob(rs.getString("job"));
				 */
				/*
				 * dto.setFavoriteField(rs.getString("favorite_field"));
				 * dto.setTermsOfUseAgree(rs.getString("terms_of_use_agree"));
				 * dto.setPrivacyAgree(rs.getString("privacy_agree"));
				 * dto.setPrivacyAgreeChoice(rs.getString("privacy_agree_choice"));
				 * dto.setBenefitsSMSAgree(rs.getString("benefits_SMS_agree"));
				 */
                dto.setCreatedAt(rs.getTimestamp("createdAt"));
				/* dto.setUpdatedAt(rs.getTimestamp("updated_at")); */
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return dto;  // DTO 객체 반환
    }
    
    //회원가입메서드
    public int insertMember(MemberDTO dto) {
    	String query = "INSERT INTO user(usermakeId, userPw, userNickname, phoneNumber, createdAt) "
    			+ "VALUES (?, ?, ?, ?, ?)";  // 쿼리문 템플릿
        try {
            // 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            psmt = conn.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, dto.getUsermakeId());
            psmt.setString(2, dto.getUserPw());
            psmt.setString(3, dto.getUserNickname());
            psmt.setString(4, dto.getPhoneNumber());
			psmt.setTimestamp(5, dto.getCreatedAt()); 
    		
			psmt.executeUpdate();
			System.out.println("회원가입성공");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("회원가입성공");
			e.printStackTrace();

		}
		return -1; // 데이터베이스 오류
    }//insertMember메서드닫음
    
  //아이디중복체크 메서드
    public int joinIdCheck(String usermakeId){
    	int result = -1;
		String query = "select usermakeId from user where usermakeId=?";
    	try {
    		//1. DB연결 - MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
    		//2. sql 구문 & psmt생성
            psmt = conn.prepareStatement(query);   // 동적 쿼리문 준비
            psmt.setString(1, usermakeId);    // 쿼리문에 값 설정

    		//3. 실행 -> select -> rs저장
    		rs = psmt.executeQuery();

    		//4. 데이터처리
    		if(rs.next()){	
    			result = 0;
    		}else{
    			result = 1;
    		}

    		System.out.println("아이디 중복체크결과 : "+result);
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	return result;
    }//joinIdCheck 메서드닫음

  //닉네임 중복체크 메서드
    public int joinNicknameCheck(String userNickname){
    	int result = -1;
		String query = "select userNickname from user where userNickname=?";
    	try {
    		//1. DB연결 - MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
    		//2. sql 구문 & psmt생성
            psmt = conn.prepareStatement(query);   // 동적 쿼리문 준비
            psmt.setString(1, userNickname);    // 쿼리문에 값 설정

    		//3. 실행 -> select -> rs저장
    		rs = psmt.executeQuery();

    		//4. 데이터처리
    		if(rs.next()){	
    			result = 0;
    		}else{
    			result = 1;
    		}

    		System.out.println("닉네임 중복체크결과 : "+result);
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	return result;
    }//joinNicknameCheck 메서드닫음
    
  //개인정보 수정 메서드
    public int updateEdit(MemberDTO dto) { 
        int result = 0;
        
        try {
       		//1. DB연결 - MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            // 쿼리문 템플릿 
            String query = "UPDATE user SET "
                         + " userPw=?, phoneNumber=? "
                         + " WHERE usermakeId=?";
            
            // 쿼리문 완성
            psmt = conn.prepareStatement(query);
            psmt.setString(1, dto.getUserPw());
            psmt.setString(2, dto.getPhoneNumber());
            psmt.setString(3, dto.getUsermakeId());
            
            // 쿼리문 실행 
            result = psmt.executeUpdate();
        } 
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환 
    }//myInfoEdit 메서드닫음
    
    //아이디로 회원정보조회(가입시간 제외)
    public MemberDTO selectMember(String usermakeId) {
        MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
        String query = "SELECT usermakeId, userPw, userNickname, phoneNumber FROM user WHERE usermakeId=?";  // 쿼리문 템플릿

        try {
            // 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            psmt = conn.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, usermakeId);    // 쿼리문의 첫 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            // 결과 처리
            if (rs.next()) {
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				/* dto.setUserId(rs.getString("user_id")); */
                dto.setUsermakeId(rs.getString("usermakeId"));
                dto.setUserPw(rs.getString("userPw"));
                dto.setUserNickname(rs.getString("userNickname"));
                dto.setPhoneNumber(rs.getString("phoneNumber"));
				/* dto.setProImg(rs.getString("pro_img")); */
				/*
				 * dto.setGender(rs.getString("gender")); dto.setBirth(rs.getDate("birth"));
				 * dto.setJob(rs.getString("job"));
				 */
				/*
				 * dto.setFavoriteField(rs.getString("favorite_field"));
				 * dto.setTermsOfUseAgree(rs.getString("terms_of_use_agree"));
				 * dto.setPrivacyAgree(rs.getString("privacy_agree"));
				 * dto.setPrivacyAgreeChoice(rs.getString("privacy_agree_choice"));
				 * dto.setBenefitsSMSAgree(rs.getString("benefits_SMS_agree"));
				 */
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return dto;  // DTO 객체 반환
    }
    
    public int deleteMember(MemberDTO dto) { 
        int result = 0;

        try {
        	// 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            // 쿼리문 템플릿
            String query = "DELETE FROM user WHERE usermakeId=?"; 

            // 쿼리문 완성
            psmt = conn.prepareStatement(query); 
            psmt.setString(1, dto.getUsermakeId()); 

            // 쿼리문 실행
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("회원 탈퇴 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환
    }
}

    
