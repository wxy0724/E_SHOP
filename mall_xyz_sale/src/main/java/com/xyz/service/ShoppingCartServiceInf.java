package com.xyz.service;

import java.util.List;

import com.xyz.bean.T_MALL_SHOPPINGCAR;
import com.xyz.bean.T_MALL_USER_ACCOUNT;

public interface ShoppingCartServiceInf {

	void addShoppingCart(T_MALL_SHOPPINGCAR cart);

	void updateShoppingCart(T_MALL_SHOPPINGCAR t_MALL_SHOPPINGCAR);

	List<T_MALL_SHOPPINGCAR> get_shopping_cart(T_MALL_USER_ACCOUNT user);

}
