package com.atguigu.server;

import javax.jws.WebService;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;

@WebService
public interface UserServer {
	
	T_MALL_USER_ACCOUNT getUser(T_MALL_USER_ACCOUNT user);
	
}
