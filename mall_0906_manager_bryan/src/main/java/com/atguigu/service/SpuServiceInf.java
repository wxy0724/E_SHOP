package com.atguigu.service;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuServiceInf {


	void save_product_image(T_MALL_PRODUCT product, List<String> shp_tp);

	List<T_MALL_PRODUCT> getspu(Map<String, Object> map);

	List<T_MALL_PRODUCT> getProducts(Integer class1_id, Integer class2_id);


}
