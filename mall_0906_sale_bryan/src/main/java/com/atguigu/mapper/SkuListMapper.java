package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.DETAIL_T_MALL_SKU;
import com.atguigu.bean.MODEL_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU;

public interface SkuListMapper {

	List<MODEL_T_MALL_SKU> select_sku_list_by_class2(int flbh2);

	List<MODEL_T_MALL_SKU> select_sku_list_by_attr(Map<String, Object> map);

	DETAIL_T_MALL_SKU select_sku_detail(int sku_id);

	List<T_MALL_SKU> select_sku_list_by_spu_id(int spu_id);


}
