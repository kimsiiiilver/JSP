<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");	

	String savePhoto = application.getRealPath("/PhotoName"); //저장할 경로
	int maxPhotoSize = 1024 * 1000;
	String encoding = "utf-8";
	
	try{
		
		MultipartRequest mr = new MultipartRequest(request, savePhoto, maxPhotoSize, encoding, new DefaultFileRenamePolicy()); //MultipartRequest객체생성
		
		String id = mr.getParameter("id");
		String name = mr.getParameter("name");
		String pass = mr.getParameter("pass");
		String phone = mr.getParameter("phone");
		String address = mr.getParameter("address");
		String photoName = mr.getFilesystemName("photoImage");
		
		File fileName = new File(savePhoto + File.separator + photoName);
		
		
		MemberDAO dao = new MemberDAO();
		
		String sql = "select * from member";
		dao.psmt = dao.con.prepareStatement(sql);
		dao.rs = dao.psmt.executeQuery();
		
		String result="";
		while(dao.rs.next()){
			String id2 = dao.rs.getString(1);
			
			if(id.equals(id2)){
				result = "기존회원";
				request.getRequestDispatcher("addMember.jsp?error=1").forward(request, response);
				break;
			}
		}
		
		if(result.equals("")){
			dao.addDTO(id, name, pass, phone, address, photoName);
			response.sendRedirect("welcome.jsp");
		}
		dao.close();
	
	} catch(Exception e){
		e.printStackTrace();
		out.print("파일 업로드 오류");
		
		
	}
	
%>
</body>
</html>