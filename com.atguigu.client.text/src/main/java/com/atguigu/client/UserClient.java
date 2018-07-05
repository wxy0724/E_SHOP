package com.atguigu.client;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import com.atguigu.bean.T_MALL_USER_ACCOUNT;
import com.atguigu.server.UserServer;

public class UserClient {
	public static void main(String[] args) {
		JaxWsProxyFactoryBean jspfb = new JaxWsProxyFactoryBean();
		
		jspfb.setAddress("http://192.168.13.29:8082/mall_0906_user_bryan/user?wsdl");
		jspfb.setServiceClass(UserServer.class);
		
		UserServer create = (UserServer)jspfb.create();
		
		T_MALL_USER_ACCOUNT user = new T_MALL_USER_ACCOUNT();
		user.setYh_mch("lilei");
		user.setYh_mm("123");
		
		T_MALL_USER_ACCOUNT account = create.getUser(user);
		
		System.out.println(account.getYh_nch());
	}
}
