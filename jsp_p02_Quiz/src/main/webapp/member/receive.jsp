<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/style/style.css?v">
</head>
<body>
	<div id="wrap">
		<div style="font-size:30px">전송된 데이터 ID : <%= id %></div>
		<div style="font-size:30px">전송된 데이터 PW : <%= pw %></div>
		<button id="backBtn"  type="submit" form="backFrm">돌아가기 </button>
		<form id="backFrm"  action="./login.jsp"></form>
	</div>
	<!-- div#wrap -->
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>    