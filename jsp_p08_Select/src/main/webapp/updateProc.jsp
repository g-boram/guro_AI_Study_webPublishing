<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/style/style.css?v">
<% 
	String productNum = request.getParameter("productNum");
    String newPrice = request.getParameter("newPrice");

    	// 유효성 검사
    if (productNum == null || productNum.trim().isEmpty() || newPrice == null || newPrice.trim().isEmpty()) {
        response.sendRedirect("listProducts.jsp?error=상품번호와 가격을 모두 입력하세요.");

		// 데이터베이스 업데이트
		Connection conn = null;
		PreparedStatement pstmt = null;
    
    
	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampleData?useSSL=false&characterEncoding=UTF8&serverTimezone=Asia/Seoul", "root", "goboram");
        
           
   
		String sql = "UPDATE goodsList SET price = ? WHERE num = ?";
		
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(Integer.parseInt(newPrice));
        pstmt.setInt(Integer.parseInt(productNum));

        int rowsUpdated = pstmt.executeUpdate();
        
       
		if (rowsUpdated > 0) {
	            response.sendRedirect("listProducts.jsp?success=수정이 완료되었습니다.");
	
		} else {
	            response.sendRedirect( "listProducts.jsp?error=수정할 데이터가 없습니다.");
       }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("listProducts.jsp?error=오류가 발생했습니다.");
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
	
</head>
<body>
	<div id="wrap">
		
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>    