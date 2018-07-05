package com.atguigu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.server.UserServer;

@Controller
public class UserController {
	
	@Autowired
	UserServer userServer;
	
	@RequestMapping("/doregister")
	public String doregister(HttpSession session,T_MALL_USER_ACCOUNT user) {
		
		userServer.register(user);
		T_MALL_USER_ACCOUNT loginuser = userServer.login2(user);
		System.out.println(loginuser);
		session.setAttribute("user", loginuser);
		return "redirect:/index.do";
	}
	
	
}
