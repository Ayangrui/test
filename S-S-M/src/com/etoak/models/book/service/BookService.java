package com.etoak.models.book.service;

import java.util.List;

import com.etoak.models.book.bean.AddCa;





//注入service层  接口

public interface BookService {

	
	 //添加书籍类型 
	  public void addca(String name);

	  //查询书籍类别
	  public List<AddCa> ListAllCa();
	
		
	  public String ListAllCa1(String string);

}
