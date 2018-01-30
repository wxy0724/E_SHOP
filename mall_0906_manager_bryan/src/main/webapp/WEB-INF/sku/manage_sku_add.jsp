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
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>硅谷商城</title>
</head>
<body>
		<h2>库存单元增加</h2>
		<hr>
		<form action="save_sku.do" method="post">
			<select id="sku_class_1_sku" name="flbh1" onchange="sku_get_class2(this.value)"><option>请选择</option></select>
			<select id="sku_class_2_sku" name="flbh2" onchange="sku_get_attr(this.value)"><option>请选择</option></select>
			<select id="tm_class_sku" name="pp_id" onchange="get_spu()"><option>请选择</option></select>
			<select id="sku_spu_sku" name="shp_id" onchange="textshow()"><option>请选择</option></select>
		<hr>
		<div id="attr_list_inner">
		</div>
		<div id="sku_form" style="display: none;">
			<jsp:include page="manage_sku_form.jsp"></jsp:include>
		</div>
			<input type="submit" value="提交"/>
		</form>
		

<script type="text/javascript">
	$(function (){
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#sku_class_1_sku").append("<option value="+n.id+">"+n.flmch1+"</option>");
			});
		});
	});
	
	function sku_get_class2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#sku_class_2_sku").empty();
			$.each(data,function(i,n){
				$("#sku_class_2_sku").append("<option value="+n.id+">"+n.flmch2+"</option>");
			});
		});
		sku_get_tm(class_1_id);
	}
	function sku_get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_class_sku").empty();
			$.each(data,function(i,n){
				$("#tm_class_sku").append("<option value="+n.id+">"+n.ppmch+"</option>");
			});
		});
	}
	
	function button_image_click(index){
		$("#file_"+index).click();
	}
	function button_image_change(index){
		var file = $("#file_"+index)[0].files[0];
		var url = window.URL.createObjectURL(file);
		$("#img_"+index).attr("src",url);
		
		var length = $("#id_button :file").length;
		if ((index+1)==length) {
			add_button(index);
		}
	}  
	
	function add_button(index){
		var img = '<img id="img_'+(index+1)+'" src="image/upload_hover.png" onclick="button_image_click('+(index+1)+')">';
		var input = '<input type="file" id="file_'+(index+1)+'" name="files" onchange="button_image_change('+(index+1)+')" style="display: none;"/>';
		$("#id_button").append(img,input);
	}
	
	function sku_get_attr(flbh2){
		$.get("sku_get_attr.do",{flbh2:flbh2},function(data){
			$("#attr_list_inner").html(data);
		});
	}
	
	function get_spu(){
		var flbh2 = $("#sku_class_2_sku").val();
		var pp_id = $("#tm_class_sku").val();
		$.get("get_spu_list.do",{flbh2:flbh2,pp_id:pp_id},function(data){
			$.each(data,function(i,n){
				$("#sku_spu_sku").append("<option value="+n.id+">"+n.shp_mch+"</option>");
			});
		});
	}
	
	function textshow(){
		$("#sku_form").show();
	} 
	
</script>
</body>
</html>