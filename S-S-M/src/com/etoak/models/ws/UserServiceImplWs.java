package com.etoak.models.ws;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoak.models.user.mapper.UserMapper;

@Service
@WebService
public class UserServiceImplWs implements UserServiceWs {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public String login(String username, String password) {
		//userMapper.login(username,password);
		System.out.println("服务器接收用户名 :"+username+"| 密码: "+password);
		return "用户名 :"+username+"| 密码: "+password;
	}

}
