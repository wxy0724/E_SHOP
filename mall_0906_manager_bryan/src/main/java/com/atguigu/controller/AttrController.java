package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.MODE_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.service.AttrServiceIcf;

@Controller
public class AttrController {
	
	@Autowired
	private AttrServiceIcf attrServiceIcf;
	
	@ResponseBody
	@RequestMapping("/manage_attr_list")
	public List<OBJECT_T_MALL_ATTR> get_attr_list(int flbh2,ModelMap map) {
		
		List<OBJECT_T_MALL_ATTR> list_attr = attrServiceIcf.get_attr_by_class_2_id(flbh2);
		
		return list_attr;
	}
	/*@RequestMapping("/manage_attr_list")
	public String get_attr_list(int flbh2,ModelMap map) {
		
		List<OBJECT_T_MALL_ATTR> list_attr = attrServiceIcf.get_attr_by_class_2_id(flbh2);
		
		map.put("list_attr", list_attr);
		return "attr_list_inner";
	}*/
	
	@RequestMapping("goto_attr_list")
	public String goto_attr_list() {
		return "manage_attr_list";
	}
	
	@RequestMapping("/save_attr")
	public String save_attr(String flbh2,MODE_T_MALL_ATTR list_attr) {
		//save_attr 
		List<OBJECT_T_MALL_ATTR> list = list_attr.getList_attr();
		/*for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getShxm_mch());
		}*/
		attrServiceIcf.save_attr(flbh2,list);
		return "redirect:/goto_attr_add.do";
	}
	
	@RequestMapping("/goto_attr")
	public String goto_attr() {
		return "attr/manage_attr";
	}
	
	@RequestMapping("/goto_attr_add")
	public String goto_attr_add() {
		return "attr/manage_attr_add";
	}
}
