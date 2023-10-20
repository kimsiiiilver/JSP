<%@page import="java.util.ArrayList"%>
<%@page import="dto.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dto.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책소개</title>
<style>
	table, tr, td{
		border: 1px solid green;
		padding: 15px;
	}
	.container{
		font-size: 15pt;
		text-align: center;	
		}



</style>
</head>
<body>
	<% ArrayList<Book> listOfBook = new BookRepository().getAllBook(); %>
	<div class="container">
	<table>
			<tr>
				<td>도서<br> 아이디</td>
				<td>도서<br> 이름</td>
				<td>도서<br> 가격</td>
				<td>도서<br> 저자</td>
				<td>도서 설명</td>
			</tr>
	<%
		for(Book bk : listOfBook){
	%>
		
			<tr>
				<td><%=bk.getBookId() %></td>
				<td><%=bk.getBookName() %></td>
				<td><%=bk.getBookPrice() %></td>
				<td><%=bk.getAuthor() %></td>
				<td><%=bk.getDescription() %></td>
			</tr>
	<% 		
		}
	%>
	
		</table>
	
	
	
	
	
	
	
	
	</div>
	
	
	
	
</body>
</html>