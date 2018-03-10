<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){});
</script>
</head>
<body>
	<c:forEach items="${list_cart }" var="cart">
		<c:if test="">
		
		</c:if>
		<input type="checkbox" onclick="check_item(${cart.sku_id},checked)" ${cart.shfxz=="1"?"checked":"" } />${cart.shfxz }
		<img alt="loading" width="70px" src="upload/image/${cart.shp_tp}"> 
		${cart.sku_mch} 
		${cart.sku_jg}
		${cart.tjshl}
		<br />
	</c:forEach>
</body>
</html>