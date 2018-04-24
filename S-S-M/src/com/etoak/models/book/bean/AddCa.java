package com.etoak.models.book.bean;

import java.util.List;

public class AddCa {

	
	//书籍的id  名称 和他的一个list集合
	private Integer id;
	private String  name;
	private List<AddCa> addca;
	
	
	
	public Integer getId() {
		return id;
	}
	@Override
	public String toString() {
		return "AddCa [id=" + id + ", name=" + name + ", addca=" + addca + "]";
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<AddCa> getAddca() {
		return addca;
	}
	public void setAddca(List<AddCa> addca) {
		this.addca = addca;
	}
	
	
	
}
