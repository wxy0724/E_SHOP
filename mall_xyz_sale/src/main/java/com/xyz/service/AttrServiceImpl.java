package com.xyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyz.bean.OBJECT_T_MALL_ATTR;
import com.xyz.mapper.AttrMapper;
@Service
public class AttrServiceImpl implements AttrService{
	
	@Autowired
	AttrMapper attrMapper;
	
	@Override
	public List<OBJECT_T_MALL_ATTR> get_attr_by_flbh2(int flbh2) {
		return attrMapper.select_attr_by_class_2_id(flbh2);
	}

}
