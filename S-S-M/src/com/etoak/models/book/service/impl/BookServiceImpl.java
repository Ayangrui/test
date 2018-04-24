package com.etoak.models.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoak.models.book.bean.AddCa;
import com.etoak.models.book.mapper.BookMapper;
import com.etoak.models.book.service.BookService;

//注解不能注入到接口当中去的
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookmapper;
	
	@Override
	public void addca(String name) {
		bookmapper.addca(name);
		
	}

	@Override
	public List<AddCa> ListAllCa() {
		List<AddCa> list=bookmapper.listallca();
		
		return list;
	}

	@Override
	public String ListAllCa1(String id) {
		String string1=bookmapper.ListAllCa1(id);
		return string1;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
