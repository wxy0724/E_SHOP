package com.xyz.mapper;

import java.util.List;

import com.xyz.bean.DETAIL_T_MALL_SKU;
import com.xyz.bean.MODEL_T_MALL_SKU;
import com.xyz.bean.T_MALL_SKU;

public interface SkuListMapper {

	public List<MODEL_T_MALL_SKU> select_sku_list_by_class_id_2(int flbh2);

	public DETAIL_T_MALL_SKU select_sku_detail(int sku_id);

	public List<T_MALL_SKU> select_sku_list_by_spu_id(int spu_id);

}
