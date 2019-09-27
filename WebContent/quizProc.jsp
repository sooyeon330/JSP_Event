<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String dao = request.getParameter("dao");

String id = request.getParameter("id");
String left = request.getParameter("left");
String right = request.getParameter("right");
String answer = request.getParameter("answer");

Connection conn = null;
PreparedStatement pstmt = null;
String sql;
try {
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "jsp_event";
	String pass = "3616";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	
	if(dao.equals("modi")){
		sql = "update spell set leftspell=?, rightspell=?, answer=? where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, left);
		pstmt.setString(2, right);
		pstmt.setString(3, answer);
		pstmt.setString(4, id);
		pstmt.executeUpdate();
	}else if(dao.equals("del")){
		sql = "delete from spell where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
	}else if(dao.equals("insert")){
		sql = "insert into spell (leftspell, rightspell, answer) values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, left);
		pstmt.setString(2, right);
		pstmt.setString(3, answer);
		
		pstmt.executeUpdate();
	}
	
}
catch(Exception e) {
	e.printStackTrace();
}
finally {
	if(pstmt != null) {try { pstmt.close(); } catch(Exception e) {}}
	if(conn != null) {try { conn.close(); } catch(Exception e) {}}
}
%>

<meta http-equiv='refresh' content='0;url=adminPage.jsp?CONTENTPAGE=adminQuiz.jsp'>

</body>
</html>









