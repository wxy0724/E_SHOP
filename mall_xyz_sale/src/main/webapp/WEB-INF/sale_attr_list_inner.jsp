<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	
	function get_param_up(shxm_id,shxzh_id,shxzhmch){
		$("#attr_param").append("<input style='display: none;' name='attr_param' value={\"shxm_id\":"+shxm_id+",\"shxzh_id\":"+shxzh_id+"}>"+shxzhmch);
		get_sku_list();
	} 
	
	function get_param_down(){
		
	}
	
	function get_sku_list(){
		var flbh2 = "${flbh2}";
		var inputs = $("#attr_param input[name='attr_param']");
		var param = "flbh2="+flbh2;
		$.each(inputs,function(i,n){
			var json = jQuery.parseJSON(n.value);
			param = param+"&t_mall_sku_attr_val_list["+i+"].shxm_id="+json.shxm_id+"&t_mall_sku_attr_val_list["+i+"].shxzh_id="+json.shxzh_id;
		});
		
		param = param + "&order=" + $("#order").val();
		
		$.get("goto_sku_list_By_attr.do",param,function(data){
			$("#sku_list_inner").html(data);
		});
	}
	
	function search_order(new_order){
		//获取排序参数
		var old_order = $("#order").val();
		
		if (new_order == old_order) {
			new_order = new_order + " desc ";
		}
		
		$("#order").val(new_order);
		
		get_sku_list();
	}
	
</script>
</head>
<body>
	<h2>商品属性</h2>
	<div>属性参数区域</div>
	<div id="attr_param"></div>
	<input id="order"/>
	<c:forEach items="${list_attr }" var="attr">
		${attr.shxm_mch }:
		<c:forEach items="${attr.list_value }" var="t_value">
			<a href="javascript:get_param_up(${attr.id },${t_value.id },'${t_value.shxzh }${t_value.shxzh_mch }');">${t_value.shxzh }${t_value.shxzh_mch }</a>
		</c:forEach>
		<br/>
	</c:forEach>
	<div id="order"></div>
	排序：
	<a href="javascript:search_order(' order by sku_xl ');">销量</a>
	<a href="javascript:search_order(' order by sku.chjshj ');">上架时间</a>
	<a href="javascript:search_order(' order by jg ');">价格</a>
	<a href="javascript:search_order(' order by jg ');">评价</a>
</body>
</html>