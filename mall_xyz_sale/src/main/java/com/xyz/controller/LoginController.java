package com.xyz.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xyz.bean.T_MALL_USER_ACCOUNT;
import com.xyz.service.LoginServiceInf;

@Controller
public class LoginController {
	
	@Autowired
	LoginServiceInf loginServiceInf;
	
	@RequestMapping("/gotoLogin")
	public String gotoLogin() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletResponse response,HttpSession session,T_MALL_USER_ACCOUNT user) {
		T_MALL_USER_ACCOUNT select_user = loginServiceInf.selectUser(user);
		
		if (select_user == null) {
			return "gotoLogin";
		}else {
			session.setAttribute("user", user);
			
			Cookie cookie;
			Cookie cookie2;
			try {
				cookie = new Cookie("yh_mch", URLEncoder.encode(user.getYh_mch(), "UTF-8"));
				cookie.setMaxAge(60 * 60 * 24);
				
				cookie2 = new Cookie("yh_nch", URLEncoder.encode("周杰伦", "UTF-8"));
				cookie2.setMaxAge(60 * 60 * 24);
				response.addCookie(cookie2);
				
				response.addCookie(cookie);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/index.do";
	}
	
}
