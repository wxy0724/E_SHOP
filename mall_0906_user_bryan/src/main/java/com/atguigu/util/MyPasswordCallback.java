package com.atguigu.util;

import java.io.IOException;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.UnsupportedCallbackException;

import org.apache.wss4j.common.ext.WSPasswordCallback;

public class MyPasswordCallback implements CallbackHandler{

	@Override
	public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException {
		
		WSPasswordCallback wsc = (WSPasswordCallback)callbacks[0];
		
		String identifier = wsc.getIdentifier();
		
		//根据identifier找到服务器上对应的password  wpc.getPassword();
		String password = "123";
		
		wsc.setPassword(password);
		
	}

}
