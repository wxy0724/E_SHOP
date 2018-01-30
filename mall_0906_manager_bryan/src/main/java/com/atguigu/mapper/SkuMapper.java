package com.atguigu.mapper;

import java.util.Map;

import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuMapper {

	void insertSku(T_MALL_SKU t_mall_sku);

	void insertsku_attr(Map<String,Object> map);


}
