package com.etoak.models.permissions.mapper;

import java.util.List;
import java.util.Map;

import com.etoak.models.permissions.bean.Permissions;

public interface PermissionsMapper {
	
	List<Permissions> getPermAll(String id);
	
	List<Permissions> getPermByRole(Map<String,Object> map);
	
}
