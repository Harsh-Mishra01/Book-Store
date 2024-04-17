package com.DAO;

import java.util.List;

import com.entity.book_dtls;

public interface BookDao {
	
	
	public boolean addBook(book_dtls bd);
	
	public List<book_dtls> allBooks();
	
	public book_dtls bookEdit(int id);
	
	public boolean updateBook(book_dtls bd);
	
	public boolean deleteBook(int id);
	
	public List<book_dtls> addNewBook();
	
	public List<book_dtls> addRecentBook();
	
	public List<book_dtls> allNewBook();
	
	public List<book_dtls> allRecentBook();
	
	public List<book_dtls> addOldBook();
	
	public List<book_dtls> allOldBooks();
	
	public List<book_dtls> oldBookList(String email);


}
