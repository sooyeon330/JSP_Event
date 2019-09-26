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
	
	String sql="SELECT leftspell, rightspell, answer FROM SPELL WHERE ROWNUM <= 5 ORDER BY DBMS_RANDOM.RANDOM";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		leftspell = rs.getString("leftspell");
		rightspell = rs.getString("rightspell");
		answer = rs.getString("answer");
		
		spellist.add(new Spell(leftspell, rightspell, answer));

	}//while
	

%>
<div class='container'>
	<div class='box'>
		<h3>알쏭달쏭 맞춤법 Quiz!</h3>
		<form action="spellcheck.jsp" method="post" class="form">
			<% for(int i=0; i<spellist.size(); i++) {%>
			<div class='quiz'>
				<div class="inputGroup">
					<input id="radio<%=i %>" name="quiz<%=i%>" type="radio" value="1"/><label for="radio<%=i%>"><%=spellist.get(i).getLeft() %></label>
				</div>
				<h2>VS</h2>
				<div class="inputGroup">
					<input id="radio<%=i %>0" name="quiz<%=i%>" type="radio" value="2"/><label for="radio<%=i%>0"><%=spellist.get(i).getRight() %></label>
				</div>
			</div>
			
			<%-- <div class='quiz'>
		 		<input type="text" class='spell' id='left' value="<%=spellist.get(i).getLeft() %>" readonly/>
					<h1>VS</h1>
				<div class='spell' id='right'><%=spellist.get(i).getRight() %></div>
			</div> --%>
			<%} %>
			<input class="submit" type="submit" value="채점하기">
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
<%!
	public String PrintHtml(JspWriter out, ArrayList<Spell> spellist, int idx) throws Exception{
		return ("<div class='spell' id='left'>"+spellist.get(idx).getLeft()
					+"</div><h1>VS</h1><div class='spell' id='right'>"
					+spellist.get(idx).getRight()+"</div>");
	}
%>














