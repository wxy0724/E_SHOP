package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.OBJECT_T_MALL_FLOW;
import com.atguigu.bean.OBJECT_T_MALL_ORDER;
import com.atguigu.bean.T_MALL_ADDRESS;
import com.atguigu.bean.T_MALL_ORDER_INFO;
import com.atguigu.exception.OverSaleException;
import com.atguigu.mapper.OrderMapper;
import com.atguigu.util.MyTimeUtil;

@Service
public class OrderServiceImpl implements OrderServiceInf {

	@Autowired
	OrderMapper orderMapper;

	@Override
	public void save_save_order(OBJECT_T_MALL_ORDER order, T_MALL_ADDRESS address) {
		
		//添加订单
		Map<Object, Object> order_map = new HashMap<>();
		order.setJdh(1);
		order_map.put("order", order);
		order_map.put("address", address);
		orderMapper.insert_order(order_map);
		
		List<OBJECT_T_MALL_FLOW> list_flow = order.getList_flow();
		
		for (int i = 0; i < list_flow.size(); i++) {
			Map<Object, Object> flow_map = new HashMap<>();
			//list_flow.get(i).setDd_id(order.getId());
			list_flow.get(i).setMdd(address.getYh_dz());
			flow_map.put("flow", list_flow.get(i));
			flow_map.put("dd_id",order.getId());
			orderMapper.insert_flow(flow_map);
			
			List<T_MALL_ORDER_INFO> list_info = list_flow.get(i).getInfo_list();
			Map<Object, Object> info_map = new HashMap<>();
			info_map.put("list_info", list_info);
			info_map.put("dd_id", order.getId());
			info_map.put("flow_id", list_flow.get(i).getId());
			orderMapper.insert_infos(info_map);
			
				for (int j = 0; j < list_info.size(); j++) {
					Map<Object, Object> shoppingcart_map = new HashMap<>();
					shoppingcart_map.put("sku_id", list_info.get(j).getSku_id());
					shoppingcart_map.put("yh_id", order.getYh_id());
					orderMapper.delete_shoppingCart(shoppingcart_map);
				}
			}
		}
	
	@Override
	public void pay_order(OBJECT_T_MALL_ORDER order) throws OverSaleException {
		
		//修改订单状态
		List<OBJECT_T_MALL_FLOW> list_flow = order.getList_flow();
		
		//修改包裹状态
		for (int i = 0; i < list_flow.size(); i++) {
			List<T_MALL_ORDER_INFO> info_list = list_flow.get(i).getInfo_list();
			
			//修改库存信息
			for (int j = 0; j < info_list.size(); j++) {
				int sku_id = info_list.get(j).getSku_id();
				long kc = get_kc(sku_id);
				if (kc >= info_list.get(j).getSku_shl()) {
					orderMapper.update_kc(info_list.get(j));
				}else {
					throw new OverSaleException("Over Sale Exception");
				}
			}
			//修改包裹信息
			list_flow.get(i).setLxfsh("12312312313");
			list_flow.get(i).setPsshj(MyTimeUtil.getDate(3));// 物流接口
			list_flow.get(i).setPsmsh("商品正在出库");
			list_flow.get(i).setYwy("SEX兔女郎");
			orderMapper.update_flow(list_flow.get(i));
		}
		// 修改订单状态，预计送达时间
		order.setJdh(3);
		order.setYjsdshj(MyTimeUtil.getDate(3));
		orderMapper.update_order(order);
		
	}
	
	private long get_kc(int sku_id) {
		long kc = 0l;
		//判断库存是否足够
		int select_count = orderMapper.select_count(sku_id);
		//等于1 说明库存大于10件，不用加锁
		if (select_count == 1) {
			kc = orderMapper.select_kc(sku_id);
		}else {
			//不大于10说明库存不足，需要加锁防止超卖
			kc = orderMapper.select_kc_for_update(sku_id);
		}
		
		return kc;
	}
}