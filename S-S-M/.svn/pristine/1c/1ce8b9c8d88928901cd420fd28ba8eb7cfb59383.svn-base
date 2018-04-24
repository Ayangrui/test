package com.etoak.models.easyui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.models.easyui.mapper.TreeMapper;

@Controller
@RequestMapping("/etoak")
public class EtoakController {

	@Autowired
	private TreeMapper tm;
	
	@RequestMapping("/deleteEt")
	@ResponseBody
	public void deleteEt(String ids){
		System.out.println("ids是"+ids);
		boolean b = false;
		String[] str = ids.split(",");
		for(String s:str){
			if(!"".equals(s)){
				tm.deleteEt(Integer.parseInt(s));
			}
		}
	}
}
