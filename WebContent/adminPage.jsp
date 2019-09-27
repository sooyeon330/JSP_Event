<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("admin")&&pw.equals("admin1234")) {  }
	else{
		out.println("<script>alert('권한이 없습니다.'); location.href='main.jsp'</script>");
	}
	
%>


관리자
<%=id %><br>
<%=pw %>


</body>
</html>