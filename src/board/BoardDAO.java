package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.BoardDTO;

public class BoardDAO{

	// 명시한 데이터베이스로의 연결이 완료된 BoardDAO 객체를 생성합니다.
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
	
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수
        
        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) count FROM board";
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
            totalCount = rs.getInt("count");  // 첫 번째 칼럼 값을 가져옴
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount; 
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public List<BoardDTO> selectList(Map<String, Object> map) { 
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수

        String query = "SELECT goalId, togetherId, userNickname, boardId, createdAt FROM board "; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY boardId DESC "; 

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
                BoardDTO bdto = new BoardDTO(); 
           
                bdto.setGoalId(rs.getString("goalId"));
                bdto.setTogetherId(rs.getString("togetherId"));
                bdto.setUserNickname(rs.getString("userNickname"));            // 작성자 닉네임
                bdto.setBoardId(rs.getString("boardId"));          // 일련번호
				/*
				 * dto.setPhoto(rs.getString("photo")); // 작성일
				 * dto.setDetail(rs.getString("detail")); // 내용
				 */                
                bdto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간

                bbs.add(bdto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
	
	// 게시글 데이터를 받아 DB에 추가합니다. 
    public int insertWrite(BoardDTO bdto) {
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
            String query = "INSERT INTO board ( "
                         + " goalId, togetherId, userNickname, photo, detail, createdAt) "
                         + " VALUES ( "
                         + "  ?, ?, ?, ?, ?, ?)";  

            psmt = conn.prepareStatement(query);  // 동적 쿼리
			psmt.setString(1, bdto.getGoalId()); 
			psmt.setString(2, bdto.getTogetherId()); 
            psmt.setString(3, bdto.getUserNickname()); 
            psmt.setString(4, bdto.getPhoto());
            psmt.setString(5, bdto.getDetail());
            psmt.setTimestamp(6, bdto.getCreatedAt());

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
    
    // 지정한 게시물을 찾아 내용을 반환합니다.
    public BoardDTO selectView(String boardId) { 
        BoardDTO bdto = new BoardDTO();
        
        // 쿼리문 준비
        String query = "SELECT b.*, u.userNickname " 
                     + " FROM user u INNER JOIN board b " 
                     + " ON u.userNickname=b.userNickname "
                     + " WHERE boardId=?";

        try {
            // 쿼리 실행        	
        	// MySQL 드라이버 로드
          	String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
            String dbId = "somee"; // 설정된 id
            String dbPass = "dream970307!"; // 설정된 password
            conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        	Class.forName("com.mysql.jdbc.Driver"); 
        	
            psmt = conn.prepareStatement(query);
            psmt.setString(1, boardId);    // 인파라미터를 일련번호로 설정 
            rs = psmt.executeQuery();  // 쿼리 실행 

            // 결과 처리
            if (rs.next()) {
                bdto.setBoardId(rs.getString(1)); 
                bdto.setUserNickname(rs.getString("userNickname"));
                bdto.setPhoto(rs.getString("photo"));
                bdto.setDetail(rs.getString("detail"));
                bdto.setCreatedAt(rs.getTimestamp("createdAt")); 
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        
        return bdto; 
    }
    
    // 목표 아이디(goalId)에 맞는 게시물의 개수를 반환합니다.
    public int idCount(Map<String, Object> map) {
        int idCount = 0; // 결과(게시물 수)를 담을 변수
        
        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) idCount FROM board INNER JOIN userGoal"
        		+ "ON board.goalId=userGoal.goalId WHERE useGoal.goalId=?";
       

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
            if(rs.next()) {  // 커서를 첫 번째 행으로 이동
            	idCount = rs.getInt(1);  // 게시물 수를 가져옴
            }
            /*
			 * psmt.setString(1, goalId); // 쿼리문의 첫 번째 인파라미터에 값 설정 rs = psmt.executeQuery();
			 * // 쿼리문 실행
			 */        }
        catch (Exception e) {
            System.out.println("목표별 게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return idCount; 
    }
}
