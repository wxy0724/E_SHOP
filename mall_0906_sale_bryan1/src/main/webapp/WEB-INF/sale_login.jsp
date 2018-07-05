<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<base href="${pageContext.request.contextPath}/"/> 
		<title>硅谷商城_用户登录</title>
		<link rel="shortcut icon" type="image/icon" href="js/images/jd.ico">
		<link rel="stylesheet" type="text/css" href="js/css/login.css">
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
		function to_submit(){
			$("#login_form").submit();
		}
		</script>
	</head>
	<body>
		<div class="up">
			<img src="js/images/logo.jpg" height="45px;" class="hy_img"/>
			<div class="hy">
				欢迎登录
			</div>
		</div>
		<div class="middle">
			<div class="login">
				<div class="l1 ">
					<div class="l1_font_01 ">硅谷会员</div>
					<a class="l1_font_02 " href="goto_register.do">用户注册</a>
				</div>
				<div class="blank_01"></div>
				<div class="ts">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${err}
				</div>
				<div class="blank_01"></div>
				<form action="dologin.do" id="login_form" method="post">
					<div class="input1">
						<input type="text" class="input1_01" name="yh_mch"/>
					</div>
					<div class="blank_01"></div>
					<div class="blank_01"></div>
					<div class="input2">
						<input type="text" class="input1_01" name="yh_mm"/>
					</div>
				
				<div class="blank_01"></div>
				<div class="blank_01"></div>
				<div class="box_01">
					<div class="box_01_both_1"><input type="radio" name="dataSource_type" value="1" />数据源1
					<input type="radio" name="dataSource_type" value="2" />数据源2</div>
					<br>
					<input type="checkbox" class="box_01_box"/>
					<div class="box_01_both">
						<div class="box_01_both_1">自动登陆</div>
						<div class="box_01_both_2">忘记密码？</div>
					</div>
				</div>
				</form>
				<div class="blank_01"></div>
				<a href="JavaScript:;" class="aline">
					<div class="red_button" onclick="to_submit()">
						登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录
					</div>
				</a>
				<div class="blank_01"></div>
				<div class="blank_01"></div>
				<div class="box_down">
					<div class="box_down_1">使用合作网站账号登录京东：</div>
					<div class="box_down_1">京东钱包&nbsp;&nbsp;|&nbsp;&nbsp;QQ 
					&nbsp;&nbsp;|&nbsp;&nbsp;微信
					</div>
				</div>
			</div>	
		</div>
		
		<div class="down">
			<br />
			Copyright©2004-2015  xu.jb.com 版权所有
		</div>
	</body>

</html>