<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html lang="ko"> 
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<title>Document</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/script.js"></script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/ind/headerTmp.jsp" %> 
		<main id="main" class="dFlex">
			<div id="lnb">
				<%@ include file="/ind/mainLnbTmp.jsp" %> 
			</div>
			<div id="contents">
				<h1>LNB 메뉴에서 작업을 선택하세요</h1>
			</div>
		</main> 
		<%@ include file="/ind/footerTmp.jsp" %>
    </div>
</body>
</html>