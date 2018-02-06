package com.atguigu.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.service.SpuServiceInf;
import com.atguigu.util.MyUploadUtil;

@Controller
public class IndexController {
	
	@Autowired
	private SpuServiceInf spuServiceInf;
	
	@RequestMapping("/index")
	public String index(String url,String title,ModelMap map) {
		map.put("url", url);
		map.put("title", title);
		return "manage_index";
	}
	
	
	@RequestMapping("/goto_spu")
	public String goto_spu() {
		return "manage_spu";
	}
	
	@RequestMapping("/goto_spu_add")
	public String goto_spu_add() {
		return "manage_spu_add";
	}
	
	
	@RequestMapping("/goto_spu_list")
	public String goto_spu_list() {
		return "list";
	}
	
	
	
	@RequestMapping("/save_spu")
	public ModelAndView save_spu(T_MALL_PRODUCT product,@RequestParam("files") MultipartFile[] files) {
		//接收文件
		List<String> shp_tp = MyUploadUtil.upload_image(files);
		//product.setShp_tp(shp_tp.get(0));
		
		//存product
		//spuServiceInf.insert_product(product);
		//存product_img
		spuServiceInf.save_product_image(product,shp_tp);
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("url", "goto_spu_add.do");
		mv.addObject("title", "商品信息添加");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/get_pro_list")
	public Object getProducts(Integer class1_id,Integer class2_id) {
		
		List<T_MALL_PRODUCT> list = spuServiceInf.getProducts(class1_id,class2_id);
		
		return list;
	}
	
	
	
}
