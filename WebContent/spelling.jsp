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
<link rel="stylesheet" href="css/inputRadio.css">
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
	
	String sql="SELECT id, leftspell, rightspell, answer FROM SPELL  ORDER BY DBMS_RANDOM.RANDOM";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		leftspell = rs.getString("leftspell");
		rightspell = rs.getString("rightspell");
		answer = rs.getString("answer");
		
		spellist.add(new Spell(rs.getString("id"),leftspell, rightspell, answer));

	}//while
%>
<div class='quizDiv'>
	<div class='box'>
		<h3>알쏭달쏭 맞춤법 Quiz!</h3>
		<form action="templateTest.jsp?CONTENTPAGE=spellingcheck.jsp" method="post" class="form">
			<% for(int i=0; i<5; i++) {%>
			<div class='quiz'>
				<div class="inputGroup">
					<input id="radio<%=i %>" name="quiz<%=spellist.get(i).getId() %>" type="radio" value="1"/><label for="radio<%=i%>"><%=spellist.get(i).getLeft() %></label>
				</div>
				<h2>VS</h2>
				<div class="inputGroup">
					<input id="radio<%=i %>0" name="quiz<%=spellist.get(i).getId() %>" type="radio" value="2"/><label for="radio<%=i %>0"><%=spellist.get(i).getRight() %></label>
				</div>
			</div>
			
			
			<%
				choice[i] = spellist.get(i).getId();
			}
				request.setAttribute("choice", choice);
			%>
			<input class="submit" type="submit" id="goAndswer" value="채점하기">
		</form>
	</div>
</div>

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














