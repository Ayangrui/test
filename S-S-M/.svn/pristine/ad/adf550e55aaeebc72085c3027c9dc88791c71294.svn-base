package com.etoak.models.role.bean;

import java.util.Date;

public class Role {
	
	private String id;
	private String name;
	private Integer status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	private Date createTime;
	private String remark;
	
	@Override
	public int hashCode(){
		return 1;
	}
	
	@Override
	public boolean equals(Object obj){
		if(obj==null){
			return false;
		}
		if(!(obj instanceof Role)){
			return false;
		}
		Role r = (Role)obj;
		return this.name.equals(r.name);
	}
	
	
	
	
}
