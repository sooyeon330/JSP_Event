<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.table{
	margin:auto;
}
.container {
  position: relative;
  width: 250px;
  height: 150px;
  float: left;
  margin:10px;
}

.image {
  display: block;
  width: 70%;
  height: auto;
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 150px;
  width: 100%;
  opacity: 0;
  transition: .3s ease;
  background-color: #0d0d0d;
}

.container:hover .overlay {
  opacity: 0.4;
}

.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}

</style>
<body>
<table>
	<tr>
		<td>
			<div class="container">
			  <a href="templateTest.jsp?CONTENTPAGE=spelling.jsp">
				  <img src="img/logo.png" alt="Avatar" class="image">
				  <div class="overlay">
				    <div class="text">맞춤법 퀴즈</div>
				  </div>
			  </a>
			</div>
		</td>
		<td>
			<div class="container">
			  <a href="templateTest.jsp?CONTENTPAGE=rowpoem.jsp">
				  <img src="img/logo.png" alt="Avatar" class="image">
				  <div class="overlay">
				    <div class="text">3행시 이벤트</div>
				  </div>
			  </a>
			</div>
		</td>
		<td>
			<div class="container">
			  <img src="img/logo.png" alt="Avatar" class="image">
			  <div class="overlay">
			    <div class="text">Hello World</div>
			  </div>
			</div>
		</td>
	</tr>


</table>
	
</body>
</html>