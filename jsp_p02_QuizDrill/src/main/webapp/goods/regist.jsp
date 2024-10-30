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
		<h1>상품등록 </h1>
		<br />
		
		<div id="inputWrap">
			<ul>
				<li>
					<span>상품명 </span><input name="goodsName" form="goodsFrm"/>
				</li>
				<li>
					<span>분류 </span>
					<label for="newR">신상품 </label>
					<input type="radio" id="newR" value="신상품" name="goodsRadio" form="goodsFrm"/>
					<label for="oldR">리퍼 </label>
					<input type="radio"  id="oldR" value="리퍼"  name="goodsRadio" form="goodsFrm"/>
				</li>
				<li>
					<span>제조사 </span>
					<select  name="goodsSelect" form="goodsFrm">
						<option value="삼성">삼성 </option>
						<option value="LG">LG </option>
						<option value="GE">GE </option>
					</select>
				</li>
			</ul>
		
			<button id="submitBtn" type="submit" form="goodsFrm">등록</button> 
			
			<form id="goodsFrm" action="./infoPrint.jsp"></form>
		</div>
	</div>
	<!-- div#wrap -->
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>    