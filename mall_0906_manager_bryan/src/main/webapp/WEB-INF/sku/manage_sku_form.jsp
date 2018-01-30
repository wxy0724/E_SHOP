<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){});
</script>
</head>
<body>
	商品库存名称：<input type="text" name="sku_mch"/><br/>
	商品库存数量：<input type="text" name="kc"/><br/>
	商品库存价格：<input type="text" name="jg"/><br/>
	商品库存地址：<input type="text" name="kcdz"/>
</body>
</html>