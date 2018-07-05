package com.atguigu.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.bean.DETAIL_T_MALL_SKU;
import com.atguigu.bean.MODEL_T_MALL_SKU;
import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.service.AttrServiceInf;
import com.atguigu.service.SkuListServiceInf;
import com.atguigu.util.MyCacheUtil;

//@Controller
public class SkuListController2 {
	
	@Autowired
	AttrServiceInf attrServiceInf;
	
	@Autowired
	SkuListServiceInf skuListServiceInf;
	
	
	@RequestMapping("goto_sku_detail")
	public String goto_sku_detail(int spu_id, int sku_id,ModelMap map) {
		
		DETAIL_T_MALL_SKU obj_sku = skuListServiceInf.get_sku_detail(sku_id);
		
		List<T_MALL_SKU> list_sku = skuListServiceInf.get_sku_list_by_spu_id(spu_id);
		map.put("list_sku", list_sku);
		map.put("obj_sku", obj_sku);
		return "sale_search_detial";
	}
	
	@RequestMapping("/goto_sku_list")
	public String goto_sku_list(int flbh2 , ModelMap map) {
		String key = "class_2_"+flbh2;
		List<MODEL_T_MALL_SKU> sku_list = new ArrayList<>();
		//检索缓存
		sku_list = MyCacheUtil.getMyListBykey(key, MODEL_T_MALL_SKU.class);
		if (sku_list==null || sku_list.size()==0) {
			//检索商品信息
			sku_list = skuListServiceInf.get_sku_list_by_class2(flbh2);
			//同步缓存
			MyCacheUtil.setMyListByKey(sku_list, key);
		}
		
		List<OBJECT_T_MALL_ATTR> attr_list = attrServiceInf.get_attr_by_class_2_id(flbh2);
		map.put("attr_list", attr_list);
		map.put("sku_list", sku_list);
		map.put("flbh2", flbh2);
		
		return "sale_sku_list";
	}
	
	@RequestMapping("/goto_sku_list_By_attr")
	public String goto_sku_list_By_attr(int flbh2 , ModelMap map , MODEL_T_MALL_SKU_ATTR_VALUE list_av,String order) {
		 
		List<OBJECT_T_MALL_ATTR> attr_list = attrServiceInf.get_attr_by_class_2_id(flbh2);
		
		List<MODEL_T_MALL_SKU> sku_list = skuListServiceInf.get_sku_list_by_attr(flbh2,list_av.getT_mall_sku_attr_val_list(),order);
		
		map.put("attr_list", attr_list);
		map.put("sku_list", sku_list);
		
		return "sale_sku_list_inner";
	}
}
