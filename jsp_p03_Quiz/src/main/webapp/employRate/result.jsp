<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    String firstNum = request.getParameter("firstNum");
    String secNum = request.getParameter("secNum");
    
    double employmentRate = 0;
    if (firstNum != null && secNum != null) {
        
    	int graduates = Integer.parseInt(firstNum);
        
        
    	int employed = Integer.parseInt(secNum);

    	
    	try {
    		if (graduates > 0) {
       		 employmentRate = ((double) employed / graduates) * 100;
       		}	
    	} catch (NumberFormatException e) {
    		out.print("NumberFormatException! " + e);
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
		<div style="font-size:30px">firstNum : <%= firstNum %></div>
		<div style="font-size:30px">secNum : <%= secNum %></div>
		 <div style="font-size:30px">취업률: <%= String.format("%.0f", employmentRate) %> %</div>
	</div>
	<!-- div#wrap -->
	<script src="../script/jquery-3.7.1.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>    

