<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.crud.bean.TeamVO" />
<jsp:setProperty property="*" name="u" />


<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>