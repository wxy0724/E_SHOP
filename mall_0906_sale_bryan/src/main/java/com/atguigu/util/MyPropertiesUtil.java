package com.atguigu.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MyPropertiesUtil {
	
	public static String getMyProperties(String propert,String key) {
		
		Properties properties = new Properties();
		
		InputStream is = MyPropertiesUtil.class.getClassLoader().getResourceAsStream(propert);
		
		try {
			properties.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String path = properties.getProperty(key);
		
		return path;
	}
}
