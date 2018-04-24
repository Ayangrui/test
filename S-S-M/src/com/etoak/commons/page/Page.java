package com.etoak.commons.page;

import java.util.List;

import org.springframework.stereotype.Service;

import jdk.nashorn.internal.ir.annotations.Reference;

/*Page组件封装了与分页相关的所有的参数
 * 当前页 
 *  上一页  
 *  下一页 
 *  总页数
 *  总记录 
 *  每页起始位置 
 *  每页显示几条
 * */
// Page<Book> page = new Page<Book>
//
@Service
public class Page<T> {
	private int currentPage;//当前页
	private int pre;  //下一页
	private int next; //上一页
	private int pageSize=4;//每页显示的记录数       
	private int start;//每页的起始位置
	private int total;//总记录数
	private int pageCount;//总页数
	private List<T> rows;//每页显示的数据
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPre() {
		if(currentPage>1)
		return currentPage-1;
		return 1;
	}
	public int getNext() {
		if(currentPage<getPageCount())
		return currentPage+1;
		return getPageCount();
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStart() {
		return (currentPage-1)*pageSize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageCount() {
		return (total+pageSize-1)/pageSize;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
	
}
