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
	
</script>
</head>
<body class="easyui-layout">

    <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',split:true" style="height:50px">
			
		</div>
		<div data-options="region:'west',split:true" style="width:100px">
			一级分类：<select class="easyui-combobox" id="list_cache_class_1" name="flbh1" onchange="list_cache_get_class2(this.value)">
			<option>请选择</option>
			</select>
			二级分类：<select class="easyui-combobox" id="list_cache_class_2" name="flbh2" onchange="sku_get_attr(this.value)">
			<option>请选择</option>
			</select>
		</div>
		<div data-options="region:'center',border:true">
			<div id="list_cache_inner""></div>
			<a href="javascript:refresh_attr_cache();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">刷新缓存属性</a>
		</div>
	</div>
	
<script type="text/javascript">
	$(function(){
		$('#list_cache_class_1').combobox({    
		    url:'js/json/class_1.js',    
		    valueField:'id',    
		    textField:'flmch1',
		    width : 80,
		    onSelect : function list_cache_get_class2(){
		    	var class_1_id = $(this).combobox('getValue');
		    	$('#list_cache_class_2').combobox({    
				    url:'js/json/class_2_'+class_1_id+'.js',    
				    valueField:'id',    
				    textField:'flmch2',
				    width : 80 ,
				    onSelect : function(){
				    	var flbh2 = $(this).combobox('getValue');
				    	sku_get_attr(flbh2)
				    }
		    	});
			}
		});  
	});
	function sku_get_attr(flbh2){
		$('#list_cache_inner').datagrid({    
		    url:'manage_attr_list.do', 
		    queryParams: {
		    	flbh2 : flbh2
			},
	
		    columns:[[
		        {field:'id',title:'编号',width:100,checkbox:'true'},    
		        {field:'shxm_mch',title:'属性名称',width:100},    
		        {field:'list_value',title:'属性值',width:300,align:'right',
		        	formatter : function(value,row,index){
		        		var str = "";
						$.each(value,function(i,n){
							str = str + n.shxzh+" "+n.shxzh_mch;
						})
						return str;
					}
		        },
		        {field:'chjshj',title:'创建时间',width:150,align:'right',
		        	formatter : function(value,row,index){
		        		var date = new Date(value).toLocaleString();
		        		return date;
					}
		        }
		    ]] 
		});  
	}
	
	function refresh_attr_cache(){
		var class_2_id = $("#list_cache_class_2").combobox("getValue");
		var attr_array = $("#list_cache_inner").datagrid("getChecked");
		var attrs = new Array();
		$.each(attr_array,function(i,n){
			attrs[i] = n.id;
		});
		$.get("refresh_attr_cache.do",{class_2_id:class_2_id,attrs:attrs},function(data){
			alert("总共刷新了"+ data +"条");
		});
	}
</body>
</html>