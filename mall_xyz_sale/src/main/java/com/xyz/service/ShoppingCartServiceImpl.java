package com.xyz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyz.bean.T_MALL_SHOPPINGCAR;
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

}
