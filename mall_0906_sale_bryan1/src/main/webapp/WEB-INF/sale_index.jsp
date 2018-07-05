<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/css/css.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>硅谷商城</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:include page="sale_header.jsp"></jsp:include>
	
	<jsp:include page="sale_search_area.jsp"></jsp:include>
	
	<jsp:include page="sale_class_list.jsp"></jsp:include>
	
	<div class="banner">
		<div class="ban">
			<img src="js/images/banner.jpg" width="980" height="380" alt="">
		</div>
	</div>
	
	<jsp:include page="sale_footer.jsp"></jsp:include>
</body>
</html>