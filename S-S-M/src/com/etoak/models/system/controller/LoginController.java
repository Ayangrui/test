package com.etoak.models.system.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.etoak.commons.utils.JsonResult;
import com.etoak.commons.utils.TreeNode;
import com.etoak.models.permissions.bean.Permissions;
import com.etoak.models.role.bean.Role;
import com.etoak.models.system.service.LoginService;
import com.etoak.models.user.bean.User;

@SessionAttributes(value={"user"})
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService ls;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult login(String username,String password,
			Model m){
		//通过username查询用户信息
		User u = ls.getUsername(username);
		if(u == null){
			return new JsonResult(0021,"当前账户不存在");
		}
		
		String pwd = DigestUtils.md5DigestAsHex(password.getBytes());
		/*if(!pwd.equals(u.getPassword())){
			return new JsonResult(0521,"密码错误");
		}*/
			
		if(pwd.equals(u.getPassword())){
			return new JsonResult(0521,"密码错误");	
		}
		
		
		//判断当前账户是否被冻结
		if(0 == u.getStatus()){
			return new JsonResult(0000,"当前账户已被冻结，详情请联系管理员");
		}
		
		u.setPassword(null);
		//通过用户ID获取角色信息
		List<String> list = ls.findRoleByUserId(u.getId());
		
		u.setRoleIds(list);
		
		m.addAttribute("user",u);
		
		return new JsonResult(200,null);
		
	}
	
	@RequestMapping("/paramissions")
	@ResponseBody
	public List<TreeNode> primissions(@RequestParam(value="id",defaultValue="0") String id,ModelMap m){
		List<TreeNode> trees = Collections.EMPTY_LIST;
		User u = (User)m.get("user");
		List<String> roleIds = u.getRoleIds();
		
		
		
		List<Role> list = ls.findInfoByRoleIds(roleIds);
		
		if(list!=null&&list.size()>0){
			Role r = new Role();
			r.setName("管理员");
			if(list.contains(r)){ //true为管理员
				//管理员查找所有权限
				List<Permissions> l = ls.getPermAll(id);
				trees = getParamTree(l);
			}else{
				Map<String,Object> attributes = new HashMap<>();
				attributes.put("list",roleIds);
				attributes.put("id",id);	
				List<Permissions> l = ls.getPermByRole(attributes);
				trees = getParamTree(l);
			}
		}
	
		
		
		return trees;
		
	}
	
	private List<TreeNode> getParamTree(List<Permissions> l){
		List<TreeNode> trees = Collections.EMPTY_LIST;
		if(l != null&&l.size()>0){
			trees = new ArrayList<>();
			TreeNode tree = null;
			for(Permissions p:l){
				tree = new TreeNode();
				tree.setId(p.getId());
				tree.setText(p.getName());
				tree.setState(p.getLeaf()==0?"closed":"open");
				Map<String,Object> map = new HashMap<>();
				map.put("pid",p.getPid());
				map.put("url",p.getUrl());
				tree.setAttributes(map);
				trees.add(tree);
			}
		}
		return trees;
	}
	
	@RequestMapping(value="/layout",method=RequestMethod.GET)
	public String layout(SessionStatus session){   //SessionStatus  spring提供的 用于销毁session
		
			//清空session
			session.setComplete();
		return "redirect:/";
	}
	@RequestMapping("/update")
	public String update(){
	
		return "user/user-add-update";
	}
	//跳转首页页面的Controlle层
	@RequestMapping("/index")
	public String index(){
		return "bookindex/index";
	}
		
	
	
	@Test
	public static void main(String[] args) {
		String pwd = DigestUtils.md5DigestAsHex("123".getBytes());
		System.out.println(pwd);
	}
}
