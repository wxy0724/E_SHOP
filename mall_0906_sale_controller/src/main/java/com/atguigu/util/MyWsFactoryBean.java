package com.atguigu.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.cxf.interceptor.OutInterceptors;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.cxf.ws.security.wss4j.WSS4JOutInterceptor;
import org.apache.wss4j.dom.handler.WSHandlerConstants;
import org.springframework.beans.factory.FactoryBean;

public class MyWsFactoryBean<T> implements FactoryBean<T>{
	
	private String url;
	private Class<T> t;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Class<T> getT() {
		return t;
	}

	public void setT(Class<T> t) {
		this.t = t;
	}

	public static <T> T getMyWs(String url,Class<T> t) {
		
		JaxWsProxyFactoryBean jspfb = new JaxWsProxyFactoryBean();
		
		jspfb.setAddress(url);
		jspfb.setServiceClass(t);
		
		//判断安全拦截器
		if (t.getSimpleName().equals("TestWsInf")) {
			//加入安全拦截器
			Map<String, Object> map = new HashMap<>();
			map.put(WSHandlerConstants.ACTION, WSHandlerConstants.USERNAME_TOKEN);
			map.put(WSHandlerConstants.PASSWORD_TYPE, "PasswordText");
			map.put(WSHandlerConstants.PW_CALLBACK_CLASS, MyPasswordCallback.class.getName());
			//校验时使用的属性名
			map.put(WSHandlerConstants.USER, "username");
			WSS4JOutInterceptor wss4jOutInterceptor = new WSS4JOutInterceptor(map);
			jspfb.getOutInterceptors().add(wss4jOutInterceptor);
		}
		
		T create = (T)jspfb.create();
		
		return create;
	}

	@Override
	public T getObject() throws Exception {
		return getMyWs(this.url,this.t);
	}

	@Override
	public Class<?> getObjectType() {
		return this.t;
	}

	@Override
	public boolean isSingleton() {
		return false;
	}

	
}
