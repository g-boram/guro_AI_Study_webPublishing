<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack.dao.MemberMgr" />
<%
    request.setCharacterEncoding("UTF-8");

    // 세션에서 사용자 ID 가져오기
    String uId_Session = (String) session.getAttribute("uId_Session");

    boolean result = false;
    String errorMessage = null;

    try {
        if (uId_Session == null) {
            throw new IllegalStateException("로그인 상태가 아닙니다.");
        }

        // 탈퇴 처리
        result = mMgr.deleteMember(uId_Session);

        if (result) {
            // 세션 무효화
            session.invalidate();
        }
    } catch (Exception e) {
        errorMessage = e.getMessage();
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="/style/style_Common.css">
</head>
<body>
    <div id="wrap_Popup">
	    <div>
		    <% if (result) { %>
	            <p>회원 탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.</p>
	        <% } else { %>
	            <p>회원 탈퇴에 실패했습니다.</p>
	            <% if (errorMessage != null) { %>
	                <p>오류: <%= errorMessage %></p>
	            <% } %>
	         
	        <% } %>
	        <hr>
        	<div id="closeBtnArea">
        		<button onclick="<%= "location.href='/index.jsp'" %>">HOME</button>
        	</div>
	    </div>
        
    </div>
</body>
</html>
