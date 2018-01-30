<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="js/jquery-1.7.2-min.js"></script> -->
<script type="text/javascript">
	function list_show(attr_id,checked){
		if (checked) {
			$("#val_list_"+attr_id).show();
		}else{
			$("#val_list_"+attr_id).hide();
		}
	}
</script>
</head>
<body>
	<h2>选择平台属性列表</h2>
	<c:forEach items="${list_attr }" var="attr" varStatus="status">
	<input type="checkbox" value="${attr.id }" name="t_mall_sku_attr_val_list[${status.index }].shxm_id" onchange="list_show(${attr.id },checked)">${attr.shxm_mch }
	</c:forEach>
	<hr>
	<c:forEach items="${list_attr }" var="attr" varStatus="status">
		<div id="val_list_${attr.id }" style="display:none;">
			<c:forEach items="${attr.list_value }" var="val" >
				<input type="radio" value="${val.id }"  name="t_mall_sku_attr_val_list[${status.index }].shxzh_id" />${val.shxzh }${val.shxzh_mch }
			</c:forEach>
			<br/>
		</div>
	</c:forEach>
</body>
</html>