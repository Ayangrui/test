package com.etoak.models.bookid.bean;

import java.util.List;

public class Book {

	
	/*public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}*/
	public String getName() {
		return name;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", price=" + price + ", author=" + author + ", publishdate=" + publishdate + ", bookcount=" + bookcount
				+ ", category=" + category + ", status=" + status + ", book=" + book + "]";
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getBookcount() {
		return bookcount;
	}
	public void setBookcount(Integer bookcount) {
		this.bookcount = bookcount;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private Integer id;
	private String name;
	private Integer price;
	private String author;
	public void setPublishdate(String publishdate) {
		this.publishdate = publishdate;
	}
	private String publishdate; 
	private Integer bookcount;
	private String category;
	private String status;
	
	private List<Book>book;
	public List<Book> getBook() {
		return book;
	}
	public void setBook(List<Book> book) {
		this.book = book;
	}
	public String getPublishdate() {
		return publishdate;
	}
	
	
	
}
