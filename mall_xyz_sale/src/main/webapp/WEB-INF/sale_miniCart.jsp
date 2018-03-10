<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function(){});
	
	function show_cart(){
		$.get("get_miniCart.do",function(data){
			$("#miniCart_list_inner").html(data);
		});
		$("#miniCart_list_inner").show();
		
	}
	function hide_cart(){
		$("#miniCart_list_inner").hide();
	}
	
	function show(){
		$("#miniCart_list_inner").show();
	}
	
</script>
</head>
<body>
	<a target="_blank" href="goto_cart_list.do" onmouseover="show_cart()" onmouseout="hide_cart()">购物车</a>
	<div id="miniCart_list_inner" onmouseover="show()" onmouseout="hide_cart()"></div>
</body>
</html>