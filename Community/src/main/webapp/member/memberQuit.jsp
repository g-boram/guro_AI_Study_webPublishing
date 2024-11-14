<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% 
	String uId_Session = (String)session.getAttribute("uId_Session"); 
%>
<!DOCTYPE html> 
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>회원탈퇴</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
</head>
<body>
	<div id="wrap">
		<%@ include file="/ind/headerTmp.jsp" %>
		<main id="main" class="dFlex">
			<div id="contents" class="memQuitDiv">
				<form name="memQuitFrm" id="memQuitFrm">
				<h1>회원탈퇴</h1>
				<p>아래 버튼을 클릭하시면 회원을 탈퇴합니다</p>
				<button type="button" id="memQuitBtn">회원 탈퇴하기</button>
				</form>
			</div>
		</main> 
		<%@ include file="/ind/footerTmp.jsp" %>
    </div>
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/script.js"></script> 
</body>
</html>