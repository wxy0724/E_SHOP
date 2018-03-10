package com.xyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyz.bean.T_MALL_SHOPPINGCAR;
import com.xyz.bean.T_MALL_USER_ACCOUNT;
import com.xyz.mapper.ShoppingCartMapper;
@Service
public class ShoppingCartServiceImpl implements ShoppingCartServiceInf{

	@Autowired
	ShoppingCartMapper shoppingCartMapper;
	
	@Override
	public void addShoppingCart(T_MALL_SHOPPINGCAR cart) {
		shoppingCartMapper.insertShoppingCart(cart);
	}

	@Override
	public void updateShoppingCart(T_MALL_SHOPPINGCAR cart) {
		shoppingCartMapper.updateShoppingCart(cart);
	}

	@Override
	public List<T_MALL_SHOPPINGCAR> get_shopping_cart(T_MALL_USER_ACCOUNT user) {
		return shoppingCartMapper.select_shopping_cart(user);
	}

}
