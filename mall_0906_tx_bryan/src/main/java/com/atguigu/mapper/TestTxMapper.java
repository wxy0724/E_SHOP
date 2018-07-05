package com.atguigu.mapper;

import com.atguigu.bean.T_MALL_ORDER_INFO;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;

public interface TestTxMapper {

	long select_kc_for_update(int sku_id);

	void update_kc(T_MALL_ORDER_INFO t_MALL_ORDER_INFO);
}
