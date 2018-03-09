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
	
	$(function (){
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#sale_class_1").append("<li  onmouseover='spu_get_class2(this.value)' value="+n.id+">"+n.flmch1+"</li>");
			});
		});
	});
	
	function spu_get_class2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#sale_class_2").empty();
			$.each(data,function(i,n){
				$("#sale_class_2").append("<li value="+n.id+"><a href='goto_sku_list.do?flbh2="+n.id+"'>"+n.flmch2+"</a></li>");
			});
		});
	}
	
</script>
</head>
<body>
	<ul id="sale_class_1" style="float: left; width: 80px"></ul>
	<ul id="sale_class_2" style="float: left; width: 80px"></ul>
</body>
</html>