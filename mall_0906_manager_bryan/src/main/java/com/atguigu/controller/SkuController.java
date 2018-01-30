package com.atguigu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.service.AttrServiceIcf;
import com.atguigu.service.SkuServiceInf;
import com.atguigu.service.SpuServiceInf;

@Controller
public class SkuController {
	
	@Autowired
	AttrServiceIcf attrServiceIcf;
	
	@Autowired
	SpuServiceInf spuServiceInf;
	
	@Autowired
	SkuServiceInf skuServiceInf;
	
	@RequestMapping("/save_sku")
	public String save_sku(T_MALL_SKU sku,MODEL_T_MALL_SKU_ATTR_VALUE t_mall_sku_list) {
		skuServiceInf.save_sku(sku,t_mall_sku_list);
		return "redirect:/goto_sku_add.do";
	}
	

	@ResponseBody
	@RequestMapping("/get_spu_list")
	public Object get_spu_list(int pp_id,int flbh2) {
		Map<String,Object> map = new HashMap<>();
		map.put("pp_id", pp_id);
		map.put("flbh2", flbh2);
		List<T_MALL_PRODUCT> list_prod = spuServiceInf.getspu(map);
		return list_prod;
	}
	
	@RequestMapping("/goto_sku")
	public String goto_sku() {
		return "sku/manage_sku";
	}
	
	@RequestMapping("/goto_sku_add")
	public String goto_sku_add() {
		return "sku/manage_sku_add";
	}
	
	@RequestMapping("/sku_get_attr")
	public String sku_get_attr(int flbh2,ModelMap map) {
		
		List<OBJECT_T_MALL_ATTR> list_attr = attrServiceIcf.get_attr_by_class_2_id(flbh2);
		
		map.put("list_attr", list_attr);
		return "manage_sku_attr_list_inner";
	}
}
