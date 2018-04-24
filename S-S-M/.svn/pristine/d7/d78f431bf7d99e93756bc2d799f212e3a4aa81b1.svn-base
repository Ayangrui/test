<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/pages/commons/include.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/skin/js/models/user/user.js"></script>
	</head>
	<body>
		<%--用户列表--%>
		<table id="user-tab"></table>
		
		<%--用户列表操作 --%>
		<!-- 查询 -->
		<div id="user-toolbar" style="overflow: hidden">
			<div style="float: left">
				<input id="queryByName" name="username"
					class="easyui-textbox" data-options="
						windth:180
					"/>
				<a href="javascript:void(0);" 
			   		class="easyui-linkbutton"
			  		data-options="iconCls:'icon-search'"
			   		onclick="obj.query();">
					查询
				</a>
			</div>
			<div style="float: right">
			<!-- 添加 -->
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true" onClick="obj.add()">添加</a>
		
			<!-- 修改 -->
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onClick="obj.update()">修改</a>
		
			<!-- 删除 -->
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove',plain:true" onClick="obj.del()">删除</a>
				
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-large-clipart',plain:true" onClick="obj.allotRole()">分配角色</a>
			</div>
		</div>
	</body>
</html>