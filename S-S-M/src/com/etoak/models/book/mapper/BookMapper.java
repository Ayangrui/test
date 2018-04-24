package com.etoak.models.book.mapper;

import java.util.List;

import com.etoak.models.book.bean.AddCa;

//接口
public interface BookMapper {

	
	//添加书籍的类型
	public void addca(String name);

	//查询书籍的类型
	public List<AddCa> listallca();

	public String ListAllCa1(String id);

	
	
	
	
	
	
	
	
	
	
}
