<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/"/> 
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	
	function check_item(sku_id,checked){
		var check = "0";
		if (checked) {
			check = "1";
		}
		$.get("change_cert_status.do",{sku_id:sku_id,check:check},function(data){
			$("#cert_list").html(data);
		})
	} 
	
</script>
<head>
	<meta charset="UTF-8">
	<title>首页</title>
	<link rel="stylesheet" type="text/css" href="js/css/css.css">	
	<link rel="stylesheet" href="js/css/style.css">
</head>
<style type="text/css">
	td{vertical-align: middle !important;}
	.form-group{padding: 5px 0;}
</style>
<body>
		<!-- 网页头 （导航栏）-->
		<jsp:include page="sale_header.jsp"></jsp:include>
		<!-- 搜索(search and minicart)-->
		<jsp:include page="sale_search_area.jsp"></jsp:include>
		
		<jsp:include page="sale_cart_list_inner_by_yhid.jsp"></jsp:include>
		
		<jsp:include page="sale_footer.jsp"></jsp:include>
	
<!-- 模态弹出窗内容 -->
<div class="modal" id="mymodal-data" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">新添收货地址</h4>
			</div>
			<div class="modal-body" style="overflow:hidden">
				<div class="form-group">
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="请输入您的所在地区">
				    </div>
				    <br>
				</div>
				<div class="form-group">
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="请输入您的详细地址">
				    </div>
				    <br>
				</div>
				<div class="form-group">
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="请输入您的邮政编码">
				    </div>
				    <br>
				</div>
				<div class="form-group">
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="请输入您的收货人姓名">
				    </div>
				    <br>
				</div>
				<div class="form-group">
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="请输入您的手机号码">
				    </div>
				    <br>
				</div>
				<div class="form-group">
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" placeholder="请输入您的电话号码">
				    </div>
				    <br>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</div>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
</body>
</html>