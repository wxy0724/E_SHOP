<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<!-- <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#spu_class_1_attr").append("<option value="+n.id+">"+n.flmch1+"</option>");
			});
		});
	});
	
	function spu_get_class2(index){
		$.getJSON("js/json/class_2_"+index+".js",function(data){
			$("#spu_class_2_attr").empty();
			$.each(data,function(i,n){
				$("#spu_class_2_attr").append("<option value="+n.id+">"+n.flmch2+"</option>");
			});
		});
		spu_get_tm(index);
	}
	function spu_get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_class_attr").empty();
			$.each(data,function(i,n){
				$("#tm_class_attr").append("<option value="+n.id+">"+n.ppmch+"</option>");
			});
		});
	}
	
</script>
</head>
<body>
		<select id="spu_class_1_attr" name="flbh1" onchange="spu_get_class2(this.value)"><option>请选择</option></select>
		<select id="spu_class_2_attr" name="flbh2"><option>请选择</option></select>
		<select id="tm_class_attr" name="pp_id"><option>请选择</option></select>
</body>
</html>