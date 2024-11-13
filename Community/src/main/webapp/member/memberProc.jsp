<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack.dao.MemberMgr" />
<jsp:useBean id="bean" class="pack.dto.MemberBean" />
<%
    request.setCharacterEncoding("UTF-8");

    boolean result = false;
    String errorMessage = null;

    try {
        // 사용자 데이터를 MemberBean 객체로 설정
        bean.setuId(request.getParameter("uId"));
        bean.setuPw(request.getParameter("uPw"));
        bean.setuName(request.getParameter("uName"));
        bean.setuEmail(request.getParameter("uEmail"));
        bean.setGender(request.getParameter("gender"));
        bean.setuBirthday(request.getParameter("uBirthday"));
        bean.setuZipcode(request.getParameter("uZipcode"));
        bean.setuAddr(request.getParameter("uAddr"));
        bean.setuHobby(request.getParameterValues("uHobby"));
        bean.setuJob(request.getParameter("uJob"));

        result = mMgr.insertMember(bean);
    } catch (Exception e) {
        errorMessage = e.getMessage();
        e.printStackTrace(); // 로그로 오류 출력
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복 체크</title>
    <link rel="stylesheet" href="/style/style_Common.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script_Join.js"></script>
</head>
<body>
    <div id="wrap_Popup">
        <div>
            <% if (result) { %>
                <p>회원가입이 완료되었습니다.</p>
            <% } else { %>
                <p>회원가입이 실패했습니다.</p>
                <% if (errorMessage != null) { %>
                    <p>오류: <%= errorMessage %></p>
                <% } %>
            <% } %>
        </div>
        <hr>
        <div id="closeBtnArea">
            <button type="button" onclick="<%= result ? "location.href='/loginPage.jsp'" : "history.back()" %>">
                <%= result ? "로그인 페이지" : "뒤로가기" %>
            </button>
        </div>
    </div>
    <!-- div#wrap -->
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/script.js"></script>
</body>
</html>
