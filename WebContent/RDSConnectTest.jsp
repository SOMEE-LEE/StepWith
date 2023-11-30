

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="db.RDSConnect"%>    
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<html>
<head><title>RDS</title></head>
<body>
<h2>RDS DB 연동</h2>
<%
	 String driver = "com.mysql.jdbc.Driver";
	 String jdbcUrl = "jdbc:mysql://step-with.couujdv1lwtj.ap-northeast-2.rds.amazonaws.com/stepwith";
     String dbId = "somee"; // 설정된 id
     String dbPass = "dream970307!"; // 설정된 password
	
	 RDSConnect rds = new RDSConnect(driver, jdbcUrl, dbId, dbPass);    
	 rds.close();
%>
</body>
</html>