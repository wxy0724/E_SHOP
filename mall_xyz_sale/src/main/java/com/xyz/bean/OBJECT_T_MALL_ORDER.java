package com.xyz.bean;

import java.util.ArrayList;
import java.util.List;

public class OBJECT_T_MALL_ORDER extends T_MALL_ORDER{
	
	List<OBJECT_T_MALL_FLOW> list_flow = new ArrayList<OBJECT_T_MALL_FLOW>();

	public List<OBJECT_T_MALL_FLOW> getList_flow() {
		return list_flow;
	}

	public void setList_flow(List<OBJECT_T_MALL_FLOW> list_flow) {
		this.list_flow = list_flow;
	}

	
}
