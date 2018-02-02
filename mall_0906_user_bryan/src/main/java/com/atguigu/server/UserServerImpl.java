package com.atguigu.server;

import javax.ws.rs.BeanParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.springframework.beans.factory.annotation.Autowired;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.service.UserServiceInf;
import com.google.gson.Gson;

public class UserServerImpl implements UserServer {

	@Autowired
	UserServiceInf userServiceInf;
	
	@Override
	public T_MALL_USER_ACCOUNT login(T_MALL_USER_ACCOUNT user) {
		return userServiceInf.login(user);
	}

	@Override
	public T_MALL_USER_ACCOUNT login2(T_MALL_USER_ACCOUNT user) {
		return userServiceInf.login2(user);
	}

	@Override
	@GET
	@Path("login3")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String login3(@BeanParam T_MALL_USER_ACCOUNT user) {
		return new Gson().toJson(user);
	}

	@Override
	public int register(T_MALL_USER_ACCOUNT user) {
		return userServiceInf.register(user);
	}
	

}
