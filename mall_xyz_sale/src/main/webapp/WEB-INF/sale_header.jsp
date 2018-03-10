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
$(function(){
	
	var yh_mch = getCookie("yh_nch");
	$("#user_name").text(yh_mch);
	
});

function getCookie(key){
	
	var cookies = document.cookie;
	cookies = cookies.replace(" ","");
	var cookie_array = cookies.split(";");
	var val = "";
	
	for (var i = 0; i < cookie_array.length; i++) {
		var cookie = cookie_array[i].split("=");
		if (cookie[0] == key) {
			val = cookie[1];
		}
	}
	
	return decodeURIComponent(val);
}
</script>
</head>
<body>
	<c:if test="${empty user }">
		请  <span id = "user_name" style="color: red">${yh_mch }</span>  <a href="gotoLogin.do">登录</a>
	</c:if>
	<c:if test="${not empty user }">
		欢迎${user.yh_mch }&nbsp;&nbsp;&nbsp;<a href="Logout.do">退出登录</a>&nbsp;&nbsp;&nbsp;
	</c:if>
	
</body>
</html>