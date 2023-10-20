<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.ProductDTO"%>
<%@ page import="dao.ProductDAO"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 상세 정보</h1>
		</div>
	</div>

	<%
		String id = request.getParameter("id");
		ProductDAO pr = new ProductDAO();
		//레포지터리 메소드 하나 만들었었음. 여기의 아이디 가지고 product의 모든 개체 가져오기
		ProductDTO pro = pr.getProductById(id);
	%>

	<div class = container align="center">
		<div class="row">
			<div class="col-md-5">
				<img src="resources/images/<%=pro.getProductImage() %>" style="width:300px; height:300px;">
			</div>
			<div class = "col-md-6">
				<h3><%=pro.getPname() %></h3>
				<p><%=pro.getDescription()%></p>
				
				<p>상품 코드 : <span class="badge badge-danger">
				<%=pro.getProductId() %></span></p>
				
				<p>제조사 : <%=pro.getManufacturer() %></p>
				<p>구분 : <%=pro.getCategory() %></p>
				<p>재고 : <%=pro.getUnitsInstock() %>개</p>
				<p>가격 : <%=pro.getUnitprice()%>원</p>
				<!-- <button type="button">클릭!</button> -->
				<p>
				<a href="#" class="btn btn-info">상품 주문</a>
				<a href="products.jsp" class="btn btn-secondary">상품 목록</a>
				</p>
				
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>











