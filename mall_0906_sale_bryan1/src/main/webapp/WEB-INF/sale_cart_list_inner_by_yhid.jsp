<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function check_order(){
		$("#order_form").submit();
	}
	
</script>
</head>
<body>
	<div class="Cbox" id="cert_list">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>是否选中</th>
					<th>商品图片</th>
					<th>商品名称</th>
					<th>商品价格</th>
					<th>商品数量</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ShoppingCart_list }" var="cart">
					<tr>
						<td><input type="checkbox" ${cart.shfxz=="1"?"checked":"" }
							onclick="check_item(${cart.sku_id},checked)">${cart.shfxz }</td>
						<td><img width="120px" height="100px"
							src="upload/image/${cart.shp_tp }" alt=""></td>
						<td>${cart.sku_mch }</td>
						<td>${cart.sku_jg }</td>
						<td><input type="text" name="min" value="${cart.tjshl }"
							style="width: 50px; text-align: center"></td>
						<td>删除</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="Cprice">
			<div class="price">总价：${sum }</div>
			<form id="order_form" action="check_order.do" method="post">
				<div class="jiesuan" onclick="check_order()">结算</div>
			</form>
		</div>
	</div>



</body>
</html>