package com.atguigu.message.listener;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.atguigu.service.LogService;

public class MyMessageListener2 implements MessageListener {

	@Autowired
	LogService logService;
	
	@Override
	public void onMessage(Message message) {
		//消息内容
		TextMessage textMessage = (TextMessage) message;
		String text = "";
		try {
			text = textMessage.getText();
		} catch (JMSException e) {
			e.printStackTrace();
		}
		//调用记录日志的业务方法
		logService.loginLog(text);
	}

}
