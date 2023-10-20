package dao;

import java.util.ArrayList;

import Common.JDBConnect;
import dto.ProductDTO;

public class ProductDAO extends JDBConnect {

	private ArrayList<ProductDTO> listOfProducts = new ArrayList();
	
	
	public ProductDAO()  {                            // db상품정보 불러오기
		super(); 
		
		String query = "select * from product";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				ProductDTO dto = new ProductDTO();
				dto.setProductId(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setUnitprice(rs.getInt(3));
				dto.setDescription(rs.getString(4));
				dto.setManufacturer(rs.getString(5));
				dto.setCategory(rs.getString(6));
				dto.setUnitsInstock(rs.getLong(7));
				dto.setCondition(rs.getString(8));
				dto.setProductImage(rs.getString(9));
				listOfProducts.add(dto);
			}
			
			System.out.println("정보 불러오기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("정보 불러오기 오류");
		}
		
	}
	
	public ArrayList<ProductDTO> getAllProducts(){
		return listOfProducts;
	}

	public ProductDTO getProductById(String productId) {
		ProductDTO productById =null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			ProductDTO pro = listOfProducts.get(i);
			if(productId != null && pro.getProductId().equals(productId)) {
				productById = pro;
				break;
			}
		}
		
		return productById;
		
	}
	
	public void addProduct(ProductDTO product) {   // db에 상품추가
		
		String query = "insert into product values(?,?,?,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getPname());
			psmt.setInt(3, product.getUnitprice());   
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getManufacturer());
			psmt.setString(6, product.getCategory());
			psmt.setLong(7, product.getUnitsInstock());   
			psmt.setString(8, product.getCondition()); 
			psmt.setString(9, product.getProductImage()); 
			psmt.executeUpdate();
			
			System.out.println("상품추가 성공");
		} catch (Exception e) {
			System.out.println("상품추가 실패");
			e.printStackTrace();
		}
		
	}
	
	public void deleteProduct(String id) {
		
		String query = "delete from product where p_id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.executeUpdate();
			
			System.out.println("상품삭제 성공");
		} catch (Exception e) {
			System.out.println("상품삭제 오류");
			e.printStackTrace();
		}
		
	}
	public void updateProduct(ProductDTO dto, String id) {
		
		String query = "update product set p_id=?, p_name=?, p_unitPrice=?, p_description=?, "
				+"p_manufacturer=?, p_category=?, p_unitInStock=?, p_condition=? where p_id=?";

		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getProductId());
			psmt.setString(2, dto.getPname());
			psmt.setInt(3, dto.getUnitprice());
			psmt.setString(4, dto.getDescription());
			psmt.setString(5, dto.getManufacturer());
			psmt.setString(6, dto.getCategory());
			psmt.setLong(7, dto.getUnitsInstock());
			psmt.setString(8, dto.getCondition());
			psmt.setString(9, id);
			psmt.executeUpdate();
			
			System.out.println("정보수정 성공");
		} catch (Exception e) {
			System.out.println("정보수정 오류");
			e.printStackTrace();
		}
		
	}
}
