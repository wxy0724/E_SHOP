package com.xyz.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MyTimeUtil {
	
	//时间的格式 getMyTime()
	public static String getMyTime(Date formatdate) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmmss");
		String date = dateFormat.format(formatdate);
		return date;
	}
	
	//时间的加减
	public static Date getDate(int num) {
		Calendar calendar = Calendar.getInstance();
		//calendar.setTime(formatdate);
		calendar.add(Calendar.DATE, num);
		Date date = calendar.getTime();
		return date;
	}

}
