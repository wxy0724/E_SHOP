package com.xyz.mapper;

import java.util.List;

import com.xyz.bean.T_MALL_SHOPPINGCAR;
import com.xyz.bean.T_MALL_USER_ACCOUNT;

public interface ShoppingCartMapper {

	void insertShoppingCart(T_MALL_SHOPPINGCAR cart);

	void updateShoppingCart(T_MALL_SHOPPINGCAR cart);
	
	List<T_MALL_SHOPPINGCAR> select_shopping_cart(T_MALL_USER_ACCOUNT user);

}
