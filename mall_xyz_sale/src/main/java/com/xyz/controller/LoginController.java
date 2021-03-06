package com.xyz.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xyz.bean.T_MALL_SHOPPINGCAR;
import com.xyz.bean.T_MALL_USER_ACCOUNT;
import com.xyz.service.LoginServiceInf;
import com.xyz.service.ShoppingCartServiceInf;

@Controller
public class LoginController {
	
	@Autowired
	JmsTemplate jmsTemplate;
	
	@Autowired
	ActiveMQQueue queueDestination;
	
	@Autowired
	LoginServiceInf loginServiceInf;
	
	@Autowired
	ShoppingCartServiceInf shoppingCartServiceInf;
	
	@RequestMapping("/gotoLogin")
	public String gotoLogin() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletResponse response,HttpSession session,T_MALL_USER_ACCOUNT user) {
		T_MALL_USER_ACCOUNT select_user = loginServiceInf.selectUser(user);
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<>();
		if (select_user == null) {
			return "gotoLogin";
		}else {
			session.setAttribute("user", select_user);
			list_cart = shoppingCartServiceInf.get_shopping_cart(select_user);
			session.setAttribute("list_cart_session", list_cart);
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
		//记录日志,发布服务
		/*int userid = user.getId();
		String yhmch = user.getYh_mch(); 
		jmsTemplate.send(queueDestination, new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				return session.createTextMessage(userid+"_user_"+ yhmch +",login");
			}
		});*/

		session.setAttribute("list_cart_session", list_cart);
		return "redirect:/index.do";
	}
	
}
