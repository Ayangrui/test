package com.etoak.models.user.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.commons.utils.JsonResult;
import com.etoak.commons.utils.TreeNode;
import com.etoak.models.role.bean.Role;
import com.etoak.models.system.service.LoginService;
import com.etoak.models.user.bean.User;
import com.etoak.models.user.mapper.UserMapper;
import com.etoak.models.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService us;
	
	@Autowired
	private UserMapper um;
	
	@Autowired
	private LoginService ls;
	
	
	@RequestMapping(value="/role",method=RequestMethod.GET)
	public String role(){
		
		return "user/user-role";
	}
	
	@RequestMapping(value="/permissions",method=RequestMethod.GET)
	public String permissions(){
		
		return "user/user-permissions";
	}
	
	
	
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(){
		
		return "user/userlist";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(Integer page,Integer rows,User user){
		
		
		
		return us.findInfoByUserPage(page, rows, user);
		
	}
	
	//用户新增
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult add(User u,HttpSession hs){
		
		try {
			User uu = (User)hs.getAttribute("user");
			List<String> roleIds = uu.getRoleIds();
			List<Role> list = ls.findInfoByRoleIds(roleIds);
			if(list!=null&&list.size()>0){
				Role r = new Role();
				r.setName("管理员");
				if(!list.contains(r)){
					return new JsonResult(500,"权限不足,无法进行添加!");
				}
			}
			
			
			u.setId(UUID.randomUUID().toString());
			//密码MD5加密
			u.setPassword(DigestUtils.md5DigestAsHex(u.getPassword().getBytes()));
			u.setCreateTime(new Date());
			int result = us.add(u);
			if(result>=1){
				return new JsonResult(200,"添加成功,请牢记您的账号:"+u.getUsername());
			}
			return new JsonResult(500,"添加失败");
		}catch(RuntimeException ex){
			return new JsonResult(500,ex.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(500,e.getMessage());
		}
	}
	
	@RequestMapping(value="/add-update",method=RequestMethod.GET)
	public String addupdate(String userId,Model m){
		//新增时ID为空  刷新时ID不能为空
		if(StringUtils.isNotBlank(userId)){
			User u = us.findUserByPrimaryKey(userId);
			m.addAttribute("u",u);
		}
		
		return "user/user-add-update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult update(User user,HttpSession hs){
		try {
			
			User uu = (User)hs.getAttribute("user");
			List<String> roleIds = uu.getRoleIds();
			List<Role> list = ls.findInfoByRoleIds(roleIds);
			if(list!=null&&list.size()>0){
				Role r = new Role();
				r.setName("管理员");
				if(!list.contains(r)){
					return new JsonResult(500,"权限不足,无法进行修改!");
				}
			}
			
			int result = us.update(user);
			if(result>=1){
				return new JsonResult(200,"信息修改成功!");
			}
			return new JsonResult(500,"信息修改失败!");
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(500,e.getMessage());
		}
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public JsonResult del(String ids,HttpSession hs){
		
		User u = (User)hs.getAttribute("user");
		List<String> roleIds = u.getRoleIds();
		List<Role> list = ls.findInfoByRoleIds(roleIds);
		if(list!=null&&list.size()>0){
			Role r = new Role();
			r.setName("管理员");
			if(!list.contains(r)){
				return new JsonResult(500,"权限不足,无法进行删除!");
			}
		}
		
		String[] s = ids.split(",");
		
		for(String ss : s){
			List<String> l = um.findRoleByUserId(ss);
			if(l.contains("1")){
				return new JsonResult(500,"管理员账户不可被删除");
			}
			
			if(!"".equals(ss)){
				int r = us.deleteUser(ss);
				if(r>0){
					return new JsonResult(200,"删除成功");
				}
				return new JsonResult(500,"删除失败");
			}
		}
		return new JsonResult(200,null);
	}
	
	@RequestMapping(value="/query",method=RequestMethod.GET)
	public String query(){
		
		return "user/user-query";
	}
	
	@RequestMapping(value="getRole",method=RequestMethod.GET)
	public String getRole(String userId,Model m){
		m.addAttribute("userId",userId);
		return "user/user-role-tree";
	}
	
	@RequestMapping(value="getRoleTree",method=RequestMethod.POST)
	@ResponseBody
	public List<TreeNode> getRoleTree(String userId){
		
		return us.getRoleTree(userId);
	}
	
	/*
	 * userId : 用户Id
	 * roleIds : 角色Id
	 * */
	@RequestMapping(value="/allotRole/{userId}",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult allotRole(
			@PathVariable String userId,
			@RequestBody List<String> roleIds,HttpSession hs){
		
		try {
			
			User uu = (User)hs.getAttribute("user");
			List<String> list0 = uu.getRoleIds();
			List<Role> list = ls.findInfoByRoleIds(list0);
			if(list!=null&&list.size()>0){
				Role r = new Role();
				r.setName("管理员");
				if(!list.contains(r)){
					return new JsonResult(500,"权限不足,无法进行角色分配!");
				}
			}
			
			
			us.allotRole(userId, roleIds);
			return new JsonResult(200,"用户分配角色成功!");
		} catch (RuntimeException e) {
			return new JsonResult(500,e.getMessage());
		}catch(Exception ex){
			return new JsonResult(500,ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="/zhuce",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult zhuce(User u,HttpSession hs){
		
		try {
			u.setId(UUID.randomUUID().toString());
			//密码MD5加密
			u.setPassword(DigestUtils.md5DigestAsHex(u.getPassword().getBytes()));
			u.setCreateTime(new Date());
			int result = us.add(u);
			if(result>=1){
				return new JsonResult(200,"注册成功");
			}
			return new JsonResult(500,"注册失败");
		}catch(RuntimeException ex){
			return new JsonResult(500,ex.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(500,e.getMessage());
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
