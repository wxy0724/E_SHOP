<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<title>确认订单</title>
<script type="text/javascript" src="js/jquery-1.7.2-min.js"></script>
<link rel="stylesheet" type="text/css" href="js/css/css.css"/>		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
	});
</script>
</head>
<body>
	<jsp:include page="../sale_search_area.jsp"></jsp:include>
	
	<div class="message">
		<div class="msg_title">收货人信息</div>
		<div class="msg_addr">
			<span class="msg_left"> 姓名 北京 </span> <span class="msg_right">
				北京市 昌平区 北七家镇 尚硅谷IT教育 </span>
		</div>
		<span class="addrs">查看更多地址信息</span>
		<div class="msg_line"></div>

		<div class="msg_title">送货清单</div>
		<div class="msg_list">
		
		<c:forEach items="${order.list_flow }" var="flow">
		<div class="msg_list_left">
				配送方式:
				<div class="left_title">${flow.psfsh }</div>
			</div>
			
			<c:forEach items="${flow.info_list }" var="info">
				<div class="msg_list_right">
						<div class="msg_img">
							<img src="upload/image/${info.shp_tp }" />
						</div>
						<div class="msg_name">${info.sku_mch }</div>
						<div class="msg_price">￥${info.sku_jg }</div>
						<div class="msg_mon">${info.sku_shl }</div>
						<div class="msg_state">有货</div>
				</div>
			</c:forEach>
		</c:forEach>
		</div>
			
		<div class="msg_line"></div>

		<div class="msg_sub">
			<div class="msg_sub_tit">
				应付金额： <b>￥${sum }</b>
			</div>
			<div class="msg_sub_adds">寄送至 ： 北京市 昌平区 北七家镇 尚硅谷IT教育
				&nbsp;某某某（收） 185****1222</div>
			<button class="msg_btn">提交订单</button>
		</div>
	</div>

</body>
</html>