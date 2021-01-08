<%@page import="epl.plaers.result.StatDTO"%>
<%@page import="java.util.List"%>
<%@page import="epl.plaers.result.StatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	td {text-align: center;}
</style>

<meta charset="UTF-8">
<title>기록/순위</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	StatDAO dao = StatDAO.getInstance();
	String sort = request.getParameter("sort");
	if(sort == null) {
		sort = "goals";
	}
	List<StatDTO> allList = dao.getAllPlayers(sort);
%>

<body>
	<br />
	<h1 align="center"> 시즌 선수 기록 </h1>
	<table border="1px solid red" align="center">
		<tr bgcolor="lightgray">
			<th>순위</th>
			<th>선수</th>
			<th><a href="rankList.jsp?sort=goals">득점</a></th>
			<th><a href="rankList.jsp?sort=assist">도움</a></th>
			<th><a href="rankList.jsp?sort=attackp">공격포인트</a></th>
			<th><a href="rankList.jsp?sort=shooting">슈팅</a></th>
			<th><a href="rankList.jsp?sort=foul">파울</a></th>
			<th><a href="rankList.jsp?sort=ycard">경고</a></th>
			<th><a href="rankList.jsp?sort=rcard">퇴장</a></th>
			<th><a href="rankList.jsp?sort=conner">코너킥</a></th>
			<th><a href="rankList.jsp?sort=pk">패널티킥</a></th>
			<th><a href="rankList.jsp?sort=offside">오프사이드</a></th>
			<th><a href="rankList.jsp?sort=ashoot">유효슈팅</a></th>
			<th><a href="rankList.jsp?sort=games">경기수</a></th>
			
		</tr>
		<% for(int i =0; i < allList.size();i++) { 
			StatDTO dto = allList.get(i); %>
		
		
		<tr>
			<td><%=dto.getRanked() %></td>
			<td text-align="left"><img src="/epl/save/<%=dto.getTeamlogo()%>"><%=dto.getPlayer() %><br/><%=dto.getTeam()%></td>
			<td><a><%=dto.getGoals()%></a></td>
			<td><%=dto.getAssist()%></td>
			<td><%=dto.getAttackp() %></td>
			<td><%=dto.getShooting() %></td>
			<td><%=dto.getFoul() %></td>
			<td><%=dto.getYcard() %></td>
			<td><%=dto.getRanked() %></td>
			<td><%=dto.getConner() %></td>
			<td><%=dto.getPk() %></td>
			<td><%=dto.getOffside() %></td>
			<td><%=dto.getAshoot() %></td>
			<td><%=dto.getGames() %></td>
		</tr>
		<% } %>
	</table>
	<br/><br/><br/>
</body>
</html>