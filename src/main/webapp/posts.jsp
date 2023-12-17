<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.crud.dao.TeamDAO, com.crud.bean.TeamVO"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>팀원 관리(index)</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
</head>
<body>

<div class="container mt-5">
	<h2>공동체리더쉽훈련 팀원 관리</h2>
	<hr>

	<!-- 게시물 목록 -->
		<%
        TeamDAO teamDAO = new TeamDAO();
        List<TeamVO> list = teamDAO.getTeamList();
        request.setAttribute("list", list);
    %>
	<table id="list" class="table table-hover table-striped" style="border:1px solid;">
		<thead>
		<tr>
			<th>Id</th>
			<th>학번</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>Email</th>
			<th>Residence</th>
			<th>전화번호</th>
			<th>전공</th>
			<th>등록일</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		</thead>
		<tbody>
		<% if (list != null && !list.isEmpty()) { %>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getSeq()}</td>
				<td>${u.getSnumber()}</td>
				<td>${u.getName()}</td>
				<td>${u.getBirth()}</td>
				<td>${u.getEmail()}</td>
				<td>${u.getResidence()}</td>
				<td>${u.getPhone()}</td>
				<td>${u.getMajor()}</td>
				<td>${u.getRegdate()}</td>
				<td>
					<button class="btn btn-primary btn-sm" onclick="redirectToUpdate(${u.getSeq()})">수정</button>
				</td>

				<td>
					<button class="btn btn-danger btn-sm delete-post" data-bs-toggle="modal"
							data-bs-target="#confirmDeleteModal" onclick="deleteConfirmed('${u.getSeq()}')">삭제
					</button>
				</td>
			</tr>
		</c:forEach>
		<% } else { %>
		<tr>
			<td colspan="11">No data available</td>
		</tr>
		<% } %>
		</tbody>
	</table>
	<button class="btn btn-primary" onclick="redirectToAdd()">추가하기</button>

	<!-- 삭제 확인 모달 -->
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel"
		 aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmDeleteModalLabel">삭제 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					정말로 삭제하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="deleteConfirmed()">예</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script src="index.js"></script>
	<script>
		$(document).ready(function () {
			$('#list').DataTable();
		});

		function redirectToAdd() {
			window.location.href = 'addpostform.jsp';
		}

		function redirectToUpdate(seq) {
			window.location.href = 'editform.jsp?id=' + seq;
		}

		function deleteConfirmed(seq) {
			var a = confirm("정말로 삭제하겠습니까?");
			if (a) location.href = 'deletepost.jsp?id=' + seq;
			$('#confirmDeleteModal').modal('hide');
		}
	</script>
</body>
</html>
