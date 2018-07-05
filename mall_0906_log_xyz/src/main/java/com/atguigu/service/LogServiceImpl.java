package com.atguigu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.mapper.LogMapper;

@Service
public class LogServiceImpl implements LogService {
	
	@Autowired
	LogMapper logMapper;
	
	@Override
	public void loginLog(String text) {
		logMapper.loginLog(text);
	}

}
