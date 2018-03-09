<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){});
</script>
</head>
<body>
	<c:forEach items="${list_attr }" var="attr">
		${attr.shxm_mch} :
		<c:forEach items="${attr.list_value }" var="t_mall_value">
			<a href="">${t_mall_value.shxzh } ${t_mall_value.shxzh_mch}</a>
		</c:forEach>
		<br/>
	</c:forEach>
</body>
</html>