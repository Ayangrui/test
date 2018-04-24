package com.etoak.models.user.service;

import java.util.List;
import java.util.Map;

import com.etoak.commons.utils.TreeNode;
import com.etoak.models.user.bean.User;

public interface UserService {
	int add(User user);
	
	/*List<User> query();*/
	
	Map<String,Object> findInfoByUserPage(Integer page,Integer rows,User user);
	
	User findUserByPrimaryKey(String id);
	
	//修改信息接口
	int update(User user);
		
	int deleteUser(String id);

	//获取角色 树状显示
	List<TreeNode> getRoleTree(String userId);
	
	//用户分配角色
	void allotRole(String userId,List<String> roles);
		
}
