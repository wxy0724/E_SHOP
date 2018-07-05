package com.atguigu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.activemq.command.ActiveMQQueue;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.server.UserServer;
import com.atguigu.service.LoginServiceInf;
import com.atguigu.service.ShoppingCartServiceInf;
import com.atguigu.util.MyJsonUtil;
import com.atguigu.ws.TestWsInf;

@Controller
public class LoginController {

	@Autowired
	JmsTemplate jmsTemplate;
	
	@Autowired
	ActiveMQQueue queueDestination;
	
	@Autowired
	LoginServiceInf loginServiceInf;

	@Autowired
	ShoppingCartServiceInf shoppingcartServiceInf;

	@Autowired
	UserServer userServer;

	@Autowired
	TestWsInf testWsInf;

	@RequestMapping("/goto_out")
	public String goto_out(HttpSession session) {
		session.invalidate();
		return "sale_login";
	}

	@RequestMapping("/goto_login")
	public String goto_login() {
		return "sale_login";
	}

	@RequestMapping("/dologin")
	public String login(String dataSource_type, T_MALL_USER_ACCOUNT loginUser,
			@CookieValue(value = "list_cart_cookie", required = false) String list_cart_cookie, HttpSession session,
			HttpServletResponse response) {

		// 测试安全接口
		testWsInf.ping("安全测试");
		T_MALL_USER_ACCOUNT user = null;
		// 判断用户,调用webservice服务
		if (dataSource_type == null || dataSource_type.equals("1")) {
			user = userServer.login(loginUser);

		} else {
			user = userServer.login2(loginUser);

		}

		if (user == null) {
			return "redirect:/goto_login.do";
		} else {
			session.setAttribute("user", user);
			try {
				Cookie cookie = new Cookie("yh_nch", URLEncoder.encode(user.getYh_nch(), "utf-8"));
				// 设置cookie的存活事件
				cookie.setMaxAge(60 * 60 * 24);
				// 当@RequestMapping作用在类上是需要设置
				// cookie.setPath("/");
				response.addCookie(cookie);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		List<T_MALL_SHOPPINGCAR> list_cart_db = shoppingcartServiceInf.get_shopping_cart(user);
		merge_cart(list_cart_db, list_cart_cookie, user, response, session);

		// 加入消息队列中间件
		// 发送mq消息
		int userid = user.getId();
		String yhmch = user.getYh_mch(); 
		jmsTemplate.send(queueDestination, new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				return session.createTextMessage(userid+"user_"+ yhmch +",login");
			}
		});

		return "redirect:/index.do";
	}

	private void merge_cart(List<T_MALL_SHOPPINGCAR> list_shopping_cart_by_yhid, String list_cart_cookie,
			T_MALL_USER_ACCOUNT user, HttpServletResponse response, HttpSession session) {
		// 同步数据库
		// 判断DB
		List<T_MALL_SHOPPINGCAR> get_shopping_cart_by_yhid = shoppingcartServiceInf.get_shopping_cart(user);
		if (list_shopping_cart_by_yhid == null || list_shopping_cart_by_yhid.size() == 0) {
			// 购物车数据库没数据
			if (StringUtils.isBlank(list_cart_cookie)) {
				// cookie是否有数据 String==null 或者 .equles="" 时返回true
			} else {
				List<T_MALL_SHOPPINGCAR> list_cart = MyJsonUtil.json_to_list(list_cart_cookie,
						T_MALL_SHOPPINGCAR.class);
				for (int i = 0; i < list_cart.size(); i++) {
					shoppingcartServiceInf.addShoppingCart(list_cart.get(i));
				}
			}
		} else {
			// 购物车数据库有数据
			if (StringUtils.isBlank(list_cart_cookie)) {
				// cookie为空
				get_shopping_cart_by_yhid = shoppingcartServiceInf.get_shopping_cart(user);
			} else {
				List<T_MALL_SHOPPINGCAR> list_cart = MyJsonUtil.json_to_list(list_cart_cookie,
						T_MALL_SHOPPINGCAR.class);
				for (int i = 0; i < list_cart.size(); i++) {
					boolean b = if_new_cart(get_shopping_cart_by_yhid, list_cart.get(i));
					if (b) {
						list_cart.get(i).setYh_id(user.getId());
						shoppingcartServiceInf.addShoppingCart(list_cart.get(i));
					} else {
						list_cart.get(i).setYh_id(user.getId());
						shoppingcartServiceInf.updateShoppingCart(list_cart.get(i));
					}
				}
			}
		}
		// 清空cookie
		response.addCookie(new Cookie("list_cart_cookie", ""));
		session.setAttribute("list_cart_session", get_shopping_cart_by_yhid);
	}

	private boolean if_new_cart(List<T_MALL_SHOPPINGCAR> list_cart, T_MALL_SHOPPINGCAR cart) {
		boolean b = true;
		for (int i = 0; i < list_cart.size(); i++) {
			if (list_cart.get(i).getSku_id() == cart.getSku_id()) {
				return false;
			}
		}
		return b;
	}
}
