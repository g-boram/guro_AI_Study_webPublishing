<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> 

<jsp:useBean id="mMgr" class="pack.dao.MemberMgr" />
<jsp:useBean id="bean" class="pack.dto.MemberBean" />
<%
    request.setCharacterEncoding("UTF-8");

    boolean result = false;
    String errorMessage = null;
    String uId_Session = (String)session.getAttribute("uId_Session"); 

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
		bean.setuId(uId_Session);
		
        result = mMgr.updateMember(bean);
        
    } catch (Exception e) {
        errorMessage = e.getMessage();
        e.printStackTrace(); // 로그로 오류 출력
    }
%>

<script>
    <% if (result) { %>
        alert("정보를 수정하셨습니다.");
        location.href = "<%= request.getContextPath() %>/index.jsp"; 
    <% } else { %>
        alert("회원정보 수정 중 문제가 발생했습니다. 다시 시도해주세요.\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.");
        history.back(); 
    <% } %> 
</script>
