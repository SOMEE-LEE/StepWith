package usergoal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;


public class UserGoalDAO {
	// 명시한 데이터베이스로의 연결이 완료된 DAO 객체를 생성합니다.
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
	
	// 작성글 데이터를 받아 DB에 추가합니다. 
    public int insertWrite(UserGoalDTO gdto) {
        int result = 0;
        
        try {
        	// 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            // INSERT 쿼리문 작성 
            String query = "INSERT INTO userGoal ( "
                         + " usermakeId, goalId, goalType, goalName, startDate, endDate, repeatCycle, repeatType, createdAt) "
                         + " VALUES ( "
                         + "  ?, ?, ?, ?, ?, ?, ?, ?, ?)";  

            psmt = conn.prepareStatement(query);  // 동적 쿼리
			psmt.setString(1, gdto.getUsermakeId()); 
			psmt.setString(2, gdto.getGoalId()); 
            psmt.setString(3, gdto.getGoalType()); 
            psmt.setString(4, gdto.getGoalName());
            psmt.setString(5, gdto.getStartDate());
            psmt.setString(6, gdto.getEndDate());
            psmt.setString(7, gdto.getRepeatCycle());
            psmt.setString(8, gdto.getRepeatType());
            psmt.setTimestamp(9, gdto.getCreatedAt());
            
            result = psmt.executeUpdate(); 
            System.out.println("게시물 입력 성공");
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
	
    
    // 검색 조건에 맞는 목표의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수
        
        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM userGoal";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
        	// 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            stmt = conn.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행
            rs.next();  // 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1);  // 첫 번째 칼럼 값을 가져옴
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount; 
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public List<UserGoalDTO> selectList(Map<String, Object> map) { 
        List<UserGoalDTO> bbs = new Vector<UserGoalDTO>();  // 결과(게시물 목록)를 담을 변수

        String query = "SELECT * FROM userGoal"; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY goalId DESC "; 

        try {
        	// 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            stmt = conn.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
            	UserGoalDTO gdto = new UserGoalDTO(); 
           
                gdto.setUsermakeId(rs.getString("usermakeId"));
                gdto.setGoalId(rs.getString("goalId"));           
                gdto.setGoalType(rs.getString("goalType"));          // 일련번호
				gdto.setGoalName(rs.getString("goalName"));     
				gdto.setStartDate(rs.getString("startDate"));
				gdto.setEndDate(rs.getString("endDate"));
				gdto.setRepeatCycle(rs.getString("repeatCycle"));
				gdto.setRepeatType(rs.getString("repeatType"));
                gdto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간

                bbs.add(gdto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    
    // 목표 아이디와 일치하는 목표 리스트를 반환합니다.
    public List<UserGoalDTO> getDTOId(String goalId) {
        List<UserGoalDTO> bbs = new Vector<UserGoalDTO>();  // 결과(게시물 목록)를 담을 변수
        String query = "SELECT * FROM userGoal WHERE goalId=?";  // 쿼리문 템플릿
        query += " ORDER BY goalId DESC "; 

        try {
            // 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            psmt = conn.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, goalId);    // 쿼리문의 첫 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
            	UserGoalDTO gdto = new UserGoalDTO();
                gdto.setUsermakeId(rs.getString("usermakeId"));
                gdto.setGoalId(rs.getString("goalId"));           
                gdto.setGoalType(rs.getString("goalType"));          // 일련번호
				gdto.setGoalName(rs.getString("goalName"));     
				gdto.setStartDate(rs.getString("startDate"));
				gdto.setEndDate(rs.getString("endDate"));
				gdto.setRepeatCycle(rs.getString("repeatCycle"));
				gdto.setRepeatType(rs.getString("repeatType"));
                gdto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간

                bbs.add(gdto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    
 // 아이디와 일치하는 목표 리스트를 반환합니다.
    public List<UserGoalDTO> getDTOuserId(String usermakeId) {
        List<UserGoalDTO> bbs = new Vector<UserGoalDTO>();  // 결과(게시물 목록)를 담을 변수
        String query = "SELECT * FROM userGoal WHERE usermakeId=?";  // 쿼리문 템플릿
        query += " ORDER BY goalId DESC "; 

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

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
            	UserGoalDTO gdto = new UserGoalDTO();
                gdto.setUsermakeId(rs.getString("usermakeId"));
                gdto.setGoalId(rs.getString("goalId"));           
                gdto.setGoalType(rs.getString("goalType"));          // 일련번호
				gdto.setGoalName(rs.getString("goalName"));     
				gdto.setStartDate(rs.getString("startDate"));
				gdto.setEndDate(rs.getString("endDate"));
				gdto.setRepeatCycle(rs.getString("repeatCycle"));
				gdto.setRepeatType(rs.getString("repeatType"));
                gdto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간

                bbs.add(gdto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    
  //아이디로 목표조회(가입시간 제외)
    public UserGoalDTO selectGoal(String goalId) {
        UserGoalDTO dto = new UserGoalDTO();  // 회원 정보 DTO 객체 생성
        String query = "SELECT * FROM userGoal WHERE goalId=?";  // 쿼리문 템플릿

        try {
            // 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            psmt = conn.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, goalId);    // 쿼리문의 첫 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            // 결과 처리
            if (rs.next()) {
                dto.setUsermakeId(rs.getString("usermakeId"));
                dto.setGoalId(rs.getString("goalId"));
                dto.setGoalType(rs.getString("goalType"));
                dto.setGoalName(rs.getString("goalName"));
                dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setRepeatCycle(rs.getString("repeatCycle"));
				dto.setRepeatType(rs.getString("repeatType"));
                dto.setCreatedAt(rs.getTimestamp("createdAt"));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return dto;  // DTO 객체 반환
    }
    
  //목표 수정 메서드
    public int updateEdit(UserGoalDTO dto) { 
        int result = 0;
        
        try {
       		//1. DB연결 - MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            // 쿼리문 템플릿 
            String query = "UPDATE userGoal SET "
                         + " endDate=?, repeatCycle=?, repeatType=? "
                         + " WHERE goalId=?";
            
            // 쿼리문 완성
            psmt = conn.prepareStatement(query);
            psmt.setString(1, dto.getEndDate());
            psmt.setString(2, dto.getRepeatCycle());
            psmt.setString(3, dto.getRepeatType());
            psmt.setString(4, dto.getGoalId());
            
            // 쿼리문 실행 
            result = psmt.executeUpdate();
        } 
        catch (Exception e) {
            System.out.println("목표 수정 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환 
    }//메서드닫음

    // 지정한 목표를 삭제합니다.
    public int deletePost(UserGoalDTO dto) { 
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
            String query = "DELETE FROM userGoal WHERE goalId=?"; 

            // 쿼리문 완성
            psmt = conn.prepareStatement(query); 
            psmt.setString(1, dto.getGoalId()); 

            // 쿼리문 실행
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("목표 삭제 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환
    }
    
}
