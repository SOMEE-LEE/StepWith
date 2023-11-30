package middown;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import middown.MidDownDTO;

public class MidDownDAO {
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
		
		// 검색 조건에 맞는 중간목표의 개수를 반환합니다.
	    public int selectCount(Map<String, Object> map) {
	        int totalCount = 0; // 결과를 담을 변수
	        
	        // 게시물 수를 얻어오는 쿼리문 작성
	        String query = "SELECT COUNT(*) FROM middleDown ";
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
	    
	    // 중간목표 목록을 반환합니다.
	    public List<MidDownDTO> selectList(Map<String, Object> map) { 
	        List<MidDownDTO> bbs = new Vector<MidDownDTO>();  // 결과(게시물 목록)를 담을 변수

	        String query = "SELECT * FROM middleDown "; 
	        

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
	                MidDownDTO dto = new MidDownDTO(); 

	                dto.setGoalId(rs.getString("goalId"));           
	                dto.setMidDownId(rs.getString("midDownId"));          // 일련번호
					dto.setMiddleGoal(rs.getString("middleGoal"));
					dto.setDownGoal(rs.getString("downGoal"));
					dto.setStartNum(rs.getString("startNum"));
					dto.setGoalNum(rs.getString("goalNum"));
					dto.setGoalUnit(rs.getString("goalUnit"));
					dto.setMidDate(rs.getString("midDate"));
	                dto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간

	                bbs.add(dto);  // 결과 목록에 저장
	            }
	        } 
	        catch (Exception e) {
	            System.out.println("세부 목표 조회 중 예외 발생");
	            e.printStackTrace();
	        }

	        return bbs;
	    }
	    
	    // 지정한 목표를 찾아 중간목표를 반환합니다.
	    public MidDownDTO selectView(String midDownId) { 
	        MidDownDTO dto = new MidDownDTO();  // 결과(세부목표 목록)를 담을 변수
	        
	        String query = "select md.* "
	        		+ "from middleDown md inner join userGoal u "
	        		+ "on u.goalId=md.goalId where md.midDownId=?";

	        try {
	        	// 쿼리 실행        	
	        	// MySQL 드라이버 로드
	          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
	            String dbId = "somee"; // 설정된 id
	            String dbPass = "dream970307!"; // 설정된 password
	            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	        	Class.forName("com.mysql.jdbc.Driver"); 
	        	
	        	psmt = conn.prepareStatement(query);
	            psmt.setString(1, midDownId); // 인파라미터를 일련번호로 설정 ❺
	            rs = psmt.executeQuery(); // 쿼리 실행 ❻
	            
	           if (rs.next()) {  // 결과 처리
	                dto.setGoalId(rs.getString("goalId"));           
	                dto.setMidDownId(rs.getString(2));          // 일련번호
					dto.setMiddleGoal(rs.getString("middleGoal"));    
					dto.setDownGoal(rs.getString("downGoal"));
					dto.setStartNum(rs.getString("startNum"));
					dto.setGoalNum(rs.getString("goalNum"));
					dto.setGoalUnit(rs.getString("goalUnit"));
					dto.setMidDate(rs.getString("midDate"));
	                dto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간
	               
	            }
	        } 
	        catch (Exception e) {
	            System.out.println("중간목표 상세보기 중 예외 발생");
	            e.printStackTrace();
	        }

	        return dto;
	    }
	    
	    // 세부계획 데이터를 받아 DB에 추가합니다. 
	    public int insertWrite(MidDownDTO dto) {
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
	            String query = "INSERT INTO middleDown ( "
	                         + " goalId, middleGoal, downGoal, startNum, goalNum, goalUnit, midDate, createdAt) "
	                         + " VALUES ( "
	                         + "  ?, ?, ?, ?, ?, ?, ?, ?)";  

	            psmt = conn.prepareStatement(query);  // 동적 쿼리
				psmt.setString(1, dto.getGoalId()); 
				psmt.setString(2, dto.getMiddleGoal()); 
				psmt.setString(3, dto.getDownGoal());
	            psmt.setString(4, dto.getStartNum()); 
	            psmt.setString(5, dto.getGoalNum());
	            psmt.setString(6, dto.getGoalUnit());
	            psmt.setString(7, dto.getMidDate());
	            psmt.setTimestamp(8, dto.getCreatedAt());

	            /*	private String goalId;
	            	private String togetherId;*/
	            
	            result = psmt.executeUpdate(); 
	            System.out.println("중간목표 입력 성공");
	        }
	        catch (Exception e) {
	            System.out.println("중간목표 입력 중 예외 발생");
	            e.printStackTrace();
	        }
	        
	        return result;
	    }
	    
	    // 지정한 중간목표를 삭제합니다.
	    public int deletePost(MidDownDTO dto) { 
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
	            String query = "DELETE FROM middle WHERE goalId=?"; 

	            // 쿼리문 완성
	            psmt = conn.prepareStatement(query); 
	            psmt.setString(1, dto.getGoalId()); 

	            // 쿼리문 실행
	            result = psmt.executeUpdate(); 
	        } 
	        catch (Exception e) {
	            System.out.println("중간목표 삭제 중 예외 발생");
	            e.printStackTrace();
	        }
	        
	        return result; // 결과 반환
	    }
}
