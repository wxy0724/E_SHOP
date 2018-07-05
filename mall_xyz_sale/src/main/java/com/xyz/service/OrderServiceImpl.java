package com.xyz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyz.bean.OBJECT_T_MALL_FLOW;
import com.xyz.bean.OBJECT_T_MALL_ORDER;
import com.xyz.bean.T_MALL_ADDRESS;
import com.xyz.bean.T_MALL_ORDER_INFO;
import com.xyz.exception.OverSaleException;
import com.xyz.mapper.OrderMapper;
import com.xyz.util.MyTimeUtil;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderMapper;

	@Override
	public void save_order(OBJECT_T_MALL_ORDER order, T_MALL_ADDRESS address) {
		Map<Object, Object> order_map = new HashMap<>();
		order.setJdh(1);
		order_map.put("order", order);
		order_map.put("address", address);
		// 保存订单表，生成主键
		orderMapper.insert_order(order_map);
		// 循环保留物流包裹
		List<OBJECT_T_MALL_FLOW> list_flow = order.getList_flow();
		for (int i = 0; i < list_flow.size(); i++) {
			// 保留物流包裹
			Map<Object, Object> flow_map = new HashMap<>();
			flow_map.put("dd_id", order.getId());
			list_flow.get(i).setMdd(address.getYh_dz());
			flow_map.put("flow", list_flow.get(i));
			orderMapper.insert_flow(flow_map);
			// 根据物流id保存订单信息
			List<T_MALL_ORDER_INFO> info_list = list_flow.get(i).getInfo_list();
			Map<Object, Object> info_map = new HashMap<>();
			info_map.put("list_info", info_list);
			info_map.put("dd_id", order.getId());
			info_map.put("flow_id", list_flow.get(i).getId());
			orderMapper.insert_infos(info_map);
			// 根据保存的订单信息，删除购物车数据
			for (int j = 0; j < info_list.size(); j++) {
				Map<Object, Object> shoppingcart_map = new HashMap<>();
				shoppingcart_map.put("sku_id", info_list.get(j).getSku_id());
				shoppingcart_map.put("yh_id", order.getYh_id());
				orderMapper.delete_shoppingCart(shoppingcart_map);
			}
		}
	}

	@Override
	public void pay_order(OBJECT_T_MALL_ORDER order) throws OverSaleException {
		// 修改订单状态
		List<OBJECT_T_MALL_FLOW> list_flow = order.getList_flow();
		for (int i = 0; i < list_flow.size(); i++) {
			//查询剩余sku数量
			List<T_MALL_ORDER_INFO> info_list = list_flow.get(i).getInfo_list();
			for (int j = 0; j < info_list.size(); j++) {
				int sku_id = info_list.get(j).getSku_id();
				long kc = get_kc(sku_id);
				
				if (kc > info_list.get(j).getSku_shl()) {
					//更新sku库，增加销量
					orderMapper.update_kc(info_list.get(i));
				}else {
					//sku数量不足，回滚订单，给出提示
					throw new OverSaleException("Over Sale");
				}
			}
			// 修改物流状态，生成物流包裹信息
			//生成物流包裹 的其他信息（配送时间、业务员和联系方式）
			list_flow.get(i).setLxfsh("138965741235");
			list_flow.get(i).setPsshj(MyTimeUtil.getDate(3));
			list_flow.get(i).setPsmsh("正在飞速送货！");
			list_flow.get(i).setYwy("鲍尔");
			orderMapper.update_flow(list_flow.get(i));
		}
		// 修改库存状态，预计送达时间
		order.setJdh(3);
		order.setYjsdshj(MyTimeUtil.getDate(3));//物流接口
		orderMapper.update_order(order);
	}
	
	public long get_kc(int sku_id) {
		int count = orderMapper.select_count(sku_id);
		long kc = 0l;
		if (count == 1) {
			kc = orderMapper.select_kc(sku_id);
		}else {
			kc = orderMapper.select_kc_for_update(sku_id);
		}
		return kc;
	}

}
