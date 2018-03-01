package com.atguigu.util;

import java.io.InputStream;
import java.util.Properties;

public class MyPropertiesUtil {
	
	public static String getMyProperties(String property,String key) {
		
		Properties properties = new Properties();
		InputStream inputStream = MyPropertiesUtil.class.getClassLoader().getResourceAsStream(property);
		try {
			properties.load(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String path = properties.getProperty(key);
		return path;
	}
}
