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
<script type="text/javascript">
	$(function(){});
</script>
</head>
<body>
	<form action="login.do">
		<input type="text" name="yh_mch"/>用户名
		<input type="text" name="yh_mm"/>密码
		<input type="submit" value="登录">
	</form>
</body>
</html>