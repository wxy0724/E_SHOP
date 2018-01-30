package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.SpuMapper;

@Service
public class SpuServiceImpl implements SpuServiceInf {
	
	@Autowired
	private SpuMapper spuMapper;
	

	@Override
	public void save_product_image(T_MALL_PRODUCT product, List<String> shp_tp) {
		product.setShp_tp(shp_tp.get(0));
		
		spuMapper.insert_product(product);
		//System.out.println(product.getShp_tp());
		Map<String, Object> map = new HashMap<>();
		map.put("shpid", product.getId());
		//System.out.println(map.put("shpid", product.getId()));
		map.put("list_img", shp_tp);
		spuMapper.insert_image(map);
	}


	@Override
	public List<T_MALL_PRODUCT> getspu(Map<String, Object> map) {
		return spuMapper.selectspu(map);
	}


	@Override
	public List<T_MALL_PRODUCT> getProducts(Integer class1_id, Integer class2_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("flbh1", class1_id);
		map.put("flbh2", class2_id);
		return spuMapper.selectProducts(map);
	}

}
