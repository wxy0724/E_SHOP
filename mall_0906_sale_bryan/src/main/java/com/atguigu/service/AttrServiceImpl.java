package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.MODEL_T_MALL_SKU;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.mapper.AttrMapper;

@Service
public class AttrServiceImpl implements AttrServiceInf {

	@Autowired
	private AttrMapper attrMapper;
	
	@Override
	public void save_attr(String flbh2, List<OBJECT_T_MALL_ATTR> list) {
		for (int i = 0; i < list.size(); i++) {
			Map<String,Object> map = new HashMap<>();
			OBJECT_T_MALL_ATTR attr = list.get(i);
			map.put("flbh2", flbh2);
			map.put("attr", attr);
			attrMapper.insert_t_attr(map);
			
			Map<String,Object> map2 = new HashMap<>();
			map2.put("shxm_id", attr.getId());
			map2.put("list_value", attr.getList_value());
			
			attrMapper.insert_value(map2);
		}

		
		//attrMapper.insert_t_value();
	}

	@Override
	public List<OBJECT_T_MALL_ATTR> get_attr_by_class_2_id(int flbh2) {
		
		return attrMapper.select_attr_by_class_2_id(flbh2);
	}



}
