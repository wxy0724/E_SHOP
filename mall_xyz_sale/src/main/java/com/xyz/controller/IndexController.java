 package com.xyz.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/index")
	public String index(@CookieValue(value="yh_mch",required = false)String yh_mch,ModelMap map) {
		
		/*try {
			map.put("yh_mch", URLDecoder.decode(yh_mch, "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}*/
		
		return "index";
	}
	
}
