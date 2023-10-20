<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sel = request.getParameter("sel");
	String text = request.getParameter("text");
	
	session.setAttribute("sel", sel);
	session.setAttribute("text", text);
	
	response.sendRedirect("boardmain.jsp");
%>