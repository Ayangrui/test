package com.etoak.models.user.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.etoak.commons.utils.TreeNode;
import com.etoak.models.role.bean.Role;
import com.etoak.models.role.mapper.RoleMapper;
import com.etoak.models.user.bean.User;
import com.etoak.models.user.mapper.UserMapper;
import com.etoak.models.user.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private RoleMapper rm;
	 
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public int add(User user) {
		User u = userMapper.getUsername(user.getUsername());
		if(u!=null){
			throw new RuntimeException("哎呀!用户名被占用了!换一个吧");
		}
		
		int r = userMapper.add(user);
		return r;
	}

	/*@Override
	public List<User> query() {
		List<User> l = userMapper.selectAll();
		System.out.println(l);
		return l;
	}*/

	@Override
	public Map<String, Object> findInfoByUserPage(Integer page, Integer rows, User user) {
		PageHelper.startPage(page,rows);
		Map<String,Object> map = new HashMap<String,Object>();
		if(user.getUsername()!=null){
			map.put("username",user.getUsername());
		}else{
			map.put("username",null);
		}
		List<User> list = userMapper.selectAll(map);
		
		PageInfo<User> pi = new PageInfo<>(list);
		
		Map<String,Object> result = new HashMap<>();
		result.put("total",pi.getTotal());
		result.put("rows",list);
		return result;
	}
	
	//通过主键ID查找用户信息
	@Override
	public User findUserByPrimaryKey(String id) {
		User u = userMapper.findUserByPrimaryKey(id);
		return u;
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public int update(User user) {
		int r = userMapper.update(user);
		return r;
	}

	@Override
	public int deleteUser(String id) {
		int r = userMapper.deleteUser(id);
		return r;
	}

	@Override
	public List<TreeNode> getRoleTree(String userId) {
		List<TreeNode> list =  Collections.EMPTY_LIST;
		
		//获取状态为1的角色  1:表示激活
		List<Role> role = rm.getRoleTreeStatus("1");
		if(role!=null && role.size()>0){
			//获取用户有哪些角色
			List<String> userRole = 
					userMapper.findRoleByUserId(userId);
			
			list = new ArrayList<>();
			TreeNode tree = null;
			for(Role r : role){
				tree = new TreeNode();
				tree.setId(r.getId());
				tree.setText(r.getName());
				tree.setChecked(userRole.contains(r.getId()));
				
				list.add(tree);
			}
		}
		return list;
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void allotRole(String userId, List<String> roles) {
		//通过id删除角色
		userMapper.delRolesByUserId(userId);
		
		if(roles!=null && roles.size()>0){
			Map<String,Object> params = new HashMap<>();
			params.put("userId", userId);
			params.put("list",roles);
			//用户分配角色
			int r = userMapper.addUserRoles(params);
			if(r <= 0){
				throw new RuntimeException("该用户分配角色失败!");
			}
			
		}
	}
	
}

























