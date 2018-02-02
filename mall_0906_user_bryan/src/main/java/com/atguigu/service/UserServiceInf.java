package com.atguigu.service;

import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;

public interface UserServiceInf {

	T_MALL_USER_ACCOUNT login(T_MALL_USER_ACCOUNT user);

	T_MALL_USER_ACCOUNT login2(T_MALL_USER_ACCOUNT user);

	int register(T_MALL_USER_ACCOUNT user);

}
