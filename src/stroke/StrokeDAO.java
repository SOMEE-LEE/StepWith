package stroke;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import memberbean.MemberDTO;
import stroke.StrokeDTO;


public class StrokeDAO {
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
    public int insertWrite(StrokeDTO sdto) {
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
            String query = "INSERT INTO userStroke ( "
                         + " usermakeId, strokeId, strokeColor, strokeDate, strokeMent, strokeMyself, createdAt) "
                         + " VALUES ( "
                         + "  ?, ?, ?, ?, ?, ?, ?)";  

            psmt = conn.prepareStatement(query);  // 동적 쿼리
			psmt.setString(1, sdto.getUsermakeId()); 
			psmt.setString(2, sdto.getStrokeId()); 
            psmt.setString(3, sdto.getStrokeColor()); 
            psmt.setString(4, sdto.getStrokeDate());
            psmt.setString(5, sdto.getStrokeMent());
            psmt.setString(6, sdto.getStrokeMyself());
            psmt.setTimestamp(7, sdto.getCreatedAt());

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
    
	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수
        
        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM userStroke";
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
    public List<StrokeDTO> selectList(Map<String, Object> map) { 
        List<StrokeDTO> bbs = new Vector<StrokeDTO>();  // 결과(게시물 목록)를 담을 변수

        String query = "SELECT * FROM userStroke"; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY strokeId DESC "; 

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
                StrokeDTO sdto = new StrokeDTO(); 
           
                sdto.setUsermakeId(rs.getString("usermakeId"));
                sdto.setStrokeId(rs.getString("strokeId"));           
                sdto.setStrokeColor(rs.getString("strokeColor"));          // 일련번호
				sdto.setStrokeDate(rs.getString("strokeDate"));     
				sdto.setStrokeMent(rs.getString("strokeMent"));
				sdto.setStrokeMyself(rs.getString("strokeMyself"));
                sdto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간

                bbs.add(sdto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    
    // 아이디에 맞는 게시물의 개수를 반환합니다.
    public int idCount(String usermakeId) {
        int idCount = 0; // 결과(게시물 수)를 담을 변수
        
        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM userStroke WHERE usermakeId=?";
       

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
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return idCount; 
    }
    
    // 명시한 아이디와 일치하는 다독임 리스트를 반환합니다.
    public List<StrokeDTO> getStrokeDTO(String usermakeId) {
        List<StrokeDTO> bbs = new Vector<StrokeDTO>();  // 결과(게시물 목록)를 담을 변수
        String query = "SELECT * FROM userStroke WHERE usermakeId=?";  // 쿼리문 템플릿
        query += " ORDER BY strokeId DESC "; 

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
                StrokeDTO sdto = new StrokeDTO();
                sdto.setUsermakeId(rs.getString("usermakeId"));
                sdto.setStrokeId(rs.getString("strokeId"));           
                sdto.setStrokeColor(rs.getString("strokeColor"));          // 일련번호
				sdto.setStrokeDate(rs.getString("strokeDate"));     
				sdto.setStrokeMent(rs.getString("strokeMent"));
				sdto.setStrokeMyself(rs.getString("strokeMyself"));
                sdto.setCreatedAt(rs.getTimestamp("createdAt"));  // 작성시간

                bbs.add(sdto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
}
