package com.xyz.mapper;

import java.util.List;

import com.xyz.bean.OBJECT_T_MALL_ATTR;

public interface AttrMapper {

	List<OBJECT_T_MALL_ATTR> select_attr_by_class_2_id(int flbh2);

}
