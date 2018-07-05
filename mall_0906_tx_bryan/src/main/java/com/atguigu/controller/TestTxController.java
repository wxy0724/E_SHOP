package com.atguigu.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.service.TestTxServiceInf;

@Controller
public class TestTxController {
	
	@Autowired
	TestTxServiceInf testTxServiceInf;
	
	
	@RequestMapping("/testTx")
	public String testTx() {
		
		testTxServiceInf.testOrderKc();
		
		return "success";
	}
	
}
