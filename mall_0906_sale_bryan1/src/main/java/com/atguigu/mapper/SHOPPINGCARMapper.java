package com.atguigu.mapper;

import java.util.List;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;

public interface SHOPPINGCARMapper {

	List<T_MALL_SHOPPINGCAR> select_shopping_cart(T_MALL_USER_ACCOUNT loginuser);

	int insertShoppingCart(T_MALL_SHOPPINGCAR cart);

	int updateShoppingCart(T_MALL_SHOPPINGCAR t_MALL_SHOPPINGCAR);

}
