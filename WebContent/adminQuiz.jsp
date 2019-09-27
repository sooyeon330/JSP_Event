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
<link rel="stylesheet" href="css/radiotoggle.css">
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
<div class="box">
<table>
	<tr>
		<td >번호</td><td >보기1</td><td >보기2</td><td> 정답</td><td> </td><td> </td>
	</tr>
<%

	for(int i=0; i<spellist.size(); i++){
%>
	<tr>
	<form action="quizProc.jsp?" method="post">
		<td><input type="text" name="id" class="num" value="<%=spellist.get(i).getId() %>" readonly ></td>
		<td><input type="text" name="left" class="leftval" value="<%=spellist.get(i).getLeft() %>"  ></td>
		<td><input type="text" name="right" class="rightval" value="<%=spellist.get(i).getRight() %>" ></td>
		<td><input type="text" name="answer" class="answerval" value="<%=spellist.get(i).getAnswer()%>" ></td>
		<td>
			<input id="toggle-on<%=i %>" class="toggle toggle-left" name="dao" value="modi" type="radio" checked>
				<label for="toggle-on<%=i %>" class="btn">수정</label> 
			<input id="toggle-off<%=i %>" class="toggle toggle-right" name="dao" value="del" type="radio">
				<label for="toggle-off<%=i %>" class="btn">삭제</label>
		</td>
		<td>
			<input type="submit" value="전송">
		</td>
	</form>
	</tr>
<%  
	}
%>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
	<form action="quizProc.jsp?dao=insert" method="post">
		<td><input type="text" name="id" class="num" readonly ></td>
		<td><input type="text" name="left" class="leftval"   ></td>
		<td><input type="text" name="right" class="rightval"  ></td>
		<td><input type="text" name="answer" class="answerval"  ></td>
		<td><input type="submit" class="submit" value="추가하기"></td>
	</form>
	</tr>
</table>
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














