<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<title>购物车列表</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function check_item(sku_id,checked) {
		var sfxzh = "0";
		if (checked) {
			sfxzh = "1";
		}
		
		$.get("change_cart_status.do",{sku_id:sku_id,sfxzh:sfxzh}, function(data) {
			$("#cart_list_inner").html(data);
		});
	}
</script>
</head>
<body>
	购物车列表:
	<div id="cart_list_inner">
		<jsp:include page="sale_cart_list_inner.jsp"></jsp:include>
	</div>
</body>
</html>