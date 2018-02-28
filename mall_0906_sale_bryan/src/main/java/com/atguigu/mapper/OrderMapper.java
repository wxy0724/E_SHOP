package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.OBJECT_T_MALL_FLOW;
import com.atguigu.bean.OBJECT_T_MALL_ORDER;
import com.atguigu.bean.T_MALL_ORDER_INFO;

public interface OrderMapper {

	void insert_order(Map<Object, Object> map);

	void insert_flow(Map<Object, Object> map1);

	void insert_infos(Map<Object, Object> map);

	void delete_shoppingCart(Map<Object, Object> shoppingcart_map);

	void update_order(OBJECT_T_MALL_ORDER order);

	void update_flow(OBJECT_T_MALL_FLOW object_T_MALL_FLOW);

	long select_kc(int sku_id);

	long select_kc_for_update(int sku_id);

	void update_kc(T_MALL_ORDER_INFO t_MALL_ORDER_INFO);

	int select_count(int sku_id);

}
