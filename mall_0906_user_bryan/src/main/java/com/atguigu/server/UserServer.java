package com.atguigu.server;

import javax.jws.WebService;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;

@WebService
public interface UserServer {
	//登录
	T_MALL_USER_ACCOUNT login(T_MALL_USER_ACCOUNT user);
	
	T_MALL_USER_ACCOUNT login2(T_MALL_USER_ACCOUNT user);
	
	String login3(T_MALL_USER_ACCOUNT user);
	
	//注册register
	int register(T_MALL_USER_ACCOUNT user);
	
	//查找
	T_MALL_USER_ACCOUNT selectUser(T_MALL_USER_ACCOUNT user);
}
