package dao;

import java.util.ArrayList;

import dto.ProductDTO;

public class ProductRepository_old {

	private ArrayList<ProductDTO> listOfProducts = new ArrayList();
	private static ProductRepository_old instance = new ProductRepository_old();
	
	public static ProductRepository_old getInstance() {
		return instance;
	}

	/*public ProductRepository() {

		Product phone = new Product("P1234", "아이폰14Pro", 1600000);
		phone.setDescription("6.7인치 OLED 디스플레이, 후면 카메라 3대, 전면 카메라 1대");
		phone.setCategory("스마트폰");
		phone.setManufacturer("애플");
		phone.setUnitsInstock(1000);
		phone.setCondition("신상품");
		
		
		Product notebook = new Product("P1235", "LG PC그램", 1200000);
		notebook.setDescription("15.6인치 AMOLED 디스플레이, i5 12세대 중고노트북");
		notebook.setCategory("노트북");
		notebook.setManufacturer("LG");
		notebook.setUnitsInstock(30);
		notebook.setCondition("중고상품");
		
		
		Product tablet = new Product("P1236", "삼성탭9 플러스", 1100000);
		tablet.setDescription("12.4인치 AMOLED 디스플레이, 안드로이드 13");
		tablet.setCategory("태블릿");
		tablet.setManufacturer("삼성");
		tablet.setUnitsInstock(30);
		tablet.setCondition("재생품");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
		
		
	}*/
	
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
	
	public void addProduct(ProductDTO product) {
		listOfProducts.add(product);
	}
}
