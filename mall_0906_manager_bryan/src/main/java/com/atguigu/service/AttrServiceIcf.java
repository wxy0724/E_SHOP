package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;

public interface AttrServiceIcf {

	void save_attr(String flbh2, List<OBJECT_T_MALL_ATTR> list);

	List<OBJECT_T_MALL_ATTR> get_attr_by_class_2_id(int flbh2);


}
