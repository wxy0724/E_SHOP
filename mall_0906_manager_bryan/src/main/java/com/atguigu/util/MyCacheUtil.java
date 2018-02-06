package com.atguigu.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import redis.clients.jedis.Jedis;

public class MyCacheUtil {
	
	public static <T> List<T> getMyListBykey(String key , Class<T> t){
		List<T> list_sku = new ArrayList<T>();
		Jedis jedis = JedisPoolUtils.getJedis();
		
		if (jedis==null) {
			return null;
		} else {
			Set<String> zrange = jedis.zrange(key, 0, -1);
			Iterator<String> iterator = zrange.iterator();
			while (iterator.hasNext()) {
				String next = iterator.next();
				
				T sku = MyJsonUtil.json_to_object(next, t);
				
				list_sku.add(sku);
			}
			
		}
		
		return list_sku;
	}
	
	public static <T> void setMyListByKey(List<T> list_sku ,String key ){
		
		Jedis jedis = JedisPoolUtils.getJedis();
		
		if (jedis==null) {
			//记录错误日志
		}else {
			
			jedis.del(key);
			
			for (int i = 0; i < list_sku.size(); i++) {
				jedis.zadd(key, i, MyJsonUtil.object_to_json(list_sku.get(i)));
			}
		}
	}
	
	//根据属性查
	public static String interKey(String[] keys) {
		
		Jedis jedis = JedisPoolUtils.getJedis();
		
		if (jedis==null) {
			//记录错误日志
		}else {
			jedis.zinterstore("new_key", keys);
		}
		
		return "new_key";
	}
}
