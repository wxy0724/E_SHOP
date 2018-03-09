<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<title>硅谷商城</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){});
</script>
</head>
<body>
	列表检索页面:<br/>
	属性列表:<br/>
	<jsp:include page="sale_attr_list_inner.jsp"></jsp:include>
	<hr/>
	商品列表:<br/>
	<jsp:include page="sale_sku_list_inner.jsp"></jsp:include>
</body>
</html>