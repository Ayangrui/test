package com.etoak.models.ws;

import javax.jws.WebService;

@WebService
public interface UserServiceWs {
	
	public String login(String username,String password);	
}
