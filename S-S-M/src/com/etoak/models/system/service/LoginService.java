package com.etoak.models.system.service;

import java.util.List;
import java.util.Map;

import com.etoak.models.permissions.bean.Permissions;
import com.etoak.models.role.bean.Role;
import com.etoak.models.user.bean.User;

public interface LoginService {
	
	User getUsername(String username);
	
	//通过用户ID查找对应的角色
	List<String> findRoleByUserId(String userId);
	
	List<Role> findInfoByRoleIds(List<String> roleIds);
	
	List<Permissions> getPermAll(String id);
	
	List<Permissions> getPermByRole(Map<String,Object> map);
	
}
