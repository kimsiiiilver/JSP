<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Common.JSFunction"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
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
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String date = sdf.format(now);
	
	
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(request.getParameter("content"));
	dto.setId(id);
	dto.setPostdate(date);

	BoardDAO dao = new BoardDAO();
	
	int result =  dao.insertWrite(dto);
	
	/* //더미 데이터 입력
	int result = 0;     
	for(int i=1; i<=1000; i++){
		dto.setTitle(title+"-"+i);
		result=dao.insertWrite(dto);
	}
	 */
	dao.close();
	
	if(result == 1){
		JSFunction.alertLocation("게시물 작성이 완료되었습니다.", "boardmain.jsp", out);
	} else {
		JSFunction.alertBack("게시물 작성이 실패했습니다.", out);
	}
	
%>
</body>
</html>