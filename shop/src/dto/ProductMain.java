package dto;

public class ProductMain {

	public static void main(String[] args) {

		ProductDTO pro = new ProductDTO("A001","아이폰15Pro",2200000);
		pro.setDescription("최신형 아이폰");
		pro.setManufacturer("애플");
		
		System.out.println("상품설명 : "+pro.getDescription());
		System.out.println("제조회사 : "+pro.getManufacturer());
				
	}

}
