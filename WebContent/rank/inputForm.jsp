<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="lnputPro.jsp" method="post" enctype="multipart/form-data">
		선수 : 	<input type="text" name="player">			<br />
		팀 : 	<input type="text" name="team">				<br />
		팀로고 : 	<input type="file" name="teamlogo">		<br />
		골 : 	<input type="text" name="goals">			<br />
		도움 : 	<input type="text" name="assist">			<br />
		게임포인트 : 	<input type="text" name="attackp">			<br />
		슛팅 : 	<input type="text" name="shooting">			<br />
		파울 : 	<input type="text" name="foul">			<br />
		경고 : 	<input type="text" name="ycard">			<br />
		퇴장 : 	<input type="text" name="rcard">			<br />
		코너킥 : 	<input type="text" name="conner">			<br />
		패널티킥 : 	<input type="text" name="pk">			<br />
		오프사이드 : 	<input type="text" name="offside">			<br />
		유효슈팅 : 	<input type="text" name="ashoot">			<br />
		경기수 : 	<input type="text" name="games">			<br />
		<input type="submit" value="전송" />
		
	
	</form>
</body>
</html>