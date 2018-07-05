package com.atguigu.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.service.ShoppingCartServiceInf;
import com.atguigu.util.MyBigDecimalUtil;
import com.atguigu.util.MyJsonUtil;

@Controller
public class ShoppingCartController {
	
	@Autowired
	ShoppingCartServiceInf shoppingcartServiceInf;
	
	@RequestMapping("/change_cert_status")
	public String change_cert_status(HttpServletResponse response,int sku_id,String check,HttpSession session,ModelMap map,
			@CookieValue(value="list_cart_cookie",required=false)String list_cart_cookie) {
		T_MALL_USER_ACCOUNT loginuser = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_SHOPPINGCAR> ShoppingCart_list = new ArrayList<>();
		//判断登录状态
		if (loginuser==null) {
			//未登录 看cookie
			ShoppingCart_list = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
		}else {
			ShoppingCart_list = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
		}
		for (int i = 0; i < ShoppingCart_list.size(); i++) {
			if (ShoppingCart_list.get(i).getSku_id()==sku_id) {
				ShoppingCart_list.get(i).setShfxz(check);
				if (loginuser==null) {
					//更新cookie
					Cookie cookie = new Cookie("list_cart_cookie", MyJsonUtil.list_to_json(ShoppingCart_list));
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				}else {
					shoppingcartServiceInf.updateShoppingCart(ShoppingCart_list.get(i));
					
				}
			}
		}
		BigDecimal sum = get_sum(ShoppingCart_list);
		map.put("sum", sum);
		map.put("ShoppingCart_list", ShoppingCart_list);
		return "sale_cart_list_inner_by_yhid";
	}
	
	public BigDecimal get_sum(List<T_MALL_SHOPPINGCAR> ShoppingCart_list) {
		BigDecimal sum = new BigDecimal("0");
		if ( ShoppingCart_list==null || ShoppingCart_list.size()==0  ) {
			
		}else {
			for (int i = 0; i < ShoppingCart_list.size(); i++) {
				if (ShoppingCart_list.get(i).getShfxz().equals("1")) {
					sum = sum.add(new BigDecimal(""+ShoppingCart_list.get(i).getHj()));
				}
			}
		}
		return sum;
	}
	
	
	@RequestMapping("goto_shoppingcart")
	public String goto_shoppingcart(HttpSession session,ModelMap map,
			@CookieValue(value="list_cart_cookie",required=false)String list_cart_cookie) {
		T_MALL_USER_ACCOUNT loginuser = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_SHOPPINGCAR> ShoppingCart_list = new ArrayList<>();
		//判断登录状态
		if (loginuser==null) {
			//未登录 看cookie
			ShoppingCart_list = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
	
		}else {
			ShoppingCart_list = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
		}
		BigDecimal sum = get_sum(ShoppingCart_list);
		
		map.put("ShoppingCart_list", ShoppingCart_list);
		map.put("sum", sum);
		return "sale_ShoppingCart";
	}
	
	
	@RequestMapping("/get_MiniCart")
	public String get_MiniCart(HttpSession session,ModelMap map,
			@CookieValue(value="list_cart_cookie",required=false)String list_cart_cookie) {
		
		T_MALL_USER_ACCOUNT loginuser = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_SHOPPINGCAR> ShoppingCart_list = new ArrayList<>();
		//判断登录状态
		if (loginuser==null) {
			//未登录 看cookie
			ShoppingCart_list = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
		}else {
			ShoppingCart_list = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
		}
		BigDecimal sum = get_sum(ShoppingCart_list);
		map.put("sum", sum);
		map.put("ShoppingCart_list", ShoppingCart_list);
		return "minicart_list_inner";
	}
	
	
	@RequestMapping("/add_cart")
	public String add_cart(HttpSession session,@CookieValue(value="list_cart_cookie",required=false)String list_cart_cookie,
			T_MALL_SHOPPINGCAR cart,HttpServletResponse response) {
		//判断用户是否登录
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		ArrayList<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<>();
		if (user==null) {
			//用户未登录 操作cookie
			//判断cookie是否为空
			if (list_cart_cookie==null || list_cart_cookie.equals("")) {
				list_cart.add(cart);
			}else {
				//如果不为空，看是否是第一次添加该商品
				list_cart = (ArrayList<T_MALL_SHOPPINGCAR>) MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
				boolean b = if_new_cart(list_cart, cart);
				if (b) {
					list_cart.add(cart);
				}else {
					for (int i = 0; i < list_cart.size(); i++) {
						if (list_cart.get(i).getSku_id()==cart.getSku_id()) {
							int tjshl = list_cart.get(i).getTjshl();
							list_cart.get(i).setTjshl(tjshl+1);
							list_cart.get(i).setHj(list_cart.get(i).getTjshl()*list_cart.get(i).getSku_jg());
						}
					}
				}
			}
			Cookie cookie = new Cookie("list_cart_cookie", MyJsonUtil.list_to_json(list_cart));
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}else {
			//用户已登录 操作session
			list_cart = (ArrayList<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
			if (list_cart==null || list_cart.size()==0) {
				//没有购物车
				shoppingcartServiceInf.addShoppingCart(cart);
				list_cart = new ArrayList<>();
				list_cart.add(cart);
				session.setAttribute("list_cart_session", list_cart);
			}else {
				//有购物车 购物车内有没有该商品
				boolean b = if_new_cart(list_cart, cart);
				if (b) {
					shoppingcartServiceInf.addShoppingCart(cart);
					list_cart.add(cart);
				}else {
					for (int i = 0; i < list_cart.size(); i++) {
						if (list_cart.get(i).getSku_id()==cart.getSku_id()) {
							int tjshl = list_cart.get(i).getTjshl();
							list_cart.get(i).setTjshl(tjshl+1);
							list_cart.get(i).setHj(list_cart.get(i).getTjshl()*list_cart.get(i).getSku_jg());
							shoppingcartServiceInf.updateShoppingCart(list_cart.get(i));
						}
					}
				}
			}
		}
		
		return "success";
	}
	
	
/*	@RequestMapping("add_cart")
	public String add_cart(HttpServletResponse response,@CookieValue(value="list_cart_cookie",required=false)String list_cart_cookie ,
		T_MALL_SHOPPINGCAR cart,HttpSession session) {
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<T_MALL_SHOPPINGCAR>();
		if (user==null) {
			//未登录 操作cookie
			if (list_cart_cookie==null || list_cart_cookie.equals("")) {
				//cookie为空 之前没添加过
				list_cart.add(cart);
				System.out.println(cart.getTjshl());
				System.out.println("cookie为空 之前没添加过");
			}else {
				//是否是第一次添加
				list_cart = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
				boolean b = if_new_cart(list_cart, cart);
				if (b) {
					list_cart.add(cart);
					System.out.println(cart.getTjshl());
					System.out.println("cookie不为空 之前没添加过");
				}else {
					//cookie不为空 之前添加过
					for (int i = 0; i < list_cart.size(); i++) {
						if (list_cart.get(i).getShp_id()==cart.getShp_id()) {
							int tjshl = list_cart.get(i).getTjshl();
							list_cart.get(i).setTjshl(tjshl+1);
							list_cart.get(i).setHj(list_cart.get(i).getTjshl()*list_cart.get(i).getSku_jg());
							System.out.println(list_cart.get(i).getTjshl());
						}
					}
				}
			}
			
			Cookie cookie = new Cookie("list_cart_cookie", MyJsonUtil.list_to_json(list_cart));
			cookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(cookie);
			
		}else {
			//登录 操作session
			//int yh_id = user.getId();
			//List<T_MALL_SHOPPINGCAR> shopping_cart_list = shoppingcartServiceInf.get_shopping_cart(yh_id);
			list_cart = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
			if (list_cart==null || list_cart.size()==0) {
				shoppingcartServiceInf.addShoppingCart(cart);
				
				list_cart = new ArrayList<>();
				list_cart.add(cart);
				session.setAttribute("list_cart_session", list_cart);
			}else {
				boolean b = if_new_cart(list_cart, cart);
				if (b) {
					//旧车 没添加过
					shoppingcartServiceInf.addShoppingCart(cart);
					//同步session
					list_cart.add(cart);
				}else {
					//旧车 添加过
					for (int i = 0; i < list_cart.size(); i++) {
						if (list_cart.get(i).getSkp_id()==cart.getSkp_id()) {
							int tjshl = list_cart.get(i).getTjshl();
							list_cart.get(i).setTjshl(tjshl+1);
							list_cart.get(i).setHj(list_cart.get(i).getTjshl()*list_cart.get(i).getSku_jg());
							shoppingcartServiceInf.updateShoppingCart(list_cart.get(i));
						}
					}
				}
				
			}
		}
		return "success";
	}*/
	
	
	private boolean if_new_cart(List<T_MALL_SHOPPINGCAR> list_cart, T_MALL_SHOPPINGCAR cart) {
		boolean b = true;
		for (int i = 0; i < list_cart.size(); i++) {
			if (list_cart.get(i).getSku_id()==cart.getSku_id()) {
				return false;
			}
		}
		return b;
	}
	
}
