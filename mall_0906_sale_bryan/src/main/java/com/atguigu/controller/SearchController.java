package com.atguigu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.bean.KEYWORDS_T_MALL_SKU;
import com.atguigu.util.MyHttpGetUtil;
import com.atguigu.util.MyJsonUtil;

@Controller
public class SearchController {
	
	@RequestMapping("/search")
	public String search(String keywords,ModelMap map) {
		List<KEYWORDS_T_MALL_SKU> list_sku = new ArrayList<KEYWORDS_T_MALL_SKU>();
		//调用关键字检索服务项目
		try {
			String doGet = MyHttpGetUtil.doGet("http://localhost:38080/mall_0906_keywords_bryan/search/"+ keywords +".do");
			list_sku = MyJsonUtil.json_to_list(doGet, KEYWORDS_T_MALL_SKU.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		map.put("list_sku", list_sku);
		map.put("keywords", keywords);
		
		return "sale_search";
	}
	
}
