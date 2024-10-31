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
		<h1>Quiz 취업률을 구하시오.  </h1>
		<br />
		
		<div id="inputWrap">
			<ol>
				<li>
					<span>졸업자 수 </span><input name="firstNum" form="quizFrm"/>
				</li>
				<li>
					<span>취업자 수 </span><input name="secNum" form="quizFrm"/>
				</li>
				<li>
					<button id="submitBtn" type="submit" form="quizFrm">취업률 계산</button>
				</li>
				
			</ol>
					 
			
			<form id="quizFrm" action="./result.jsp"></form>
		</div>
	</div>
	<!-- div#wrap -->
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>    