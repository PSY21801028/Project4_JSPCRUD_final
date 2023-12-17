<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.TeamDAO, com.crud.bean.TeamVO"%>
<%@ page import="com.crud.dao.TeamDAO" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		TeamVO u = new TeamVO();
		u.setSeq(id);
		TeamDAO teamDAO = new TeamDAO();
		teamDAO.deleteTeam(u);
	}
	response.sendRedirect("posts.jsp");
%>