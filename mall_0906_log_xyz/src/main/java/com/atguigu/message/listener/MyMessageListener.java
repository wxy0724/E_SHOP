package com.atguigu.message.listener;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.atguigu.service.LogService;

public class MyMessageListener implements MessageListener{
	
	@Autowired
	LogService logService;
	
	@Override
	public void onMessage(Message message) {
		TextMessage textMessage = (TextMessage) message;
		String text = "";
		try {
			text = textMessage.getText();
			System.out.println(text);
		} catch (JMSException e) {
			e.printStackTrace();
		}
		logService.loginLog(text);
	}

}
