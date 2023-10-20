<%@page import="Common.BoardPage"%>
<%@page import="java.util.List"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	
	String sel = (String)session.getAttribute("sel");
	String text = (String)session.getAttribute("text");

	BoardDAO dao = new BoardDAO(); 
	
	// 게시물 전체 개수
	int totalCount = dao.selectCount(sel, text);
	
	// 한 페이지 게시물 개수(20개)
	int postPage = Integer.parseInt(application.getInitParameter("POST_PAGE"));
	// 하단 표시 페이지 숫자(10개)
	int blockCount = Integer.parseInt(application.getInitParameter("BLOCK_COUNT"));
	// 게시물 페이지 전체 개수
	int totalPage = (int)Math.ceil((double)totalCount / postPage);
	
	int pageNum = 1; // 기본 페이지 번호는 1로 세팅
	if (request.getParameter("pageNum") != null){
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	
	int start = (pageNum -1) * postPage + 1;
	
	
	int virtualNum = totalCount -postPage*(pageNum-1);
	
	List<BoardDTO> boardLists = dao.selectList(start, sel, text);
	
	
	
	dao.close();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@ include file="LoginCheck.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
	<form action="boardProcess.jsp">
		<table border="1" width="100%">
			<tr align="center">
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">아이디</th>
				<th width="15%">작성일</th>
				<th width="10">조회수</th>
			</tr>
			
			<%-- <!-- JSTL 태그 활용하여 1줄만 출력 -->
			<c:set var="boardli" value="<%=boardLists %>" scope="request"/>
			<tr align="center">
				<td>${boardli[0].num}</td>
				<td>${boardli[0].title}</td>
				<td>${boardli[0].id}</td>
				<td>${boardli[0].postdate}</td>
				<td>${boardli[0].visitcount}</td>
			</tr>
			 --%>
			
			 <%-- <%
				for(BoardDTO dto : boardLists){
			
			%>
			<tr align="center">
				<td><%=virtualNum-- %></td>
				<td><a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a> </td> <!--  num값 확인하기 -->
				<td><%=dto.getId() %></td>
				<td><%=dto.getPostdate() %></td>
				<td><%=dto.getVisitcount() %></td>
			</tr>
			
			<%} %>  --%>
			
			<c:forEach var="boardli" items="<%=boardLists %>">
				<tr align="center">
					<td><%=virtualNum-- %></td>
					<td><a href="View.jsp?num=${boardli.num}">${boardli.title}</a></td>
					<td>${boardli.id}</td>
					<td>${boardli.postdate}</td>
					<td>${boardli.visitcount}</td>
				</tr>
			</c:forEach>
			
			<%-- <tr align="center">
				<td colspan="5">
			 		<%=BoardPage.pagingStr(totalCount, postPage, blockCount, pageNum, totalPage) %>
				</td>
			</tr> --%>
			
			
		<tr align="center">
			<td colspan="5">
				<c:set var="pageNum" value="<%=pageNum%>"/>
				<c:forEach var="i" begin="1" end="<%=blockCount%>">
					
					<c:choose>
						<c:when test="${pageNum==i}">
							<font color="red"><b>[${i}]</b></font>
						</c:when>
						<c:otherwise>
						<c:url value="boardmain.jsp" var="url"/>
						 <a href="${url}<%-- boardmain.jsp--%>?pageNum=${i} "><font color="black">[${i}]</font></a> 
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</td>
		</tr>
			
			<tr align="center">
				<td colspan="5">
			 		<select name="sel" class="txt">
			 			<option value="title">제목</option>
			 			<option value="id">아이디</option>
			 		</select>
		 			<input type="text" name="text">
		 			<input type="submit" class="btn btn-primary" value="검색">
				</td>
			</tr>
		</table>
		</form>
		<br>
			<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
			
	</div>
	
</body>
</html>