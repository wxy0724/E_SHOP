package com.atguigu.server;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_ADDRESS;
import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.service.AddressService;

public class AddressServerImpl implements AddressServer {
	
	@Autowired
	AddressService addressService;
	
	@Override
	public void add_address(T_MALL_ADDRESS address) {
		addressService.add_address(address);
	}

	@Override
	public List<T_MALL_ADDRESS> get_addresses_by_user_id(T_MALL_USER_ACCOUNT user) {
		return addressService.get_addresses_by_user_id(user);
	}

	@Override
	public T_MALL_ADDRESS get_addresses_by_id(int address_id) {
		return addressService.get_addresses_by_id(address_id);
	}

}
