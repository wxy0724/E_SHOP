package com.xyz.service;

import java.util.List;

import com.xyz.bean.DETAIL_T_MALL_SKU;
import com.xyz.bean.MODEL_T_MALL_SKU;
import com.xyz.bean.T_MALL_SKU;
import com.xyz.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuListServiceInf {

	List<MODEL_T_MALL_SKU> get_sku_list_by_class_id_2(int flbh2);

	DETAIL_T_MALL_SKU get_sku_detail(int sku_id);

	List<T_MALL_SKU> get_sku_list_by_spu_id(int spu_id);

	List<MODEL_T_MALL_SKU> get_sku_list_by_attr(int flbh2, List<T_MALL_SKU_ATTR_VALUE> t_mall_sku_attr_val_list,
			String order);

}
