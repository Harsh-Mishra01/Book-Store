package com.entity;

import java.io.FileInputStream;
import java.io.InputStream;

public class book_dtls {
	private int bookid;
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	private String bookName;
	private String Author;
	private String Price;
	private String bookCatagory;
	private String bookStatus;
	private String fis; //book image
	private String email;
	
	public book_dtls() {
		super();
		this.bookName = bookName;
		this.Author = Author;
		this.Price = Price;
		this.bookCatagory = bookCatagory;
		this.bookStatus = bookStatus;
		this.fis = fis;
		
		this.email = email;
		
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getBookCatagory() {
		return bookCatagory;
	}
	public void setBookCatagory(String bookCatagory) {
		this.bookCatagory = bookCatagory;
	}
	public String getBookStatus() {
		return bookStatus;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}
	
	public String getFis() {
		return fis;
	}
	public void setFis(String fis) {
		this.fis = fis;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	@Override
	public String toString() {
		String x= "book_dtls [Author=" + Author + ", bookCatagory=" + bookCatagory + ", Filestream=" + fis
				+ ", bookName=" + bookName + ", bookStatus=" + bookStatus + ", Price=" + Price + ", email="+ email +"]";
		System.out.println(x);
		return x;
	}

}
