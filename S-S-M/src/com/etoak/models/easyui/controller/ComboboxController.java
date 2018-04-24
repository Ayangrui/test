package com.etoak.models.easyui.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.commons.utils.GenderEnum;

@Controller
@RequestMapping("/combobox")
public class ComboboxController {
	
	List<Map<String,Object>> list = Collections.EMPTY_LIST;
	
	@RequestMapping("/getGender")
	@ResponseBody
	public List<Map<String,Object>> getGender(){
		GenderEnum[] gg = GenderEnum.values();
		if(gg.length>0){
			list = new ArrayList<>();
			Map<String,Object> map = null;
			for(GenderEnum g:gg){
				map = new HashMap<>();
				map.put("label", g.getCode());
				map.put("value",g.getValue());
				list.add(map);
			}
		}
		
		
		return list;
	}
	
}
