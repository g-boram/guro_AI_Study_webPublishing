<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    String goodsName = request.getParameter("goodsName");
    String goodsRadio = request.getParameter("goodsRadio");
    String goodsSelect = request.getParameter("goodsSelect");
    %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../style/style.css?v">
</head>
<body>
	<div id="wrap">
		<h1>InfoPrint</h1>
		<div style="font-size:30px">goodsName : <%= goodsName %></div>
		<div style="font-size:30px">goodsRadio : <%= goodsRadio %></div>
		<div style="font-size:30px">goodsSelect : <%= goodsSelect %></div>
		<button id="backBtn"  type="submit" form="backFrm">추가 등록하기 </button>
		<form id="backFrm"  action="./regist.jsp"></form>
	</div>
	<!-- div#wrap -->
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>    