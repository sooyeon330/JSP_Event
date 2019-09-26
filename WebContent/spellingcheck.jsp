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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Fira+Sans" rel="stylesheet">

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	ArrayList<Spell> spellist = (ArrayList<Spell>)request.getAttribute("spellist");

	String[] choice = new String[5];
	String[] answer = new String[5];
	
	for(int i=0; i<5; i++){
		choice[i] = request.getParameter("quiz"+i);
		answer[i] = request.getParameter("answer"+i);
		
		// 답 텍스트로 얻어오기
/* 		switch(answer[i]){
		case "1" : answer = ; break;
		case "2" : answer = ; break;
		} */
		
		
		out.println("choice : "+choice[i]+","+"answer : "+answer[i]+"<br>");
	}
		
	
	int chkCnt =0;	
	
	for(int i=0; i<5; i++){
		if(choice[i].equals(answer[i])){
			chkCnt++;
			out.println(chkCnt);
		}
	}

	int percent;
	
	percent = chkCnt* 20;

%>
	
	<button class="w3-button w3-green" id="showRS" onclick="move()">점수확인하기</button>
	
	<br>
	<div class="answerDiv">
		
		<div class="w3-light-grey">
			<div id="myBar" class="w3-container w3-green w3-center" style="width:0%"></div>
		</div>
		<table>
				<tr>
					<td>정답</td><td>선택한 답</td>
				</tr>
<%
		for(int i=0; i<spellist.size(); i++){
%>
			<tr>
				<td>
					<%=spellist.get(Integer.parseInt(answer[i])).getAnswer() %>
				</td>
				<td>
					<%=spellist.get(Integer.parseInt(choice[i])).getAnswer() %>
				</td>
			</tr>
<%		}

%>
	</table>
	</div>
	<input type="button" class="submit" onclick="location.href='templateTest.jsp?CONTENTPAGE=spelling.jsp'" value="다시하기" />
<%
	

%>
<script>
$(function(){
	$("#showRS").click(function(){
		move();
	});
});

function move() {
  var elem = document.getElementById("myBar");   
  var width = 0;
  var id = setInterval(frame, 10);
  function frame() {
    if (width >= <%=percent%>) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
      elem.innerHTML = width * 1  + '%';
    }
  }
}
</script>
</body>
</html>















