package com.atguigu.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.atguigu.bean.OBJECT_T_MALL_FLOW;
import com.atguigu.bean.OBJECT_T_MALL_ORDER;
import com.atguigu.bean.T_MALL_ADDRESS;
import com.atguigu.bean.T_MALL_FLOW;
import com.atguigu.bean.T_MALL_ORDER_INFO;
import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.server.AddressServer;
import com.atguigu.service.OrderServiceInf;
import com.atguigu.service.ShoppingCartServiceInf;

@Controller
@SessionAttributes("order")
public class OrderController {
	
	@Autowired
	AddressServer addressServer;
	
	@Autowired
	OrderServiceInf orderServiceInf;
	
	@Autowired
	ShoppingCartServiceInf shoppingCartServiceInf;
	
	@RequestMapping("/check_order")
	public String check_order(ModelMap map,HttpSession session) {
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		//拿到购物车
		List<T_MALL_SHOPPINGCAR> list_cart = (List<T_MALL_SHOPPINGCAR>)session.getAttribute("list_cart_session");
		BigDecimal sum = get_sum(list_cart);
		
		OBJECT_T_MALL_ORDER order = new OBJECT_T_MALL_ORDER();
		
		
		Set<String> set_kcdz = new HashSet<>();
		
		if (user == null) {
			return "redirect:/goto_login.do";
		}else {
			
			order.setJdh(0);
			order.setYh_id(user.getId());
			order.setZje(sum);
			
			//发货地址去重
			for (int i = 0; i < list_cart.size(); i++) {
				set_kcdz.add(list_cart.get(i).getKcdz());
			}
			
			//遍历库存地址
			Iterator<String> iterator = set_kcdz.iterator();
			
			List<OBJECT_T_MALL_FLOW> list_flow = new ArrayList<>();
			while (iterator.hasNext()) {
				//获取存入set中的库存地址
				String kcdz = iterator.next();
				
				OBJECT_T_MALL_FLOW flow = new OBJECT_T_MALL_FLOW();
				flow.setPsfsh("尚硅谷人肉送达");
				flow.setYh_id(user.getId());
				flow.setMqdd("商品未出库");		
				
				List<T_MALL_ORDER_INFO> list_info = new ArrayList<>();
				//遍历购物车，将信息存储到order_info对象，将order_info对象add到list
				for (int i = 0; i < list_cart.size(); i++) {
					if (list_cart.get(i).getShfxz().equals("1") && list_cart.get(i).getKcdz().equals(kcdz)) {
						T_MALL_ORDER_INFO info = new T_MALL_ORDER_INFO();
						info.setSku_id(list_cart.get(i).getSku_id());
						info.setSku_mch(list_cart.get(i).getSku_mch());
						info.setShp_tp(list_cart.get(i).getShp_tp());
						info.setSku_jg(list_cart.get(i).getSku_jg());
						info.setSku_shl(list_cart.get(i).getTjshl());
						info.setSku_kcdz(kcdz);
						info.setGwch_id(list_cart.get(i).getId());
						
						list_info.add(info);
					}
				}
				//将订单信息放入包裹中
				flow.setInfo_list(list_info);
				list_flow.add(flow);
			}
			order.setList_flow(list_flow);;
		}
		
		List<T_MALL_ADDRESS> address_list = addressServer.get_addresses_by_user_id(user);
		map.put("address_list", address_list);
		map.put("order", order);
		return "order/sale_check_order";
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
	
	@RequestMapping("/save_order")
	public String save_order(HttpSession session,int address_id,@ModelAttribute("order")OBJECT_T_MALL_ORDER order) {
		
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT)session.getAttribute("user");
		
		T_MALL_ADDRESS address = addressServer.get_addresses_by_id(address_id);
		
		//持久化订单信息
		orderServiceInf.save_save_order(order,address);
		
		//更新session
		List<T_MALL_SHOPPINGCAR> list_cart = shoppingCartServiceInf.get_shopping_cart(user);
		session.setAttribute("list_cart_session", list_cart);
		
		return "redirect:goto_pay.do";
	}
	
	@RequestMapping("/goto_pay")
	public String goto_pay() {
		
		return "order/sale_pay";
	}
	
	@RequestMapping("/pay_after")
	public String pay_after(@ModelAttribute("order") OBJECT_T_MALL_ORDER order) {
		
		try {
			orderServiceInf.pay_order(order);
		} catch (Exception e) {
			e.printStackTrace();
			return "order/pay_error";
		}
		
		return "order/pay_success";
	}
	
	@RequestMapping("order_notify")
	public String order_notify(String trade_no, HttpServletResponse response) {
		try {
			response.getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("order_success")
	public String order_success(String trade_no, ModelMap map) {
		try {
			trade_no = new String(trade_no.getBytes("iso8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("trade_no", trade_no);
		return "order_success";
	}
	
}
