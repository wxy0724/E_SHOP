package com.atguigu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/index")
	public String index(@CookieValue(value="yh_nch",required=false) String yh_nch,
			ModelMap map) {
		return "sale_index";
	}
	
	@RequestMapping("/goto_register")
	public String goto_register() {
		return "user/register";
	}

}
