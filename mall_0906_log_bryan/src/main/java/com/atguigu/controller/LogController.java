package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LogController {
	
	@RequestMapping("/log")
	@ResponseBody
	public String log() {
		return "success";
	}
	
}
