<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.crud.dao.TeamDAO, com.crud.bean.TeamVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>팀원 정보 수정</title>

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<style>
		body {
			background-color: #f8f9fa;
		}

		.container {
			background-color: #ffffff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			margin-top: 50px;
		}

		label {
			margin-top: 10px;
			margin-bottom: 5px;
			display: block;
		}

		button {
			margin-top: 10px;
		}
	</style>
</head>
<body class="d-flex align-items-center justify-content-center vh-100">

<%
	TeamDAO teamDAO = new TeamDAO();
	String id = request.getParameter("id");
	TeamVO u = teamDAO.getTeam(Integer.parseInt(id));
%>

<div class="container">
	<h1 class="text-center">Edit Form</h1>
	<form action="editpost.jsp" method="post">

		<!-- Hidden field for sequence ID -->
		<input type="hidden" name="seq" value="<%= u.getSeq() %>"/>

		<!-- Student Number -->
		<label for="snum">Student Number:</label>
		<input type="text" id="snum" name="snumber" class="form-control" value="<%= u.getSnumber() %>">

		<!-- Name -->
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" class="form-control" value="<%= u.getName() %>">

		<!-- Birth -->
		<label for="birth">Birth:</label>
		<input type="text" id="birth" name="birth" class="form-control" value="<%= u.getBirth() %>">

		<!-- Email -->
		<label for="email">Email:</label>
		<input type="text" id="email" name="email" class="form-control" value="<%= u.getEmail() %>">

		<!-- Residence -->
		<label for="residence">Residence:</label>
		<input type="text" id="residence" name="residence" class="form-control" value="<%= u.getResidence() %>">

		<!-- Phone -->
		<label for="phone">Phone:</label>
		<input type="text" id="phone" name="phone" class="form-control" value="<%= u.getPhone() %>">

		<!-- Major -->
		<label for="major">Major:</label>
		<input type="text" id="major" name="major" class="form-control" value="<%= u.getMajor() %>">

		<!-- Submit Button -->
		<button type="submit" class="btn btn-primary">Edit Post</button>

		<!-- Cancel Button -->
		<button type="button" class="btn btn-secondary" onclick="history.back()">Cancel</button>
	</form>
</div>

</body>
</html>
