package com.xyz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyz.bean.T_MALL_USER_ACCOUNT;
import com.xyz.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginServiceInf{
	
	@Autowired
	LoginMapper loginMapper;

	@Override
	public T_MALL_USER_ACCOUNT selectUser(T_MALL_USER_ACCOUNT user) {
		
		T_MALL_USER_ACCOUNT select_user = loginMapper.selectUser(user);
		
		return select_user;
	}

}
