package com.atguigu.util;

import java.math.BigDecimal;
import java.util.List;

import com.atguigu.bean.T_MALL_SHOPPINGCAR;

public class MyBigDecimalUtil {
	
	public static BigDecimal add(BigDecimal number) {
		BigDecimal decimal = new BigDecimal("0");
		BigDecimal bigDecimal = decimal.add(decimal);
		return bigDecimal;
	}
	
}
