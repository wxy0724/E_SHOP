package com.xyz.controller;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xyz.bean.OBJECT_T_MALL_FLOW;
import com.xyz.bean.OBJECT_T_MALL_ORDER;
import com.xyz.bean.T_MALL_ADDRESS;
import com.xyz.bean.T_MALL_ORDER_INFO;
import com.xyz.bean.T_MALL_SHOPPINGCAR;
import com.xyz.bean.T_MALL_USER_ACCOUNT;
import com.xyz.service.AddressService;
import com.xyz.service.OrderService;
import com.xyz.service.ShoppingCartServiceInf;

@Controller
@SessionAttributes("order")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ShoppingCartServiceInf shoppingCartServiceInf;
	
	@Autowired
	AddressService addressService;
	
	@RequestMapping("/check_order")
	public String check_order(HttpSession session,ModelMap map) {
		
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<>();
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_ADDRESS> list_address = addressService.get_addresses_by_user_id(user);
		if (user==null) {
			return "redirect:/login.jsp";
		}else {
			OBJECT_T_MALL_ORDER order = new OBJECT_T_MALL_ORDER();
			order.setYh_id(user.getId());
			order.setJdh(0);
			list_cart = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
			order.setZje(get_sum(list_cart));
			if (list_cart==null || list_cart.size()==0) {
				//去数据库中查找
				
			}else {
				//拆单，根据实际业务拆单
				Set<String> set_kcdz = new HashSet<>();
				for (int i = 0; i < list_cart.size(); i++) {
					//根据库存地址确定拆单个数
					set_kcdz.add(list_cart.get(i).getKcdz());
				}
				//循环库存地址，将订单中的商品数据按照库存地址放入库存包裹
				List<OBJECT_T_MALL_FLOW> list_flow = new ArrayList<>();
				Iterator<String> iterator = set_kcdz.iterator();
				while(iterator.hasNext()) {
					String kcdz = iterator.next();
					
					//每个地址对应一个包裹
					OBJECT_T_MALL_FLOW flow = new OBJECT_T_MALL_FLOW();
					flow.setPsfsh("千里送人头");
					flow.setMqdd("商品未出库");
					flow.setYh_id(user.getId());
					List<T_MALL_ORDER_INFO> list_info = new ArrayList<>();
					T_MALL_ORDER_INFO info = new T_MALL_ORDER_INFO();
					//循环购物车
					for (int i = 0; i < list_cart.size(); i++) {
						if (list_cart.get(i).getShfxz().equals("1") && list_cart.get(i).getKcdz().equals(kcdz)) {
							info.setGwch_id(list_cart.get(i).getId());
							info.setShp_tp(list_cart.get(i).getShp_tp());
							info.setSku_id(list_cart.get(i).getSku_id());
							info.setSku_jg(list_cart.get(i).getSku_jg());
							info.setSku_mch(list_cart.get(i).getSku_mch());
							info.setSku_shl(list_cart.get(i).getTjshl());
							list_info.add(info);
						}
					}
					//商品信息放入包裹中
					flow.setInfo_list(list_info);
					//物流包裹放到集合中
					list_flow.add(flow);
				}
				//将库存包裹放入订单
				order.setList_flow(list_flow);
			}
			map.put("order", order);
			map.put("address_list", list_address);
			//游离态数据，并不会持久化
			return "sale_check_order";
		}
	}
	
	@RequestMapping("/save_order")
	public String save_order(ModelMap map,HttpSession session ,int address_id ,@ModelAttribute("order")OBJECT_T_MALL_ORDER order) {
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		order.setDzh_id(address_id);
		//保存订单业务
		T_MALL_ADDRESS address = addressService.get_addresses_by_id(address_id);
		orderService.save_order(order,address);
		//重新同步购物车session
		session.setAttribute("list_cart_session", shoppingCartServiceInf.get_shopping_cart(user));
		return "redirect:/goto_pay.do";
	}
	
	@RequestMapping("/goto_pay")
	public String goto_pay() {
		//调用支付服务返回的页面
		return "sale_pay";
	}
	
	@RequestMapping("/pay_after")
	public String pay_after(@ModelAttribute("order")OBJECT_T_MALL_ORDER order) {
		//支付成功后调用订单通知业务
		try {
			orderService.pay_order(order);
		} catch (Exception e) {
			e.printStackTrace();
			return "sale_fail";
		}
		return "sale_success";
	}
	
	
	public BigDecimal get_sum(List<T_MALL_SHOPPINGCAR> ShoppingCart_list) {
		BigDecimal sum = new BigDecimal("0");
		if (ShoppingCart_list == null || ShoppingCart_list.size() == 0) {

		} else {
			for (int i = 0; i < ShoppingCart_list.size(); i++) {
				if (ShoppingCart_list.get(i).getShfxz().equals("1")) {
					sum = sum.add(new BigDecimal("" + ShoppingCart_list.get(i).getHj()));
				}
			}
		}
		return sum;
	}
	
}
