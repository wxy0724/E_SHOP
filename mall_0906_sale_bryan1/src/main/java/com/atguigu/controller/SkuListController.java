package com.atguigu.controller;


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

@Controller
public class SkuListController {
	
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
		//检索商品信息
		List<MODEL_T_MALL_SKU> sku_list = skuListServiceInf.get_sku_list_by_class2(flbh2);
		
		List<OBJECT_T_MALL_ATTR> attr_list = attrServiceInf.get_attr_by_class_2_id(flbh2);
		
		map.put("attr_list", attr_list);
		map.put("sku_list", sku_list);
		map.put("flbh2", flbh2);
		return "sale_sku_list";
	}
	
	@RequestMapping("/goto_sku_list_By_attr")
	public String goto_sku_list_By_attr(int flbh2 , ModelMap map , MODEL_T_MALL_SKU_ATTR_VALUE list_av) {
		 
		List<OBJECT_T_MALL_ATTR> attr_list = attrServiceInf.get_attr_by_class_2_id(flbh2);
		
		List<MODEL_T_MALL_SKU> sku_list = skuListServiceInf.get_sku_list_byattr(flbh2,list_av.getT_mall_sku_attr_val_list());
		
		map.put("attr_list", attr_list);
		map.put("sku_list", sku_list);
		
		return "sale_sku_list_inner";
	}
}
