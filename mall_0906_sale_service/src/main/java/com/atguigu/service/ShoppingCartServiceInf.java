package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;

public interface ShoppingCartServiceInf {

	List<T_MALL_SHOPPINGCAR> get_shopping_cart(T_MALL_USER_ACCOUNT loginuser);

	int addShoppingCart(T_MALL_SHOPPINGCAR cart);

	int updateShoppingCart(T_MALL_SHOPPINGCAR t_MALL_SHOPPINGCAR);

}
