package habit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.BoardDTO;
import habit.HabitDTO;
import usergoal.UserGoalDTO;

public class HabitDAO {
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
		
		 // 검색 조건에 맞는 세부계획의 개수를 반환합니다.
	    public int selectCount(Map<String, Object> map) {
	        int totalCount = 0; // 결과(게시물 수)를 담을 변수
	        
	        // 게시물 수를 얻어오는 쿼리문 작성
	        String query = "SELECT COUNT(*) FROM habit ";
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
		
	    // 세부목표 목록을 반환합니다.
	    public List<HabitDTO> selectList(Map<String, Object> map) { 
	        List<HabitDTO> bbs = new Vector<HabitDTO>();  // 결과(게시물 목록)를 담을 변수

	        String query = "SELECT * FROM habit "; 
	        

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
	                HabitDTO hdto = new HabitDTO(); 

	                hdto.setGoalId(rs.getString("goalId"));           
	                hdto.setHabitId(rs.getString("habitId"));          // 일련번호
					hdto.setTodo(rs.getString("todo"));     
					hdto.setStartNum(rs.getString("startNum"));
					hdto.setGoalNum(rs.getString("goalNum"));
					hdto.setGoalUnit(rs.getString("goalUnit"));
	                hdto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간

	                bbs.add(hdto);  // 결과 목록에 저장
	            }
	        } 
	        catch (Exception e) {
	            System.out.println("세부 목표 조회 중 예외 발생");
	            e.printStackTrace();
	        }

	        return bbs;
	    }
	    
		// 지정한 목표를 찾아 세부목표를 반환합니다.
	    public HabitDTO selectView(String habitId) { 
	        HabitDTO hdto = new HabitDTO();  // 결과(세부목표 목록)를 담을 변수
	        
	        String query = "select h.* "
	        		+ "from habit h inner join userGoal u "
	        		+ "on u.goalId=h.goalId where h.habitId=?";

	        try {
	        	// 쿼리 실행        	
	        	// MySQL 드라이버 로드
	          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
	            String dbId = "somee"; // 설정된 id
	            String dbPass = "dream970307!"; // 설정된 password
	            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	        	Class.forName("com.mysql.jdbc.Driver"); 
	        	
	        	psmt = conn.prepareStatement(query);
	            psmt.setString(1, habitId); // 인파라미터를 일련번호로 설정 ❺
	            rs = psmt.executeQuery(); // 쿼리 실행 ❻
	            
	           if (rs.next()) {  // 결과 처리
	                hdto.setGoalId(rs.getString("goalId"));           
	                hdto.setHabitId(rs.getString(2));          // 일련번호
					hdto.setTodo(rs.getString("todo"));     
					hdto.setStartNum(rs.getString("startNum"));
					hdto.setGoalNum(rs.getString("goalNum"));
					hdto.setGoalUnit(rs.getString("goalUnit"));
	                hdto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간
	               
	            }
	        } 
	        catch (Exception e) {
	            System.out.println("세부 목표 상세보기 중 예외 발생");
	            e.printStackTrace();
	        }

	        return hdto;
	    }
	    
	    // 세부계획 데이터를 받아 DB에 추가합니다. 
	    public int insertWrite(HabitDTO dto) {
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
	            String query = "INSERT INTO habit ( "
	                         + " goalId, todo, startNum, goalNum, goalUnit, createdAt) "
	                         + " VALUES ( "
	                         + "  ?, ?, ?, ?, ?, ?)";  

	            psmt = conn.prepareStatement(query);  // 동적 쿼리
				psmt.setString(1, dto.getGoalId()); 
				psmt.setString(2, dto.getTodo()); 
	            psmt.setString(3, dto.getStartNum()); 
	            psmt.setString(4, dto.getGoalNum());
	            psmt.setString(5, dto.getGoalUnit());
	            psmt.setTimestamp(6, dto.getCreatedAt());

	            /*	private String goalId;
	            	private String togetherId;*/
	            
	            result = psmt.executeUpdate(); 
	            System.out.println("게시물 입력 성공");
	        }
	        catch (Exception e) {
	            System.out.println("게시물 입력 중 예외 발생");
	            e.printStackTrace();
	        }
	        
	        return result;
	    }
	    
	    // 지정한 세부목표를 삭제합니다.
	    public int deletePost(HabitDTO dto) { 
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
	            String query = "DELETE FROM habit WHERE goalId=?"; 

	            // 쿼리문 완성
	            psmt = conn.prepareStatement(query); 
	            psmt.setString(1, dto.getGoalId()); 

	            // 쿼리문 실행
	            result = psmt.executeUpdate(); 
	        } 
	        catch (Exception e) {
	            System.out.println("게시물 삭제 중 예외 발생");
	            e.printStackTrace();
	        }
	        
	        return result; // 결과 반환
	    }
	    
}
