package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;

public interface AttrMapper {

	void insert_t_attr(Map<String, Object> map);

	void insert_value(Map<String, Object> map2);

	List<OBJECT_T_MALL_ATTR> select_attr_by_class_2_id(int flbh2);

	List<Integer> select_list_value_id_by_attr_id(int i);
}
