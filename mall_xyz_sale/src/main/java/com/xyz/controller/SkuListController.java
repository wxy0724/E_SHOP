package com.xyz.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xyz.bean.DETAIL_T_MALL_SKU;
import com.xyz.bean.MODEL_T_MALL_SKU;
import com.xyz.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.xyz.bean.OBJECT_T_MALL_ATTR;
import com.xyz.bean.T_MALL_SKU;
import com.xyz.bean.T_MALL_SKU_ATTR_VALUE;
import com.xyz.service.AttrService;
import com.xyz.service.SkuListServiceInf;
import com.xyz.util.JedisPoolUtils;
import com.xyz.util.MyCacheUtil;
import com.xyz.util.MyJsonUtil;

import redis.clients.jedis.Jedis;

@Controller
public class SkuListController {

	@Autowired
	SkuListServiceInf skuListServiceInf;

	@Autowired
	AttrService attrService;

	/*
	 * @RequestMapping("/goto_sku_list_By_attr") public String
	 * goto_sku_list_By_attr(int flbh2 , ModelMap map , MODEL_T_MALL_SKU_ATTR_VALUE
	 * list_av,String order) { List<MODEL_T_MALL_SKU> sku_list = new ArrayList<>();
	 * List<T_MALL_SKU_ATTR_VALUE> list_sku_attr =
	 * list_av.getT_mall_sku_attr_val_list(); String[] keys = new
	 * String[list_sku_attr.size()]; for (int i = 0; i <list_sku_attr.size(); i++) {
	 * String key =
	 * "attr_class_2_"+list_sku_attr.get(i).getShxm_id()+"_"+list_sku_attr.get(i).
	 * getShxzh_id(); keys[i] = key; } String new_key = MyCacheUtil.interKey(keys);
	 * 
	 * //调用属性检索业务 sku_list = MyCacheUtil.getMyListBykey(new_key,
	 * MODEL_T_MALL_SKU.class); if (sku_list == null ||sku_list.size()==0) {
	 * //走mysql sku_list = skuListServiceInf.get_sku_list_by_attr(flbh2,list_av.
	 * getT_mall_sku_attr_val_list(),order); MyCacheUtil.setMyListByKey(sku_list,
	 * new_key); } map.put("sku_list", sku_list); return "sale_sku_list_inner"; }
	 */

	@RequestMapping("/goto_sku_list_By_attr")
	public String goto_sku_list_By_attr(int flbh2, ModelMap map, MODEL_T_MALL_SKU_ATTR_VALUE list_av, String order) {
		List<MODEL_T_MALL_SKU> sku_list = new ArrayList<>();
		List<T_MALL_SKU_ATTR_VALUE> t_list_av = list_av.getT_mall_sku_attr_val_list();

		String new_key = "";

		if (t_list_av != null && t_list_av.size() > 0) {
			String[] keys = new String[t_list_av.size()];

			// 从redis中查
			for (int i = 0; i < t_list_av.size(); i++) {
				// 合并之后的new_key
				String key = "attr_" + flbh2 + "_" + t_list_av.get(i).getShxm_id() + "_"
						+ t_list_av.get(i).getShxzh_id();
				keys[i] = key;
			}

			new_key = MyCacheUtil.interKey(keys);
			sku_list = MyCacheUtil.getMyListBykey(new_key, MODEL_T_MALL_SKU.class);
		}
		if (sku_list == null || sku_list.size() == 0) {
			// 从数据库里查
			sku_list = skuListServiceInf.get_sku_list_by_attr(flbh2, list_av.getT_mall_sku_attr_val_list(), order);
			MyCacheUtil.setMyListByKey(sku_list, new_key);
		}
		map.put("list_sku", sku_list);

		return "sale_sku_list_inner";
	}

	@RequestMapping("/goto_sku_list")
	public String goto_sku_list(int flbh2, ModelMap map) {

		List<MODEL_T_MALL_SKU> list_sku = new ArrayList<MODEL_T_MALL_SKU>();
		// 调用sku内容检索业务
		// 检索缓存
		String key = "class_2_" + flbh2;
		list_sku = MyCacheUtil.getMyListBykey(key, MODEL_T_MALL_SKU.class);
		// mysql
		if (list_sku == null || list_sku.size() == 0) {

			list_sku = skuListServiceInf.get_sku_list_by_class_id_2(flbh2);
			// 同步缓存,消息队列，异步同步
			MyCacheUtil.setMyListByKey(list_sku, key);
		}
		List<OBJECT_T_MALL_ATTR> list_attr = attrService.get_attr_by_flbh2(flbh2);
		map.put("list_attr", list_attr);
		map.put("list_sku", list_sku);
		map.put("flbh2", flbh2);
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
