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
<!--  <script type="text/javascript">
	$(function (){
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#spu_class_1").append("<option value="+n.id+">"+n.flmch1+"</option>");
			});
		});
	});
	
	function spu_get_class2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#spu_class_2").empty();
			$.each(data,function(i,n){
				$("#spu_class_2").append("<option value="+n.id+">"+n.flmch2+"</option>");
			});
		});
		spu_get_tm(class_1_id);
	}
	function spu_get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_class").empty();
			$.each(data,function(i,n){
				$("#tm_class").append("<option value="+n.id+">"+n.ppmch+"</option>");
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
	
</script> -->
<title>硅谷商城</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',split:true" style="height:50px">
			<select id="spu_class_1" name="flbh1" onchange="spu_get_class2(this.value)"></select>
			<select id="spu_class_2" name="flbh2" ></select>
			<select id="tm_class" name="pp_id"></select>
		</div>
		<div data-options="region:'west',split:true" style="width:100px"></div>
		<div data-options="region:'center',border:true">
			<form action="save_spu.do" method="post" enctype="multipart/form-data">
				
				<hr>
				商品名称：<input type="text" name="shp_mch" value="输入商品名称"/>
				<hr>
				商品描述：<textarea name="shp_msh">输入商品描述</textarea><br>
				<div id="id_button">选择图片:
					<img id="img_0" src="image/upload_hover.png" onclick="button_image_click(0)">
					<input id="file_0" type="file" name="files" onchange="button_image_change(0)" style="display: none;"/>
				</div>
				<br>
				<input type="submit" value="提交"/>
			</form>
		</div>
	</div>
	
	
	
	
<script type="text/javascript">
	$(function (){
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#spu_class_1").append("<option value="+n.id+">"+n.flmch1+"</option>");
			});
		});
	});
	
	function spu_get_class2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#spu_class_2").empty();
			$.each(data,function(i,n){
				$("#spu_class_2").append("<option value="+n.id+">"+n.flmch2+"</option>");
			});
		});
		spu_get_tm(class_1_id);
	}
	function spu_get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_class").empty();
			$.each(data,function(i,n){
				$("#tm_class").append("<option value="+n.id+">"+n.ppmch+"</option>");
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
	
</script>
</body>
</html>