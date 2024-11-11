<%@page import="pack.dto.DataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="fuo" class="pack.ex.FUO" />
    
<%
DataBean dataBean = new DataBean();
boolean chk1 = fuo.mtdUpload(request, dataBean);
%>
    
<jsp:useBean id="dbConn" class="pack.jdbc.DBConn" />
<%
dbConn.mtdDBConn();
boolean chk2 = dbConn.mtdInsert(request, dataBean);
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
		<h1>업로드 테스트 결과</h1>
		<hr>
		<p>작성자 : <%=dataBean.getWriter() %></p>
		<p>원본파일 정보 : <%=dataBean.getOriginalFile() %></p>
		<p>업로드파일 정보 : <%=dataBean.getOriginalFile() %></p>
		<p>파일 크기 : <%=dataBean.getFileSize() %> Bytes</p>
	
		<hr>
	    <div id="btnArea"> 
	        <button type="button" onclick="location.href='/inputTest.jsp'">입력하기</button> 
	    </div>
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>    