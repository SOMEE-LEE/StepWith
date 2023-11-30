package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class RDSConnect {
	public Connection conn;
    public Statement stmt;  
    public PreparedStatement psmt;  
    public ResultSet rs;
	
    public RDSConnect(String driver, String jdbcUrl, String dbId, String dbPass) {
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

    // 연결 해제(자원 반납)
    public void close() { 
        try {            
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (conn != null) conn.close(); 

            System.out.println("RDS 자원 해제");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

}
