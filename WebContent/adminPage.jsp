<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[관리자]한글날 Event</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/logo2.png">    
<link rel="stylesheet" href="css/main.css">
<head>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		String contentPage = request.getParameter("CONTENTPAGE");
	%>
	

	<jsp:include page="adminTop.jsp" flush="false" />
	<div class="content">
		<jsp:include  page="<%=contentPage%>" flush="false" />
	</div>
	
</body>
</html>