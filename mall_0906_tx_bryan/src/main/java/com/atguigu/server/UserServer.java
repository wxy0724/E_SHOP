package com.atguigu.server;

import javax.jws.WebService;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;

@WebService
public interface UserServer {
	
	T_MALL_USER_ACCOUNT login(T_MALL_USER_ACCOUNT user);
	
	T_MALL_USER_ACCOUNT login2(T_MALL_USER_ACCOUNT user);
	
	T_MALL_USER_ACCOUNT login3(T_MALL_USER_ACCOUNT user);
	
	//注册
	int register(T_MALL_USER_ACCOUNT user);
	
}
