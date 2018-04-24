package com.etoak.models.bookid.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoak.models.bookid.bean.Book;
import com.etoak.models.bookid.mapper.BookidMapper;
import com.etoak.models.bookid.service.BookidService;




@Service
public class BookidServiceImpl implements BookidService  {

	@Autowired
	private BookidMapper bookidMapper;
	
	
	
	
	
	@Override
	public void addbookid(Book book) {
		bookidMapper.addbookid(book);
	}
	@Override
	public void addbookid() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<Book> queryAll_book() {

		List<Book> book= bookidMapper.queryAll();
		return book;
	}
	@Override
	public int queryAll_booked() {
		
		 int total=bookidMapper.queryAlled();
		
		return total;
	}
	@Override
	public List<Book> querySome(int start, int pageSize) {
		
		List<Book>book= bookidMapper.querySome(start,pageSize);
		return book;
	}
	
	
	
	@Override
	public void deletebook(Integer id) {
		bookidMapper.deletebook1(id);
		
	}
	@Override
	public void deletebook(Double id) {
		bookidMapper.deletebook(id);
		
		
	}
	@Override
	public List<Book> querySome(int start, int pageSize, String tj) {
		List<Book>book= bookidMapper.querySome(start,pageSize,tj);
		return book;
	}
	
	
	
	
	

}
