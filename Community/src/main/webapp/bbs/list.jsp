<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String uId_Session = (String)session.getAttribute("uId_Session"); %>
<%@ page import="pack.dto.BoardBean,java.util.Vector" %> 

<jsp:useBean id="bMgr" class="pack.dao.BoardMgr" />

<%
	///////////////////////페이징 관련 속성 값 시작/////////////////////////// 
	// 페이징(Paging) = 페이지 나누기를 의미함
	int totalRecord = 0; 
	int numPerPage = 5; 
	int pagePerBlock = 5; 
	int totalPage = 0; 
	int totalBlock = 0;
	
	int nowPage = 1;
	int nowBlock =1;
	
	int start = 0; 
	int end = 5;
	int listSize = 0;
	
	// 게시판 검색 관련소스
	String keyField = ""; // DB의 컬럼명 
	String keyWord = ""; // DB의 검색어
	
		if (request.getParameter("keyWord") != null) { 
			keyField = request.getParameter("keyField"); 
			keyWord = request.getParameter("keyWord");
		}
	
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage")); 
			start = (nowPage * numPerPage) - numPerPage;
			end = numPerPage;
		}
		
	totalRecord = bMgr.getTotalCount(keyField, keyWord); // 전체 데이터 수 반환
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage); 
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); 
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	///////////////////////페이징 관련 속성 값 끝///////////////////////////
	Vector<BoardBean> vList = null; 
%>


<!DOCTYPE html> <html lang="ko"> 
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<title>게시판 목록</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<link rel="stylesheet" href="/style/style_BBS.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/script_BBS.js"></script>
</head>
<body>
	<div id="wrap">
	<%@ include file="/ind/headerTmp.jsp" %>
		<main id="main" class="dFlex">
			<div id="lnb">
				<%@ include file="/ind/mainLnbTmp.jsp" %> 
			</div>
			<div id="contents" class="bbsList">
				<%
					String prnType = "";
					
					if (keyWord.equals("null") || keyWord.equals("")) {
						prnType = "전체 게시글"; 
					} else {
						prnType = "검색 결과"; 
					}
				%>
			<div id="pageInfo" class="dFlex">
				<span><%=prnType %> : <%=totalRecord%> 개</span> 
				<span>페이지 : <%=nowPage + " / " + totalPage%></span>
			</div>
		      	
		      	<table id="boardList">
			        <thead>
						<tr> <th>번호</th> <th>제목</th> <th>이름</th> <th>날짜</th> <th>조회수</th> </tr> 
						<tr> <td colspan="5" class="spaceTd"></td> </tr> 
					</thead> 
					<tbody> 
					<%
						vList = bMgr.getBoardList(keyField, keyWord, start, end); // DB에서 데이터 불러오기 listSize = vList.size();
						if (vList.isEmpty()) { 
					%>
					<tr>
						<td colspan="5"><%="게시물이 없습니다." %></td>
					 </tr>
					<% } else {
						
						for (int i=0; i<numPerPage; i++) { 
							if(i==listSize) break;
							
							BoardBean bean = vList.get(i); 
							
							int num = bean.getNum();
							String uName = bean.getuName(); 
							String subject = bean.getSubject(); 
							String regTM = bean.getRegTM();
						    
							int depth = bean.getDepth();
							int readCnt = bean.getReadCnt(); 
					%>
						<tr class="prnTr" onclick="read('<%=num%>', '<%=nowPage%>')">
							<td><% if (depth == 0) out.print(num); // 답변글이 아님을 의미함 %></td> 
							<td class="subjectTd">
							<%
								if (depth > 0) { // 답변글을 의미함
									for(int blank=0; blank<depth; blank++) { 
										out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
									} // End of inner for 
								} // End of inner if 
								out.print(subject);
							%>
							</td>
							<td><%=uName %></td> 
							<td><%=regTM %></td> 
							<td><%=readCnt %></td>
						</tr> 
					<%
						}//Endofouterfor 데이터가있을경우출력끝 
					} // End of outer if
					%>
					<tr id="listBtnArea">
						<td colspan="2">
						<% if (uId_Session == null) { %>
							<button type="button" id="loginAlertBtn" class="listBtnStyle">글쓰기</button> 
						<% } else { %>
							<button type="button" id="writeBtn" class="listBtnStyle">글쓰기</button> 
						<% } %>
						</td>
						<td colspan="3">
							<form name="searchFrm" class="dFlex" id="searchFrm"> 
								<div>
									<select name="keyField" id="keyField">
										<option value="subject" <% if(keyField.equals("subject")) out.print("selected"); %>>제 목</option> 
										<option value="uName" <% if(keyField.equals("uName")) out.print("selected"); %>>이 름</option> 
										<option value="content" <% if(keyField.equals("content")) out.print("selected"); %>>내 용</option>
									</select>
				  				</div>
								<div>
									<input type="text" name="keyWord" id="keyWord" id="keyWord" size="20" maxlength="30" value="<%=keyWord%>">
								</div> 
								<div>
									<button type="button" id="searchBtn" class="listBtnStyle">검색</button> 
								</div>
							</form>
							<input type="hidden" id="pKeyField" value="<%=keyField%>"> <input type="hidden" id="pKeyWord" value="<%=keyWord%>">

							<tr id="listPagingArea">
							<!-- 페이징 시작 -->
							<td colspan="5" id="pagingTd">
							<%
								int pageStart = (nowBlock - 1 ) * pagePerBlock +1;
							
								if(totalPage != 0) {
							%>
							
							<% if (nowBlock>1) {  %>
								<span class="moveBlockArea" onclick="moveBlock('<%=nowBlock-1%>', '<%=pagePerBlock%>')">&lt;</span>
							<% } else { %>
								<span class="moveBlockArea" ></span>
							<% } // End of inner if %>
							
							<!-- 페이지 나누기용 페이지 번호 출력 시작 --> 
							<%
								for ( ; pageStart<=pageEnd; pageStart++) {
								if (pageStart == nowPage) { // 현재 사용자가 보고 있는 페이지 
							%>
								<span class="nowPageNum"><%=pageStart %></span> 
							<%}else{ //현재사용자가보고있지않은페이지%>
								<span class="pageNum" onclick="movePage('<%=pageStart %>')"><%=pageStart %></span> 
							<% } // End If%>
						<%} //EndofFor%><!--페이지나누기용페이지번호출력끝 -->
				
				
						<% if (totalBlock>nowBlock) { %>
							<span class="moveBlockArea" onclick="moveBlock('<%=nowBlock+1%>', '<%=pagePerBlock%>')">&gt;</span>
						<% } else { %>
							<span class="moveBlockArea"></span>
						<% }// Endofinnerif
						} else {
						out.print("<b>[ Paging Area ]</b>");
						} //Endodouterif 
						%>
						</td>
					</tr> 
				</tbody>
				</table>
			</div> 
		</main>

	<%@ include file="/ind/footerTmp.jsp" %> 
	</div>
</body>
</html>
