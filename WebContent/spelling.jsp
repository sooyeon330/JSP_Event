<%@page import="test.Spell"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/spelling.css">
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

Connection conn =null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:XE";
String user = "jsp_event";
String pass = "3616";

Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, user, pass);

ArrayList<Spell> spell = new ArrayList<>();

try{
	
	String sql="SELECT * FROM SPELL WHERE ROWNUM < 5 ORDER BY DBMS_RANDOM.RANDOM";
	

	
	
	
	
	
	
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs!=null){try{rs.close();}catch(Exception e){}}//if
	if(pstmt!=null){try{pstmt.close();}catch(Exception e){}}//if
	if(conn!=null){try{conn.close();}catch(Exception e){}}//if
}


%>
<div class="container">
	<div class="box">
		<h3>알쏭달쏭 맞춤법 Quiz!</h3>
		<div class="quiz">
			<h4 class="spell"></h4>
			<h4 class="spell"></h4>
		</div>
	</div>
</div>

</body>
</html>