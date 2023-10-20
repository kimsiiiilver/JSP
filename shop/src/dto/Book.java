package dto;

public class Book {

	private String bookId; //도서아이디
	private String bookName; //도서이름
	private int bookPrice; //도서가격
	private String author; //저자
	private String description; //도서설명
	
	public Book( ) {
		super();
	}
	
	public Book(String bookId, String bookName) {
		this.bookId = bookId;
		this.bookName = bookName;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
}

