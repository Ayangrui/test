package com.etoak.commons.utils;

public enum GenderEnum {
	GENDER0("女","0"),
	GENDER1("男","1");
	
	private String code;
	private String value;
	
	private GenderEnum(String code, String value) {
		this.code = code;
		this.value = value;
	}
		
	public String getCode() {
		return code;
	}
	public String getValue() {
		return value;
	}
	public static void main(String[] args) {
		/*GenderEnum v0 = GenderEnum.GENDER0;
		System.out.println(v0.getCode()+" | "+v0.getValue());*/
		
		GenderEnum[] gg = GenderEnum.values();
		for(GenderEnum g : gg){
			System.out.println(g.getCode()+" | "+g.getValue());
		}
		
	}
}
