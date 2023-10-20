<%@page import="Common.JSFunction"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = new BoardDTO();
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String num = request.getParameter("num");
	String id = request.getParameter("id");
	String id2 = (String)session.getAttribute("user_id");
			
	if(id.equals(id2)){
	JSFunction.alertLocation("수정이 완료되었습니다.", "boardmain.jsp", out);
	dao.EditBoard(title, content, num);
	} else {
		JSFunction.alertBack("수정 실패", out);
	}
	
	
	dao.close();
	

%>