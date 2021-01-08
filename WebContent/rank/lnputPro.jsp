<%@page import="epl.plaers.result.StatDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="epl.plaers.result.StatDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8"); 
	StatDTO dto = new StatDTO();
	String path = request.getRealPath("save");
	int max = 1024 * 1024 * 5;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);
	
	dto.setPlayer(mr.getParameter("player"));
	dto.setGoals(Integer.parseInt(mr.getParameter("goals")));
	dto.setAssist(Integer.parseInt(mr.getParameter("assist")));
	dto.setAttackp(Integer.parseInt(mr.getParameter("attackp")));
	dto.setShooting(Integer.parseInt(mr.getParameter("shooting")));
	dto.setFoul(Integer.parseInt(mr.getParameter("foul")));
	dto.setYcard(Integer.parseInt(mr.getParameter("ycard")));
	dto.setRcard(Integer.parseInt(mr.getParameter("rcard")));
	dto.setConner(Integer.parseInt(mr.getParameter("conner")));
	dto.setPk(Integer.parseInt(mr.getParameter("pk")));
	dto.setOffside(Integer.parseInt(mr.getParameter("offside")));
	dto.setAshoot(Integer.parseInt(mr.getParameter("ashoot")));
	dto.setGames(Integer.parseInt(mr.getParameter("games")));
	dto.setTeamlogo(mr.getFilesystemName("teamlogo"));
	dto.setTeam(mr.getParameter("team"));
	
	StatDAO dao = StatDAO.getInstance();
	dao.inputStat(dto);
	
	
	
	response.sendRedirect("inputForm.jsp");
	
	
	
%>
<body>

</body>
</html>