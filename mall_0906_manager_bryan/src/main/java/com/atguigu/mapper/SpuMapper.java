package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuMapper {

	void insert_product(T_MALL_PRODUCT product);

	void insert_image(Map<String, Object> map);

	List<T_MALL_PRODUCT> selectspu(Map<String, Object> map);

	List<T_MALL_PRODUCT> selectProducts(Map<String, Object> map);

}
