package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.mapper.SkuMapper;
@Service
public class SkuServiceImpl implements SkuServiceInf {
	
	@Autowired
	SkuMapper skumapper;
	
	@Override
	public void save_sku(T_MALL_SKU t_mall_sku, MODEL_T_MALL_SKU_ATTR_VALUE t_mall_sku_list) {
		List<T_MALL_SKU_ATTR_VALUE> list = t_mall_sku_list.getT_mall_sku_attr_val_list();
		
		
		skumapper.insertSku(t_mall_sku);
		
		Map<String,Object> map = new HashMap<>();
		map.put("sku_id", t_mall_sku.getId());
		map.put("shp_id", t_mall_sku.getShp_id());
		map.put("list", list);
		
		skumapper.insertsku_attr(map);
	}

}
