<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<title>硅谷商城</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
		var val = getMyCookie("yh_nch");
		$("#yh_nch").text(val);
	});

	function getMyCookie(key) {
		var val = "";

		var cookie = document.cookie.replace(/\s/, "");
		var cookie_arry = cookie.split(";");

		for (var i = 0; i < cookie_arry.length; i++) {
			var cookies = cookie_arry[i].split("=");
			if (cookies[0] == key) {
				val = cookies[1];
			}
		}
		return decodeURIComponent(val);
	}
</script>
</head>
<body>
	<div class="top">
		<div class="top_text">
			<c:if test="${empty user }">
				<span style="color: red" id="yh_nch"><a>${yh_nch }</a></span>&nbsp;&nbsp;
		<a href="goto_login.do">用户登录</a>
				<a href="goto_register.do">用户注册</a>
			</c:if>

			<c:if test="${not empty user }">
		欢迎${user.yh_nch } 
		<a href="goto_out.do">注销</a>
			</c:if>
		</div>
	</div>
	
	<div class="top_img">
		<img src="js/images/top_img.jpg" alt="">
	</div>

</body>
</html>