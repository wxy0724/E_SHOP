<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2-min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript">
	$(function(){});
</script>
</head>
<body>
	关键字检索:<font color="red">${keywords }</font>
	<hr/>
	<div class="Sbox" >
		<c:forEach items="${list_sku }" var="sku">
			<div class="list" >
				<div class="img">
					<img alt="" width="100%" height="70%" src="${pageContext.request.contextPath}/upload/image/${sku.shp_tp}">
				</div>
				<div class="price">¥${sku.jg}</div>
				<div class="title"><a href="goto_sku_detail.do?sku_id=${sku.id}&spu_id=${sku.shp_id}" target="_blank">${sku.sku_mch}</a></div>
			</div>
		</c:forEach>
	</div>
</body>
</html>