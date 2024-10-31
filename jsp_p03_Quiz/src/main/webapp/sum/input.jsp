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
		<h1>Quiz 누적 결과 산출 </h1>
		<br />
		
		<div id="inputWrap">
			<div>
				<span>입력값 1 </span><input name="firstNum" form="quizFrm"/>
			</div>
			<div>
				<span>입력값 2 </span><input name="secNum" form="quizFrm"/>
			</div>
			<div>
				<button id="submitBtn" type="submit" form="quizFrm">누적 결과</button>
			</div>
			<form id="quizFrm" action="./result.jsp"></form>
		</div>
	</div>
	<!-- div#wrap -->
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>    