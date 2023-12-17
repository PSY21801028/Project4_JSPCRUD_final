<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.crud.dao.TeamDAO, com.crud.bean.TeamVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>새 팀원 추가</title>

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
            margin-top: 50px; /* 여기에 추가 */
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center vh-100">

<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    if (request.getMethod().equalsIgnoreCase("post")) {
        TeamDAO teamDAO = new TeamDAO();
        TeamVO teamVO = new TeamVO();
        teamVO.setSnumber(Integer.parseInt(request.getParameter("snum")));
        teamVO.setName(request.getParameter("lname") + request.getParameter("fname"));
        teamVO.setBirth(request.getParameter("dob"));
        teamVO.setEmail(request.getParameter("e-mail") + "@" + request.getParameter("server"));
        teamVO.setResidence(request.getParameter("rs"));
        teamVO.setPhone(request.getParameter("contact"));
        teamVO.setMajor(request.getParameter("major"));

        teamDAO.insertTeam(teamVO);

        response.sendRedirect("posts.jsp");
    }
%>

<div class="container">
    <h1 class="text-center">Add New Post</h1>
    <form action="addpostform.jsp" method="post" accept-charset="UTF-8">
    <label for="snum">Student Number:</label><br>
    <input type="text" id="snum" name="snum" placeholder="22000000"><br>

    <label for="major">Major:</label><br>
    <input type="text" id="major" name="major" placeholder="전산전자공학부"><br>

    <label for="fname">First name:</label><br>
    <input type="text" id="fname" name="fname" placeholder="Soonyong"><br>

    <label for="lname">Last name:</label><br>
    <input type="text" id="lname" name="lname" placeholder="Park"><br><br>

    <label>Handong RC</label><br>
    <label>
        <input type="radio" name="RC" value="열송">
        열송
    </label>

    <label>
        <input type="radio" name="RC" value="장기려">
        장기려
    </label>

    <label>
        <input type="radio" name="RC" value="손양원">
        손양원
    </label>

    <label>
        <input type="radio" name="RC" value="카마이클">
        카마이클
    </label>

    <label>
        <input type="radio" name="RC" value="카이퍼">
        카이퍼
    </label>

    <label>
        <input type="radio" name="RC" value="토레이">
        토레이
    </label><br>

    <label for="email">E-mail</label><br>
    <div class="w-50 input-group mb-3">
        <input type="text" class="form-control" placeholder="Username" aria-label="Username" name="e-mail">
        <span class="input-group-text">@</span>
        <input type="text" class="form-control" placeholder="Server" aria-label="Server" name="server">
    </div><br>

    <label for="contact">Contact (Phone):</label><br>
    <input type="text" id="contact" name="contact" placeholder="010-"><br><br>

    <label for="dob">생년월일:</label>
    <input type="date" id="dob" name="dob" required><br><br>

    <label for="residential">거주형태</label>
    <select id="residential" name="rs">
        <option value="외부거주">외부거주</option>
        <option value="기숙사">기숙사</option>
    </select><br><br>

    <textarea rows="5" cols="70" name="textarea">
        여러 줄의 텍스트를 입력하세요.
        이 텍스트 영역은 스크롤이 가능합니다.
    </textarea><br>

        <button type="submit" class="btn btn-primary">등록하기</button>
</form>


</body>
</html>
