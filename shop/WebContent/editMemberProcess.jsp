<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String id = (String)session.getAttribute("user_id");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	
	MemberDAO dao = new MemberDAO();
	
	dao.editDTO(id, name, pass, phone, address);
	response.sendRedirect("welcome.jsp");
	
	dao.close();


%>
</body>
</html>