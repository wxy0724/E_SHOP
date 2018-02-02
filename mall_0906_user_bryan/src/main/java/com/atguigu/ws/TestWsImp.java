package com.atguigu.ws;

import javax.jws.WebService;

public class TestWsImp implements TestWsInf {

	@Override
	public String ping(String say) {
		System.err.println("服务器ws调用：" + say);
		return "pong";
	}

}
