<%@page import="test.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	ArrayList<Board> boardlist = new ArrayList<>();
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "jsp_event";
		String pass = "3616";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);

		String id="";
		String title="";
		String content="";
		String writetime="";
		
		sql="SELECT id, title, content, writetime FROM board";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		 SimpleDateFormat format1 = new SimpleDateFormat ();
		
		while(rs.next()){
			id = rs.getString("id");
			title = rs.getString("title");
			content = rs.getString("content");
			writetime = format1.format(new Date());
			boardlist.add(new Board(id,title,content,writetime));
		}//while
		
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		if(pstmt != null) {try { pstmt.close(); } catch(Exception e) {}}
		if(conn != null) {try { conn.close(); } catch(Exception e) {}}
	}
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="Container">
	<img src="img/rowpoem.PNG">
	<div class="board">
		<table border=1>
			<tr>
				<td>번호</td><td>제목</td><td>등록자</td><td>작성시간</td>
			</tr>
<%	
		for(int i=0; i<boardlist.size(); i++){
%>
			<tr>
				<td><%=boardlist.get(i).getId() %></td>
				<td><%=boardlist.get(i).getTitle() %></td>
				<td><%=boardlist.get(i).getTel() %></td>
				<td><%=boardlist.get(i).getWritetime() %></td>
			</tr>
<%		}
%>
			
		</table>
	</div>
</div>
</body>
</html>

















