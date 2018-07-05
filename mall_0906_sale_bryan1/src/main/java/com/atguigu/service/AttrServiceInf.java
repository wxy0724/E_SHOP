package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.MODEL_T_MALL_SKU;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;

public interface AttrServiceInf {

	void save_attr(String flbh2, List<OBJECT_T_MALL_ATTR> list);

	List<OBJECT_T_MALL_ATTR> get_attr_by_class_2_id(int flbh2);




}
