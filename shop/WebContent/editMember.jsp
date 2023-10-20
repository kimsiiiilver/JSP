<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("user_id");
	String pw = (String)session.getAttribute("user_pw");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(id, pw);
	
	String path = "PhotoName/"+dto.getPhotoName();
	dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 정보 수정</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="row">
		<div class="col-md-5 ">
			<img src="<%=path%>">
		</div>
		<div class="col-md-5 col-md-offset-5">
			<h5 class="form-signin-heading">수정할 정보를 입력하세요.</h5>
			<form class="form-signin" action="editMemberProcess.jsp" method="post">
				<div class="form-group">
					<label for="inputId" class="sr-only">아이디</label> 
					<input type="text" class="form-control" 
					placeholder="아이디" name="pass" id="inputId" value="<%= id%>" readonly>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> 
					<input type="password" class="form-control" 
					placeholder="비밀번호" name="pass" id="inputPassword" required>
				</div>
				<div class="form-group">
					<label for="inputName" class="sr-only">이름</label> 
					<input type="text" class="form-control" 
					placeholder="이름" name="name" id="inputName" required>
				</div>
				<div class="form-group">
					<label for="inputPhone" class="sr-only">연락처</label> 
					<input type="text" class="form-control" 
					placeholder="010-1234-5678" name="phone" id="inputPhone" required>
				</div>
				<div class="form-group">
					<label for="inputAddress" class="sr-only">주소</label> 
					<input type="text" class="form-control" 
					placeholder="주소" name="address" id="inputAddress" required>
				</div>
				
				
				<button class="btn btn-lg btn-info btn-block" 
					type="submit" >수정완료</button>

			</form>
		</div>
		</div>
	</div>
	
</body>
</html>