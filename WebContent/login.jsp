<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="resources/css/inputform.css">
</head>

<div class='form'>
  <h2>Login</h2>
  <form action="adminPage.jsp" method="post">
	  <input name='id' placeholder='UserID' type='text'>
	  <input id='pw' name='pw' placeholder='Password' type='password'>
	  <input type='submit' id="adminbtn" class='animated'  value='Login'>
	  <a class='forgot' href='joinform.jsp'>Don't have an account?</a>
  </form>
</div>



</body>
</html>