<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String) session.getAttribute("user_id");
%>


<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<%
					out.print("<a class='navbar-brand' href='welcome.jsp'>");
					out.print("홈");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='products.jsp'>");
					out.print("상품목록");
					out.print("</a>");

				%>
			</div>
			<div class="navbar-header justify-content-end">
			<%
				if(user_id==null) {
					out.print("<a class='navbar-brand' href='login.jsp'>");
					out.print("로그인");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='addMember.jsp'>");
					out.print("회원가입");
					out.print("</a>");
				} else {    
					out.print("<a class='navbar-brand' href='#' style='color: green; font-size:0.8em;'>");
					out.print((String)session.getAttribute("user_id")+"님");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='logout.jsp'>");
					out.print("로그아웃");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='editMember.jsp'>");
					out.print("회원정보수정");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='deleteMember.jsp'>");
					out.print("회원탈퇴");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='boardmain.jsp?pageNum=1'>");
					out.print("게시판");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='addProduct.jsp'>");
					out.print("상품추가");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='updateIdCheck.jsp'>");
					out.print("상품수정");
					out.print("</a>");
					out.print("<a class='navbar-brand' href='deleteProduct.jsp'>");
					out.print("상품삭제");
					out.print("</a>");
					
				}
			%>
			</div>
		</div>
</nav>