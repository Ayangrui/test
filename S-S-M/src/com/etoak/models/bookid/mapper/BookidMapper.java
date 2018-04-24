package com.etoak.models.bookid.mapper;

import java.util.List;
import java.util.Map;

import com.etoak.models.bookid.bean.Book;

//接口
public interface BookidMapper {

	      void addbookid(Book book);


		int queryAlled();


		List<Book> queryAll();


		List<Book> querySome(int start, int pageSize);


		void deletebook(Double id);


		void deletebook1(Integer id);


		List<Book> querySome(int start, int pageSize, String tj);

	
	
	
	
}
