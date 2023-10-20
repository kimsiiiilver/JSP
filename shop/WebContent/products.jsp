
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.ProductDTO"%>
<%@ page import="dao.ProductDAO"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품정보</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="LoginCheck.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>

	<%
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> listOfProducts = dao.getAllProducts();
		dao.close();
	%>
	<div class = container>
		<div class="row" align="center">
		
		<%
					for(int i=0; i<listOfProducts.size(); i++){
						ProductDTO product = listOfProducts.get(i);
		%>
			<div class = "col-md-4">
				<img src="resources/images/<%=product.getProductImage()%>" style="width:300px; height:300px;"> 
				<h3><%=product.getPname() %></h3>
				<h3><%=product.getDescription()%></h3>
				<h3><%=product.getUnitprice()%></h3>
				<!-- <button type="button">클릭!</button> -->
				<p><a href="product.jsp?id=<%=product.getProductId() %>"
				class="btn btn-secondary" role="button">상세 정보</a></p>
			</div>
		<% 
			}
		%>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>











