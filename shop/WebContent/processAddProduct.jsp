<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.ProductDTO" %>
<%@ page import="dao.ProductDAO" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%

	String sd = application.getRealPath("/resources/images");  //이미지 경로
	int maxSize = 1024 * 1024 * 5;  //이미지 사이즈
	String ecoding = "utf-8";   //전송 방식
	MultipartRequest mr = new MultipartRequest(request, sd ,maxSize, ecoding, new DefaultFileRenamePolicy());

	String productId = mr.getParameter("productId");
	String pname = mr.getParameter("pname");
	//String unitprice = request.getParameter("unitprice");
	
	int unitprice = Integer.parseInt(mr.getParameter("unitprice"));   //if문 사용 없이 String -> int로 바로 변경할때
	
	String description = mr.getParameter("description");
	String manufacturer = mr.getParameter("manufacturer");
	String category = mr.getParameter("category");
	long unitsInstock = Long.parseLong(mr.getParameter("unitsInstock"));
	String condition = mr.getParameter("condition");
	String productImage = mr.getFilesystemName("productImage");
	
	/*Integer price;
	if(unitprice.isEmpty()){
		price = 0;  // 가격을 입력하지 않을 경우 0으로 설정
	} else{
		price = Integer.valueOf(unitprice);
	}*/
	
	ProductDAO pr = new ProductDAO();
	ProductDTO newProduct = new ProductDTO();
	newProduct.setPname(pname);
	newProduct.setProductId(productId);
	newProduct.setUnitprice(unitprice);
	newProduct.setDescription(description);
	newProduct.setCategory(category);
	newProduct.setManufacturer(manufacturer);
	newProduct.setUnitsInstock(unitsInstock);
	newProduct.setCondition(condition);
	newProduct.setProductImage(productImage);
	
	
	File photoFile = new File(sd+File.separator+productImage);  //이미지 저장
	
	pr.addProduct(newProduct);
	response.sendRedirect("products.jsp");
%>


