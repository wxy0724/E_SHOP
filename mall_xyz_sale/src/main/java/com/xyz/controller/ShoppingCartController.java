package com.xyz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xyz.bean.T_MALL_SHOPPINGCAR;
import com.xyz.bean.T_MALL_USER_ACCOUNT;
import com.xyz.service.ShoppingCartServiceInf;
import com.xyz.util.MyJsonUtil;

@Controller
public class ShoppingCartController {

	@Autowired
	ShoppingCartServiceInf shoppingCartServiceInf;
	
	@RequestMapping("/add_cart")
	public String add_cart(HttpSession session,T_MALL_SHOPPINGCAR cart,HttpServletResponse response,
			@CookieValue(value = "list_cart_cookie",required=false)String list_cart_cookie) {
		
		//调用购物车添加功能
		//判断用户是否登录
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<T_MALL_SHOPPINGCAR>();
		if (user == null) {
			//判断cookie是否为空，说明购物车是空的
			if (list_cart_cookie == null || list_cart_cookie.equals("")) {
				//添加购物车
				list_cart.add(cart);
				
			}else {
				//cookie不为空，需要查看购物车内是否包含改商品
				list_cart = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
				
				if(if_new_cart(list_cart,cart)) {
					//购物车内没有，添加购物车
					list_cart.add(cart);
				}else {
					//购物车内有该商品，更新商品数量
					for (T_MALL_SHOPPINGCAR t_MALL_SHOPPINGCAR : list_cart) {
						if (t_MALL_SHOPPINGCAR.getSku_id() == cart.getSku_id()) {
							t_MALL_SHOPPINGCAR.setTjshl(t_MALL_SHOPPINGCAR.getTjshl()+cart.getTjshl());
							t_MALL_SHOPPINGCAR.setHj(t_MALL_SHOPPINGCAR.getSku_jg() * t_MALL_SHOPPINGCAR.getTjshl());
						}
					}
				}
			}
			//覆盖Cookie
			Cookie cookie = new Cookie("list_cart_cookie", MyJsonUtil.list_to_json(list_cart));
			cookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(cookie);
			//合并购物车
			merge_cart(user);
			
		}else {
			//已登录
			list_cart = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
			if (list_cart == null || list_cart.size() == 0) {
				//session中沒有,同步DB
				shoppingCartServiceInf.addShoppingCart(cart);
				list_cart = new ArrayList<>();
				list_cart.add(cart);
				session.setAttribute("list_cart_session", list_cart);
			}else {
				if (if_new_cart(list_cart, cart)) {
					//购物车内不包含该商品
					shoppingCartServiceInf.addShoppingCart(cart);
					list_cart.add(cart);
					session.setAttribute("list_cart_session", list_cart);
				}else {
					//购物车内包含该商品，修改
					for (int i = 0; i < list_cart.size(); i++) {
						if (list_cart.get(i).getSku_id()==cart.getSku_id()) {
							int tjshl = list_cart.get(i).getTjshl();
							list_cart.get(i).setTjshl(tjshl+1);
							list_cart.get(i).setHj(list_cart.get(i).getTjshl()*list_cart.get(i).getSku_jg());
							shoppingCartServiceInf.updateShoppingCart(list_cart.get(i));
						}
					}
				}
			}
		
		}
		return "sale_cart_success";
	}
	
	public void merge_cart(T_MALL_USER_ACCOUNT user){
		
	}
	
	/**
	 * 判断该购物车是否被添加
	 * @param list_cart
	 * @param cart
	 * @return
	 */
	public boolean if_new_cart(List<T_MALL_SHOPPINGCAR> list_cart,T_MALL_SHOPPINGCAR cart) {
		
		boolean b = true;
		for (T_MALL_SHOPPINGCAR t_MALL_SHOPPINGCAR : list_cart) {
			if (t_MALL_SHOPPINGCAR.getSku_id() == cart.getSku_id()) {
				b = false;
			}
		}
		return b;
	}
	
}
