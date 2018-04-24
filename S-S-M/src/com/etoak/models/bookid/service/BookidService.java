package com.etoak.models.bookid.service;

import java.util.List;
import java.util.Map;

import com.etoak.models.bookid.bean.Book;

public interface BookidService {

	void addbookid(Book book);

	void addbookid();

	List<Book> queryAll_book();

	int queryAll_booked();

	List<Book> querySome(int start, int pageSize);

	void deletebook(Double id);

	void deletebook(Integer id);

	List<Book> querySome(int start, int pageSize, String tj);

	
	
	
	
	
	
	
}
