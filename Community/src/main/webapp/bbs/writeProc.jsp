<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bMgr" class="pack.dao.BoardMgr" scope="page" /> 
<%
	bMgr.insertBoard(request); response.sendRedirect("/bbs/list.jsp");
%>
