package com.xyz.service;

import com.xyz.bean.OBJECT_T_MALL_ORDER;
import com.xyz.bean.T_MALL_ADDRESS;
import com.xyz.exception.OverSaleException;

public interface OrderService {

	void save_order(OBJECT_T_MALL_ORDER order, T_MALL_ADDRESS address);

	void pay_order(OBJECT_T_MALL_ORDER order) throws OverSaleException;

}
