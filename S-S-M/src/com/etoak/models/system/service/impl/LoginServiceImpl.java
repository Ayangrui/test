package com.etoak.models.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoak.models.permissions.bean.Permissions;
import com.etoak.models.permissions.mapper.PermissionsMapper;
import com.etoak.models.role.bean.Role;
import com.etoak.models.role.mapper.RoleMapper;
import com.etoak.models.system.service.LoginService;
import com.etoak.models.user.bean.User;
import com.etoak.models.user.mapper.UserMapper;
@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private UserMapper um;
	@Autowired
	private RoleMapper rm;
	@Autowired
	private PermissionsMapper pm;
	
	@Override
	public User getUsername(String username) {

		User u = um.getUsername(username);
		
		return u;
	}

	@Override
	public List<String> findRoleByUserId(String userId) {
		List<String> list = um.findRoleByUserId(userId);
		return list;
	}

	@Override
	public List<Role> findInfoByRoleIds(List<String> roleIds) {
		
		List<Role> list = rm.findInfoByRoleIds(roleIds);
		
		return list;
	}

	@Override
	public List<Permissions> getPermAll(String id) {
		List<Permissions> list = pm.getPermAll(id);
		
		return list;
	}

	@Override
	public List<Permissions> getPermByRole(Map<String, Object> map) {
		List<Permissions> list = pm.getPermByRole(map);
		return list;
	}

}
