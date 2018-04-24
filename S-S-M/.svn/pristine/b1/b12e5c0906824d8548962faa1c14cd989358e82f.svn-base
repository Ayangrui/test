package com.etoak.models.easyui.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.commons.utils.TreeNode;
import com.etoak.models.easyui.mapper.TreeMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/tree")
public class TreeController {
	
	@Autowired
	private TreeMapper tm;
	
	@RequestMapping("/getNodes")
	@ResponseBody
	public List<TreeNode> getNodes(@RequestParam(value="id",defaultValue="0") String id,String etoak){
		List<TreeNode> list = Collections.EMPTY_LIST;
		
		List<Map<String,Object>> nodes = tm.findInfoByPid(id);
		
		if(nodes!=null && nodes.size()>0){
			list = new ArrayList<>();
			TreeNode tree = null;
			for(Map<String,Object> node:nodes){
				tree = new TreeNode();
				tree.setId(node.get("id").toString());
				tree.setText(node.get("name")==null?"":node.get("name").toString());
				
				//判断当前节点下是否还有子节点
				long l = tm.findCountByPid(node.get("id").toString());
				String state = "open";
				if(l>0){
					state="closed";
				}
				tree.setState(state);
				Map<String,Object> m = new HashMap<String,Object>();
				m.put("url", node.get("url").toString());
				tree.setAttributes(m);
					
				list.add(tree);
				
			}
		}
		
		return list;
	}
	
	/**
	 * page   当前页
	 * rows  每页记录数
	 * */
	
	@RequestMapping("/getAllPage")
	@ResponseBody
	public Map<String,Object> getallpage(Integer page,Integer rows){
		
		PageHelper.startPage(page,rows);
		List<Map<String,Object>> list = tm.findAll();
		PageInfo<Map<String,Object>> pi = new PageInfo<>(list);
		
		Map<String,Object> result = new HashMap<>();
		result.put("total",pi.getTotal());
		result.put("rows",list);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
