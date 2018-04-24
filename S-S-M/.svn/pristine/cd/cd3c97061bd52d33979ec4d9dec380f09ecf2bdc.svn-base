package com.etoak.models.easyui.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/form")
public class FormController {
	
	@RequestMapping("/form")
	@ResponseBody
	public Map<String,Object> form(String username,String password,
			String gender,String birthday,MultipartFile pic,String remark,String etoak){
		System.out.println("用户名 -->"+username);
		System.out.println("密码 -->"+password);
		System.out.println("性别 -->"+gender);
		System.out.println("生日 -->"+birthday);
		System.out.println("图片 -->"+pic);
		System.out.println("备注 -->"+remark);
		System.out.println("附加参数 -->"+etoak);
		
		Map<String,Object> map = new HashMap<>();
		map.put("success", "成功");
		
		return map;
	}
	
}
