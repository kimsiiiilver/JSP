<%@page import="Common.JSFunction"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id2 = (String)session.getAttribute("user_id");
	String num = request.getParameter("num");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	
	String id = dto.getId();
	
	if(id.equals(id2)){
		dao.DeleteBoard(num);
		JSFunction.alertLocation("삭제가 완료되었습니다.", "boardmain.jsp", out);
	} else {
		JSFunction.alertBack("삭제 실패", out);
	}
	
	dao.close();
	

%>