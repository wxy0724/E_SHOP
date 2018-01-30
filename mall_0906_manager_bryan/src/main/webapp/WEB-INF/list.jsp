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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#spu_class_1_list").append("<option value="+n.id+">"+n.flmch1+"</option>")
			});
		});
	});
	function spu_get_class2(class_1){
		$.getJSON("js/json/class_2_"+class_1+".js",function(data){
			 $("#spu_class_2_list").empty();
			$.each(data,function(i,n){
				 $("#spu_class_2_list").append("<option value="+n.id+">"+n.flmch2+"</option>")
			});
		});
	}
	
	function get_pro_list(){
		var class1_id = $("#spu_class_1_list").val();
		var class2_id = $("#spu_class_2_list").val();		
		$.ajax({
			type : "post",
			url : "get_pro_list.do",
			data : {
				class1_id : class1_id,
				class2_id : class2_id
			},
			success : function(result){
				$.each(result,function(i,n){
					$("#product_table").append('<tr><td><img src="ccc.jpg" width="50px"></td><td>'+n.shp_mch+'</td><td>'+n.shp_msh+'</td><td><a href="update.html">更新</a></td><td>删除</td></tr>');
				})
			}
		});
	}
</script>
<title>硅谷商城</title>
</head>
<body>
		一级分类<select id="spu_class_1_list" onchange="spu_get_class2(this.value)"><option>请选择</option></select> 
		二级分类<select id="spu_class_2_list" onchange="get_pro_list()"><option>请选择</option></select>
	
		<table id="product_table" align="center" width="500px" border="1">
			
		</table>
		
		
		
<script type="text/javascript">
	$(function(){
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#spu_class_1_list").append("<option value="+n.id+">"+n.flmch1+"</option>")
			});
		});
	});
	function spu_get_class2(class_1){
		$.getJSON("js/json/class_2_"+class_1+".js",function(data){
			 $("#spu_class_2_list").empty();
			$.each(data,function(i,n){
				 $("#spu_class_2_list").append("<option value="+n.id+">"+n.flmch2+"</option>")
			});
		});
	}
	
	function get_pro_list(){
		var class1_id = $("#spu_class_1_list").val();
		var class2_id = $("#spu_class_2_list").val();		
		$.ajax({
			type : "post",
			url : "get_pro_list.do",
			data : {
				class1_id : class1_id,
				class2_id : class2_id
			},
			success : function(result){
				$.each(result,function(i,n){
					$("#product_table").append('<tr><td><img src="ccc.jpg" width="50px"></td><td>'+n.shp_mch+'</td><td>'+n.shp_msh+'</td><td><a href="update.html">更新</a></td><td>删除</td></tr>');
				})
			}
		});
	}
</script>
	</body>
</html>