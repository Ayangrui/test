package com.etoak.commons.utils;

//弹窗
public class JsonResult {
	private Integer code;//状态码
	private String msg;//信息
	public JsonResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JsonResult(Integer code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
