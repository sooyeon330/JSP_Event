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
	
	String sql="SELECT id, leftspell, rightspell, answer FROM SPELL WHERE ROWNUM <= 5 ORDER BY DBMS_RANDOM.RANDOM";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		leftspell = rs.getString("leftspell");
		rightspell = rs.getString("rightspell");
		answer = rs.getString("answer");
		
		spellist.add(new Spell(rs.getString("id"),leftspell, rightspell, answer));

	}//while
%>
<%
	request.setCharacterEncoding("utf-8");

	String[] choice = new String[5];
	String[] rightAns = new String[5];
	
	for(int i=0; i<5; i++){
		choice[i] = request.getParameter("quiz"+i);
		rightAns[i] = request.getParameter("answer"+i);
		
		
	//	out.println("choice : "+choice[i]+","+"answer : "+rightAns[i]+"<br>");
	}
		
	
	int chkCnt =0;	
	
	for(int i=0; i<5; i++){
		if(choice[i].equals(rightAns[i])){
			chkCnt++;
	//		out.println(chkCnt);
		}
	}

	int percent;
	
	percent = chkCnt* 20;
	
	for(int i=0; i<5; i++){
		// 답 텍스트로 얻어오기
		switch(rightAns[i]){
		case "1" : rightAns[i] = spellist.get(i).getLeft(); break;
		case "2" : rightAns[i] = spellist.get(i).getRight(); break;
		} 
		
		switch(choice[i]){
			case "1" : choice[i] = spellist.get(i).getLeft(); break;
			case "2" : choice[i] = spellist.get(i).getRight(); break;
		} 
	}

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
					<%=rightAns[i]%>
				</td>
				<td>
					<%=choice[i]%>
				</td>
			</tr>
<%		}

%>
	</table>
	</div>
	<input type="button" class="submit" onclick="location.href='templateTest.jsp?CONTENTPAGE=spelling.jsp'" value="다시하기" />
	
<script>
$(function(){
	$(".answerDiv").hide();
	$("#showRS").click(function(){
		$(".answerDiv").show();
		move();
	});
});
	
	 
	 
function move() {
  var elem = document.getElementById("myBar");   
  var width = 0;
  var id = setInterval(frame, 10);
  function frame() {
	if (width >= <%= percent %>) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
      elem.innerHTML = width * 1  + '%';
    }
  }
}
</script>
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















