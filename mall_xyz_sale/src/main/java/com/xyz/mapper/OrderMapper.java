package com.xyz.mapper;

import java.util.Map;

import com.xyz.bean.OBJECT_T_MALL_FLOW;
import com.xyz.bean.OBJECT_T_MALL_ORDER;
import com.xyz.bean.T_MALL_ORDER_INFO;

public interface OrderMapper {

	void insert_order(Map<Object, Object> order_map);

	void insert_flow(Map<Object, Object> flow_map);

	void insert_infos(Map<Object, Object> info_map);

	void delete_shoppingCart(Map<Object, Object> shoppingcart_map);

	long select_kc_for_update(int sku_id);

	int select_count(int sku_id);

	long select_kc(int sku_id);

	void update_kc(T_MALL_ORDER_INFO t_MALL_ORDER_INFO);

	void update_flow(OBJECT_T_MALL_FLOW object_T_MALL_FLOW);

	void update_order(OBJECT_T_MALL_ORDER order);

}
