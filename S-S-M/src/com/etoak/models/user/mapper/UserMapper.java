package com.etoak.models.user.mapper;

import java.util.List;
import java.util.Map;

import com.etoak.models.user.bean.User;


public interface UserMapper {
	
	//添加用户
	int add(User user);
	
	//带有条件查询所有
	List<User> selectAll(Map<String,Object> map);
	
	//根据username查询对应信息
	User getUsername(String username);
	
	//通过用户ID查找对应的角色
	List<String> findRoleByUserId(String userId);
	
	//根据id查询主键
	User findUserByPrimaryKey(String id);
	
	//修改信息接口
	int update(User user);
	
	//根据id删除用户
	int deleteUser(String id);
	
	//通过用户id删除角色
	int delRolesByUserId(String userId);
	
	//用户分配角色
	//userId 用户id
	//roles 角色id
	int addUserRoles(Map<String,Object> map);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
