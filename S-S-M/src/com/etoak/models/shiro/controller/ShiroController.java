package com.etoak.models.shiro.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.web.bind.annotation.RequestMapping;



public class ShiroController {
/*
	 @RequestMapping("/login")
	    public String login(HttpServletRequest request)throws Exception{

	        //如果登录失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定名
	        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
	        if(exceptionClassName!=null){
	            if(UnknownAccountException.class.getName().equals(exceptionClassName)){
	                throw new CustomException("账号不存在");
	            }else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)){
	                throw new CustomException("用户名或密码错误");
	            }else {
	                throw new Exception();//最终在异常处理器生成未知错误
	            }
	        }
	        //此方法不处理登录成功(认证成功)，shiro认证成功会自动跳转到上一个请求路径。
	        //登录失败还到login页面
	        return "login";
	    }*/
	 
}