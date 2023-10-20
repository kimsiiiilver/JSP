package dto;

import java.util.ArrayList;

public class BookRepository {
	
	private ArrayList<Book> listOfBook = new ArrayList<>();
	
	public BookRepository() {
		
		Book book1 = new Book("a1234", "데미안");
		book1.setBookPrice(9000);
		book1.setAuthor("헤르만 헤세");
		book1.setDescription("젊은 남자의 내적 성장과 정체성 탐구를 다루는 소설로,<br> 세상의 복잡함과 미스터리에 대한 탐구를 통해 새로운 방향을 찾아가는 이야기");
	
		Book book2 = new Book("a1235", "어린왕자");
		book2.setBookPrice(7000);
		book2.setAuthor("생텍쥐페리");
		book2.setDescription(" 어린 왕자와 조커 사이의 동화적인 우정을 통해<br> 인간 본성과 삶의 가치를 탐구하는 이야기");
	
		Book book3 = new Book("a1236", "희망의 나라로");
		book3.setBookPrice(10000);
		book3.setAuthor("김영하");
		book3.setDescription("그의 인생 경험과 생각을 담은 수필집입니다.<br> 다양한 주제를 통해 인간 본성과 삶의 의미를 고찰");
	
		listOfBook.add(book1);
		listOfBook.add(book2);
		listOfBook.add(book3);
	
	}
	
	public ArrayList<Book> getAllBook(){
		return listOfBook;
	}
	

}
