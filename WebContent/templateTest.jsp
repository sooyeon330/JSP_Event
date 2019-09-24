<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SongForYou</title>
<link rel="stylesheet" href="CSS/main.css">
<link rel="shortcut icon" href="img/btoblogo.jpg">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String headerPage = request.getParameter("HEADERPAGE");
		String contentPage = request.getParameter("CONTENTPAGE");
	%>
	

	<table class="template" cellpadding="2" cellspacing="0">

		<tr>
			<td class="top" colspan="3"><jsp:include page="top.jsp"
					flush="false" /></td>
		</tr>
		<tr>
			<td class="header" colspan="3"><jsp:include
					page="<%=contentPage%>" flush="false" /></td>
		</tr>
		<tr>
			<td class="footer" colspan="3"><jsp:include page="footer.jsp"
					flush="false" /></td>
		</tr>
	</table>


</body>
</html>