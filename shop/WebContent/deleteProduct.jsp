<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 삭제</h1>
		</div>
	</div>
		
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">삭제할 상품 아이디를 입력하세요.</h5>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.print("<div class='alert alert-danger'>");
					out.print("해당 상품의 아이디가 없습니다.");
					out.print("</div>");
				}
			%>
			<form class="form-signin" action="deleteProductProcess.jsp" method="post">

				
				<div class="form-group">
					<label for="inputId" class="sr-only">상품아이디</label> 
					<input type="text" class="form-control" 
					placeholder="상품아이디" name="id" required>
				</div>
				<button class="btn btn-lg btn-success btn-block" 
					type="submit">삭제</button>

			</form>
		</div>
	</div>
	
</body>
</html>