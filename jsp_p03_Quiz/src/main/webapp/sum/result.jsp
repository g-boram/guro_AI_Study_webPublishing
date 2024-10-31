<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    int firstNum = Integer.parseInt(request.getParameter("firstNum"));
    int secNum = Integer.parseInt(request.getParameter("secNum"));
    String resultStr = "";
    int resultNum = 0;
    
   	int min = firstNum;
   	int max = secNum;
   	
   	if(min > max) {
   		min = secNum;
   		max = firstNum;
   	}
    
   	for (int i=min; i <= max; i++ ) {
		resultStr += i ;
		resultNum += i;
		
		if(i < max) {
			resultStr += i + " + ";
		} else {
			resultStr += i + " = ";
		}
	}
   	

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
		<div style="font-size:30px">입력값 1 : <%= firstNum %></div>
		<div style="font-size:30px">입력값 2 : <%= secNum %></div>
		 <div style="font-size:30px">resultStr: <%= resultStr %> </div>
		 <div style="font-size:30px">resultNum: <%= resultNum %> </div>
	</div>
	<!-- div#wrap -->
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>    

