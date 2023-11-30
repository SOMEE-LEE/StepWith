package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class FileDAO {
		// 명시한 데이터베이스로의 연결이 완료된 FileDAO 객체를 생성합니다.
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
		
		public int upload(String fileName, String fileRealName, int bbsID) {
			String SQL = "INSERT INTO bbs_file VALUES (?,?,?)";
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, fileName);
				pstmt.setString(2, fileRealName);
				pstmt.setInt(3, bbsID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				
			}
			return -1;
			
		}
		
}
