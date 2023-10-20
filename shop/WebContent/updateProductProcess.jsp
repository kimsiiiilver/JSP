<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
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
	
	ProductDTO dto = new ProductDTO();

	String id = request.getParameter("id");
	dto.setProductId(request.getParameter("productId"));
	dto.setPname(request.getParameter("pname"));
	dto.setUnitprice(Integer.parseInt(request.getParameter("unitprice")));
	dto.setDescription(request.getParameter("description"));
	dto.setManufacturer(request.getParameter("manufacturer"));
	dto.setCategory(request.getParameter("category"));
	dto.setUnitsInstock(Long.parseLong(request.getParameter("unitsInstock")));
	dto.setCondition(request.getParameter("condition"));
	
	ProductDAO dao = new ProductDAO();
	dao.updateProduct(dto, id);
	dao.close();
	
	response.sendRedirect("products.jsp");

%>
</body>
</html>