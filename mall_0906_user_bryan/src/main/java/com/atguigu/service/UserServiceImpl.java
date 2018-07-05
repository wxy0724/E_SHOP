package com.atguigu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.mapper.UserMapper;
import com.atguigu.util.MyRoutingDataSource;

@Service
public class UserServiceImpl implements UserServiceInf {
	
	@Autowired
	UserMapper userMapper;

	@Override
	public T_MALL_USER_ACCOUNT login(T_MALL_USER_ACCOUNT user) {
		MyRoutingDataSource.setKey("1");
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		return userMapper.selectUser(user);
	}

	@Override
	public T_MALL_USER_ACCOUNT login2(T_MALL_USER_ACCOUNT user) {
		MyRoutingDataSource.setKey("2");
		return userMapper.selectUser(user);
	}

	@Override
	public int register(T_MALL_USER_ACCOUNT user) {
		MyRoutingDataSource.setKey("2");
		return userMapper.register(user);
	}

	@Override
	public T_MALL_USER_ACCOUNT selectUser(T_MALL_USER_ACCOUNT user) {
		return userMapper.selectUser(user);
	}
	
	

}
