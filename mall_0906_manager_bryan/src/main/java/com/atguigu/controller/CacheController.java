package com.atguigu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.MODEL_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.service.AttrServiceIcf;
import com.atguigu.service.SkuListServiceInf;
import com.atguigu.util.JedisPoolUtils;
import com.atguigu.util.MyCacheUtil;
import com.atguigu.util.MyJsonUtil;

@Controller
public class CacheController {
	
	@Autowired
	AttrServiceIcf attrServiceIcf;
	
	@Autowired
	SkuListServiceInf skuListServiceInf;
	
	@RequestMapping("/goto_cache")
	public String goto_cache(Integer class1_id,Integer class2_id) {
		
		return "manage_cache";
	}
	
	@ResponseBody
	@RequestMapping("/refresh_attr_cache")
	public Object refresh_attr_cache(Integer class_2_id, @RequestParam("attrs[]") int[]attrs) {
		
		//计数器
		long count = 0l;
		
		for (int i = 0; i < attrs.length; i++) {
			
			List<Integer> list_value_id = attrServiceIcf.get_list_value_id_by_attr_id(attrs[i]);
			
			for (int j = 0; j < list_value_id.size(); j++) {
				//生成key attr_flbh2_属性名id_属性值id
				String key = "attr_"+class_2_id+"_"+attrs[i]+"_"+list_value_id.get(j);
				
				List<T_MALL_SKU_ATTR_VALUE> list_av = new ArrayList<>();
				T_MALL_SKU_ATTR_VALUE av = new T_MALL_SKU_ATTR_VALUE();
				av.setShxm_id(attrs[i]);
				av.setShxzh_id(list_value_id.get(j));
				list_av.add(av);
				
				//查对应的属性值
				List<MODEL_T_MALL_SKU> list_by_attr = skuListServiceInf.get_sku_list_byattr(class_2_id, list_av);
				//存入redis
				MyCacheUtil.setMyListByKey(list_by_attr, key);
				
				count = count + list_by_attr.size();
			}
			
		}
		//返回刷新多少条
		return count;
	}
}
