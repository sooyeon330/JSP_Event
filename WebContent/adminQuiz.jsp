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
<link rel="stylesheet" href="css/adminquiz.css">
<link href="https://fonts.googleapis.com/css?family=Fira+Sans" rel="stylesheet">

</head>

<body>
<%
request.setCharacterEncoding("utf-8");

Connection conn =null;
PreparedStatement pstmt = null;
ResultSet rs = null;

ArrayList<Spell> spellist = new ArrayList<>();
String[] choice = new String[5];
int idx=0;
try{
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "jsp_event";
	String pass = "3616";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	
	String leftspell="";
	String rightspell="";
	String answer="";
	
	String sql="SELECT id, leftspell, rightspell, answer FROM SPELL";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		leftspell = rs.getString("leftspell");
		rightspell = rs.getString("rightspell");
		answer = rs.getString("answer");
		
		spellist.add(new Spell(rs.getString("id"),leftspell, rightspell, answer));

	}//while
%>
<table border=1>
	<tr>
		<td >번호</td><td >보기1</td><td >보기2</td><td > 정답</td>
	</tr>
<%
	for(int i=0; i<spellist.size(); i++){
%>
	<tr>
		<td><input type="text" class="num" value="<%=spellist.get(i).getId() %>" readonly></td>
		<td ><input type="text" class="leftval" value="<%=spellist.get(i).getLeft() %>" ></td>
		<td ><input type="text" class="rightval" value="<%=spellist.get(i).getRight() %>" ></td>
		<td ><input type="text" class="answerval" value="<%=spellist.get(i).getAnswer()%>" ></td>
	</tr>
<%  
	}
%>

</table>

<%
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs!=null){try{rs.close();}catch(Exception e){}}//if
	if(pstmt!=null){try{pstmt.close();}catch(Exception e){}}//if
	if(conn!=null){try{conn.close();}catch(Exception e){}}//if
}

%>

</body>
</html>














