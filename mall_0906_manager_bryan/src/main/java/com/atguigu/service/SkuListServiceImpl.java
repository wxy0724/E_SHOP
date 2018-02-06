package com.atguigu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.DETAIL_T_MALL_SKU;
import com.atguigu.bean.MODEL_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.mapper.SkuListMapper;

@Service
public class SkuListServiceImpl implements SkuListServiceInf {
	
	@Autowired
	SkuListMapper skuListMapper;
	
	@Override
	public List<MODEL_T_MALL_SKU> get_sku_list_by_class2(int flbh2) {
		return skuListMapper.select_sku_list_by_class2(flbh2);
	}

	/*@Override
	public List<MODEL_T_MALL_SKU> get_sku_list_byattr(int flbh2, List<T_MALL_SKU_ATTR_VALUE> list_av) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flbh2", flbh2);

		if (list_av != null && list_av.size() > 0) {
			// 根据分类属性交叉检索的动态sql
			StringBuffer sql = new StringBuffer();
			sql.append(" and sku.id in ");
			sql.append(" (select sku0.sku_id from ");

			// 拼接动态sql
			for (int i = 0; i < list_av.size(); i++) {
				sql.append(" (select sku_id from t_mall_sku_attr_value where shxm_id = " + list_av.get(i).getShxm_id()
						+ " and shxzh_id = " + list_av.get(i).getShxzh_id() + ") sku" + i + " ");
				if (list_av.size() > 1 && i < (list_av.size() - 1)) {
					sql.append(" , ");
				}

			}

			if (list_av.size() > 1) {
				sql.append(" where ");
				for (int j = 0; j < list_av.size(); j++) {

					if (j < list_av.size() - 1) {
						sql.append(" sku" + j + ".sku_id=sku" + (j + 1) + ".sku_id");
					}

					if (list_av.size() > 2 && j < list_av.size() - 2) {
						sql.append(" and ");
					}
				}
			}

			sql.append(" ) ");

			map.put("sql", sql.toString());

		}

		List<MODEL_T_MALL_SKU> list_sku = skuListMapper.select_sku_list_by_attr(map);
		return list_sku;
	}*/
	
	
	
	@Override
	public List<MODEL_T_MALL_SKU> get_sku_list_byattr(int flbh2, List<T_MALL_SKU_ATTR_VALUE> t_mall_sku_attr_val_list) {
		
		StringBuffer sql = new StringBuffer();
		Map<String,Object> map = new HashMap<>();
		map.put("flbh2", flbh2);
		if (t_mall_sku_attr_val_list==null || t_mall_sku_attr_val_list.size()==0 ) {
			map.put("sql", "");
		}else {
			//所有sql通用的
				sql.append(" AND sku.id in (select sk0.sku_id from ");
			
			if (t_mall_sku_attr_val_list.size()==1) {
				sql.append(" ( select sku_id from t_mall_sku_attr_value where shxm_id = "+t_mall_sku_attr_val_list.get(0).getShxm_id()+" and shxzh_id = "+t_mall_sku_attr_val_list.get(0).getShxzh_id()+" ) sk0 ");
			}else {
				for (int i = 0; i < t_mall_sku_attr_val_list.size()-1; i++) {
					//, size>1
					sql.append(" (select sku_id from t_mall_sku_attr_value where shxm_id = "+t_mall_sku_attr_val_list.get(i).getShxm_id()+" and shxzh_id = "+t_mall_sku_attr_val_list.get(i).getShxzh_id()+" )sk"+i+" , ");
				}
				int size = t_mall_sku_attr_val_list.size();
				sql.append(" (select sku_id from t_mall_sku_attr_value where shxm_id = "+t_mall_sku_attr_val_list.get(size-1).getShxm_id()+" and shxzh_id = "+t_mall_sku_attr_val_list.get(size-1).getShxzh_id()+" )sk"+(size-1)+" ");
			}
			//where
			if (t_mall_sku_attr_val_list.size()>1) {
				sql.append(" where ");
			}
			
			//and
			if (t_mall_sku_attr_val_list.size()>1) {
				
				for (int i = 1; i < t_mall_sku_attr_val_list.size()-1; i++) {
					
					sql.append(" sk"+(i-1)+".sku_id=sk"+i+".sku_id and ");
					
				}
				int size = t_mall_sku_attr_val_list.size();
				sql.append(" sk"+(size-2)+".sku_id=sk"+ (size-1) +".sku_id ");
				
//					sql.append(" sk0.sku_id=sku1.sku_id ");
//				}else {
//					for (int i = 1; i < t_mall_sku_attr_val_list.size()-1; i++) {
//						sql.append(" sk"+(i-1)+".sku_id=sku"+i+".sku_id and ");
//					}
//					int size = t_mall_sku_attr_val_list.size();
//					sql.append(" sk"+(size-2)+".sku_id=sku"+(size-1)+".sku_id  ");
				}
			
			sql.append(" ) ");
			map.put("sql", sql.toString());
		}

		
		//and size>1
//AND sku.id in (select sku_id from
//(select sku_id from t_mall_sku_attr_value where shm_id = ? and shzh_id = ? )sk0,
//(selec sku_id from t_mall_sku_attr_value where shm_id = ? and shzh_id = ? )sk1
//where
//sk0.sk_id=sku1.sku_id
//and
//)
		System.out.println(flbh2+""+sql);
		List<MODEL_T_MALL_SKU> list = skuListMapper.select_sku_list_by_attr(map);
		return list;
	}

	@Override
	public DETAIL_T_MALL_SKU get_sku_detail(int sku_id) {
		return skuListMapper.select_sku_detail(sku_id);
	}

	@Override
	public List<T_MALL_SKU> get_sku_list_by_spu_id(int spu_id) {
		return skuListMapper.select_sku_list_by_spu_id(spu_id);
	}

}
