package com.xyz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xyz.bean.DETAIL_T_MALL_SKU;
import com.xyz.bean.MODEL_T_MALL_SKU;
import com.xyz.bean.OBJECT_T_MALL_ATTR;
import com.xyz.bean.T_MALL_SKU;
import com.xyz.service.AttrService;
import com.xyz.service.SkuListServiceInf;

@Controller
public class SkuListController {

	@Autowired
	SkuListServiceInf skuListServiceInf;

	@Autowired
	AttrService attrService;

	@RequestMapping("/goto_sku_list")
	public String goto_sku_list(int flbh2, ModelMap map) {

		List<OBJECT_T_MALL_ATTR> list_attr = attrService.get_attr_by_flbh2(flbh2);

		List<MODEL_T_MALL_SKU> list_sku = skuListServiceInf.get_sku_list_by_class_id_2(flbh2);

		map.put("list_attr", list_attr);
		map.put("list_sku", list_sku);
		return "sale_sku_list";
	}

	@RequestMapping("/goto_sku_detail")
	public String goto_sku_detail(int spu_id, int sku_id, ModelMap map) {

		DETAIL_T_MALL_SKU obj_sku = skuListServiceInf.get_sku_detail(sku_id);

		List<T_MALL_SKU> list_sku = skuListServiceInf.get_sku_list_by_spu_id(spu_id);
		map.put("list_sku", list_sku);
		map.put("obj_sku", obj_sku);
	
		return "sale_search_detail";
	}

}
