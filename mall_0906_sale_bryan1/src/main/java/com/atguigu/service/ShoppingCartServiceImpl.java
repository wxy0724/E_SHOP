package com.atguigu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.mapper.SHOPPINGCARMapper;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartServiceInf {
	
	@Autowired
	SHOPPINGCARMapper  shoppingcarMapper;
	
	@Override
	public List<T_MALL_SHOPPINGCAR> get_shopping_cart(T_MALL_USER_ACCOUNT loginuser) {
		return shoppingcarMapper.select_shopping_cart(loginuser);
	}

	@Override
	public int addShoppingCart(T_MALL_SHOPPINGCAR cart) {
		return shoppingcarMapper.insertShoppingCart(cart);
	}

	@Override
	public int updateShoppingCart(T_MALL_SHOPPINGCAR t_MALL_SHOPPINGCAR) {
		return shoppingcarMapper.updateShoppingCart(t_MALL_SHOPPINGCAR);
	}

}
