<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/pages/commons/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">   
        *{   
            margin: 0;   
            padding: 0;   
        }    
        .center-in-center{   
            position: absolute;   
            top: 35%;   
            left: 40%;   
        }   
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="easyui-layout" fit="true">
		<div data-options="region:'north'" style="height:80px">
			
			<div style="float:right;line-height:78px;margin-right: 30px">
				欢迎：
				<span style="margin-right: 10px">
					<a href="${pageContext.request.contextPath }/login/layout">
					注销登录</a>
				</span>
			</div>
		</div>
		<div data-options="region:'west',split:true" title="导航" style="width:150px;">
			<ul id="tree-perm"></ul>
		</div>
		<div data-options="region:'center',title:'管理面板',iconCls:'icon-ok'">
			<div id="index-tabs" class="easyui-tabs" fit="true">
				 <div title="出错误啦!" class="center-in-center" style="padding:20px;display:none;">   
       				 <h3>┗|｀O′|┛ 嗷~~当前还没有登录哦！是否立即前往登录?</h3><br/>
       				<a href="${pageContext.request.contextPath }/pages/models/user/index.jsp">再等等</a>
					<a href="${pageContext.request.contextPath }/pages/models/login.jsp">登录</a>
   				 </div>   
				
			</div>
		</div>
	</div>

</body>
</html>