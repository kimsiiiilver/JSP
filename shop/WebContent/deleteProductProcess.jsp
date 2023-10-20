<%@page import="Common.JSFunction"%>
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
	String id = request.getParameter("id");

	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.getProductById(id);
	
	if(dto != null){
		dao.deleteProduct(id);
		JSFunction.alertLocation("상품이 삭제되었습니다.", "products.jsp", out);
	} else {
		JSFunction.alertBack("상품 아이디를 다시 입력하세요", out);
	}
	dao.close();
%>
</body>
</html>