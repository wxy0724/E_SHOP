<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<title>硅谷商城</title>
<!-- <script type="text/javascript" src="js/jquery-1.7.2-min.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="search">
		<div class="logo">
			<img src="./images/logo.jpg" alt="">
		</div>
		<div class="search_on">
			<div class="se">
				<input type="text" name="search" class="lf"> <input
					type="submit" class="clik" value="搜索">
			</div>
			<div class="se">
				<a href="">取暖神奇</a> <a href="">1元秒杀</a> <a href="">吹风机</a> <a
					href="">玉兰油</a>
			</div>
		</div>
		<jsp:include page="sale_miniCart.jsp"></jsp:include>
	</div>
</body>
</html>