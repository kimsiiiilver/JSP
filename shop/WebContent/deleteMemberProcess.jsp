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
	String id = (String)session.getAttribute("user_id");
	String pass = request.getParameter("pass");
	System.out.print(id);
	System.out.print(pass);
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(id, pass);
	if(dto.getId()!= null){
		dao.deleteDTO(id);
		response.sendRedirect("logout.jsp");
	} else {
		response.sendRedirect("deleteMember.jsp");
	}
	dao.close();



%>
</body>
</html>