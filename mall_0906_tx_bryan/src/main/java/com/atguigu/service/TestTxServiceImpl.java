package com.atguigu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_ORDER_INFO;
import com.atguigu.mapper.TestTxMapper;

@Service
public class TestTxServiceImpl implements TestTxServiceInf {

	@Autowired
	TestTxMapper testTxMapper;
	
	@Override
	public void testOrderKc() {
		
		long kc = testTxMapper.select_kc_for_update(1);
		
		T_MALL_ORDER_INFO t_MALL_ORDER_INFO = new T_MALL_ORDER_INFO();
		t_MALL_ORDER_INFO.setSku_id(1);
		t_MALL_ORDER_INFO.setSku_shl(1);
		
		if (kc > 0) {
			testTxMapper.update_kc(t_MALL_ORDER_INFO);
		}
	}
	

}
