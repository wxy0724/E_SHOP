package com.xyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyz.bean.DETAIL_T_MALL_SKU;
import com.xyz.bean.MODEL_T_MALL_SKU;
import com.xyz.bean.T_MALL_SKU;
import com.xyz.mapper.SkuListMapper;

@Service
public class SkuListServiceImpl implements SkuListServiceInf{
	
	@Autowired
	SkuListMapper skuListMapper;
	
	@Override
	public List<MODEL_T_MALL_SKU> get_sku_list_by_class_id_2(int flbh2) {
		return skuListMapper.select_sku_list_by_class_id_2(flbh2);
	}

	@Override
	public DETAIL_T_MALL_SKU get_sku_detail(int sku_id) {
		return skuListMapper.select_sku_detail(sku_id);
	}

	@Override
	public List<T_MALL_SKU> get_sku_list_by_spu_id(int spu_id) {
		return skuListMapper.select_sku_list_by_spu_id(spu_id);
	}

}
