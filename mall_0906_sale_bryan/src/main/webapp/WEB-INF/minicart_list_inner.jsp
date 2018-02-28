<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2-min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
	});
</script>
</head>
<body>
		<div class="cart_pro">
			<h6>最新加入的商品</h6>
			<c:forEach items="${ShoppingCart_list }" var="cart">
				<div class="one">
					<img width="120px" height="100px"
						src="upload/image/${cart.shp_tp }" /> <span class="one_name">
						${cart.sku_mch } </span> <span class="one_prece"> <b>￥${cart.sku_jg }</b><br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除
					</span>
				</div>
				</br>
			</c:forEach>
			<div class="gobottom">
					<br/>
					共<span>2</span>件商品&nbsp;&nbsp;&nbsp;&nbsp;
					共计￥<span>${sum}</span>
					<button class="goprice">去购物车</button>
				</div>
			</div>
		</div>
</body>
</html>