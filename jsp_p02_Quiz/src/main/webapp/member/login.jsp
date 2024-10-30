<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../style/style.css?v">
</head>
<body>
	<div id="wrap">
		<h1>로그인</h1>
		
		<div id="inputWrap">
			<input placeholder="아이디 입력 " name="id" form="loginFrm"/>
			<input placeholder="비밀번호 입력 " name="pw" form="loginFrm"/>
			<button id="loginBtn" type="button" form="loginFrm">로그인 </button> 
			
			<form id="loginFrm" action="./receive.jsp"></form>
		</div>
	</div>
	<!-- div#wrap -->
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>    