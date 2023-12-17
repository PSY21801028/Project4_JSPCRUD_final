<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.TeamDAO"%>
<%@ page import="com.crud.dao.TeamDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.crud.bean.TeamVO" />
<jsp:setProperty property="*" name="u"/>

<%
	TeamDAO teamDAO = new TeamDAO();
	int i= teamDAO.updateTeam(u);
	response.sendRedirect("posts.jsp");
%>