package dto;


public class ProductDTO  {    

	
	private String productId; // 상품 아이디
	private String pname; // 상품명
	private Integer unitprice; // 상품가
	private String description; // 상품 설명
	private String manufacturer; // 제조회사
	private String category; // 상품분류
	private long unitsInstock; // 상품 재고 개수
	private String condition; // 상품 상태(신상, 중고, 재생)
	private String productImage; //상품 사진

	public ProductDTO() {
		super();
		
	}
	public String getProductImage() {
		return productImage;
	}
	

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}


	public ProductDTO(String productId, String pname, Integer unitprice) {
		this.productId = productId;
		this.pname = pname;
		this.unitprice = unitprice;
	}
	

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(Integer unitprice) {
		this.unitprice = unitprice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInstock() {
		return unitsInstock;
	}

	public void setUnitsInstock(long unitsInstock) {
		this.unitsInstock = unitsInstock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
}
